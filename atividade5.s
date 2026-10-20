# 5. Leia os catetos de um triangulo e calcule a hipotenusa.
# hipotenusa = raiz(cateto1^2 + cateto2^2)

.data
msg1: .asciiz "Digite o primeiro cateto: "
msg2: .asciiz "Digite o segundo cateto: "
msg3: .asciiz "Hipotenusa: "

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

    mul $t2, $t0, $t0
    mul $t3, $t1, $t1
    add $t4, $t2, $t3

    mtc1 $t4, $f0
    cvt.s.w $f0, $f0
    sqrt.s $f12, $f0

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 2
    syscall

    li $v0, 10
    syscall