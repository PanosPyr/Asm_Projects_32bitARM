	AREA SIMPLE_PROG,CODE,READONLY
	
__main PROC
	EXPORT __main
	IMPORT __heap_base

	movs R1,#0x01
	movs R2, #0x02
	
	movs r0,#0xff
	ldr r1, =__heap_base
mem_fill
	STRB r0, [r1]
	adds r1, r1, #+1
	subs r0,r0,#1
	BPL mem_fill 
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
extern_loop
	movs r3, #0x00 ; loop counter
	movs r0, #0x00 ; swap flag
	ldr r1,=__heap_base
	adds r2, r1, #1
main_loop

;;;;add code here

	ldrb r4, [r1]
	ldrb r5, [r2]

	cmp r4, r5
	BLE skip_swap
	strb r5, [r1]
	strb r4, [r2]
	adds r0, r0, #0x01
skip_swap
	adds r1, r1, #0x01
	adds r2, r2, #0x01
	adds r3, r3, #0x01
	
	cmp r3, #0xFF
	bne main_loop

check_loop
	cmp r0,#0x00
	bne extern_loop
exit
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	BX R14
	ENDP
	END
		