.text
.globl reverse

reverse:
        // x0: pointer to start of string
        // Find end of string (position of last non-NUL char)
        mov     x1, x0                // x1: scan pointer
1:
        ldrb    w2, [x1]             // load byte
        cbz     w2, 2f               // if NUL, done scanning
        add     x1, x1, #1           // advance
        b       1b
2:
        sub     x1, x1, #1           // x1: pointer to last char (or before start if empty)

        // Swap from both ends until pointers cross
3:
        cmp     x0, x1               // while start < end
        b.hs    4f                   // if start >= end, done

        ldrb    w2, [x0]             // load start byte
        ldrb    w3, [x1]             // load end byte
        strb    w3, [x0]             // store end at start
        strb    w2, [x1]             // store start at end

        add     x0, x0, #1           // ++start
        sub     x1, x1, #1           // --end
        b       3b

4:
        ret
