.text
.globl leap_year

leap_year:
        // w0 contains the input year; return 1 if leap, else 0
        // Check divisible by 4: (year & 3) == 0
        ands    w1, w0, #3
        b.ne    not_leap

        // At this point, year is divisible by 4.
        // Check if divisible by 100
        mov     w2, #100
        udiv    w3, w0, w2          // w3 = year / 100
        msub    w4, w3, w2, w0      // w4 = year - (w3 * 100) = year % 100
        cmp     w4, #0
        b.ne    is_leap             // if NOT divisible by 100 -> leap

        // Divisible by 100; must also be divisible by 400 to be leap
        mov     w2, #400
        udiv    w3, w0, w2          // w3 = year / 400
        msub    w4, w3, w2, w0      // w4 = year % 400
        cmp     w4, #0
        b.eq    is_leap

not_leap:
        mov     w0, #0
        ret

is_leap:
        mov     w0, #1
        ret
