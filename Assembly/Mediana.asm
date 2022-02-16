#Escreva um programa que calcule a mediana(valor do meio) de 3 números armazenados na memória. Após encontrar 
#essa mediana, escrevê-la na posição seguinte aos 3 números. 
#Exemplo: 

main:
addi $t0, $zero,0x1001 #t0=0x00001001
sll $t0, $t0,16 #0x10010000

lw $s0,0($t0)#a=MEM[0]
lw $s1,4($t0)#b=MEM[1]
lw $s2,8($t0)#c=MEM[2]
slt $t1,$s0,$s1 #t1=1 if(a<b)
beq $t1,$zero,ouprimeiroif
slt $t1,$s2,$s0#t1=1 if(c<a)
beq $t1,$zero,ouprimeiroif
sw $s0,12($t0)#MEM[3]=a
j fim
ouprimeiroif:
slt $t1,$s0,$s2 #t1=1 if(a<c)
beq $t1,$zero,segundoif
slt $t1,$s1,$s0#t1=1 if(b<a)
beq $t1,$zero,segundoif
sw $s0,12($t0)#MEM[3]=a
j fim
segundoif:
slt $t1,$s1,$s0 #t1=1 if(b<a)
beq $t1,$zero,ousegundoif
slt $t1,$s2,$s1#t1=1 if(c<b)
beq $t1,$zero,ousegundoif
sw $s1,12($t0)#MEM[3]=b
j fim
ousegundoif:
slt $t1,$s1,$s2 #t1=1 if(b<c)
beq $t1,$zero,terceiroif
slt $t1,$s0,$s1#t1=1 if(a<b)
beq $t1,$zero,terceiroif
sw $s1,12($t0)#MEM[3]=b
j fim
terceiroif:
sw $s2,12($t0)#MEM[3]=c
fim:
.data
A: .word 9
B: .word 10 
C: .word 93
