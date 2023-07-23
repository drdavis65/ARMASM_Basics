.global _start

_start:
	MOV r0,#1
	MOV r1,#3
	PUSH {r0,r1}
	BL get_value	// branch linked-adds address of following
					// instruction to link register
	POP {r0,r1}
	B end
	
get_value:
	MOV r0,#5
	MOV r1,#7
	ADD r2,r0,r1
	BX LR			// branch back to address stored in link register
	
end: