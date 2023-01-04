print macro m
mov ah,09h
mov dx,offset m
int 21h
endm

.model small
.data
empty db 10,13,"$"
str1 db 20 dup("$")
str2 db 20 dup("$")
mstring1 db 10,13,"enter first string:$"
mstring2 db 10,13,"enter second string:$"
mconcat db 10,13,"concatenated string:$"
.code
start:
mov ax,@data
mov ds,ax
print mstring1
call accept_string
print mstring2
mov ah,0ah
lea dx,str2
int 21h
mov cl,str1+1
mov si,offset str1
next: inc si
dec cl
jnz next
inc si
inc si
mov di,offset str2
inc di
inc di
mov cl,str2+1
mov_next:
mov al,[di]
mov[si],al
inc si
inc di
dec cl
jnz mov_next
print mconcat
print str1+2
exit:mov ah,4ch
int 21h

accept_string proc near
mov ah,0ah
mov dx,offset str1
int 21h
ret
accept_string endp
end start
end 

