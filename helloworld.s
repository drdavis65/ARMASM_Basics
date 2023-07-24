
.global _start
_start:
	MOV r0,#1	// stdout (commandline), #0 stdin, #2 stderr
	LDR r1,=message	// load location of message into r1
	LDR r2,=len	// length of string into r2
	MOV r7,#4	// #4 in r7 to write something to the screen
			// r7 interrupt register, based on values of r0,r1,r2
	SWI 0		// software interrupt
	
	MOV r7,#1	// #1 to terminate program
	SWI 0		// software interrupt

.data
message:
	.asciz "hello world\n"
len = .-message
