# 4. Calcule a area de um trapezio usando numeros inteiros.
# A = ((base maior + base menor) * altura) / 2

.data
msg1: .asciiz "Base maior: "
msg2: .asciiz "Base menor: "
msg3: .asciiz "Altura: "
msg4: .asciiz "Area do trapezio: "

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

    add $t3, $t0, $t1
    mul $t3, $t3, $t2

    li $t4, 2
    div $t3, $t4
    mflo $t5

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    add $a0, $t5, $zero
    syscall

    li $v0, 10
    syscall