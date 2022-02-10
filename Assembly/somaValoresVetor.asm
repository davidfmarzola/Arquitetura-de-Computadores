# programa 15:

# Escrever um programa que crie um vetor de 100 elementos na memória onde 
# vetor[i]=2*i + 1. Após a última posição do vetor criado, escrever a soma de todos 
# os valores armazenados do vetor.
# Use o MARS para verificar a quantidade de instruções conforme o tipo (ULA, Desvios, 
# Mem ou Outras)
# $t2=i,$t0=MEM[i],$s1=2*i + 1
.text
.globl main
main:
addi $t3,$zero,100
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
do:
# armazenando o valor da memória no registrador
sll $s1,$t2,1 #s1=t2*2 - 2*i
addi $s1,$s1,1 #s1+=1
lw $zero,0x0000($t0) # h=MEM[0+t0] - h=A[i]
sw $s1,0x0000($t0) # MEM[0+t0]=h - MEM[i]=h
addi $t0,$t0,4 #MEM[t0+4]
add $s2,$s2,$s1 #s2=s2+s1

#loop até t2=100
addi $t2,$t2,1
bne $t2,$t3,do 
sw $s2,0x0000($t0) #soma de todos os valores do vetor

#ula=3+5n=503
#desvio = n = 100
#memoria = 2n+1=201



