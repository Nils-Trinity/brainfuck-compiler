section .data


section .bss
  cell_arr  resb 100
  cell_ptr  resb 8
  io_buffer resb 1

section .text
global _start

_start:
  ; +
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  add rax, 69
  mov [cell_arr+rdx], rax
  ; .
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  mov byte [io_buffer], al

  mov rdx, 0x1
  mov rsi, io_buffer
  mov rdi, 0x1
  mov rax, 0x1
  syscall

  ; exit
  mov rdi, [io_buffer]
  mov rax, 0x3C
  syscall
