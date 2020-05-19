	.file	"example_fact.c"
	.section	.rodata
.LC0:
	.string	"The 13th Fibonaci number is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
    #initialize argument to 13
	movl	$13, %edi
    #calculate the 13th fibonacci number
	call	my_fact
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	my_fact
	.type	my_fact, @function
my_fact:
.LFB1:
	.cfi_startproc
    #create the stack
	pushq	%rbp    
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq   %rbx
    #initialize 16 bytes on the stack
    subq	$16, %rsp
    #store the argument on the stack
	movl	%edi, -4(%rbp)
	#if argument > 1, then jump to .L4
    cmpl	$1, -4(%rbp)
	jg	.L4
    #else, return the argument. it's safe to assume argument = 1 at this point
	movl	-4(%rbp), %eax
	jmp	.L5
.L4:
    #ebx = fib(n-1)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	#calculate fib(n-1) recursively
    call	my_fact
	movl    %eax, %ebx

    #eax = fib(n-1) + fib(n-2)
    movl    -4(%rbp), %eax
	subl	$2, %eax
    movl    %eax, %edi
	#calculate fib(n-2) recursively
    call	my_fact
	addl    %ebx, %eax
.L5:
    #pop the stack
    #leave was giving seg faults, so I had to do pop manually
    addq    $16, %rsp
    popq    %rbx
    popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	my_fact, .-my_fact
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
