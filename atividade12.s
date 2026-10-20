# 12. Leia a altura, em centimetros, de 15 pessoas.
# Calcule e mostre:
# a) A menor altura do grupo.
# b) A maior altura do grupo.

.data
msg1: .asciiz "Digite a altura da pessoa em cm: "
msg2: .asciiz "\nMenor altura: "
msg3: .asciiz "\nMaior altura: "

.text
main:
    # Le a primeira altura para inicializar
    # os valores de menor e maior.
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall

    add $t1, $v0, $zero
    add $t2, $v0, $zero

    # $t0 conta quantas pessoas foram lidas.
    li $t0, 1

ler:
    # Para depois de ler as 15 pessoas.
    bge $t0, 15, mostrar

    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t3, $v0, $zero

    # Atualiza a menor altura, se necessario.
    bge $t3, $t1, verificar_maior
    add $t1, $t3, $zero

verificar_maior:
    # Atualiza a maior altura, se necessario.
    ble $t3, $t2, continuar
    add $t2, $t3, $zero

continuar:
    addi $t0, $t0, 1
    j ler

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    add $a0, $t1, $zero
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $t2, $zero
    syscall

    li $v0, 10
    syscall