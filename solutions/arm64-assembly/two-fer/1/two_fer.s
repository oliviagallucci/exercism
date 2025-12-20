.text
.globl two_fer

two_fer:
        // x0 = buffer (destination)
        // x1 = name (source or NULL)
        mov     x2, x0                // x2: current write ptr

        // Copy prefix "One for "
        adr     x3, prefix            // x3: read ptr to prefix
1:      ldrb    w4, [x3], #1          // w4 = *x3++
        cbz     w4, 2f                // if null terminator, done with prefix
        strb    w4, [x2], #1          // *x2++ = w4
        b       1b

        // Copy name or "you"
2:      cbz     x1, 3f                // if name == NULL, use "you"
        mov     x3, x1
        b       4f
3:      adr     x3, youstr
4:      ldrb    w4, [x3], #1
        cbz     w4, 5f                // done with name
        strb    w4, [x2], #1
        b       4b

        // Copy suffix ", one for me." including terminator
5:      adr     x3, suffix
6:      ldrb    w4, [x3], #1
        strb    w4, [x2], #1
        cbz     w4, 7f                // copied null terminator
        b       6b

7:      ret

        // Inline constants in the same section for simple ADR addressing
        .align  2
prefix:
        .asciz  "One for "
youstr:
        .asciz  "you"
suffix:
        .asciz  ", one for me."
