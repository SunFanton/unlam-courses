.data
    vector: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 # 10 elementos

.text
    la x1, vector
    addi x5, x0, 10 # cant elementos
    addi x2, x0, 1 # contador elementos loop2
    addi x6, x0, 10 # iteraciones para loop
    addi x7, x0, 1 # para iteracion de impresion por consola de PrintVector
    addi x8, x0, 1 # contador de loop1
   
    loop1:
      jal x9 loop2  
      la x1, vector
      jal x9 print_vector
      addi a0, x0, 10
      addi a7, x0, 11
      ecall
      la x1, vector
      addi x5, x5, -1
      addi x2, x0, 1
      addi x7, x0, 1 
      addi x8, x8, 1 
      blt x8, x6, loop1
      j end 
    
   loop2:
     addi x3, x1, 4
     jal x4 pushMin
     addi x1, x1, 4
     addi x2, x2, 1
     blt x2, x5, loop2
     beqz x0, go_back_loop1
    
  pushMin:
      lw a0, 0(x1)
      lw a1, 0(x3)
      bgt a0, a1, exit_pushMin
      sw a0, 0(x3)
      sw a1, 0(x1)
      beqz x0, exit_pushMin

  print_vector: 
        lw a0, 0(x1)
        addi a7, x0, 1
        ecall
        addi x7, x7, 1
        addi x1, x1, 4
        bgt x7, x6, go_back_loop1
        addi a0, x0, 44
        addi a7, x0, 11
        ecall
        j print_vector
        
    go_back_loop1:
        jalr x0, x9, 0
        
    exit_pushMin:
       jalr x0, x4, 0
        
    end:
        nop