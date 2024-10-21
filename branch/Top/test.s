.text
main:
add $t1, $0, $0
nop
nop
nop
nop
addi $t1, $t1, 6
nop
nop
nop
nop
sw $t1, 0($0)
nop
nop
nop
nop
lw $t2, 0($0)
nop
nop
nop
nop
addi $t3, $t2, 4
nop
nop
nop
nop
mul $t4, $t3, $t2
nop
nop
nop
nop
sub $t5, $t4, $t3
nop
nop
nop
nop
and $t5, $t5, $t3
nop
nop
nop
nop
andi $t5, $t5, 47
nop
nop
nop
nop
or $t5, $t5, $0
nop
nop
nop
nop
nor $t5, $t5, $t2
nop
nop
nop
nop
xor $t1, $t2, $t1
nop
nop
nop
nop
ori $t1, $t1, 7
nop
nop
nop
nop
xori $t5, $t5, 12
nop
nop
nop
nop
sll $t2, $t2, 2
nop
nop
nop
nop5
srl $t2, $t2, 2
nop
nop
nop
nop
slt $t1, $t2, $t5
nop
nop
nop
nop
slti $t1, $t5, 31 