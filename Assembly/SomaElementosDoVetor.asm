#Para os dois exercícios a seguir, considere que a máquina opera a 100MHz e os CPIs das instruções são: 
#Instruções da ALU -> 3; 
#Instruções de Desvio -> 4; 
#Instruções de MEM -> 5; 
  
#Considere que um vetor de 100 números inteiros está armazenado na memória e o endereço base está 
#em $S1. Escrever um programa que some todos os elementos do vetor e armazene esta soma na primeira 
#posição de memória após o vetor. Calcule o CPI médio, o tempo de execução do programa, implemente 
#alguma melhoria nesse seu programa e calcule o speedup (se o seu programa já está na menor versão 
#possível, insira dois nops dentro do loop e calcule o speedup do programa original sobre esse com os dois 
#nops). 

#1° parte: vetor totalmente desordenado
addi $s4,$zero,100 #s4=100
addi $t3,$zero,100 #t3=100
addi $t0,$zero,0x1001 #t0=0x00001001
sll $t0,$t0,16 #0x10010000 
desordenado:
sw $s4,0($t0)#MEM[i]=s4
addi $s4,$s4,-1#s4=s4-1
addi $t0,$t0,4#i=i+1
bne $s4,$zero,desordenado#while(s4!=0) goto desordenado
addi $t1,$zero,0x1001 #t0=0x00001001
sll $t1,$t1,16 #0x10010000
do:
lw $s1,0($t1) # h=MEM[0+t0] - h=A[i]
add $s2,$s2,$s1 #s2=s2+s1
addi $t1,$t1,4 #MEM[t0+4]
addi $t2,$t2,1#t2+=1
bne $t2,$t3,do #while(t2!=t3) do
fim:
sw $s2,0x0000($t1) #soma de todos os valores do vetor
