#y=x^3 + 1 se x > 0 
#y=x^4 - 1 se x <= 0

addi $t2,$zero,1#t2=1 
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
lw $s0,0x0000($t0)#x=MEM[0]
slt $t1,$s0,$t2 #t1=1 if(x<1), t1=0 if(x>=1)
mul $t2,$s0,$s0#t1=x^2
mul $t2,$t2,$s0#t1=x^3
beq $t1,$zero, maior#t1=0 goto maior
menorigual:
mul $t2,$t2,$s0#t2=x^4
addi $s1,$t2,-1#y=t2-1
sw $s1,4($t0)#MEM[1]=y
j fim
maior:
addi $s1,$t2,1#y=t2+1
fim:
sw $s1,4($t0)#MEM[1]=y


.data
.word -2
