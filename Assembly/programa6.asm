# x = o maior inteiro possível;
# y = 300.000; 0x493E0
# z = x - 4y
# x=$s0, y=$s1, z=$s2

.text
.globl main

main:
#maior inteiro possível
addi $t0, $zero, 0x7fff 
sll $t0, $t0, 16
ori $s0, $t0, 0xffff
#y=300.000
addi $t1, $zero, 4
sll $t1, $t1, 16
ori $s1, $t1, 0x93E0
#4y
sll $t2, $s1, 2 
#z=x-4y
sub $s2, $s0, $t2
