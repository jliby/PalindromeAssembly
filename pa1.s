.section .data
input_prompt    :   .asciz  "Input a string: "
input_spec      :   .asciz  "%[^\n]"
length_spec     :   .asciz  "String length: %d\n"
false           :   .asciz  "F"
true            :   .asciz  "T"
palindrome_spec :   .asciz  "String is a palindrome (T/F): %c\n"
input           :   .space 8
.section .text
.global main
# program execution begins here
main:
# add code and other labels here
    ldr x0, =input_prompt
    bl printf

    ldr x0, =input_spec
    ldr x1, =input
    bl scanf
    #get length

# i
    ldr x19, =input
# length
    add x20, xzr, xzr
    
    #count
    #loop for length of string
    loop1: add x10, x20, x19
    ldurb w11, [x10, #0]
    cbz w11, l2
    
    add x20, x20, #1

#end of loop
    b loop1

    l2:
    
    mov x1, x20
    ldr x0, =length_spec
    bl printf




    #palindrome

    #count = 0
    add x21, xzr, xzr
    #int i = 0
    add x22, xzr, xzr
 
    L3:
        # compares i and length
        cmp x20, x22
        beq else

            #string[i]
    

            #string2[length - i - 1]
            sub x13, x20, x22
            sub x13, x13, #1

            #string[i]

            ldrb w14, [x19, x22]
            #string2[length - i - 1]

            ldrb w15, [x19, x13]

            # if string[i] != string2[length - i - 1]
            cmp  w14, w15
            bne else2

            #i++
            add x22, x22, #1

            #Branch to loop 3
            b  L3

        else2:
            #exit print false

            ldr x0, =palindrome_spec
            mov x1, #70
            bl printf
            b exit
        else:
            #exit print true
            ldr x0, =palindrome_spec
            mov x1, #84
            bl printf
            

            b exit


# branch to this label on program completion
exit:
    mov x0, 0
    mov x8, 93
    svc 0
    ret
