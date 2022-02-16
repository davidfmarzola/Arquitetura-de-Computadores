#leia número; 
#se ( 50 <= número <=100 ou 150 <= número <= 200) 
#    registrador flag = 1; 
#caso contrério 
#    registrador flag = 0; 

addi $s1,$zero,1 #s1=1
addi $t0, $zero,0x1001 #t0=0x00001001
sll $t0, $t0,0x0010 #0x10010000
lw $s0,0($t0)#numero=MEM[0]

slti $t2,$s0,101#t2=1 if num<101,t2=0 num>=101
beq $t2,$zero,segundoif #t2=0 goto segundoif
slti $t2,$s0,50 #t2=1 if num<50
beq $t2,$zero,true #t2=0 goto true
segundoif:
slti $t2,$s0,201#t2=1 if num<201,t2=0 num>=201
beq $t2,$zero,false #t2=0 goto false
slti $t2,$s0,150 #t2=1 if num<150
beq $t2,$s1,false #t2=1 goto false
true:
addi $s2,$zero,1#flag=1
j fim
false:
addi $s2,$zero,0#flag=0
fim:
.data
.word 201
