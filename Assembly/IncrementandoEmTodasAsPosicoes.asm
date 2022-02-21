#programa que incrementa 1 em todas posições da memória
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
#Repita os cálculos anteriores para o seguinte programa em MIPS: 
addi $s3, $s2, 396 #s3=s2+396
LOOP: 
lw $s1,0($t1) #s1=MEM[t1]
addi $s1,$s1,1 #s1=s1+1
sw $s1,0($t1) #MEM[i]=$s1
addi $t1,$t1,4 #t1=t1+4
sub $s5,$s3,$t1 #s5=s3-t1
bne $s5,$zero,LOOP #while(s5!=zero) goto loop
fim:
