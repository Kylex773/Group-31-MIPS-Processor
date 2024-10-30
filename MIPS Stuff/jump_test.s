    addi $t0 $t0 5
    nop
    nop
    nop
    nop
    bgez $t0 here
    nop
    nop
    nop
    nop
    addi $t1 $t1 12
    nop
    nop
    nop
    nop
here:    addi $t0 $t0 -6
    nop
    nop
    nop
    nop
    bgez $t0 here
    nop
    nop
    nop
    nop
    beq $t1 $t2 here
    nop
    nop
    nop
    nop
    beq $t1 $t1 here2
    nop
    nop
    nop
    nop
    addi $t5 $t5 5
    nop
    nop
    nop
    nop
here2: add $t2 $t0 $t1
    nop
    nop
    nop
    nop
    bne $t1 $t1 here2
    nop
    nop
    nop
    nop
    bne $t1 $t2 here3
    nop
    nop
    nop
    nop
    addi $t5 $t5 5
    nop
    nop
    nop
    nop 
here3: bgtz $t0 here4
    nop
    nop
    nop
    nop
    addi $t5 $t5 5
    nop
    nop
    nop
    nop
here4: addi $t0 $t0 5
    nop
    nop
    nop
    nop
    bgtz $t0 here4
    nop
    nop
    nop
    nop
here5:    addi $t0 $t0 -2
    nop
    nop
    nop
    nop
    blez $t0 here5
    nop
    nop
    nop
    nop
    addi $t0 $t0 -2
    nop
    nop
    nop
    nop
here6:    addi $t0 $t0 1
    nop
    nop
    nop
    nop
    bltz $t0 here6
    nop
    nop
    nop
    nop
    j here7
    nop
    nop
    nop
    nop
    addi $t5 $t5 5
    nop
    nop
    nop
    nop
    addi $t6 $t6 130
    nop
    nop
    nop
    nop
    jr $t6
    nop
    nop
    nop
    nop
    addi $t5 $t5 5
    nop
    nop
    nop
    nop
    jal 1