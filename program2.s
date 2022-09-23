.data


.text
#x
addi $t3, $zero, 3
#y
addi $t4, $zero, -1
#z
add $t1, $t3, $t4

beq $t1, $zero, CASOZIGUALCERO
beq $t1, 1, CASOZIGUALUNO
addi $t4, $t4, -1


CASOZIGUALCERO:

addi $t4, $t4, 1
j FIN

CASOZIGUALUNO:

addi $t4, $zero, 100
j FIN

FIN:

