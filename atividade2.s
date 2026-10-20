# 2. Camisetas pequenas custam R$ 10, medias R$ 12
# e grandes R$ 15.
# Leia as quantidades vendidas e informe o total arrecadado.

.data
msg1: .asciiz "Quantidade de camisetas pequenas: "
msg2: .asciiz "Quantidade de camisetas medias: "
msg3: .asciiz "Quantidade de camisetas grandes: "
msg4: .asciiz "Total arrecadado: R$ "

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

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    add $t2, $v0, $zero

    li $t3, 10
    mul $t4, $t0, $t3

    li $t3, 12
    mul $t5, $t1, $t3

    li $t3, 15
    mul $t6, $t2, $t3

    add $t7, $t4, $t5
    add $t7, $t7, $t6

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    add $a0, $t7, $zero
    syscall

    li $v0, 10
    syscall