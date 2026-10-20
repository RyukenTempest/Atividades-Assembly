# 9. Leia dois numeros inteiros e exiba o quociente.
# O segundo numero nao pode ser zero.
# Repita a leitura do segundo numero ate ele ser valido.

.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero (diferente de zero): "
msg3: .asciiz "Quociente inteiro: "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, $zero

ler_divisor:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, $zero

    beq $t1, $zero, ler_divisor

    div $t0, $t1
    mflo $t2

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $t2, $zero
    syscall

    li $v0, 10
    syscall