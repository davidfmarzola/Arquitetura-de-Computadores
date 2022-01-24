# programa 10

# Considere o seguinte programa: y = 127x – 65z + 1
# Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores 
# de x e z estão armazenados na memória e, na posição imediatamente a seguir, o valor de 
# y deverá ser escrito, ou seja:

# x está na primeira posição livre da memória - 0x10010000 - $s0
# z está na 2 posição livre da memória - 0x10010004 - $s1
# y está na 5 posição livre da memória - 0x10010008 - $s2
# lw r1, num(r2) - r1=MEM[num+r2]
# sw r1, num(r2) - MEM[num+r2]=r1

.text
.globl main
main:
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
lw $s0,0x0000($t0)
lw $s1,0x0004($t0)

sll $t1,$s0,7 #t1=128x
sub $t1,$t1,$s0 #t1=t1-x=127x
sll $t3,$s1,6 #t3=64z
add $t3,$t3,$s1 #t3=t3+z=65z
sub $s2,$t1,$t3 #y=127x-65z
addi $s2,$s2,1 #y=y+1=127x – 65z + 1
sw $s2, 0x0008($t0)

.data
x: .word 5
z: .word 7
y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa.
