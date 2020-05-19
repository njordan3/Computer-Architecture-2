	.file	"myblas.c"
	.text
	.globl	faxpy
	.type	faxpy, @function
faxpy:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movss	%xmm0, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax      # get 'i'
	cltq                        # promote 'i' to 64-bits
	leaq	0(,%rax,4), %rdx    # rdx <- i * 4
	movq	-48(%rbp), %rax     # rax <- *result
	addq	%rdx, %rax          # rax += i * 4
	movl	-4(%rbp), %edx      # reshadow 'i'
	movslq	%edx, %rdx          # a different way to promote it to 64 bits
	leaq	0(,%rdx,4), %rcx    # rcx <- i * 4
	movq	-32(%rbp), %rdx     # rdx <- *x
	addq	%rcx, %rdx          # rdx += rcx
    movups	(%rdx), %xmm0       # xmm0 <- Mem(rdx); previously used movss
	# vbroadcastss previously wasn't used
    vbroadcastss    -24(%rbp), %xmm2    # xmm2 <- -24(%rbp)
	mulps	%xmm2, %xmm0        # vector * scalar; xmm0 *= -24(%rbp); previously used mulss
    movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movups	(%rdx), %xmm1       # previously used movss
	addps	%xmm1, %xmm0        # add two vectores; xmm0 += xmm1; previously used adds
	movups	%xmm0, (%rax)       # store the result back into *(result +i*4); previously used movss
	addl	$4, -4(%rbp)        # i += 4; previously used i++
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	faxpy, .-faxpy
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
