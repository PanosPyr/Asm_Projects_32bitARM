	AREA SIMPLE_PROG,CODE,READONLY
	
__main PROC
	EXPORT __main
	IMPORT __heap_base

Main_Loop	
				
				ldr r1, =__heap_base
				movs r3, #0x00
				movs r2, #0x01
				
;;;  fill 10 first places start				
			
				strb r2, [r1]
fill_loop
				adds r2, #0x01
				adds r3, #0x01
				adds r1, #0x01
				strb r2, [r1]
				cmp r3, #0x09
				bne fill_loop
				
;;;  fill 10 first places end

;;;  find maximum value	start
				
				ldr r1, =__heap_base
				movs r4, #0x00
				ldrb r2, [r1]	
max_loop
				adds r1, #0x01
				adds r4, #0x01
				ldrb r3, [r1]
				cmp r2, r3 
				blt swap_max
counter_max
				cmp r4, #0x09
				bne max_loop
				b min
swap_max				
				movs r2,r3
				b counter_max
				
;;;  find maximum value	end

;;;  find minimum value	start

min
				ldr r1, =__heap_base
				movs r5, #0x00
				ldrb r6, [r1]	
min_loop
				adds r1, #0x01
				adds r5, #0x01
				ldrb r3, [r1]
				cmp r6, r3 
				bgt swap_min
counter_min
				cmp r5, #0x09
				bne min_loop
				b selected_transfer
swap_min				
				movs r6,r3
				b counter_min

;;;  find minimum value	end

;;;	selected transfer start
selected_transfer
				ldr r1, =__heap_base
				ldr r3, =__heap_base
				adds r3, r3,#0x30
				movs r2, #0x5f
				strb r2, [r1]
				movs r2, #0xa3
				strb r2, [r1,#1]
				movs r2, #0x1b
				strb r2, [r1,#2]
				movs r2, #0xff
				strb r2, [r1,#3]
				movs r2, #0x3d
				strb r2, [r1,#4]
				movs r2, #0x01
				strb r2, [r1,#5]
				movs r2, #0xf5
				strb r2, [r1,#6]
				movs r2, #0x8a
				strb r2, [r1,#7]
				movs r2, #0x4a
				strb r2, [r1,#8]
				movs r2, #0x7f
				strb r2, [r1,#9]				
				movs r4, #0x00
sel_loop
				ldrb r2, [r1]
				adds r1, #0x01
				cmp r2, #0x5f
				bge transfer_loop
counter
				adds r4, #0x01
				cmp r4, #0x0A
				beq end
				b sel_loop
				
transfer_loop
				strb r2, [r3]
				adds r3, r3,#1
				b counter
				
;;;	selected transfer end

end
				B 		Main_Loop




		
		
	BX R14
	ENDP
	END