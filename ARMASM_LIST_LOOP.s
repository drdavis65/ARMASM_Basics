.global _start
.equ endlist,0xffffffff			// constant

_start:
	LDR r0,=list
	LDR r3,=endlist
	SUB r2,r2,r2
	//LDR r1,[r0]
	//ADD r2,r2,r1
loop:
	LDR r1,[r0],#4
	CMP r1, r3
	BEQ exit
	ADD r2,r2,r1
	BAL loop
	
exit:
	
.data
list:
	.word 1,2,3,4,5,6,7,8,9,10,-1