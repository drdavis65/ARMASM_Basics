.global _start
_start:
	//REGISTER LOADING
	LDR r0,=list 			// load memory location of list with equals
	LDR r1,[r0]				// dereference with brackets to access
	LDR r2,[r0,#4]			// access second element of list with #4 4 bytes away
	LDR r3,[r0,#4]!			// pre-increment
	LDR r4,[r0],#4			// post-increment
	
	//ARITHMETIC
	ADD r5,r1,r2			// r5 = r1 + r2
	ADDS r5,r1,r2			// r5 = r1 + r2 with flags
	ADC r5,r1,r2			// r5 = r1 + r2 + carry
	SUB r6,r1,r2			// r6 = r1 - r2
	SUBS r6,r1,r2			// r6 = r1 - r2 with flags
	//cpsr register negative, zero, carry, overflow
	
	//LOGIC
	AND r1,r2,r3			// r1 = r2 & r3
	ORR	r1,r2,r3			// r1 = r2 | r3
	EOR r1,r2,r3			// r1 = r2 ^ r3
	MVN r1,r1				// r1 = ~r1
	AND r2,r2,#0x00001000	// clear all bits but bit 3
	ORR r2,r2,#0x00001000	// set bit 3
	
	//SHIFTS & ROTATIONS
	LSL r1,#3				// r1 left shift 3 bits
	LSL r1,r2				// r1 left shift by value of r2
	MOV r1,r0,LSL #1		// r1 = r0 left shifted by 1
	LSR	r2,#2
	ROR r3,#4
	//for left rotate ROR 32-n
	
	//COMPARISON
	CMP r0,r1				// r0-r1 & sets cpsr register
	BGT greater				// goes to label if carry flag set
	BLT						// branch less than
	BLE						// branch less then equal to
	BEQ						// branch equals
	BNE						// branch does not equal
	BAL	default				// branch always
	
greater:
	MOV r2,#2

default:
	MOV r3,#16
.data
list:
	.word 4,5,-9,2,-10,64,100