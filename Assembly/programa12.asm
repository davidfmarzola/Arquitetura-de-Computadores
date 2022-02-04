# programa 12

#Considere a seguinte situação:
#int ***x;

#onde x contem um ponteiro para um ponteiro para um ponteiro para um inteiro.
#Nessa situação, considere que a posição inicial de memória contenha o inteiro em 
#questão
#Coloque todos os outros valores em registradores, use os endereços de memória que 
#quiser dentro do espaço de endereçamento do Mips.

#Resumo do problema:
#k = MEM [ MEM [MEM [ x ] ] ]. 

#Crie um programa que implemente a estrutura de dados acima, leia o valor de K, o 
#multiplique por 2 e o reescreva no local correto conhecendo-se apenas o valor de x
# lw r1, num(r2) - r1=MEM[num+r2]
# sw r1, num(r2) - MEM[num+r2]=r1
.text
.globl main
main:
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
# armazenando o valor da memória no registrador
lw $s0,0x0000($t0) #x1=MEM[0x0000]
lw $s1,0x0004($t0) #x2=MEM[0x0004]
lw $s2,0x0008($t0) #x3=MEM[t0+0x0008]

# armazenando o valor do registrador na memória
sll $s0,$s0,1 #valor de k
sw $s0, 0x000c($t0) #MEM[0x000c]=x

.data
dado: .word 2 # 1° posição da memória
x1: .word 0x10010000
x2: .word 0x10010004
x3: .word 0x10010008
