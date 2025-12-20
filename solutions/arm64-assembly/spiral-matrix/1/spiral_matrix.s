.text
.globl spiral_matrix

// size_t spiral_matrix(uint32_t *dest, size_t size)
// x0 = dest (row-major buffer of size*size uint32_t)
// x1 = size
// returns x0 = count = size*size
spiral_matrix:
        // Prologue
        stp     x29, x30, [sp, -16]!
        mov     x29, sp
        stp     x19, x20, [sp, -16]!
        stp     x21, x22, [sp, -16]!
        stp     x23, x24, [sp, -16]!
        stp     x25, x26, [sp, -16]!
        stp     x27, x28, [sp, -16]!

        // if dest == NULL or size == 0: return 0
        cbz     x0, .ret_zero
        cbz     x1, .ret_zero

        mov     x20, x0              // base = dest
        mov     x19, x1              // n

        // count = n*n
        mul     x27, x19, x19

        mov     w21, #1              // val = 1 (uint32_t)

        mov     x22, #0              // top = 0
        sub     x23, x19, #1         // bottom = n-1
        mov     x24, #0              // left = 0
        sub     x25, x19, #1         // right = n-1

.outer_loop:
        // while (left <= right && top <= bottom)
        cmp     x24, x25
        b.gt    .done
        cmp     x22, x23
        b.gt    .done

        // ---- Top row: col = left..right ----
        mov     x26, x24
.top_row_loop:
        mul     x10, x22, x19        // top*n
        add     x10, x10, x26        // + col
        lsl     x10, x10, #2         // *4 bytes
        add     x11, x20, x10
        str     w21, [x11]
        add     w21, w21, #1

        cmp     x26, x25
        b.eq    .top_row_done
        add     x26, x26, #1
        b       .top_row_loop
.top_row_done:

        // ---- Right col: row = top+1..bottom ----
        add     x26, x22, #1
        cmp     x26, x23
        b.gt    .right_col_done
.right_col_loop:
        mul     x10, x26, x19        // row*n
        add     x10, x10, x25        // + right
        lsl     x10, x10, #2
        add     x11, x20, x10
        str     w21, [x11]
        add     w21, w21, #1

        cmp     x26, x23
        b.eq    .right_col_done
        add     x26, x26, #1
        b       .right_col_loop
.right_col_done:

        // ---- Bottom row (reverse): col = right-1..left ----
        // only if top < bottom AND left < right
        cmp     x22, x23
        b.eq    .bottom_row_skip
        cmp     x24, x25
        b.eq    .bottom_row_skip

        sub     x26, x25, #1
.bottom_row_loop:
        mul     x10, x23, x19        // bottom*n
        add     x10, x10, x26
        lsl     x10, x10, #2
        add     x11, x20, x10
        str     w21, [x11]
        add     w21, w21, #1

        cmp     x26, x24
        b.eq    .bottom_row_done
        sub     x26, x26, #1
        b       .bottom_row_loop
.bottom_row_done:
.bottom_row_skip:

        // ---- Left col (reverse): row = bottom-1..top+1 ----
        // only if left < right
        cmp     x24, x25
        b.eq    .left_col_skip

        sub     x26, x23, #1         // row = bottom-1
        add     x12, x22, #1         // stop = top+1
        cmp     x26, x12
        b.lt    .left_col_skip
.left_col_loop:
        mul     x10, x26, x19
        add     x10, x10, x24
        lsl     x10, x10, #2
        add     x11, x20, x10
        str     w21, [x11]
        add     w21, w21, #1

        cmp     x26, x12
        b.eq    .left_col_skip
        sub     x26, x26, #1
        b       .left_col_loop

.left_col_skip:
        // shrink boundaries
        add     x22, x22, #1
        sub     x23, x23, #1
        add     x24, x24, #1
        sub     x25, x25, #1
        b       .outer_loop

.done:
        // return count
        mov     x0, x27
        b       .epilogue

.ret_zero:
        mov     x0, #0

.epilogue:
        ldp     x27, x28, [sp], 16
        ldp     x25, x26, [sp], 16
        ldp     x23, x24, [sp], 16
        ldp     x21, x22, [sp], 16
        ldp     x19, x20, [sp], 16
        ldp     x29, x30, [sp], 16
        ret
