.equ SWITCH, 0xff200040
.equ LED, 0xff200000

.global _start

_start:
	LDR r0,=SWITCH
	LDR r1,[r0]			// read switches
	
	LDR r0,=LED
	STR r1,[r0]			// store switch value into deref LED addr