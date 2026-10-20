# 8. Encontre o dobro de um numero positivo
# e o triplo de um numero negativo.
# Imprima o resultado.

.data
msg1: .asciiz "Digite um numero: "
msg2: .asciiz "Resultado: "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, $zero

    bgt $t0, $zero, positivo
    blt $t0, $zero, negativo
    j mostrar

positivo:
    li $t1, 2
    mul $t0, $t0, $t1
    j mostrar

negativo:
    li $t1, 3
    mul $t0, $t0, $t1

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    add $a0, $t0, $zero
    syscall

    li $v0, 10
    syscall