.data
.text
addi $t6, $zero, 10 #t6 = 7
addi $t7, $zero, 15 #t7 = 3
addi $t0, $zero, 0 #t0 = 0
bgt $t7, $zero, loop
#while ($t7 > 0)
loop:
# $t0 = += $t6
add $t0, $t0, $t6
# $t7 -= 1
addi $t7, $t7, -1
# if ($t7 > 0) ir a loop
bgt $t7, $zero, loop
#fin while
j end
end:


