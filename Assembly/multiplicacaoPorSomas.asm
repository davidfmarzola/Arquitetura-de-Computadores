# programa 17

# Para a expressão a seguir, escreva um programa que calcule o valor de k:
# k = x * y (Você deverá realizar a multiplicação através de somas!)
# O valor de x deve ser lido da primeira posição livre da memória e o valor de y deverá 
# lido da segunda posição livre. O valor de k, após calculado, deverá ainda ser escrito na 
# terceira posição livre da memória.

.text
.globl main
main:
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
lw $s0,0x0000($t0) #x=MEM[0x10010000]
lw $s1,0x0004($t0) #y=MEM[0x10010004]
do:
add $t1,$s0,$zero #t1=x+0 
add $s2,$s2,$t1 #k=k+t1
#repito o laço y vezes
addi $s1,$s1,-1#y=y+1
bne $s1,$zero,do#y!=0, do
sw $s2,0x0008($t0) #MEM[0X0008]=k

#area da memória
.data
x: .word 4 # 1° posição da memória
y: .word 3
