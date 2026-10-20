# 3. A empresa paga R$ 10 por hora normal e R$ 15
# por hora extra.
# Leia as horas normais, as horas extras e o desconto.
# Calcule e exiba o salario bruto e o salario liquido.
# O desconto e informado como valor inteiro em reais.

.data
msg1: .asciiz "Horas normais trabalhadas: "
msg2: .asciiz "Horas extras trabalhadas: "
msg3: .asciiz "Desconto em reais: "
msg4: .asciiz "Salario bruto: R$ "
msg5: .asciiz "\nSalario liquido: R$ "

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

    li $t3, 15
    mul $t5, $t1, $t3

    add $t6, $t4, $t5
    sub $t7, $t6, $t2

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    add $a0, $t6, $zero
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    add $a0, $t7, $zero
    syscall

    li $v0, 10
    syscall