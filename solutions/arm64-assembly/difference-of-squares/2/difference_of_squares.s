.text
.globl square_of_sum
.globl sum_of_squares
.globl difference_of_squares

square_of_sum:
        // x0 = n
        // compute t = n * (n + 1)
        add     x1, x0, #1
        mul     x2, x0, x1
        // divide by 2: t = t / 2 (always even)
        lsr     x2, x2, #1
        // square: result = t * t
        mul     x0, x2, x2
        ret

sum_of_squares:
        // x0 = n
        // compute numerator = n * (n + 1) * (2n + 1)
        add     x1, x0, #1          // x1 = n + 1
        lsl     x2, x0, #1          // x2 = 2n
        add     x2, x2, #1          // x2 = 2n + 1
        mul     x3, x0, x1          // x3 = n * (n + 1)
        mul     x3, x3, x2          // x3 = n * (n + 1) * (2n + 1)
        // divide by 6
        mov     x4, #6
        udiv    x0, x3, x4
        ret

difference_of_squares:
        // Save frame pointer + link register, keep 16-byte alignment
        stp     x29, x30, [sp, #-32]!
        mov     x29, sp
        // Save callee-saved regs we use
        stp     x19, x20, [sp, #16]

        // x0 = n
        mov     x20, x0             // save n
        bl      square_of_sum       // x0 = square_of_sum(n)
        mov     x19, x0             // save square_of_sum
        mov     x0, x20             // restore n
        bl      sum_of_squares      // x0 = sum_of_squares(n)
        sub     x0, x19, x0         // difference

        // Restore regs + return address
        ldp     x19, x20, [sp, #16]
        ldp     x29, x30, [sp], #32
        ret
