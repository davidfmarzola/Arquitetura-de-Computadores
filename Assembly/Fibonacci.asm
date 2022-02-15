#Escreva um programa que compute a série de Fibonacci, a série é definida como: 
 
#1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ... 
 
#Cada termo da soma é a soma dos dois termos predecessores. 
#Exemplo: o termo 13 é a soma de 5 e 8. 
#Escreva o programa que compute os primeiros 100 termos da série. Se não for possível computar estes 
#100 termos, identifique a maior quantidade possível suportada pelo emulador. 
#Cada termo deverá estar em uma posição da memória. O primeiro termo na primeira posição livre da 
#memória. 

addi $t1,$zero,1#t1=1 
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
sw $t1,0($t0)#MEM[0]=t1
sw $t1,4($t0)#MEM[1]=t1
addi $t2,$zero,100#t2=100
addi $t3,$zero,2#i=2
loop:
lw $s1,0($t0)#s1=MEM[i]
lw $s2,4($t0)#s2=MEM[i+1]
add $s3,$s1,$s2#y=s1+s2
sw $s3,8($t0) #MEM[i+2]=s3
addi $t0,$t0,4#i=i+1
bne $t3,$t2,loop#while(i!=t2)
