# Usar as inst. sll, srl e sra
# x = 3;
# y = 4 ;
# z = ( 15*x + 67*y)*4
# x = $s0, y = $s1, z = $s2

.text
.globl main

main:
addi $s0, $zero, 3 # x = 3
sll $t0, $s0, 4 # t0 = 15x+3
sub $t0, $t0, $s0 #  t0 = 15x
addi $s1, $zero, 4 # y = 4
sll $t1, $s1, 6 # t1=67y-11
addi $t1, $t1, 12 # t1=67y
add $t2, $t0, $t1 # t2=t0+t1
sll $s2, $t2, 2 # z = t2*4
