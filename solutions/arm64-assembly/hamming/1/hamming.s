.equ UNEQUAL_LENGTHS, -1

.text
.globl distance

distance:
        mov     w2, #0
1:
        ldrb    w3, [x0]
        ldrb    w4, [x1]
        cbz     w3, 2f
        cbz     w4, 3f
        cmp     w3, w4
        b.ne    4f
        add     x0, x0, #1
        add     x1, x1, #1
        b       1b
4:
        add     w2, w2, #1
        add     x0, x0, #1
        add     x1, x1, #1
        b       1b
2:
        cbnz    w4, 5f
        mov     w0, w2
        ret
3:
5:
        mov     w0, #0
        sub     w0, w0, #1
        ret
