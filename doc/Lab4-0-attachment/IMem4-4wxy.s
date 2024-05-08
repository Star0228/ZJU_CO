


auipc x1, 0    

jal	x0, start          # 00 

trap:

addi	x30, x0, 0xB  #验证跳转是否成功

nop

nop

nop

addi x0,x0,0 # mert

dummy:   

addi	x0, x0, 0                    # 04    

addi	x0, x0, 0                     # 08    

addi	x0, x0, 0                      # 0C    

addi	x0, x0, 0                      # 10    

addi	x0, x0, 0                     # 14    

addi	x0, x0, 0                      # 18    

addi	x0, x0, 0                     # 1C   

 jal	x0, dummy





start: 

add	x27, x0, x0	#0x00000DB3

add	x28, x0, x0 #	0x00000E33

add	x29, x0, x0	#0x00000EB3

add	x30, x0, x0 #0x00000DB3

addi	x31, x0, 0x99

#CSRRW

addi	x29, x29, 0xff	#0x0FFE8E93

addi	x27, x27, 0xff 	# 0x0FFD8D93

csrrw	x28,0x300, x27	

csrrw	x28, 0x300 , x31	

bne	x28, x27, dummy

addi	x30, x0, 1

#CSRRS

addi	x27, x0, 0x66

csrrs	x28, 0x300, x27

csrrw	x28, 0x300, x27

bne	x28, x29, dummy

addi	x30, x0, 2

#rs1为x0，不写但读

csrrs	x28, 0x300, x0

bne	x28, x27, dummy

csrrw	x28,0x300, x27

beq	x28, x0, dummy

addi	x30, x0, 3

#CSRRC

addi	x31, x0, 0x22

addi	x29, x0, 0x44

csrrc	x28,0x300, x31    #mst = ~22&66

csrrw	x28, 0x300, x27

bne	x28, x29, dummy

addi	x30, x0, 4

#rs1为x0，不写

csrrc	x28, 0x300, x0

bne	x28, x27, dummy

csrrw	x28, 0x300, x27

beq	x28, x0, dummy

addi	x30, x0, 5

#CSRRWI

addi	x29, x0, 0x1f

addi x0,x0,0#csrrwi	x28,0x300, 0x1f #addi x0,x0,0 

csrrw	x28, 0x300, x27

bne	x28, x29, dummy

addi	x30, x0, 6

#CSRRSI

addi	x29, x0, 0x7f

addi x0,x0,0#csrrsi	x28, mstatus, 0x19

csrrw	x28, 0x300, x27

bne	x28, x29, dummy

addi	x30, x0, 7

#uimm为0，不会写入

addi x0,x0,0#csrrsi	x28, mstatus, 0

csrrw	x28,0x300, x27

beq	x28, x0, dummy

addi	x30, x0, 8

#CSRRCI

addi	x29, x0, 0x64

addi x0,x0,0#csrrci	x28, mstatus, 0x12

csrrw	x28, 0x300, x27

bne	x28, x29, dummy

addi	x30, x0, 9

#uimm为0，不写

addi x0,x0,0#csrrci	x28, mstatus, 0

bne	x28, x27, dummy

csrrw	x28, 0x300, x27

beq	x28, x0, dummy

addi	x30, x0, 0xA

addi x0,x0,0#csrrwi	x7, mtvec, 0x28

nop  #illgeal

nop  #ecall

jal x0,dummy


