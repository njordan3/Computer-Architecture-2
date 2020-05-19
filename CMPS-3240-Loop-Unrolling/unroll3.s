	.file	"unroll.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp  # Old
    push    %r12        # Save old value of %r12 on stack
    push    %r13        # Save old value of %r13 on stack
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$800000000, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax      # Reload i
	cltq                        # Promote eax to rax
	leaq	0(,%rax,4), %rdx    # rdx <- 4 * i
	movq	-16(%rbp), %rax     # rax <- a
	addq	%rax, %rdx          # rdx <- a[i]
    #*** NEW
    leaq    4(%rdx), %r12       # r12 <- a[i+1]
    #***
	movl	-4(%rbp), %eax      # Reload i
	cltq                        # Promote eax to rax
	leaq	0(,%rax,4), %rcx    # rcx <- 4 * i
	movq	-24(%rbp), %rax     # rax <- b
	addq	%rcx, %rax          # rax <- b[i]
	movl	(%rax), %ecx
    #*** NEW
    leaq    4(%rax), %r13       # r13 <- b[i+1]
    #***
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-24(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %eax
	imull	%ecx, %eax
	movl	%eax, (%rdx)
    #*** NEW
    movl    (%r13), %eax
    movl    (%r13), %ecx
    imull   %eax, %ecx
    movl    %ecx, (%r12)
	#addl	$1, -4(%rbp)
	addl	$2, -4(%rbp)
    #***
.L2:
	cmpl	$199999999, -4(%rbp)
	jle	.L3
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
    pop     %r13    # Restore callee saved registers
    pop     %r12
	leave           # Old    
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
