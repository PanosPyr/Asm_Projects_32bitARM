	AREA SIMPLE_PROG,CODE,READONLY
	
__main PROC
	EXPORT __main
	IMPORT __heap_base

Main_Loop	
				
;;; report 1 start	3874A25CA5

	movs r0, #0x82
	movs r1, #0x23
	adds r0, r0, r1
	ldr r1, =0x14A257CF
	ldr r2, =0x23D24A8D
	adds r1, r1, r2

;;; report 1 end 

;;; report 2 start	D2A76B6AFE

	movs r2, #0x21
	movs r3, #0x23
	subs r2, r2, r3
	add r2, r2, 0x100
	ldr r3, =0xFA7CD5F8
	ldr r4, =0x27D56A8D
	sbc r3, r3, r4

;;; report 2 end 

;;; report 3 start	r6: piliko	r4: ipoloipo

	movs r4, #0x08
	movs r5, #0x03
	movs r6, #0x00

division
	adds r6, r6, #0x01
	subs r4, r4, r5
	bcs division
	subs r6, r6, #0x01
	adds r4, r4, r5
;;; report 3 end 

				B 		Main_Loop




		
		
	BX R14
	ENDP
	END