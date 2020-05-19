	.file	"hello_sse.c"
	.section	.rodata
.LC2:
	.string	"%f %f %f %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3516:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movaps	.LC0(%rip), %xmm0
	movaps	%xmm0, -16(%rbp)
	movaps	.LC1(%rip), %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	-16(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-32(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	-64(%rbp), %xmm0
	subps	-80(%rbp), %xmm0
	movaps	%xmm0, -96(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	addq	$12, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm3
	movq	-40(%rbp), %rax
	addq	$8, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm2
	movq	-40(%rbp), %rax
	addq	$4, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movq	-40(%rbp), %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$4, %eax
	call	printf@PLT
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3516:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC0:
	.long	1090519040
	.long	1086324736
	.long	1082130432
	.long	1073741824
	.align 16
.LC1:
	.long	1088421888
	.long	1084227584
	.long	1077936128
	.long	1065353216
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
