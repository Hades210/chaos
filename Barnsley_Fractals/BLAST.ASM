; Some ASM programs to quickly move stuff to the EGA screen. Kinda like
; bit blocks; as a matter of fact, they are lifted from Wilton's
; "Programmer's Guide to PC and PS/2 video systems". 



.model medium,c
        .8086
        LOCALS

        .code
public  blast_bottom

blast_bottom    proc far
arg     start:word
        ; void blast_bottom(int start)
        ;
        ; Blast 14 rows to 0, starting at the offset given.

        push    di

        mov     di,0a000h
        mov     es,di
        mov     di,start

        mov     dx,3ceh
        mov     ax,5
        out     dx,ax
        mov     ah,0
        mov     al,0
        out     dx,ax
        mov     ax,0f01h
        out     dx,ax
        mov     cx,15*40
        rep     stosw
        mov     ax,1
        out     dx,ax
        pop     di
        ret
blast_bottom    endp

public  blast_n
blast_n    proc far,start,count:word
        ; void blast_n(int start,int count)
        ;
        ; Blast count words to 0, starting at the offset given.

        push    di

        mov     di,0a000h
        mov     es,di
        mov     di,start

        mov     dx,3ceh
        mov     ax,5
        out     dx,ax
        mov     ah,0
        mov     al,0
        out     dx,ax
        mov     ax,0f01h
        out     dx,ax
        mov     cx,count
        rep     stosw
        mov     ax,1
        out     dx,ax
        pop     di
        ret
blast_n    endp


        public  zapbuffer
zapbuffer       proc far
        ; void zapbuffer(unsigned short far *buffer,int count)
        ; Clears the buffer...
arg     buffer:dword,count:word
        push    di

        mov     cx,count
;        shr     cx,1
        les     di,buffer
        mov     ax,0
        rep     stosw
        pop     di
        ret
zapbuffer       endp


        end
