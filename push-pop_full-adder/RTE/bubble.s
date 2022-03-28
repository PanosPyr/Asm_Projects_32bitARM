	AREA SIMPLE_PROG,CODE,READONLY
	
__main PROC
	EXPORT __main
	IMPORT __heap_base


	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	movs r3, #0x14
	movs r4, #0x28
	push {r3, r4}
	pop {r4}
	pop{r3}
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	ldr r1, =0x7FDF136F
	movs r0, #0x20
	and r3,r0,r1
	cmp r3, #0x20
	bne n_eq
	movs r2, #0x01
	b full_adder
	
n_eq	
	movs r2, #0x00
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	A<- R2 / B<- R3 / Cin<- R4 / S<- R5 / Cout<- R6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 	i kathe eisodos einai 3 bit gi auto ta r7 kai r8 exoun tin timi 777
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	gia na exei 1 bit i kathe eisodos prepei na ginei allagi tou iparxon kwdika, me ton antistoixo kwdika sta sxolia
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	ousiastika allazei to kathe 7 me 1

full_adder	

	ldr r7, =0x777	
	;ldr r7, =0x111
	ldr r8, =0x777	
	;ldr r8, =0x111
	push{r7}
	
fill_stack
	subs r7,r7, #0x01
	and r7, r8
	push {r7}
	cmp r7, #0x00
	bne fill_stack

full_adder_calc	

	pop {r7}
	
	and r2, r7, #0x700	
	;and r2, r7, #0x100
	lsr r2, #8
	
	and r3, r7, #0x70	
	;and r3, r7, #0x10
	lsr r3, #4
	
	and r4, r7, #0x7	
	;and r4, r7, #0x1
	
	
	eor r0,r2,r3
	eor r5,r0,r4
	
	and r0,r2,r3
	and r1,r3,r4
	orr r1,r0,r1
	and r0,r2,r4
	orr r6,r0,r1
	cmp r7, r8
	beq end
	b full_adder_calc
	
end	
	
	BX R14
	
	
	
	
	ENDP
	END
		