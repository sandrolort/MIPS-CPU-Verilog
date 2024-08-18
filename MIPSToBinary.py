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

register_map = {
    "$zero": 0, "$at": 1, "$v0": 2, "$v1": 3,
    "$a0": 4, "$a1": 5, "$a2": 6, "$a3": 7,
    "$t0": 8, "$t1": 9, "$t2": 10, "$t3": 11,
    "$t4": 12, "$t5": 13, "$t6": 14, "$t7": 15,
    "$s0": 16, "$s1": 17, "$s2": 18, "$s3": 19,
    "$s4": 20, "$s5": 21, "$s6": 22, "$s7": 23,
    "$t8": 24, "$t9": 25, "$k0": 26, "$k1": 27,
    "$gp": 28, "$sp": 29, "$fp": 30, "$ra": 31
}

def twos_complement(value, bits):
    if value >= 0:
        return value
    else:
        return (1 << bits) + value

def parse_register(reg):
    if reg in register_map:
        return register_map[reg]
    elif reg.startswith('$'):
        try:
            return int(reg[1:])
        except ValueError:
            raise ValueError(f"Invalid register: {reg}")
    else:
        try:
            return int(reg)
        except ValueError:
            raise ValueError(f"Invalid register: {reg}")

def parse_immediate(imm):
    if imm.startswith('0x'):
        return int(imm, 16)
    elif imm.startswith('0b'):
        return int(imm, 2)
    else:
        return int(imm)

def translate_mips(instruction, labels, current_address):
    parts = re.split(r'[\[,\(\)\s]', instruction)
    parts = [part for part in parts if part]  # Remove empty parts
    opcode = parts[0].lower()
    if opcode not in mips_instructions:
        return None  # Return None for invalid instructions
    binary_format = mips_instructions[opcode]

    for i, part in enumerate(parts[1:]):
        if part in labels:
            # Calculate relative offset for branch instructions
            if opcode in ["beq", "bne", "blez", "bgtz", "bltz", "bgez"]:
                offset = (labels[part] - current_address - 1) & 0xFFFF  # -1 because PC is incremented
                binary_format = binary_format.replace("iiiiiiiiiiiiiiii", f"{offset:016b}")
            # Calculate absolute address for jump instructions
            elif opcode in ["j", "jal"]:
                address = labels[part] & 0x3FFFFFF  # 26-bit address
                binary_format = binary_format.replace("xxxxxxxxxxxxxxxxxxxxxxxxxx", f"{address:026b}")
        elif part.startswith('$') or part.isdigit():
            register = parse_register(part)
            if "ddddd" in binary_format:
                binary_format = binary_format.replace("ddddd", f"{register:05b}")
            elif "ttttt" in binary_format:
                binary_format = binary_format.replace("ttttt", f"{register:05b}")
            else:
                binary_format = binary_format.replace("sssss", f"{register:05b}")
        else:
            try:
                value = parse_immediate(part)
                binary_format = binary_format.replace("iiiiiiiiiiiiiiii", f"{twos_complement(value, 16):016b}")
            except ValueError:
                # If the value cannot be converted to an integer, leave it as is
                pass
    return f"{int(binary_format, 2):08X}"  # Convert binary to hexadecimal

def handle_init(parts):
    if len(parts) != 3:
        return None
    try:
        address = parse_immediate(parts[1])
        value = parse_immediate(parts[2])
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

        # First pass: collect labels
        labels = {}
        address = 0
        for line in infile:
            line = line.strip()
            if not line or line.startswith("//"):
                continue
            if line.endswith(":"):
                labels[line[:-1]] = address
            elif not line.startswith("init"):
                address += 1

        # Second pass: translate instructions
        infile.seek(0)
        address = 0
        content = []

        for line in infile:
            line = line.strip()
            if not line or line.startswith("//"):
                continue
            if line.endswith(":"):
                continue

            parts = line.split()
            if parts[0].lower() == "init":
                init_result = handle_init(parts)
                if init_result:
                    content.append(init_result)
            else:
                hex_value = translate_mips(line, labels, address)
                if hex_value:
                    content.append((address, hex_value))
                    address += 1

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
