# 1. A imobiliaria Imobilis vende apenas terrenos retangulares.
# Leia as dimensoes de um terreno e exiba sua area.

.data
msg1: .asciiz "Digite o comprimento: "
msg2: .asciiz "Digite a largura: "
msg3: .asciiz "Area do terreno: "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    add $t1, $v0, $zero

    mul $t2, $t0, $t1

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    add $a0, $t2, $zero
    syscall

    li $v0, 10
    syscall