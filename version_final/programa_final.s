.data
    dato1:                   .word 125 #productos
    dato2:                   .word 12 #capacidad
    resultado1: .word 0 #cajas completas
    resultado2: .word 0 #producto sobrante 
    resultado3: .word 0 #coincidencia entre cajas y productos
    mensaje_productosresiduo: .asciiz "Productos sin empacar: " #preparamos el mensaje desde la memoria
    mensaje_productoscom: .asciiz "Empaque completo" #se prepara el mensaje desde la memoria

.text
.globl main

main:
    lw $t0, dato1 #cargamos el valor al registro t0 desde la memoria al registro
    lw $t1, dato2 #cargamos el valor al registro t1 desde la memoria al registro
    div $t2, $t0, $t1 #operacion para calcular cajas completas
    rem $t3, $t0, $t1 #operacion para calcular el sobrante de los productos
    seq $t4, $t0, $t1 #pregunta si coincide los productos y las cajas
    sw $t2, resultado1 #guardamos la cantidad de cajas completas en resultado 1 del registro a la memoria
    sw $t3, resultado2 #guardamos la cantidad de producto sobrante en resultado 2 del registro a la memoria
    sw $t4, resultado3 #guardamos si salio 1 o 0 en resultado 3 para ver la coincidencia 

    bne $t3, $zero, sobrante #si residuo != 0 salta a la etiqueta sobrante, si no, continua
    li $v0, 4 #syscall 4 nos dice que se imprime caracteres
    la $a0, mensaje_productoscom #cargamos la direccion del mensaje en $a0
    syscall #se imprime el mensaje
    li $v0, 10 #finalizacion del programa
    syscall

sobrante: 
    li $v0, 4 #syscall 4 nos dice que se imprime caracteres
    la $a0, mensaje_productosresiduo #cargamos la direccion del mensaje en $a0
    syscall #se imprime el mensaje
    li $v0, 1 #syscall 1 nos dice que se imprime un entero
    add $a0, $t3, $zero #movemos $t3 a $a0 con la ayuda de sumando $zero
    syscall #se imprime el entero en este caso el residuo
    li   $v0, 10 #finalizamos el programa    
    syscall
