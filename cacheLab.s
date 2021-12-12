	.file	"cacheLab.c"
	.text
	.globl	LRUOrganizer
	.type	LRUOrganizer, @function
LRUOrganizer:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	20(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-32(%rbp), %edx
	subl	$1, %edx
	movl	%edx, 20(%rax)
	movl	$0, -8(%rbp)
	jmp	.L2
.L4:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	je	.L3
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	20(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L3
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	20(%rax), %edx
	subl	$1, %edx
	movl	%edx, 20(%rax)
.L3:
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L4
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	LRUOrganizer, .-LRUOrganizer
	.section	.rodata
	.align 8
.LC0:
	.string	"Welcome to the Cache Simulation!"
.LC1:
	.string	"%d %d %d %d %s %d %d"
.LC2:
	.string	"LRU"
.LC3:
	.string	"LFU"
.LC4:
	.string	"%lx"
.LC5:
	.string	"%lx M\n"
.LC6:
	.string	"%lx H \n"
.LC7:
	.string	"%lx H\n"
.LC8:
	.string	"%.f %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	-27(%rbp), %r8
	leaq	-160(%rbp), %rdi
	leaq	-164(%rbp), %rcx
	leaq	-168(%rbp), %rdx
	leaq	-172(%rbp), %rax
	leaq	-152(%rbp), %rsi
	pushq	%rsi
	leaq	-156(%rbp), %rsi
	pushq	%rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addq	$16, %rsp
	movl	-172(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	call	log2@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -96(%rbp)
	movl	-164(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	call	log2@PLT
	cvttsd2si	%xmm0, %eax
	movl	%eax, -92(%rbp)
	movl	-160(%rbp), %eax
	subl	-96(%rbp), %eax
	subl	-92(%rbp), %eax
	movl	%eax, -88(%rbp)
	movl	-172(%rbp), %edx
	movl	-168(%rbp), %eax
	imull	%eax, %edx
	movl	-164(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, -84(%rbp)
	movl	$0, -148(%rbp)
	movl	$0, -144(%rbp)
	movl	$0, -140(%rbp)
	movl	-172(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	movl	$0, -136(%rbp)
	jmp	.L6
.L11:
	movl	-168(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	movl	-136(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	%rcx, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	movl	$0, -132(%rbp)
	jmp	.L7
.L10:
	movl	-136(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	$0, (%rax)
	movl	-136(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	$0, 8(%rax)
	leaq	-27(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	movl	-136(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-132(%rbp), %eax
	movl	%eax, 20(%rdx)
	jmp	.L9
.L8:
	leaq	-27(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	movl	-136(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	$0, 16(%rax)
.L9:
	addl	$1, -132(%rbp)
.L7:
	movl	-168(%rbp), %eax
	cmpl	%eax, -132(%rbp)
	jl	.L10
	addl	$1, -136(%rbp)
.L6:
	movl	-172(%rbp), %eax
	cmpl	%eax, -136(%rbp)
	jl	.L11
	jmp	.L12
.L34:
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-80(%rbp), %rax
	cmpq	$-1, %rax
	je	.L40
	movq	-80(%rbp), %rdx
	movl	-92(%rbp), %eax
	movl	%eax, %ecx
	sarq	%cl, %rdx
	movl	-96(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	subl	$1, %eax
	cltq
	andq	%rdx, %rax
	movq	%rax, -64(%rbp)
	movq	-80(%rbp), %rdx
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	sarq	%cl, %rdx
	movl	-88(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	subl	$1, %eax
	cltq
	andq	%rdx, %rax
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	-168(%rbp), %eax
	cmpl	$1, %eax
	jne	.L15
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L16
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L17
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -56(%rbp)
	je	.L17
.L16:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-48(%rbp), %rax
	movl	$1, (%rax)
	movq	-48(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 8(%rax)
	addl	$1, -144(%rbp)
	movl	-152(%rbp), %edx
	movl	-156(%rbp), %eax
	addl	%edx, %eax
	addl	%eax, -140(%rbp)
	jmp	.L12
.L17:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-48(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 8(%rax)
	addl	$1, -148(%rbp)
	movl	-156(%rbp), %eax
	addl	%eax, -140(%rbp)
	jmp	.L12
.L15:
	movl	-168(%rbp), %eax
	cmpl	$1, %eax
	jle	.L19
	movl	-164(%rbp), %ebx
	movl	-84(%rbp), %eax
	cltd
	idivl	%ebx
	movl	%eax, %edx
	movl	-168(%rbp), %eax
	cmpl	%eax, %edx
	jg	.L20
.L19:
	movl	-164(%rbp), %ebx
	movl	-84(%rbp), %eax
	cltd
	idivl	%ebx
	movl	%eax, %edx
	movl	-168(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L12
.L20:
	movl	$0, -128(%rbp)
	movl	$0, -124(%rbp)
	jmp	.L21
.L33:
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L22
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, (%rax)
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rax, 8(%rdx)
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 16(%rax)
	movl	-168(%rbp), %edx
	movl	-124(%rbp), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	LRUOrganizer
	addl	$1, -144(%rbp)
	movl	-152(%rbp), %edx
	movl	-156(%rbp), %eax
	addl	%edx, %eax
	addl	%eax, -140(%rbp)
	jmp	.L12
.L22:
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rax
	cmpq	%rax, -56(%rbp)
	je	.L23
	addl	$1, -128(%rbp)
	movl	-168(%rbp), %eax
	cmpl	%eax, -128(%rbp)
	jne	.L25
	jmp	.L39
.L23:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-124(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	16(%rax), %edx
	addl	$1, %edx
	movl	%edx, 16(%rax)
	movl	-168(%rbp), %edx
	movl	-124(%rbp), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	LRUOrganizer
	addl	$1, -148(%rbp)
	movl	-156(%rbp), %eax
	addl	%eax, -140(%rbp)
	jmp	.L12
.L39:
	addl	$1, -144(%rbp)
	movl	-152(%rbp), %edx
	movl	-156(%rbp), %eax
	addl	%edx, %eax
	addl	%eax, -140(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-27(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L26
	movl	$0, -120(%rbp)
	movl	$0, -116(%rbp)
	jmp	.L27
.L29:
	movl	-116(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	20(%rax), %eax
	testl	%eax, %eax
	jne	.L28
	movl	-116(%rbp), %eax
	movl	%eax, -120(%rbp)
.L28:
	addl	$1, -116(%rbp)
.L27:
	movl	-168(%rbp), %eax
	cmpl	%eax, -116(%rbp)
	jl	.L29
	movl	-168(%rbp), %edx
	movl	-120(%rbp), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	LRUOrganizer
	movl	-120(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rax, 8(%rdx)
	jmp	.L25
.L26:
	leaq	-27(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L25
	movq	-48(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -112(%rbp)
	movl	$0, -108(%rbp)
	movl	$0, -104(%rbp)
	jmp	.L30
.L32:
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	16(%rax), %eax
	cmpl	%eax, -112(%rbp)
	jle	.L31
	movl	-104(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	16(%rax), %eax
	movl	%eax, -112(%rbp)
	movl	-104(%rbp), %eax
	movl	%eax, -108(%rbp)
.L31:
	addl	$1, -104(%rbp)
.L30:
	movl	-168(%rbp), %eax
	cmpl	%eax, -104(%rbp)
	jl	.L32
	movl	-108(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rax, 8(%rdx)
	movl	-108(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 16(%rax)
.L25:
	addl	$1, -124(%rbp)
.L21:
	movl	-168(%rbp), %eax
	cmpl	%eax, -124(%rbp)
	jl	.L33
.L12:
	movq	-80(%rbp), %rax
	cmpq	$-1, %rax
	jne	.L34
	jmp	.L14
.L40:
	nop
.L14:
	movl	-144(%rbp), %eax
	imull	$100, %eax, %eax
	cvtsi2sd	%eax, %xmm0
	movl	-148(%rbp), %edx
	movl	-144(%rbp), %eax
	addl	%edx, %eax
	cvtsi2sd	%eax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	-140(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, -184(%rbp)
	movsd	-184(%rbp), %xmm0
	leaq	.LC8(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -100(%rbp)
	jmp	.L35
.L36:
	movl	-100(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -100(%rbp)
.L35:
	movl	-168(%rbp), %eax
	cmpl	%eax, -100(%rbp)
	jl	.L36
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L38
	call	__stack_chk_fail@PLT
.L38:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
