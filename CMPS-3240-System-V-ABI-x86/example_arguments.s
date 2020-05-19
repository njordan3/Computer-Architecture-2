	.file	"example_arguments.c"
	.text
	.globl	example_arguments
	.type	example_arguments, @function
example_arguments:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	%r9d, -24(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movl	-16(%rbp), %eax
	addl	%eax, %edx
	movl	-20(%rbp), %eax
	addl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%eax, %edx
	movl	16(%rbp), %eax
	addl	%eax, %edx
	movl	24(%rbp), %eax
	addl	%eax, %edx
	movl	32(%rbp), %eax
	addl	%eax, %edx
	movl	40(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	example_arguments, .-example_arguments
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
