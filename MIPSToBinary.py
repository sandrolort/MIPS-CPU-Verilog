import re

mips_instructions = {
    # R-Type instructions
    "add": "000000ssssstttttddddd00000100000",
    "addu": "000000ssssstttttddddd00000100001",
    "sub": "000000ssssstttttddddd00000100010",
    "subu": "000000ssssstttttddddd00000100011",
    "and": "000000ssssstttttddddd00000100100",
    "or": "000000ssssstttttddddd00000100101",
    "xor": "000000ssssstttttddddd00000100110",
    "nor": "000000ssssstttttddddd00000100111",
    "slt": "000000ssssstttttddddd00000101010",
    "sltu": "000000ssssstttttddddd00000101011",
    "srl": "000000aaaaaaaaaatdddddaaaaa000010",
    "jr": "000000sssss000000000000000001000",
    "jalr": "000000sssss000000000000000001001",

    # I-Type instructions
    "lw": "100011ssssstttttiiiiiiiiiiiiiiii",
    "sw": "101011ssssstttttiiiiiiiiiiiiiiii",
    "addi": "001000ssssstttttiiiiiiiiiiiiiiii",
    "addiu": "001001ssssstttttiiiiiiiiiiiiiiii",
    "slti": "001010ssssstttttiiiiiiiiiiiiiiii",
    "sltiu": "001011ssssstttttiiiiiiiiiiiiiiii",
    "andi": "001100ssssstttttiiiiiiiiiiiiiiii",
    "ori": "001101ssssstttttiiiiiiiiiiiiiiii",
    "xori": "001110ssssstttttiiiiiiiiiiiiiiii",
    "lui": "001111aaaaaaaaaatiiiiiiiiiiiiiiii",
    "bltz": "000001sssss00000iiiiiiiiiiiiiiii",
    "bgez": "000001sssss00001iiiiiiiiiiiiiiii",
    "beq": "000100ssssstttttiiiiiiiiiiiiiiii",
    "bne": "000101ssssstttttiiiiiiiiiiiiiiii",
    "blez": "000110sssss00000iiiiiiiiiiiiiiii",
    "bgtz": "000111sssss00000iiiiiiiiiiiiiiii",

    # J-Type instructions
    "j":  "000010xxxxxxxxxxxxxxxxxxxxxxxxxx",
    "jal":"000011xxxxxxxxxxxxxxxxxxxxxxxxxx"
}

def twos_complement(value, bits):
    """Compute the two's complement of an integer value with the given number of bits."""
    if value >= 0:
        return value
    else:
        return (1 << bits) + value

def translate_mips(instruction, indx):
    parts = re.split(r'[\[,\(\)\s]', instruction)
    opcode = parts[0].lower()

    if opcode not in mips_instructions:
        return f"Invalid instruction: {instruction}"

    binary_format = mips_instructions[opcode]

    for i, part in enumerate(parts[1:]):
        if part:
            if part.isdigit():
                register = int(part)
                if("ddddd" in binary_format):
                    binary_format = binary_format.replace(f"ddddd", f"{register:05b}")
                elif("ttttt" in binary_format):
                    binary_format = binary_format.replace(f"ttttt", f"{register:05b}")
                else:
                    binary_format = binary_format.replace(f"sssss", f"{register:05b}")
            elif part.startswith("0x"):
                value = int(part, 16)
                binary_format = binary_format.replace("iiiiiiiiiiiiiiii", f"{twos_complement(value, 16):016b}")
                binary_format = binary_format.replace("xxxxxxxxxxxxxxxxxxxxxxxxxx", f"{twos_complement(value, 26):026b}")
            else:
                try:
                    value = int(part)
                    binary_format = binary_format.replace("iiiiiiiiiiiiiiii", f"{twos_complement(value, 16):016b}")
                    binary_format = binary_format.replace("xxxxxxxxxxxxxxxxxxxxxxxxxx", f"{twos_complement(value, 26):026b}")
                except ValueError:
                    # If the value cannot be converted to an integer, leave it as is
                    pass

    return "Memory[{}] = 32'b{};".format(str(indx), binary_format)
# Example usage
# print(translate_mips("add 8, 9, 10"))
# print(translate_mips("addi 16, 17, 0x1234"))
# print(translate_mips("lw 8, 0x10(16)"))
# print(translate_mips("srl 8, 9, 4"))
# print(translate_mips("j 0x12345678"))
# print(translate_mips("beq 8, 9, -9")) # enter hex values. For negative, you can use -(decimal) shortcut.

with open('MIPS.asm', 'r') as file:
    index = 0
    # Read each line from the file
    for line in file:
        # Print the line
        print(translate_mips(line.strip(), index))
        index = index + 1
