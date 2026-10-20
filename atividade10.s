# 10. Receba dois inteiros e exiba o resto da divisao
# do maior pelo menor.
# Nao utilize REM. Utilize DIV, MUL e SUB.
# Verifique qual numero e o maior no inicio.

.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero: "
msg3: .asciiz "Resto da divisao: "
msg4: .asciiz "Erro: divisao por zero."

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

    # Define o maior em $t2 e o menor em $t3.
    bge $t0, $t1, a_maior

    add $t2, $t1, $zero
    add $t3, $t0, $zero
    j verificar_zero

a_maior:
    add $t2, $t0, $zero
    add $t3, $t1, $zero

verificar_zero:
    beq $t3, $zero, erro

    # Quociente = maior / menor.
    div $t2, $t3
    mflo $t4

    # Produto = quociente * menor.
    mul $t5, $t4, $t3

    # Resto = maior - produto.
    sub $t6, $t2, $t5

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    add $a0, $t6, $zero
    syscall

    j sair

erro:
    li $v0, 4
    la $a0, msg4
    syscall

sair:
    li $v0, 10
    syscall