;Gulam Rasool
;23-ntu-cs-fl-1159
include Irvine32.inc
.data
arr sword -8,9,-13,10,-11,12,-13,14,-15,16
MsgSum byte "Sum of positive integer is: ",0
MsgCount byte "Total number of positive integer are: ",0

.code
main proc
call clrscr
mov esi, offset arr                ;Storing Address of Array
mov ecx, lengthof arr              ;Giving Length of Array to ECX for iteration of loop
mov eax,0                          ;to store Sum of Positive Integer
mov ebx,0                          ;To store Number of Positive Integer

next:
    mov dx,word ptr [esi]       ;Taking only 16-bit value throught indirect addressing
    test dx,8000h               ;Testing with 8000h which do AND operation 
    jnz negative                ;If value is Negative and Zero flag  is ON then move to Negative Label
    add ax,dx                   ;Come to instruction If Zero flag is ON and will add the value 
    inc ebx                     ;increement ebx by 1 to count number of positive integer
negative:
    add esi,type arr            ;move esi to next element if number is negative
    loop next

mov edx,offset MsgSum           ;To display Sum of Positive Integer
call writestring 
call writedec
call crlf

mov edx,offset MsgCount         ;To display Number of Positive Integer
call writestring 
mov eax,ebx
call writedec


exit
main endp
end main