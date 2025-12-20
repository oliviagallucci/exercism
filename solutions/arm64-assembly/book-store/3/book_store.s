.text
.globl total

total:
        // Prologue
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        sub     sp, sp, #64                // local stack: counts[5]*4 at sp+0, groups[6]*4 at sp+32

        // Zero-init locals (64 bytes)
        stp     xzr, xzr, [sp, #0]
        stp     xzr, xzr, [sp, #16]
        stp     xzr, xzr, [sp, #32]
        stp     xzr, xzr, [sp, #48]

        // Args: x0 = basket_count, x1 = basket ptr
        cbz     x0, .ret_zero
        cbz     x1, .ret_zero

        // Build counts[5] for book ids 1..5
        mov     x2, #0                     // i = 0
.count_loop:
        cmp     x2, x0
        bhs     .done_count
        ldrh    w3, [x1, x2, lsl #1]       // v = basket[i]
        cmp     w3, #1
        blt     .skip_incr
        cmp     w3, #5
        bgt     .skip_incr
        sub     w3, w3, #1                 // idx = v - 1
        uxtw    x4, w3
        lsl     x4, x4, #2                 // *4
        add     x4, x4, sp                 // &counts[idx]
        ldr     w5, [x4]
        add     w5, w5, #1
        str     w5, [x4]
.skip_incr:
        add     x2, x2, #1
        b       .count_loop
.done_count:

        // Greedy grouping: repeatedly form largest distinct-set groups
.groups_loop:
        mov     w8, #0                     // group size accumulator g
        // idx 0
        ldr     w4, [sp, #0]
        cbz     w4, .g0_skip
        sub     w4, w4, #1
        str     w4, [sp, #0]
        add     w8, w8, #1
.g0_skip:
        // idx 1
        ldr     w4, [sp, #4]
        cbz     w4, .g1_skip
        sub     w4, w4, #1
        str     w4, [sp, #4]
        add     w8, w8, #1
.g1_skip:
        // idx 2
        ldr     w4, [sp, #8]
        cbz     w4, .g2_skip
        sub     w4, w4, #1
        str     w4, [sp, #8]
        add     w8, w8, #1
.g2_skip:
        // idx 3
        ldr     w4, [sp, #12]
        cbz     w4, .g3_skip
        sub     w4, w4, #1
        str     w4, [sp, #12]
        add     w8, w8, #1
.g3_skip:
        // idx 4
        ldr     w4, [sp, #16]
        cbz     w4, .g4_skip
        sub     w4, w4, #1
        str     w4, [sp, #16]
        add     w8, w8, #1
.g4_skip:
        cbz     w8, .groups_done           // if g == 0, no more groups
        // groups[g]++ at base sp+32
        uxtw    x9, w8
        lsl     x9, x9, #2
        add     x9, x9, sp
        add     x9, x9, #32
        ldr     w10, [x9]
        add     w10, w10, #1
        str     w10, [x9]
        b       .groups_loop
.groups_done:

        // Adjustment: replace pairs of (5 + 3) with (4 + 4)
.adjust_loop:
        ldr     w4, [sp, #32 + 20]         // groups[5]
        ldr     w5, [sp, #32 + 12]         // groups[3]
        cbz     w4, .adjust_done
        cbz     w5, .adjust_done
        sub     w4, w4, #1
        str     w4, [sp, #32 + 20]
        sub     w5, w5, #1
        str     w5, [sp, #32 + 12]
        ldr     w6, [sp, #32 + 16]         // groups[4]
        add     w6, w6, #2
        str     w6, [sp, #32 + 16]
        b       .adjust_loop
.adjust_done:

        // Sum total using price table
        mov     x12, #0
        // 1-book groups @ 800
        ldr     w4, [sp, #32 + 4]
        mov     w5, #800
        umaddl  x12, w4, w5, x12
        // 2-book groups @ 1520
        ldr     w4, [sp, #32 + 8]
        mov     w5, #1520
        umaddl  x12, w4, w5, x12
        // 3-book groups @ 2160
        ldr     w4, [sp, #32 + 12]
        mov     w5, #2160
        umaddl  x12, w4, w5, x12
        // 4-book groups @ 2560
        ldr     w4, [sp, #32 + 16]
        mov     w5, #2560
        umaddl  x12, w4, w5, x12
        // 5-book groups @ 3000
        ldr     w4, [sp, #32 + 20]
        mov     w5, #3000
        umaddl  x12, w4, w5, x12

        // Epilogue
        mov     x0, x12
        add     sp, sp, #64
        ldp     x29, x30, [sp], #16
        ret

.ret_zero:
        mov     w0, #0
        add     sp, sp, #64
        ldp     x29, x30, [sp], #16
        ret
