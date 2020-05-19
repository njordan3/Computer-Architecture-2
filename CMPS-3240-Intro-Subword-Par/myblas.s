	.file	"myblas.c"
	.text
	.globl	dewvm
	.type	dewvm, @function
dewvm:
.LFB0:
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
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax      # get 'i'
	cltq                        # promote 'i' to 64-bits
	leaq	0(,%rax,8), %rdx    # rdx <- i * 8
	movq	-48(%rbp), %rax     # rax <- *result
	addq	%rdx, %rax          # rax += i * 8
    movl	-4(%rbp), %edx      # reshadow 'i'
	movslq	%edx, %rdx          # a different way to promote it to 64 bits
	leaq	0(,%rdx,8), %rcx    # rcx <- i * 8
	movq	-32(%rbp), %rdx     # rdx <- *x
	addq	%rcx, %rdx          # rdx += rcx
	movupd	(%rdx), %xmm1       # xmm1 <- Mem(rdx); previously used movsd
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movupd	(%rdx), %xmm0       # previously used movsd
	mulpd	%xmm1, %xmm0        # multiply two vectors; previously used mulsd
	movupd	%xmm0, (%rax)       # store the result back into *(result + i*8); previously used movsd
	addl	$2, -4(%rbp)        # i += 2; previously i++
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L3
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	dewvm, .-dewvm
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
