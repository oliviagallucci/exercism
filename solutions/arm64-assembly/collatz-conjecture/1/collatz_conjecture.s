.equ INVALID_NUMBER, -1

.text
.globl steps

steps:
        // x0 = number (int64)
        // Return -1 if number <= 0
        // Return 0 if number == 1
        // Else compute Collatz steps count in w1

        // if number == 1 -> return 0
        cmp     x0, #1
        beq     1f
        // if number < 1 -> return INVALID_NUMBER (-1)
        b.lt    2f

        // steps counter = 0
        mov     w1, wzr

0:      // loop while number != 1
        // branch to odd handler if LSB is 1
        tbnz    x0, #0, 3f
        // even: number = number / 2
        lsr     x0, x0, #1
        add     w1, w1, #1
        // if number != 1, continue loop
        cmp     x0, #1
        b.ne    0b
        b       4f

3:      // odd: number = 3*number + 1
        add     x2, x0, x0        // 2n
        add     x0, x2, x0        // 3n
        add     x0, x0, #1        // 3n + 1
        add     w1, w1, #1
        // if number != 1, continue loop
        cmp     x0, #1
        b.ne    0b

4:      // done: return steps count
        mov     w0, w1
        ret

1:      // return 0 steps for number == 1
        mov     w0, wzr
        ret

2:      // invalid input (<= 0)
        mov     w0, INVALID_NUMBER
        ret
