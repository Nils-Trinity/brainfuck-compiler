section .data
  arr_size equ 30000
  arg_size equ 256 ; MAKE THIS VARIABLE ; COMPILER FLAG

section .bss
  cell_arr  resb arr_size
  cell_ptr  resb 8
  io_buffer resb 1
 
  syscall_len  resb 1 ; New compared to systemf
  syscall_data resb 8 ; These allow syscalls up to 8 bytes long
                      ; Probably overkill, but better than only getting first 256
 
  arg0_type resb 1 ; The type of the argument
  arg1_type resb 1 ; 0 for immediate value
  arg2_type resb 1 ; 1 for contents of pointer to another cell
  arg3_type resb 1 ; 2 for pointer to another cell
  arg4_type resb 1
  arg5_type resb 1
  
  arg0_len resb 1 ; The length of the argument, in bytes
  arg1_len resb 1
  arg2_len resb 1
  arg3_len resb 1
  arg4_len resb 1
  arg5_len resb 1

  arg0_data resb arg_size ; The argument's data itself
  arg1_data resb arg_size ; Defaults at 256 bytes
  arg2_data resb arg_size ; but should be variable using
  arg3_data resb arg_size ; -a(?) <value>
  arg4_data resb arg_size ; i.e. -a 6969 to make these 6969 bytes long
  arg5_data resb arg_size ; TODO: Check if arg_size*6 > arr_size, and throw an error if so

section .text
global _start

_start:
inc_0:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

right_1:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

right_2:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

inc_3:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_4:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_5:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_6:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_7:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_8:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

fwd_9:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  cmp al, 0x0
  jz bkwd_23

left_10:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

inc_11:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_12:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_13:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_14:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_15:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_16:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_17:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_18:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_19:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_20:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

right_21:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

dec_22:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  dec al
  mov [cell_arr+rdx], al

bkwd_23:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  cmp al, 0x0
  jnz fwd_9

inc_24:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

right_25:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

right_26:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

inc_27:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

right_28:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

right_29:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

inc_30:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_31:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_32:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_33:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_34:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_35:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_36:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

fwd_37:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  cmp al, 0x0
  jz bkwd_51

left_38:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

inc_39:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_40:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_41:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_42:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_43:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_44:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_45:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_46:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_47:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

inc_48:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  inc al
  mov [cell_arr+rdx], al

right_49:
  mov rdx, [cell_ptr]
  inc rdx
  cmp rdx, arr_size
  jg memory_out_of_bounds
  mov [cell_ptr], rdx

dec_50:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  dec al
  mov [cell_arr+rdx], al

bkwd_51:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  cmp al, 0x0
  jnz fwd_37

left_52:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

dec_53:
  mov rdx, [cell_ptr]
  mov rax, [cell_arr+rdx]
  dec al
  mov [cell_arr+rdx], al

left_54:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

left_55:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

left_56:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

left_57:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

left_58:
  mov rdx, [cell_ptr]
  dec rdx
  cmp rdx, 0x0
  jl memory_out_of_bounds
  mov [cell_ptr], rdx

syscall_59:
  mov r15, [cell_ptr]
  mov r11, [cell_arr+r15] ; opcode len
  
  mov rdi, r15 ; opcode
  mov rsi, r11
  call combine_bytes
  mov [syscall_data], rax

  add r15, r11 ; get to the next section
  add r15, 1

  mov r11, [cell_arr+r15] ; num args
  inc r15 ; get to arg
prep_args:
  mov r10, 0 ; counter

  cmp r11, 0
  je sys_prep_exec
  
  cmp r10, 0
  je prep_arg0
  cmp r10, 1
  je prep_arg1
  cmp r10, 2
  je prep_arg2
  cmp r10, 3
  je prep_arg3
  cmp r10, 4
  je prep_arg4
  cmp r10, 5
  je prep_arg5
  ; args
    ; arg type
    ; arg len
    ; arg value
  ; TODO: Get sys_exit.bf working as a prototype

%macro prep_argn 1
  mov rax, [cell_arr+r15]
  mov [arg%1_type], rax

  inc r15
  mov rax, [cell_arr+r15]
  mov [arg%1_len], al
  mov r10, rax

 load_arg%1: ; make sure this works
  cmp r10, 0
  je finish_prep_args

  inc r15
  mov rax, [cell_arr+r15]
  mov [cell_arr+r15], al
  dec r10
  jmp load_arg%1
%endmacro

prep_arg0:
  prep_argn 0
prep_arg1:
  prep_argn 1
prep_arg2:
  prep_argn 2
prep_arg3:
  prep_argn 3
prep_arg4:
  prep_argn 4
prep_arg5:
  prep_argn 5

finish_prep_args:
  dec r11
  inc r10
  jmp prep_args

sys_prep_exec:

%macro exec_prep_argn 1
  ; get arg type
  mov r8, [arg%1_type]
  mov rdi, [arg%1_len]

  cmp r8, 0
  je exec_prep_arg%1_immediate
  cmp r8, 1
  je exec_prep_arg%1_ptr_contents
  cmp r8, 2
  je exec_prep_arg%1_ptr_contents
  jmp invalid_arg_type
  ; 0 = immediate
 exec_prep_arg%1_immediate:
  mov rsi, [arg%1_data]
  call combine_bytes
  push rax
  jmp exec_prep_arg%1_end
  ; 1 = ptr contents
 exec_prep_arg%1_ptr_contents:
  ; 2 = ptr
 exec_prep_arg%1_ptr:
 exec_prep_arg%1_end:

%endmacro

exec_prep_arg0:
  exec_prep_argn 0
exec_prep_arg1:
  exec_prep_argn 1
exec_prep_arg2:
  exec_prep_argn 2
exec_prep_arg3:
  exec_prep_argn 3
exec_prep_arg4:
  exec_prep_argn 4
exec_prep_arg5:
  exec_prep_argn 5
exec_prep_opcode:
  mov rsi, [syscall_data]
  call combine_bytes
  push rax

exec_syscall_59:
  pop r9
  pop r8
  pop r10
  pop rdx
  pop rsi
  pop rdi
  jmp exit
  pop rax
  syscall
  ; TODO: put return value back into tape
  ; The cell the syscall started on should be return value length
  ; The following <length> cells are the return value
  ; God please let this work


combine_bytes:
  push rbp
  ; rdi is start addr
  ; rsi is length

  ; r9 is counter
  ; r10 is combined bytes

  mov r9, 0
  movzx r10, byte [rdi+r9]

  cmp r9, rsi
  jge finish_combine_bytes

 loop:
  sal r10, 8
  or r10b, byte [rdi+r9]
  inc r9
  cmp r9, rsi
  jne loop

 finish_combine_bytes:
  mov rax, r10
  pop rbp
  ret


exit_normal:
  mov rdi, 0x0
  jmp exit
memory_out_of_bounds:
  mov rdi, 0x1
  jmp exit
invalid_arg_type:
  mov rdi, 0x2
  jmp exit
exit:
  mov rax, 0x3C
  syscall
