# programa 16

# Escreva um programa que avalie a expressão: (x*y)/z. 
# Use x = 1600000 (=0x186A00), y = 80000 (=0x13880), e z = 400000 (=0x61A80). 
# Inicializar os registradores com os valores acima
# $s0=x, $s1=y, $s2=z

.text
.globl main
main:
addi $s0,$zero,0x186a
sll $s0,$s0,8 #x=0x18600
addi $s1,$zero,0x1388
sll $s1,$s1,4 #y=0x13880
addi $s2,$zero,0x61a8
sll $s2,$s2,4 #z=0x13880
div $s0,$s2
mflo $t0
mul $s3,$s1,$t0
