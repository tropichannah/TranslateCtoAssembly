COMMENT!
	 Student: Hannah Hammonds
	 Class: CSC3210
	 Assignment#: 4
	 Description:
	if (var1 > var2) OR (var3 < var2){
	var1 = var2 + var3;
	var2++;
	var3++;
	}
	else{
	var1--;
	var2--;
	var3--;
	}
	Here var1, var2 and var3 are DWORD variables.
	var1 is initialized with 10 (decimal), 

	var2 is initialized with 11(decimal) 

	and var3 is initialized with 12 (decimal).

	Translate the following code in assembly code (MASM).
	You need to implement the logic of the if-else statement with JMP, CMP (compare), JL (jump if less), JA (jump if
	above) instructions
!

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data										;initialize variables
	var1 DWORD 10d
	var2 DWORD 11d
	var3 DWORD 12d
.code
main PROC
	mov eax, var1							;move variables to registers
	mov ebx, var2
	mov ecx, var3

	cmp eax, ebx
	JL More									;if var2 < var1 jump to more lable
	JMP Other								;if var2 > var1 jump to other lable
	cmp ecx, ebx
	JA More									;if var2 > var3 jump to more lable
	JMP Other								;if var1 < var2 jump to other lable

More:
	add ebx, ecx							;var2 + var3
	mov eax, ebx							;var1 = var2 + var3
	inc ebx									;var2++
	inc ecx									;var3++

Other:
	dec eax									;var1--
	dec ebx									;var2--
	dec ecx									;var3--

INVOKE ExitProcess, 0

main ENDP
END main
