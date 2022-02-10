# programa 14:

# Escreva um programa que leia um valor A da memória, identifique se o número é par 
# ou não. Um valor deverá ser escrito na segunda posição livre da memória (0 para par e 
# 1 para ímpar).

.text
.globl main
main:
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
# armazenando o valor da memória no registrador
lw $s0,0x0000($t0) #a=MEM[0x0000]

andi $t1,$s0,1 #par ou ímpar
sw $t1,0x0004($t0)#MEM[0x0004]=t1

.data
a: .word 4 # 1° posição da memória
flag: .word -1 #par ou ímpar
