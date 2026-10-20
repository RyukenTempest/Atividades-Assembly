# 6. Leia dois inteiros A e B.
# Se forem iguais, some os dois.
# Caso contrario, multiplique A por B.
# Guarde o resultado em C e exiba C.

.data
msg1: .asciiz "Digite A: "
msg2: .asciiz "Digite B: "
msg3: .asciiz "Resultado C: "

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

    beq $t0, $t1, iguais
    j diferentes

iguais:
    add $t2, $t0, $t1
    j mostrar

diferentes:
    mul $t2, $t0, $t1

mostrar:
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $t2, $zero
    syscall

    li $v0, 10
    syscall