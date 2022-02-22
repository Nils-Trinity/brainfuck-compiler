# Brainfuck Compiler
The compiler compiles brainfuck programs into native assembly code for multiple compilation targets.

# Flags
```
- -h                  --  Prints this message
- -o <filename>       --  Sets the output file. The default is bf.out
- -s <size>          --  Specifies the size of the cell array. 30k cells by default
- --target <target>  --  The compilation target. Defaults to 64 bit linux
- --syscall          --  Whether or not the brainfuck program contains syscalls(see the Syscalls section below). 
- --debug [a] [b]    --  Signals that the program contains the debug character "#", which will print the current cell array at values between a and b. If a and b aren't specified, then it'll print the first 16 cells
```

# Specs
- Attempting to go left at cell 0, or right at the rightmost cell, will exit with code 1
- Cells are 1 byte(0-255), and wrap automaticall
- The cell array is 30,000 cells large by default. Change this with the `-s` compiler flag
- Mismatched brackets will return a compiler error(code 2)

# Syscalls
The idea of syscalls in brainfuck comes from systemf(linked below). Systemf's implementation has been tweaked to allow for larger syscall codes.
Here's how it works:
- In a brainfuck program, use `%` to call a syscall. To get information about the syscall, it'll read from the current cell, then move right
- The value at the current cell is the size of the opcode in bytes. This is needed because each cell is 1 byte in length, meaning codes above 255 are impossible within one cell
- The next cell(s), based on the first cell, are the opcode. The cells should be in Little Endian order(for no particular reason)
- After the opcode has been read, the next cell is the number of arguments the syscall takes
- For each argument:
  - The first cell is the type of argument: 0 is a normal int/char, 1 is a pointer, where the argument is the contents of the pointer, and 2 is a normal pointer to another cell
  - The next cell is the length, in bytes, of the argument(similar to the opcode length). This is also in Little Endian
  - The following x cells, based on the previous cell, are the actual argument
  - The syscall is called, and the return value is stored as follows:
  - The first cell is the length of the return value
  - The following cell(s) are the value, again, in Little Endian

For example, the cell array for an exit syscall with an exit code of 1 69 would look like this:
`[1, 60, 1, 0, 1, 69]`

# Credits
Systemf: https://github.com/ajyoon/systemf
