.text
.globl response

// char *response(const char *hey_bob)
// x0 = pointer to NUL-terminated input string
// returns x0 = pointer to constant reply string
response:
        mov     x1, x0

        // w2 = any_non_ws (0/1)
        // w3 = has_letter (0/1)
        // w4 = has_lower  (0/1)
        // w5 = last_non_ws_char (byte)
        mov     w2, wzr
        mov     w3, wzr
        mov     w4, wzr
        mov     w5, wzr

.loop:
        ldrb    w6, [x1], #1
        cbz     w6, .done

        // ASCII whitespace: <= 0x20
        cmp     w6, #0x20
        ble     .check_letter

        // Non-whitespace
        mov     w2, #1
        mov     w5, w6

.check_letter:
        // 'A'..'Z'
        cmp     w6, #'A'
        blt     .check_lower
        cmp     w6, #'Z'
        bgt     .check_lower
        mov     w3, #1
        b       .loop

.check_lower:
        // 'a'..'z'
        cmp     w6, #'a'
        blt     .loop
        cmp     w6, #'z'
        bgt     .loop
        mov     w3, #1
        mov     w4, #1
        b       .loop

.done:
        // Silence?
        cbz     w2, .reply_silence

        // is_question = (last_non_ws == '?') in w7
        mov     w7, wzr
        cmp     w5, #'?'
        cset    w7, eq

        // is_yelling = has_letter && !has_lower in w8
        mov     w8, wzr
        cbz     w3, .not_yelling
        cbnz    w4, .not_yelling
        mov     w8, #1
.not_yelling:

        // yelling question?
        cbz     w7, .not_question
        cbz     w8, .reply_question
        b       .reply_yell_question

.not_question:
        cbnz    w8, .reply_yelling
        b       .reply_other

.reply_silence:
        adrp    x0, fine_be_that_way
        add     x0, x0, :lo12:fine_be_that_way
        ret

.reply_yell_question:
        adrp    x0, calm_down
        add     x0, x0, :lo12:calm_down
        ret

.reply_yelling:
        adrp    x0, whoa_chill
        add     x0, x0, :lo12:whoa_chill
        ret

.reply_question:
        adrp    x0, sure
        add     x0, x0, :lo12:sure
        ret

.reply_other:
        adrp    x0, whatever
        add     x0, x0, :lo12:whatever
        ret


.section .rodata
sure:
        .asciz "Sure."
whoa_chill:
        .asciz "Whoa, chill out!"
calm_down:
        .asciz "Calm down, I know what I'm doing!"
fine_be_that_way:
        .asciz "Fine. Be that way!"
whatever:
        .asciz "Whatever."
