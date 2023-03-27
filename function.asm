.686
.model flat
public _draw_hyperbolas
public _define_error

.data
Xa EQU 1
Ya EQU 3
Xb EQU 15
Yb EQU 12

.code
_define_error PROC
	push ebp
	mov ebp,esp
	push edi
	push esi
	push ebx

	
	finit

	mov eax,0

	push Xa
	fild dword ptr [esp]
	add esp,4

	fild dword ptr [ebp+12]
	fsubp st(1), st(0) ;Xa - x

	fmul st(0),st(0) ;(Xa - x)^2

	push Ya
	fild dword ptr [esp]
	add esp,4

	fild dword ptr [ebp+16]
	fsubp st(1), st(0)

	fmul st(0),st(0)

	faddp st(1), st(0)
	fsqrt

	push Xb
	fild dword ptr [esp]
	add esp,4

	fild dword ptr [ebp+12]
	fsubp st(1), st(0)

	fmul st(0),st(0)

	push Yb
	fild dword ptr [esp]
	add esp,4

	fild dword ptr [ebp+16]
	fsubp st(1), st(0)

	fmul st(0),st(0)

	faddp st(1), st(0)
	fsqrt

	fsubp st(1), st(0)

	fld dword ptr [ebp+8] ;d

	fsubp st(1), st(0)

	fabs

	fld dword ptr [ebp+20]

	fcomi st(0) ,st(1)
	jbe skip

	mov eax,1

	skip:

	pop ebx
	pop esi
	pop edi
	pop ebp

	ret
_define_error ENDP

_draw_hyperbolas PROC
	push ebp
	mov ebp,esp
	push edi
	push esi
	push ebx

	finit

	mov edi,0 ;x
	mov esi,0 ;y
	mov ecx,[ebp+16] ;m
	mov ebx,[ebp+20] ;n
	mov edx,[ebp+12]

	rows:

		columns:

		push dword ptr [ebp+8];d
		push edi
		push esi
		push dword ptr [ebp+24];epsilon
		call _define_error
		add esp, 16
		mov [edx],al
		inc edx

		inc edi

		cmp ebx,edi
		jne columns

	xor edi,edi
	inc esi

	cmp esi,ecx
	jne rows

	pop ebx
	pop esi
	pop edi
	pop ebp

	ret
_draw_hyperbolas ENDP
END
