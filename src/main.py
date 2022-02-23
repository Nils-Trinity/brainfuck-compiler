#!/bin/python

from typing import List, Tuple
import os
import sys
import getopt
from enum import Enum, auto
from dataclasses import dataclass

#-------------------------#
#--- Compiler Settings ---#
#-------------------------#

FILENAME = "bf.out"
ARR_SIZE = 30000
TARGET = "nasm64"
HAS_SYSCALL = False
WRAPS = False


#-----------------------------------#
#--- Intermediate Representation ---#
#-----------------------------------#

INC = '+'
DEC = '-'
LEFT = '<'
RIGHT = '>'
IN = ','
OUT = '.'
FWD = '['
BKWD = ']'
SYSCALL = '%'
DEBUG = '#'

# If the "--syscall" and/or "--debug" flags are set, they'll be appended to this list
VALID_TOKENS = [INC, DEC, LEFT, RIGHT, IN, OUT, FWD, BKWD]


@dataclass
class Token:
    token: chr
    addr: int


def matchJumps(tokens: List[Token]) -> List[Tuple[int, int]]:
    pairs = []
    stack = []
    for token in tokens:
        if token.token == FWD:
            stack.append(token.addr)
        elif token.token == BKWD:
            pairs.append((stack.pop(), token.addr))

    return pairs


def filterChars(program: str) -> str:
    return ''.join(ch for ch in program if ch in VALID_TOKENS)


def parseToken(token: str, addr: int) -> Token:
    return Token(token, addr)


def parseProgram(program: str) -> List[Token]:
    tokens = []
    
    for i in range(len(program)):
        token = program[i]
        
        for valid_token in VALID_TOKENS:
            if token == valid_token:
                tokens.append(parseToken(token, i))
                break
        i += 1

    return tokens


#----------------#
#--- Compiler ---#
#----------------#

#TODO: Compile to multiple operating systems, processors, and both 32 and 64 bit assembly
# It should be noted that I don't currently know the differences between the various devices I'd like to compile to, so, for now I'm sticking to ensuring it runs on 64-bit Linux

def compile_linux64(tokens: List[Token]) -> str:
    lines = []

    # Header
    lines.append(f"section .data\n\n")
    lines.append(f"section .bss\n")
    lines.append(f"  cell_arr  resb 100\n")
    lines.append(f"  cell_ptr  resb 8\n")
    lines.append(f"  io_buffer resb 1\n\n")
    lines.append(f"section .text\n")
    lines.append(f"global _start\n\n")
    lines.append(f"_start:\n")
    
    #TODO: Compile each token into relevant assembly

    #TODO: --no-exit flag, which forces the programmer to add a sys_exit call to their brainfuck programs. Not sure why or if it'd be useful, but its an option
    # Otherwise, the program should automatically append an exit with code 0

#------------------------#
#--- Argument Parsing ---#
#------------------------#

def help():
    print("A program to compile brainfuck code into native assembly")
    print("FLAGS:")
    print("  -h, --help    --  Prints this message")
    print("  -o <filename> --  Output file. Defaults to bf.out")
    print("  -s <size>     --  Size of the cell array, in bytes. Defaults to 30,000, as per most bf implementations")
    print("  -w, --wrap    --  Whether or not memory wraps. If unset, attempting togo left at cell 0 or right at the max cell will produce an error")
    print("  -t <target>   --  Compilation target. Defaults to 64 bits and nasm")
    print("  --syscall     --  Whether or not the brainfuck code contains syscalls")
    print("  --debug       --  Whether or not the code contains debug characters")
    print("See https://github.com/Nils-Trinity/brainfuck-compiler for more details")


def parse_args(argv: List[str]):
    try:
        opts, args = getopt.getopt(argv, "ho:s:t:w", ["help", "syscall", "debug", "wrap"])
    except:
        print("Error parsing args")

    for opt, arg in opts:
        if opt in ["-h", "--help"]:
            help()
            exit()
        elif opt in ["-o"]:
            FILENAME = arg
        elif opt in ["-s"]:
            ARR_SIZE = int(arg)
        elif opt in ["-t"]:
            TARGET = arg
        elif opt in ["--syscall"]:
            VALID_TOKENS.append(SYSCALL)
        elif opt in ["--debug"]:
            VALID_TOKENS.append(DEBUG)
        elif opt in ["-w", "--wrap"]:
            WRAPS = True
        else:
            help()
            exit()

def main():
    parse_args(sys.argv[1:])

    inputfile = sys.argv[-1]
    if not os.path.isfile(inputfile):
        print("ERROR: File not found.")
        exit(1)

    with open(inputfile, "r") as file:
        program = file.read()

    tokens = parseProgram(filterChars(program))
    print(tokens)
    print(matchJumps(tokens))
    # TODO: Compile standard brainfuck to x86_64 linux through nasm
    # TODO: Syscalls
    

if __name__ == "__main__":
    main()
