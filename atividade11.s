# 11. Leia uma quantidade desconhecida de numeros.
# Conte os numeros nos intervalos:
# [0-25], [26-50], [51-75] e [76-100].
# Um numero negativo encerra a entrada.
# Rejeite numeros maiores que 100.

.data
msg1: .asciiz "Digite um numero (negativo encerra): "
msg2: .asciiz "Numero invalido. Digite ate 100.\n"
msg3: .asciiz "\nQuantidade de 0 a 25: "
msg4: .asciiz "\nQuantidade de 26 a 50: "
msg5: .asciiz "\nQuantidade de 51 a 75: "
msg6: .asciiz "\nQuantidade de 76 a 100: "

.text
main:
    # Inicializa os quatro contadores.
    li $t1, 0
    li $t2, 0
    li $t3, 0
    li $t4, 0

ler:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, $zero

    # Numero negativo encerra a entrada.
    blt $t0, $zero, mostrar

    # Valores acima de 100 sao rejeitados.
    bgt $t0, 100, invalido

    # Identifica o intervalo do numero.
    ble $t0, 25, faixa1
    ble $t0, 50, faixa2
    ble $t0, 75, faixa3
    j faixa4

invalido:
    li $v0, 4
    la $a0, msg2
    syscall
    j ler

faixa1:
    addi $t1, $t1, 1
    j ler

faixa2:
    addi $t2, $t2, 1
    j ler

faixa3:
    addi $t3, $t3, 1
    j ler

faixa4:
    addi $t4, $t4, 1
    j ler

mostrar:
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $t1, $zero
    syscall

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    add $a0, $t2, $zero
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    add $a0, $t3, $zero
    syscall

    li $v0, 4
    la $a0, msg6
    syscall
    li $v0, 1
    add $a0, $t4, $zero
    syscall

    li $v0, 10
    syscall