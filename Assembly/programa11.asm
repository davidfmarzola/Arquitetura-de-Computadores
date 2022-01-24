# // programa 11

# Considere o seguinte programa: y = x – z + 300000
# igual à questão anterior
# x está na 1 posição livre da memória - 0x10010000 - $s0
# z está na 2 posição livre da memória - 0x10010004 - $s1
# y está na 3 posição livre da memória - 0x10010008 - $s2

addi $t0, $zero, 0x1001 #t0=0x00001001
sll $t0, $t0, 0x0010 #0x10010000
lw $s0,0x0000($t0)
lw $s1,0x0004($t0)

sub $t1,$s0,$s1 #t1=x-z
addi $t2,$0,0x4 #y=0 + 0x0004
sll $t2,$t2,16 # y=0x40000
ori $t2,$t2,0x93E0 #y=y||0x93e0=300000
add $s2,$t1,$t2
sw $s2, 0x0008($t0)

.data
x: .word 100000
z: .word 200000
y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa
