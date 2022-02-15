.text
.globl main
main:
#1° parte = vetor totalmente desordenado
addi $s4,$zero,100 #s4=100
addi $t0,$zero,0x1001 #t0=0x00001001
sll $t0,$t0,16 #0x10010000 
desordenado:
sw $s4,0($t0)#MEM[i]=s4
addi $s4,$s4,-1#s4=s4-1
addi $t0,$t0,4#i=i+1
bne $s4,$zero,desordenado#while(s4!=0) goto desordenado
#analisar e implementar abaixo
addi $s1,$zero,99
addi $s2,$zero,100
do1:
addi $s2,$s2,-1
addi $s1,$zero,99
do2:
sll $t0,$s1,2
add $t0,$s0,$t0
lw $t1,0($t0)
lw $t2,-4($t0)
slt $t3,$t2,$t1
beq $t3,$zero,else
add $s3,$t1,$zero
sw $t2,0($t0)
sw $s3,-4($t0)
else:
addi $s1,$s1,-1
bne $s1,$zero,do2
bne $s2,$zero,do1
