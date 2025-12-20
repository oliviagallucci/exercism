.text
.globl egg_count

egg_count:
        // x0 = input number (encoded positions)
        // return x0 = number of set bits (eggs)

        mov     x1, #0              // count = 0
        cbz     x0, .done           // if n == 0, return 0

.loop:
        sub     x2, x0, #1          // x2 = n - 1
        and     x0, x0, x2          // n &= (n - 1)  (clears lowest set bit)
        add     x1, x1, #1          // count++
        cbnz    x0, .loop           // continue until n == 0

.done:
        mov     x0, x1              // return count
        ret
