

.text
main:
	la $a0,msg1 #carga el mensaje en $a0
	li $v0,4 
	syscall #imprime el mensaje

	li $v0,5 #lee un entero
	syscall #guarda el entero en $v0
	move $t2,$v0 #guarda el entero en $t2

	move $a0,$t2 #carga el entero en $a0
	move $v0,$t2 #carga el entero en $v0 para que no se pierda
	jal fib #llama a fib
	move $t3,$v0 #guarda el resultado en $t3

	la $a0,msg2 #carga el mensaje en $a0
	li $v0,4 
	syscall #imprime el mensaje que se muestra antes del numero ingresado

	move $a0,$t2 #carga el numero ingresado en $a0
	li $v0,1 
	syscall #imprime el numero ingresado

	la $a0,msg3 #carga el mensaje en $a0 que muestra el resultado
	li $v0,4
	syscall #imprime el mensaje

	move $a0,$t3 #carga el resultado en $a0
	li $v0,1 
	syscall #imprime el resultado

	li $v0,10 #finalmente termina el programa
	syscall #termina el programa


fib: #funcion fib, recibe el numero en $a0, devuelve el resultado en $v0

	#revisamos casos bases para no hacer llamadas recursivas
	beqz $a0,casoCero
	beq $a0,1,casoUno 
	#==============================


	sub $sp,$sp,4 #sp es el puntero de la pila, se le resta 4 para guardar el valor de $ra
	sw $ra,0($sp) #guarda el valor de $ra en la pila

	sub $a0,$a0,1 #se le resta 1 al numero para la llamada recursiva
	jal fib #llama a fib con el numero -1
	add $a0,$a0,1 #se le suma 1 al numero para que no se pierda

	lw $ra,0($sp) #se carga el valor de $ra que se guardo en la pila
	add $sp,$sp,4 #se le suma 4 al puntero de la pila para que apunte al valor anterior

	sub $sp,$sp,4 #se le resta 4 al puntero de la pila 
	sw $v0,0($sp) #se guarda el valor de $v0 en la pila

	sub $sp,$sp,4 #se le resta 4 al puntero de la pila porque se va a guardar el valor de $ra
	sw $ra,0($sp) #se guarda el valor de $ra en la pila

	sub $a0,$a0,2 #se le resta 2 al numero para la llamada recursiva
	jal fib  #llama a fib con el numero -2
	add $a0,$a0,2 #se le suma 2 al numero para que no se pierda

	lw $ra,0($sp) #se carga el valor de $ra que se guardo en la pila
	add $sp,$sp,4 #se le suma 4 al puntero de la pila para que apunte al valor anterior

	lw $s7,0($sp) #se carga el valor de $v0 que se guardo en la pila
	add $sp,$sp,4 #se le suma 4 al puntero de la pila para que apunte al valor anterior

	add $v0,$v0,$s7 #se suman los dos valores de $v0 que se guardaron en la pila
	jr $ra #finalmente se retorna el resultado


casoCero: #caso base, si el numero es 0 retorna 0
	li $v0,0
	jr $ra
casoUno: #caso base, si el numero es 1 retorna 1
	li $v0,1
	jr $ra

.data
msg1: .asciiz "Ingrese un numero entero: "
msg2: .asciiz "El fibonacci del numero ingresado ("
msg3: .asciiz ") es: "

