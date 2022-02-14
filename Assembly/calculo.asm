# programa 18

# Para a expressão a seguir, escreva um programa que calcule o valor de k: 
# k = x^y
# Obs: Você poderá utilizar o exercício anterior.
# O valor de x deve ser lido da primeira posição livre da memória e o valor de y deverá 
# lido da segunda posição livre. O valor de k, após calculado, deverá ainda ser escrito na 
# terceira posição livre da memória.
# Dê um valor para x e y (dê valores pequenos !!) e use o MARS para verificar a 
# quantidade de instruções conforme o tipo (ULA, Desvios, Mem ou Outras)

.text
.globl main
main:
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
lw $s0,0x0000($t0) #x=MEM[0x10010000]
lw $s1,0x0004($t0) #y=MEM[0x10010004]
addi $s1,$s1,-1 #y=y-1
add $s2,$s2,$s0 #k=k+x
la:
mul $s2,$s2,$s0 #k=x*x - não é instrução aritmética

addi $s1,$s1,-1 #y=y-1
bne $s1,$zero,la #(y!=0)?goto la:encerra;
sw $s2,0x0008($t0)

#ula=4+n
#desvio = n = y-1 = 2
#memoria = 2+1 = 3

.data
x: .word 4
y: .word 3
