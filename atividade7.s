# 7. Leia um numero.
# Some 5 caso seja par ou 8 caso seja impar.
# Imprima o resultado.

.data
msg1: .asciiz "Digite um numero inteiro: "
msg2: .asciiz "Resultado: "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $t1, 2
    div $t0, $t1
    mfhi $t2

    beq $t2, $zero, par
    j impar

par:
    addi $t0, $t0, 5
    j mostrar

impar:
    addi $t0, $t0, 8

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    add $a0, $t0, $zero
    syscall

    li $v0, 10
    syscall