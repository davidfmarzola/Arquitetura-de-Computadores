#y=x^4 + x^3 - 2x^2 -> se x for par 
#y = x^5 – x^3 + 1 -> se x for impar

#valores constantes
addi $t7,$zero,1#t7=1
addi $t2,$zero,4#t2=4
addi $t3,$zero,3#t3=3
addi $t4,$zero,2#t4=2
addi $t5,$zero,5#t5=5

addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
lw $s0,0x0000($t0)#x=MEM[0]
andi $t6,$s0,1 #par(0),impar(1)
beq $t6,$t7,impar#t6==t7 goto impar
par:
mul $t1,$s0,$s0#t1=x^2
mflo $t1
mul $s1,$t1,$s0#t1=x^3
mflo $s1
mul $t1,$s1,$s0#t1=x^4
mflo $t1
mul $s2,$s0,$s0#s2=x^2
mflo $s2
sll $s2,$s2,1#s2=s2*2
add $s3,$t1,$s1#s3=t1+s1
sub $s3,$s3,$s2#s3=s3-s2
lw $s3,0x0004($t0)
j fim
impar:
addi $s4,$zero,1
addi $s5,$zero,1
potencia5:
mul $s4,$s4,$s0#s4=x*x
addi $t8,$t8,1#t8=t8+1
bne $t8,$t5,potencia5
potencia3:
mul $s5,$s5,$s0#s5=x*x
addi $t9,$t9,1#t9=t9+1
bne $t9,$t3,potencia3
sub $s6,$s4,$s5#s6=s4-s5
addi $s6,$s6,1#s6=s6+1
lw $s6,0x0004($t0)
fim:

.data
.word 3
