#Escreva uma função que receba como argumentos 2 números inteiros de 32 bits. Essa função deverá 
#também retornar um inteiro. 
#O primeiro número recebido como parâmetro representa um endereço de memória e o segundo uma 
#quantidade de elementos. Sua função deverá criar um vetor que tem início nesse endereço de memória 
#(primeiro argumento) e a quantidade de elementos desse vetor dadas pelo segundo argumento. 
#Cada elemento do vetor é um elemento da série: 
#y[i] = 2i – 1 se i for par; 
#y[i] = i se i for impar. 
#O valor retornado será a soma de todos os elementos de y[].

.text 
.globl main 
main: 
#$s1->vet[i],$s2->tamvet,$t0->i
addi $s1,$zero,0x1001#s1=0x00001001
sll $s1,$s1,16#s1=0x10010000
addi $s2,$zero,0x0010#s2=16
jal soma
nop 
add $s3, $zero, $v0#s3=0+
j fim
soma:
andi $s4,$s2,1#(0)par,(1)impar
beq $s4,$zero,par#while(s4=0) goto par
impar:

add $v0, $v0, $s1#v0=v0+s1
jr $ra 
par:

add $v0, $v0, $s1#v0=v0+s1
jr $ra 
fim:
#Definindo a função e retornando 
 
 
