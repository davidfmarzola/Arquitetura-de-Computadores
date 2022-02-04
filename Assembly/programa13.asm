# programa 13:

.text
.globl main
main:
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
# armazenando o valor da memória no registrador
lw $s0,0x0000($t0) #a=MEM[0x0000]

# númro negativo ou positivo
srl $t1,$s0,31 #t1=1(bit de sinal)
beq $t1,$0,la #desvia para L2 se bit de sinal = 0
# modulo do número
sub $s0,$zero,$s0 #a=0-(-2)=2
la:
sw $s0,0x0000($t0)#MEM[0x0000]=a 

.data
a: .word -2 # 1° posição da memória
