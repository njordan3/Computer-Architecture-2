	.file	"test.c"
	.text
	.globl	vectOp
	.type	vectOp, @function
vectOp:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movups	(%rdx), %xmm1
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movups	(%rdx), %xmm0
	mulps	%xmm1, %xmm0
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-48(%rbp), %rdx
	addq	%rcx, %rdx
	movups	(%rdx), %xmm1
	addps	%xmm1, %xmm0
	movups	%xmm0, (%rax)
	addl	$4, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	vectOp, .-vectOp
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movl	$100000000, %edi
	call	vectOp
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
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
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
