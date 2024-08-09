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
        return None  # Return None for invalid instructions
    binary_format = mips_instructions[opcode]
    for i, part in enumerate(parts[1:]):
        if part:
            if part.isdigit():
                register = int(part)
                if "ddddd" in binary_format:
                    binary_format = binary_format.replace(f"ddddd", f"{register:05b}")
                elif "ttttt" in binary_format:
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
    return f"{int(binary_format, 2):08X}"  # Convert binary to hexadecimal

def handle_init(parts):
    """Handle the init command and return the address and value."""
    if len(parts) != 3:
        return None
    try:
        address = int(parts[1], 16)
        value = int(parts[2], 16)
        return (address, f"{value:08X}")
    except ValueError:
        return None

def create_mif_file(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        # Write MIF file header
        outfile.write("WIDTH=32;\n")
        outfile.write("DEPTH=4096;\n\n")
        outfile.write("ADDRESS_RADIX=HEX;\n")
        outfile.write("DATA_RADIX=HEX;\n\n")
        outfile.write("CONTENT BEGIN\n")

        index = 0
        content = []

        for line in infile:
            line = line.strip()
            if line.startswith("//") or not line:
                continue
            
            parts = line.split()
            if parts[0].lower() == "init":
                init_result = handle_init(parts)
                if init_result:
                    content.append(init_result)
            else:
                hex_value = translate_mips(line, index)
                if hex_value:
                    content.append((index, hex_value))
                    index += 1

        # Sort content by address
        content.sort(key=lambda x: x[0])

        # Write content with refined gap filling
        prev_addr = -1
        for addr, value in content:
            if prev_addr != -1:
                diff = addr - prev_addr
                if diff == 2:
                    outfile.write(f"\t{(prev_addr + 1):03X} : 00000000;\n")
                elif diff > 2:
                    outfile.write(f"\t[{(prev_addr + 1):03X}..{(addr - 1):03X}] : 00000000;\n")
            outfile.write(f"\t{addr:03X} : {value};\n")
            prev_addr = addr

        # Fill the rest with zeros using range notation
        last_address = content[-1][0]
        if last_address < 4095:
            outfile.write(f"\t[{(last_address + 1):03X}..FFF] : 00000000;\n")

        outfile.write("END;\n")

# Usage
input_file = 'MIPS.asm'
output_file = 'output.mif'
create_mif_file(input_file, output_file)
print(f"MIF file '{output_file}' has been created.")