;Gulam Rasool
;23-ntu-cs-fl-1159
include irvine32.inc
.data
arr sword 1,2,3,4,5,6,7,8,9,10
MsgSum byte "Sum of Odd Numbers is: ",0
MsgCount byte "Total number of Odd numbers are: ",0

.code
main proc

call clrscr
mov esi, offset arr
mov ecx, lengthof arr
mov eax,0
mov ebx,0

Next:
    mov dx,word ptr[esi]    ;Store only word type value
    test dx,0001h           ;Test with 0001h which do AND operation for least Significant bit
    jz skip                 ;if number will be Even AND operation result 0 and ZERO flag will ON it will jump to SKIP label
    add ax,dx               ;If number is ODD Zero flag will SET 1 and do Sum of even Numbers  
    inc ebx                 ;Increement ebx to count number of ODD Number 

    skip:                   ;Move here when there is Even number
        add esi,type arr    ;Move ESI to next index  
loop Next

mov edx,offset MsgSum       ;Display Sum of Even Numbers
call writestring
call writedec

call crlf

mov edx,offset MsgCount     ;Display Number of Even Numbers
call writestring
mov eax,ebx
call writedec


exit
main endp
end main