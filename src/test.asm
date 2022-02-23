section .data
  arr_size equ 10
  
section .bss
  cell_arr  resb arr_size
  cell_ptr  resb 8
  io_buffer resb 1

section .text
global _start

_start:


exit_normal:
  mov rsi, 0x0
  jmp exit
memory_out_of_bounds:
  mov rsi, 0x1
exit:
  mov rax, 0x3C
  syscall
