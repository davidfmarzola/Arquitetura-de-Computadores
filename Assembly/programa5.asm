# quinto programa
# x = 100000 = 0x186a0
# y = 200000 = 0x30d40
# z = x + y

# x=$s0, y=$s1, z=$s2

.text
.globl main

main:
addi $t0, $zero, 1
sll $t0, $t0, 16
ori $s0, $t0, 0x86a0

addi $t0, $zero, 3
sll $t0, $t0, 16
ori $s1, $t0, 0x0d40

add $s2, $s0, $s1 # z = x + y
