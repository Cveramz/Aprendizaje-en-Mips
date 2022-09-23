.data
.text
addiu $t0, $zero, 0x10010000
addi $t1, $zero, 5
sw $t1, 0($t0)
lw $t2, 0($t0)
sub $t2, $t2, 1
sw $t2, 16($t0)
