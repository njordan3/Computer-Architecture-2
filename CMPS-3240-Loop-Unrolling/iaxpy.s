	.file	"iaxpy.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$1, -8(%rbp)
	movl	$400000000, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$400000000, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$400000000, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	imull	-8(%rbp), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-24(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %eax
	addl	%ecx, %eax
	movl	%eax, (%rdx)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$99999999, -4(%rbp)
	jle	.L3
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
