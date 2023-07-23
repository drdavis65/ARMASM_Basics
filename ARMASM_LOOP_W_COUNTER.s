.global _start

_start:
	LDR r0,=list
	SUB r3,r3,r3			// counter
	SUB r2,r2,r2			// sum
loop:
	CMP r3,#10
	MOVGE r5,#666			// move if greater than or equal to
	BEQ exit
	ADDLT r3,#1				// add if negative flag set
	LDR r1,[r0],#4
	ADD r2,r2,r1
	BAL loop
	
	
exit:
	
.data
list:
	.word 1,2,3,4,5,6,7,8,9,10