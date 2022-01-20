# programa 9

# soma = x1 + x2 + x3 + x4
# x1 está na primeira posição livre da memória - 0x10010000 - $s0
# x2 está na 2 posição livre da memória - 0x10010004 - $s1
# x3 está na 3 posição livre da memória - 0x10010008 - $s2
# x4 está na 4 posição livre da memória - 0x1001000c - $s3
# soma está na 5 posição livre da memória - 0x10010010 - $s4
# lw r1, num(r2) - r1=MEM[num+r2]
# sw r1, num(r2) - MEM[num+r2]=r1
.text # area do código
.globl main
main:
# acessando o endereço de memória
addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
# lendo dados(word) da memória
lw $s0,0x0000($t0)
lw $s1,0x0004($t0)
lw $s2,0x0008($t0)
lw $s3,0x000c($t0)

#cálculos e armazenamento na memória
add $t1, $s0, $s1 # t1=x1+x2
add $t1, $t1, $s2 # t1 = t1 + x3
add $s4, $t1, $s3 # soma = t1 + s3
sw $s4, 0x0010($t0)
addi $t2,$t2,-1

# área destinada à memória
.data  # 0x 10010000
x1: .word 15
x2: .word 25
x3: .word 13
x4: .word 17
soma: .word -1
