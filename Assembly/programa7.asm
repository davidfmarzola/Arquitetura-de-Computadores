# programa 7
# $8(number) está em $t0
ori $8, $0, 0x01 # $8 = 0x01
ori $8, $8, 0xffff # $8 = 0x0000ffff
sll $8, $8, 16 # $8 = 0xffff0000
ori $8, $8, 0xffff # $8 = 0xffffffff
