	.file	"fact.c"
	.section	.rodata
.LC0:
	.string	"The 10th fibonacci number is %d\n"
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
	movl	$10, -4(%rbp)       # push 10 on the stack
	movl	$1, -8(%rbp)        # push 1 on the stack
.L2:
	movl	-8(%rbp), %eax      # %eax = 1;
	addl	-4(%rbp), %eax      # %eax += 10;
	movl	%eax, -8(%rbp)      # push %eax onto the stack
	subl	$1, -4(%rbp)        # %eax--;
	cmpl	$1, -4(%rbp)        # is %eax > 1?
	jg	.L2                     # if so, jump to .L2
	movl	-8(%rbp), %eax      # store the result in %eax
	movl	%eax, %esi          # store the result in %eax
	leaq	.LC0(%rip), %rdi    # load the string we want to print
	movl	$0, %eax            # %eax = 0;
	call	printf@PLT          # call printf
	movl	$0, %eax            # %eax = 0;
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
