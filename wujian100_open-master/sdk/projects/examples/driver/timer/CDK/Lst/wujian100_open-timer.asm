
C:/Users/Administrator/Desktop/wujian100_open-master/sdk/projects/examples/driver/timer/CDK//Obj/wujian100_open-timer.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <Reset_Handler>:
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
.option push
.option norelax
    la      gp, __global_pointer$
       0:	20000197          	auipc	gp,0x20000
       4:	65c18193          	addi	gp,gp,1628 # 2000065c <g_system_clock>
.option pop
    la      a0, Default_Handler
       8:	00000517          	auipc	a0,0x0
       c:	1b850513          	addi	a0,a0,440 # 1c0 <Default_Handler>
    ori     a0, a0, 3
      10:	00356513          	ori	a0,a0,3
    csrw    mtvec, a0
      14:	30551073          	csrw	mtvec,a0

    la      a0, __Vectors
      18:	9a418513          	addi	a0,gp,-1628 # 20000000 <__Vectors>
    csrw    mtvt, a0
      1c:	30751073          	csrw	mtvt,a0

    la      sp, g_top_irqstack
      20:	20001117          	auipc	sp,0x20001
      24:	65c10113          	addi	sp,sp,1628 # 2000167c <g_top_irqstack>

    /* Load data section */
    la      a0, __erodata
      28:	00006517          	auipc	a0,0x6
      2c:	0a050513          	addi	a0,a0,160 # 60c8 <__ctor_end__>
    la      a1, __data_start__
      30:	9a418593          	addi	a1,gp,-1628 # 20000000 <__Vectors>
    la      a2, __data_end__
      34:	00418613          	addi	a2,gp,4 # 20000660 <__bss_start__>
    bgeu    a1, a2, 2f
      38:	00c5fa63          	bgeu	a1,a2,4c <Reset_Handler+0x4c>
1:
    lw      t0, (a0)
      3c:	00052283          	lw	t0,0(a0)
    sw      t0, (a1)
      40:	0055a023          	sw	t0,0(a1)
    addi    a0, a0, 4
      44:	0511                	addi	a0,a0,4
    addi    a1, a1, 4
      46:	0591                	addi	a1,a1,4
    bltu    a1, a2, 1b
      48:	fec5eae3          	bltu	a1,a2,3c <Reset_Handler+0x3c>
2:

    /* Clear bss section */
    la      a0, __bss_start__
      4c:	00418513          	addi	a0,gp,4 # 20000660 <__bss_start__>
    la      a1, __bss_end__
      50:	20002597          	auipc	a1,0x20002
      54:	f4058593          	addi	a1,a1,-192 # 20001f90 <__bss_end__>
    bgeu    a0, a1, 2f
      58:	00b57763          	bgeu	a0,a1,66 <Reset_Handler+0x66>
1:
    sw      zero, (a0)
      5c:	00052023          	sw	zero,0(a0)
    addi    a0, a0, 4
      60:	0511                	addi	a0,a0,4
    bltu    a0, a1, 1b
      62:	feb56de3          	bltu	a0,a1,5c <Reset_Handler+0x5c>
2:

#ifndef __NO_SYSTEM_INIT
    jal     SystemInit
      66:	3b5030ef          	jal	ra,3c1a <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      6a:	341020ef          	jal	ra,2baa <board_init>
#endif

    jal     main
      6e:	1e4040ef          	jal	ra,4252 <main>

00000072 <__exit>:

    .size   Reset_Handler, . - Reset_Handler

__exit:
    j      __exit
      72:	a001                	j	72 <__exit>
	...

00000080 <Default_IRQHandler>:
    .align  2
    .global Default_IRQHandler
    .weak   Default_IRQHandler
    .type   Default_IRQHandler, %function
Default_IRQHandler:
    addi    sp, sp, -48
      80:	7179                	addi	sp,sp,-48
    sw      t0, 4(sp)
      82:	c216                	sw	t0,4(sp)
    sw      t1, 8(sp)
      84:	c41a                	sw	t1,8(sp)
    csrr    t0, mepc
      86:	341022f3          	csrr	t0,mepc
    csrr    t1, mcause
      8a:	34202373          	csrr	t1,mcause
    sw      t1, 40(sp)
      8e:	d41a                	sw	t1,40(sp)
    sw      t0, 44(sp)
      90:	d616                	sw	t0,44(sp)
    csrs    mstatus, 8
      92:	30046073          	csrsi	mstatus,8

    sw      ra, 0(sp)
      96:	c006                	sw	ra,0(sp)
    sw      t2, 12(sp)
      98:	c61e                	sw	t2,12(sp)
    sw      a0, 16(sp)
      9a:	c82a                	sw	a0,16(sp)
    sw      a1, 20(sp)
      9c:	ca2e                	sw	a1,20(sp)
    sw      a2, 24(sp)
      9e:	cc32                	sw	a2,24(sp)
    sw      a3, 28(sp)
      a0:	ce36                	sw	a3,28(sp)
    sw      a4, 32(sp)
      a2:	d03a                	sw	a4,32(sp)
    sw      a5, 36(sp)
      a4:	d23e                	sw	a5,36(sp)

    andi    t1, t1, 0x3FF
      a6:	3ff37313          	andi	t1,t1,1023
    slli    t1, t1, 2
      aa:	030a                	slli	t1,t1,0x2

    la      t0, g_irqvector
      ac:	20002297          	auipc	t0,0x20002
      b0:	cc028293          	addi	t0,t0,-832 # 20001d6c <g_irqvector>
    add     t0, t0, t1
      b4:	929a                	add	t0,t0,t1
    lw      t2, (t0)
      b6:	0002a383          	lw	t2,0(t0)
    jalr    t2
      ba:	9382                	jalr	t2

    csrc    mstatus, 8
      bc:	30047073          	csrci	mstatus,8

    lw      a1, 40(sp)
      c0:	55a2                	lw	a1,40(sp)
    andi    a0, a1, 0x3FF
      c2:	3ff5f513          	andi	a0,a1,1023

    /* clear pending */
    li      a2, 0xE000E100
      c6:	e000e637          	lui	a2,0xe000e
      ca:	10060613          	addi	a2,a2,256 # e000e100 <__heap_end+0xbffde100>
    add     a2, a2, a0
      ce:	962a                	add	a2,a2,a0
    lb      a3, 0(a2)
      d0:	00060683          	lb	a3,0(a2)
    li      a4, 1
      d4:	4705                	li	a4,1
    not     a4, a4
      d6:	fff74713          	not	a4,a4
    and     a5, a4, a3
      da:	00d777b3          	and	a5,a4,a3
    sb      a5, 0(a2)
      de:	00f60023          	sb	a5,0(a2)

    li      t0, MSTATUS_PRV1
      e2:	000022b7          	lui	t0,0x2
      e6:	88028293          	addi	t0,t0,-1920 # 1880 <__muldf3+0x260>
    csrs    mstatus, t0
      ea:	3002a073          	csrs	mstatus,t0
    csrw    mcause, a1
      ee:	34259073          	csrw	mcause,a1
    lw      t0, 44(sp)
      f2:	52b2                	lw	t0,44(sp)
    csrw    mepc, t0
      f4:	34129073          	csrw	mepc,t0
    lw      ra, 0(sp)
      f8:	4082                	lw	ra,0(sp)
    lw      t0, 4(sp)
      fa:	4292                	lw	t0,4(sp)
    lw      t1, 8(sp)
      fc:	4322                	lw	t1,8(sp)
    lw      t2, 12(sp)
      fe:	43b2                	lw	t2,12(sp)
    lw      a0, 16(sp)
     100:	4542                	lw	a0,16(sp)
    lw      a1, 20(sp)
     102:	45d2                	lw	a1,20(sp)
    lw      a2, 24(sp)
     104:	4662                	lw	a2,24(sp)
    lw      a3, 28(sp)
     106:	46f2                	lw	a3,28(sp)
    lw      a4, 32(sp)
     108:	5702                	lw	a4,32(sp)
    lw      a5, 36(sp)
     10a:	5792                	lw	a5,36(sp)

    addi    sp, sp, 48
     10c:	6145                	addi	sp,sp,48
    mret
     10e:	30200073          	mret
     112:	0001                	nop

00000114 <trap>:
    .align  2
    .global trap
    .type   trap, %function
trap:
    /* Check for interrupt */
    addi    sp, sp, -4
     114:	1171                	addi	sp,sp,-4
    sw      t0, 0x0(sp)
     116:	c016                	sw	t0,0(sp)
    csrr    t0, mcause
     118:	342022f3          	csrr	t0,mcause

    blt     t0, x0, .Lirq
     11c:	0602c463          	bltz	t0,184 <trap+0x70>

    addi    sp, sp, 4
     120:	0111                	addi	sp,sp,4

    la      t0, g_trap_sp
     122:	20001297          	auipc	t0,0x20001
     126:	75a28293          	addi	t0,t0,1882 # 2000187c <g_trap_sp>
    addi    t0, t0, -68
     12a:	fbc28293          	addi	t0,t0,-68
    sw      x1, 0(t0)
     12e:	0012a023          	sw	ra,0(t0)
    sw      x2, 4(t0)
     132:	0022a223          	sw	sp,4(t0)
    sw      x3, 8(t0)
     136:	0032a423          	sw	gp,8(t0)
    sw      x4, 12(t0)
     13a:	0042a623          	sw	tp,12(t0)
    sw      x6, 20(t0)
     13e:	0062aa23          	sw	t1,20(t0)
    sw      x7, 24(t0)
     142:	0072ac23          	sw	t2,24(t0)
    sw      x8, 28(t0)
     146:	0082ae23          	sw	s0,28(t0)
    sw      x9, 32(t0)
     14a:	0292a023          	sw	s1,32(t0)
    sw      x10, 36(t0)
     14e:	02a2a223          	sw	a0,36(t0)
    sw      x11, 40(t0)
     152:	02b2a423          	sw	a1,40(t0)
    sw      x12, 44(t0)
     156:	02c2a623          	sw	a2,44(t0)
    sw      x13, 48(t0)
     15a:	02d2a823          	sw	a3,48(t0)
    sw      x14, 52(t0)
     15e:	02e2aa23          	sw	a4,52(t0)
    sw      x15, 56(t0)
     162:	02f2ac23          	sw	a5,56(t0)
    csrr    a0, mepc
     166:	34102573          	csrr	a0,mepc
    sw      a0, 60(t0)
     16a:	02a2ae23          	sw	a0,60(t0)
    csrr    a0, mstatus
     16e:	30002573          	csrr	a0,mstatus
    sw      a0, 64(t0)
     172:	04a2a023          	sw	a0,64(t0)

    mv      a0, t0
     176:	8516                	mv	a0,t0
    lw      t0, -4(sp)
     178:	ffc12283          	lw	t0,-4(sp)
    mv      sp, a0
     17c:	812a                	mv	sp,a0
    sw      t0, 16(sp)
     17e:	c816                	sw	t0,16(sp)

    jal     trap_c
     180:	2f9030ef          	jal	ra,3c78 <trap_c>


.Lirq:
    lw      t0, 0x0(sp)
     184:	4282                	lw	t0,0(sp)
    addi    sp, sp, 4
     186:	0111                	addi	sp,sp,4
    j       Default_IRQHandler
     188:	ef9ff06f          	j	80 <Default_IRQHandler>
     18c:	00000013          	nop
     190:	00000013          	nop
     194:	00000013          	nop
     198:	00000013          	nop
     19c:	00000013          	nop
     1a0:	00000013          	nop
     1a4:	00000013          	nop
     1a8:	00000013          	nop
     1ac:	00000013          	nop
     1b0:	00000013          	nop
     1b4:	00000013          	nop
     1b8:	00000013          	nop
     1bc:	00000013          	nop

000001c0 <Default_Handler>:
    .align  6
    .weak   Default_Handler
    .global Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    j      trap
     1c0:	bf91                	j	114 <trap>
	...

000001f4 <__udivdi3>:
     1f4:	1161                	addi	sp,sp,-8
     1f6:	c222                	sw	s0,4(sp)
     1f8:	c026                	sw	s1,0(sp)
     1fa:	87ae                	mv	a5,a1
     1fc:	20069d63          	bnez	a3,416 <__min_heap_size+0x216>
     200:	83b6                	mv	t2,a3
     202:	8332                	mv	t1,a2
     204:	82aa                	mv	t0,a0
     206:	00005697          	auipc	a3,0x5
     20a:	0c268693          	addi	a3,a3,194 # 52c8 <__clz_tab>
     20e:	0ac5fd63          	bgeu	a1,a2,2c8 <__min_heap_size+0xc8>
     212:	6741                	lui	a4,0x10
     214:	0ae67363          	bgeu	a2,a4,2ba <__min_heap_size+0xba>
     218:	0ff00713          	li	a4,255
     21c:	00c73733          	sltu	a4,a4,a2
     220:	070e                	slli	a4,a4,0x3
     222:	00e653b3          	srl	t2,a2,a4
     226:	969e                	add	a3,a3,t2
     228:	0006c683          	lbu	a3,0(a3)
     22c:	9736                	add	a4,a4,a3
     22e:	02000693          	li	a3,32
     232:	8e99                	sub	a3,a3,a4
     234:	ca91                	beqz	a3,248 <__min_heap_size+0x48>
     236:	00d795b3          	sll	a1,a5,a3
     23a:	00e55733          	srl	a4,a0,a4
     23e:	00d61333          	sll	t1,a2,a3
     242:	8dd9                	or	a1,a1,a4
     244:	00d512b3          	sll	t0,a0,a3
     248:	01035513          	srli	a0,t1,0x10
     24c:	02a5f733          	remu	a4,a1,a0
     250:	01031613          	slli	a2,t1,0x10
     254:	8241                	srli	a2,a2,0x10
     256:	0102d693          	srli	a3,t0,0x10
     25a:	02a5d5b3          	divu	a1,a1,a0
     25e:	0742                	slli	a4,a4,0x10
     260:	8ed9                	or	a3,a3,a4
     262:	02b607b3          	mul	a5,a2,a1
     266:	872e                	mv	a4,a1
     268:	00f6fc63          	bgeu	a3,a5,280 <__min_heap_size+0x80>
     26c:	969a                	add	a3,a3,t1
     26e:	fff58713          	addi	a4,a1,-1
     272:	0066e763          	bltu	a3,t1,280 <__min_heap_size+0x80>
     276:	00f6f563          	bgeu	a3,a5,280 <__min_heap_size+0x80>
     27a:	ffe58713          	addi	a4,a1,-2
     27e:	969a                	add	a3,a3,t1
     280:	8e9d                	sub	a3,a3,a5
     282:	02a6f7b3          	remu	a5,a3,a0
     286:	02c2                	slli	t0,t0,0x10
     288:	0102d293          	srli	t0,t0,0x10
     28c:	02a6d6b3          	divu	a3,a3,a0
     290:	07c2                	slli	a5,a5,0x10
     292:	0057e2b3          	or	t0,a5,t0
     296:	02d60633          	mul	a2,a2,a3
     29a:	8536                	mv	a0,a3
     29c:	00c2fb63          	bgeu	t0,a2,2b2 <__min_heap_size+0xb2>
     2a0:	929a                	add	t0,t0,t1
     2a2:	fff68513          	addi	a0,a3,-1
     2a6:	0062e663          	bltu	t0,t1,2b2 <__min_heap_size+0xb2>
     2aa:	00c2f463          	bgeu	t0,a2,2b2 <__min_heap_size+0xb2>
     2ae:	ffe68513          	addi	a0,a3,-2
     2b2:	0742                	slli	a4,a4,0x10
     2b4:	8f49                	or	a4,a4,a0
     2b6:	4581                	li	a1,0
     2b8:	a85d                	j	36e <__min_heap_size+0x16e>
     2ba:	010003b7          	lui	t2,0x1000
     2be:	4741                	li	a4,16
     2c0:	f67661e3          	bltu	a2,t2,222 <__min_heap_size+0x22>
     2c4:	4761                	li	a4,24
     2c6:	bfb1                	j	222 <__min_heap_size+0x22>
     2c8:	e601                	bnez	a2,2d0 <__min_heap_size+0xd0>
     2ca:	4705                	li	a4,1
     2cc:	02c75333          	divu	t1,a4,a2
     2d0:	6741                	lui	a4,0x10
     2d2:	0ae37363          	bgeu	t1,a4,378 <__min_heap_size+0x178>
     2d6:	0ff00713          	li	a4,255
     2da:	00677363          	bgeu	a4,t1,2e0 <__min_heap_size+0xe0>
     2de:	43a1                	li	t2,8
     2e0:	00735733          	srl	a4,t1,t2
     2e4:	96ba                	add	a3,a3,a4
     2e6:	0006c703          	lbu	a4,0(a3)
     2ea:	971e                	add	a4,a4,t2
     2ec:	02000393          	li	t2,32
     2f0:	40e383b3          	sub	t2,t2,a4
     2f4:	08039963          	bnez	t2,386 <__min_heap_size+0x186>
     2f8:	406787b3          	sub	a5,a5,t1
     2fc:	4585                	li	a1,1
     2fe:	01035413          	srli	s0,t1,0x10
     302:	01031393          	slli	t2,t1,0x10
     306:	0103d393          	srli	t2,t2,0x10
     30a:	0102d693          	srli	a3,t0,0x10
     30e:	0287f733          	remu	a4,a5,s0
     312:	0287d7b3          	divu	a5,a5,s0
     316:	0742                	slli	a4,a4,0x10
     318:	8ed9                	or	a3,a3,a4
     31a:	02f38633          	mul	a2,t2,a5
     31e:	873e                	mv	a4,a5
     320:	00c6fc63          	bgeu	a3,a2,338 <__min_heap_size+0x138>
     324:	969a                	add	a3,a3,t1
     326:	fff78713          	addi	a4,a5,-1
     32a:	0066e763          	bltu	a3,t1,338 <__min_heap_size+0x138>
     32e:	00c6f563          	bgeu	a3,a2,338 <__min_heap_size+0x138>
     332:	ffe78713          	addi	a4,a5,-2
     336:	969a                	add	a3,a3,t1
     338:	8e91                	sub	a3,a3,a2
     33a:	0286f7b3          	remu	a5,a3,s0
     33e:	02c2                	slli	t0,t0,0x10
     340:	0102d293          	srli	t0,t0,0x10
     344:	0286d6b3          	divu	a3,a3,s0
     348:	07c2                	slli	a5,a5,0x10
     34a:	0057e2b3          	or	t0,a5,t0
     34e:	02d383b3          	mul	t2,t2,a3
     352:	8536                	mv	a0,a3
     354:	0072fb63          	bgeu	t0,t2,36a <__min_heap_size+0x16a>
     358:	929a                	add	t0,t0,t1
     35a:	fff68513          	addi	a0,a3,-1
     35e:	0062e663          	bltu	t0,t1,36a <__min_heap_size+0x16a>
     362:	0072f463          	bgeu	t0,t2,36a <__min_heap_size+0x16a>
     366:	ffe68513          	addi	a0,a3,-2
     36a:	0742                	slli	a4,a4,0x10
     36c:	8f49                	or	a4,a4,a0
     36e:	853a                	mv	a0,a4
     370:	4412                	lw	s0,4(sp)
     372:	4482                	lw	s1,0(sp)
     374:	0121                	addi	sp,sp,8
     376:	8082                	ret
     378:	01000737          	lui	a4,0x1000
     37c:	43c1                	li	t2,16
     37e:	f6e361e3          	bltu	t1,a4,2e0 <__min_heap_size+0xe0>
     382:	43e1                	li	t2,24
     384:	bfb1                	j	2e0 <__min_heap_size+0xe0>
     386:	00731333          	sll	t1,t1,t2
     38a:	00e7d6b3          	srl	a3,a5,a4
     38e:	01035593          	srli	a1,t1,0x10
     392:	007797b3          	sll	a5,a5,t2
     396:	007512b3          	sll	t0,a0,t2
     39a:	02b6d3b3          	divu	t2,a3,a1
     39e:	00e55733          	srl	a4,a0,a4
     3a2:	00f76633          	or	a2,a4,a5
     3a6:	01031793          	slli	a5,t1,0x10
     3aa:	83c1                	srli	a5,a5,0x10
     3ac:	01065513          	srli	a0,a2,0x10
     3b0:	02b6f733          	remu	a4,a3,a1
     3b4:	027786b3          	mul	a3,a5,t2
     3b8:	0742                	slli	a4,a4,0x10
     3ba:	8f49                	or	a4,a4,a0
     3bc:	851e                	mv	a0,t2
     3be:	00d77c63          	bgeu	a4,a3,3d6 <__min_heap_size+0x1d6>
     3c2:	971a                	add	a4,a4,t1
     3c4:	fff38513          	addi	a0,t2,-1 # ffffff <__ctor_end__+0xff9f37>
     3c8:	00676763          	bltu	a4,t1,3d6 <__min_heap_size+0x1d6>
     3cc:	00d77563          	bgeu	a4,a3,3d6 <__min_heap_size+0x1d6>
     3d0:	ffe38513          	addi	a0,t2,-2
     3d4:	971a                	add	a4,a4,t1
     3d6:	40d706b3          	sub	a3,a4,a3
     3da:	02b6f733          	remu	a4,a3,a1
     3de:	02b6d6b3          	divu	a3,a3,a1
     3e2:	0742                	slli	a4,a4,0x10
     3e4:	02d783b3          	mul	t2,a5,a3
     3e8:	01061793          	slli	a5,a2,0x10
     3ec:	83c1                	srli	a5,a5,0x10
     3ee:	8fd9                	or	a5,a5,a4
     3f0:	8736                	mv	a4,a3
     3f2:	0077fc63          	bgeu	a5,t2,40a <__min_heap_size+0x20a>
     3f6:	979a                	add	a5,a5,t1
     3f8:	fff68713          	addi	a4,a3,-1
     3fc:	0067e763          	bltu	a5,t1,40a <__min_heap_size+0x20a>
     400:	0077f563          	bgeu	a5,t2,40a <__min_heap_size+0x20a>
     404:	ffe68713          	addi	a4,a3,-2
     408:	979a                	add	a5,a5,t1
     40a:	01051593          	slli	a1,a0,0x10
     40e:	407787b3          	sub	a5,a5,t2
     412:	8dd9                	or	a1,a1,a4
     414:	b5ed                	j	2fe <__min_heap_size+0xfe>
     416:	14d5e063          	bltu	a1,a3,556 <__min_heap_size+0x356>
     41a:	6741                	lui	a4,0x10
     41c:	02e6fd63          	bgeu	a3,a4,456 <__min_heap_size+0x256>
     420:	0ff00713          	li	a4,255
     424:	00d73733          	sltu	a4,a4,a3
     428:	070e                	slli	a4,a4,0x3
     42a:	00e6d333          	srl	t1,a3,a4
     42e:	00005597          	auipc	a1,0x5
     432:	e9a58593          	addi	a1,a1,-358 # 52c8 <__clz_tab>
     436:	959a                	add	a1,a1,t1
     438:	0005c583          	lbu	a1,0(a1)
     43c:	972e                	add	a4,a4,a1
     43e:	02000593          	li	a1,32
     442:	8d99                	sub	a1,a1,a4
     444:	e185                	bnez	a1,464 <__min_heap_size+0x264>
     446:	4705                	li	a4,1
     448:	f2f6e3e3          	bltu	a3,a5,36e <__min_heap_size+0x16e>
     44c:	00c53633          	sltu	a2,a0,a2
     450:	00164713          	xori	a4,a2,1
     454:	bf29                	j	36e <__min_heap_size+0x16e>
     456:	010005b7          	lui	a1,0x1000
     45a:	4741                	li	a4,16
     45c:	fcb6e7e3          	bltu	a3,a1,42a <__min_heap_size+0x22a>
     460:	4761                	li	a4,24
     462:	b7e1                	j	42a <__min_heap_size+0x22a>
     464:	00e65333          	srl	t1,a2,a4
     468:	00b696b3          	sll	a3,a3,a1
     46c:	00d366b3          	or	a3,t1,a3
     470:	00e7d3b3          	srl	t2,a5,a4
     474:	0106d413          	srli	s0,a3,0x10
     478:	0283f2b3          	remu	t0,t2,s0
     47c:	00e55733          	srl	a4,a0,a4
     480:	00b797b3          	sll	a5,a5,a1
     484:	8fd9                	or	a5,a5,a4
     486:	01069713          	slli	a4,a3,0x10
     48a:	8341                	srli	a4,a4,0x10
     48c:	0107d313          	srli	t1,a5,0x10
     490:	00b61633          	sll	a2,a2,a1
     494:	0283d3b3          	divu	t2,t2,s0
     498:	02c2                	slli	t0,t0,0x10
     49a:	0062e2b3          	or	t0,t0,t1
     49e:	027704b3          	mul	s1,a4,t2
     4a2:	831e                	mv	t1,t2
     4a4:	0092fc63          	bgeu	t0,s1,4bc <__min_heap_size+0x2bc>
     4a8:	92b6                	add	t0,t0,a3
     4aa:	fff38313          	addi	t1,t2,-1
     4ae:	00d2e763          	bltu	t0,a3,4bc <__min_heap_size+0x2bc>
     4b2:	0092f563          	bgeu	t0,s1,4bc <__min_heap_size+0x2bc>
     4b6:	ffe38313          	addi	t1,t2,-2
     4ba:	92b6                	add	t0,t0,a3
     4bc:	409282b3          	sub	t0,t0,s1
     4c0:	0282f3b3          	remu	t2,t0,s0
     4c4:	07c2                	slli	a5,a5,0x10
     4c6:	83c1                	srli	a5,a5,0x10
     4c8:	0282d2b3          	divu	t0,t0,s0
     4cc:	03c2                	slli	t2,t2,0x10
     4ce:	00f3e7b3          	or	a5,t2,a5
     4d2:	02570733          	mul	a4,a4,t0
     4d6:	8396                	mv	t2,t0
     4d8:	00e7fc63          	bgeu	a5,a4,4f0 <__min_heap_size+0x2f0>
     4dc:	97b6                	add	a5,a5,a3
     4de:	fff28393          	addi	t2,t0,-1
     4e2:	00d7e763          	bltu	a5,a3,4f0 <__min_heap_size+0x2f0>
     4e6:	00e7f563          	bgeu	a5,a4,4f0 <__min_heap_size+0x2f0>
     4ea:	ffe28393          	addi	t2,t0,-2
     4ee:	97b6                	add	a5,a5,a3
     4f0:	8f99                	sub	a5,a5,a4
     4f2:	01031713          	slli	a4,t1,0x10
     4f6:	00776733          	or	a4,a4,t2
     4fa:	63c1                	lui	t2,0x10
     4fc:	fff38313          	addi	t1,t2,-1 # ffff <__ctor_end__+0x9f37>
     500:	006776b3          	and	a3,a4,t1
     504:	01075413          	srli	s0,a4,0x10
     508:	00667333          	and	t1,a2,t1
     50c:	8241                	srli	a2,a2,0x10
     50e:	026682b3          	mul	t0,a3,t1
     512:	02640333          	mul	t1,s0,t1
     516:	02c40433          	mul	s0,s0,a2
     51a:	02c68633          	mul	a2,a3,a2
     51e:	0102d693          	srli	a3,t0,0x10
     522:	961a                	add	a2,a2,t1
     524:	96b2                	add	a3,a3,a2
     526:	0066f363          	bgeu	a3,t1,52c <__min_heap_size+0x32c>
     52a:	941e                	add	s0,s0,t2
     52c:	0106d613          	srli	a2,a3,0x10
     530:	9432                	add	s0,s0,a2
     532:	0287e063          	bltu	a5,s0,552 <__min_heap_size+0x352>
     536:	d88790e3          	bne	a5,s0,2b6 <__min_heap_size+0xb6>
     53a:	67c1                	lui	a5,0x10
     53c:	17fd                	addi	a5,a5,-1
     53e:	8efd                	and	a3,a3,a5
     540:	06c2                	slli	a3,a3,0x10
     542:	00f2f2b3          	and	t0,t0,a5
     546:	00b51533          	sll	a0,a0,a1
     54a:	9696                	add	a3,a3,t0
     54c:	4581                	li	a1,0
     54e:	e2d570e3          	bgeu	a0,a3,36e <__min_heap_size+0x16e>
     552:	177d                	addi	a4,a4,-1
     554:	b38d                	j	2b6 <__min_heap_size+0xb6>
     556:	4581                	li	a1,0
     558:	4701                	li	a4,0
     55a:	bd11                	j	36e <__min_heap_size+0x16e>

0000055c <__umoddi3>:
     55c:	1151                	addi	sp,sp,-12
     55e:	c422                	sw	s0,8(sp)
     560:	c226                	sw	s1,4(sp)
     562:	87aa                	mv	a5,a0
     564:	832e                	mv	t1,a1
     566:	1c069b63          	bnez	a3,73c <__umoddi3+0x1e0>
     56a:	8736                	mv	a4,a3
     56c:	8432                	mv	s0,a2
     56e:	00005697          	auipc	a3,0x5
     572:	d5a68693          	addi	a3,a3,-678 # 52c8 <__clz_tab>
     576:	0ac5fb63          	bgeu	a1,a2,62c <__umoddi3+0xd0>
     57a:	62c1                	lui	t0,0x10
     57c:	0a567163          	bgeu	a2,t0,61e <__umoddi3+0xc2>
     580:	0ff00293          	li	t0,255
     584:	00c2f363          	bgeu	t0,a2,58a <__umoddi3+0x2e>
     588:	4721                	li	a4,8
     58a:	00e652b3          	srl	t0,a2,a4
     58e:	9696                	add	a3,a3,t0
     590:	0006c283          	lbu	t0,0(a3)
     594:	02000393          	li	t2,32
     598:	9716                	add	a4,a4,t0
     59a:	40e383b3          	sub	t2,t2,a4
     59e:	00038c63          	beqz	t2,5b6 <__umoddi3+0x5a>
     5a2:	007595b3          	sll	a1,a1,t2
     5a6:	00e55733          	srl	a4,a0,a4
     5aa:	00761433          	sll	s0,a2,t2
     5ae:	00b76333          	or	t1,a4,a1
     5b2:	007517b3          	sll	a5,a0,t2
     5b6:	01045613          	srli	a2,s0,0x10
     5ba:	02c376b3          	remu	a3,t1,a2
     5be:	01041513          	slli	a0,s0,0x10
     5c2:	8141                	srli	a0,a0,0x10
     5c4:	0107d713          	srli	a4,a5,0x10
     5c8:	02c35333          	divu	t1,t1,a2
     5cc:	06c2                	slli	a3,a3,0x10
     5ce:	8f55                	or	a4,a4,a3
     5d0:	02650333          	mul	t1,a0,t1
     5d4:	00677863          	bgeu	a4,t1,5e4 <__umoddi3+0x88>
     5d8:	9722                	add	a4,a4,s0
     5da:	00876563          	bltu	a4,s0,5e4 <__umoddi3+0x88>
     5de:	00677363          	bgeu	a4,t1,5e4 <__umoddi3+0x88>
     5e2:	9722                	add	a4,a4,s0
     5e4:	40670733          	sub	a4,a4,t1
     5e8:	02c776b3          	remu	a3,a4,a2
     5ec:	07c2                	slli	a5,a5,0x10
     5ee:	83c1                	srli	a5,a5,0x10
     5f0:	02c75733          	divu	a4,a4,a2
     5f4:	02e50733          	mul	a4,a0,a4
     5f8:	01069513          	slli	a0,a3,0x10
     5fc:	8fc9                	or	a5,a5,a0
     5fe:	00e7f863          	bgeu	a5,a4,60e <__umoddi3+0xb2>
     602:	97a2                	add	a5,a5,s0
     604:	0087e563          	bltu	a5,s0,60e <__umoddi3+0xb2>
     608:	00e7f363          	bgeu	a5,a4,60e <__umoddi3+0xb2>
     60c:	97a2                	add	a5,a5,s0
     60e:	8f99                	sub	a5,a5,a4
     610:	0077d533          	srl	a0,a5,t2
     614:	4581                	li	a1,0
     616:	4422                	lw	s0,8(sp)
     618:	4492                	lw	s1,4(sp)
     61a:	0131                	addi	sp,sp,12
     61c:	8082                	ret
     61e:	010002b7          	lui	t0,0x1000
     622:	4741                	li	a4,16
     624:	f65663e3          	bltu	a2,t0,58a <__umoddi3+0x2e>
     628:	4761                	li	a4,24
     62a:	b785                	j	58a <__umoddi3+0x2e>
     62c:	e601                	bnez	a2,634 <__umoddi3+0xd8>
     62e:	4605                	li	a2,1
     630:	02865433          	divu	s0,a2,s0
     634:	6641                	lui	a2,0x10
     636:	08c47263          	bgeu	s0,a2,6ba <__umoddi3+0x15e>
     63a:	0ff00613          	li	a2,255
     63e:	00867363          	bgeu	a2,s0,644 <__umoddi3+0xe8>
     642:	4721                	li	a4,8
     644:	00e45633          	srl	a2,s0,a4
     648:	96b2                	add	a3,a3,a2
     64a:	0006c283          	lbu	t0,0(a3)
     64e:	02000393          	li	t2,32
     652:	9716                	add	a4,a4,t0
     654:	40e383b3          	sub	t2,t2,a4
     658:	06039863          	bnez	t2,6c8 <__umoddi3+0x16c>
     65c:	8d81                	sub	a1,a1,s0
     65e:	01045693          	srli	a3,s0,0x10
     662:	01041513          	slli	a0,s0,0x10
     666:	8141                	srli	a0,a0,0x10
     668:	0107d613          	srli	a2,a5,0x10
     66c:	02d5f733          	remu	a4,a1,a3
     670:	02d5d5b3          	divu	a1,a1,a3
     674:	0742                	slli	a4,a4,0x10
     676:	8f51                	or	a4,a4,a2
     678:	02b505b3          	mul	a1,a0,a1
     67c:	00b77863          	bgeu	a4,a1,68c <__umoddi3+0x130>
     680:	9722                	add	a4,a4,s0
     682:	00876563          	bltu	a4,s0,68c <__umoddi3+0x130>
     686:	00b77363          	bgeu	a4,a1,68c <__umoddi3+0x130>
     68a:	9722                	add	a4,a4,s0
     68c:	40b705b3          	sub	a1,a4,a1
     690:	02d5f733          	remu	a4,a1,a3
     694:	07c2                	slli	a5,a5,0x10
     696:	83c1                	srli	a5,a5,0x10
     698:	02d5d5b3          	divu	a1,a1,a3
     69c:	02b505b3          	mul	a1,a0,a1
     6a0:	01071513          	slli	a0,a4,0x10
     6a4:	8fc9                	or	a5,a5,a0
     6a6:	00b7f863          	bgeu	a5,a1,6b6 <__umoddi3+0x15a>
     6aa:	97a2                	add	a5,a5,s0
     6ac:	0087e563          	bltu	a5,s0,6b6 <__umoddi3+0x15a>
     6b0:	00b7f363          	bgeu	a5,a1,6b6 <__umoddi3+0x15a>
     6b4:	97a2                	add	a5,a5,s0
     6b6:	8f8d                	sub	a5,a5,a1
     6b8:	bfa1                	j	610 <__umoddi3+0xb4>
     6ba:	01000637          	lui	a2,0x1000
     6be:	4741                	li	a4,16
     6c0:	f8c462e3          	bltu	s0,a2,644 <__umoddi3+0xe8>
     6c4:	4761                	li	a4,24
     6c6:	bfbd                	j	644 <__umoddi3+0xe8>
     6c8:	00741433          	sll	s0,s0,t2
     6cc:	00e5d6b3          	srl	a3,a1,a4
     6d0:	01045613          	srli	a2,s0,0x10
     6d4:	00e55733          	srl	a4,a0,a4
     6d8:	007595b3          	sll	a1,a1,t2
     6dc:	00b762b3          	or	t0,a4,a1
     6e0:	02c6f733          	remu	a4,a3,a2
     6e4:	01041593          	slli	a1,s0,0x10
     6e8:	81c1                	srli	a1,a1,0x10
     6ea:	007517b3          	sll	a5,a0,t2
     6ee:	0102d513          	srli	a0,t0,0x10
     6f2:	02c6d6b3          	divu	a3,a3,a2
     6f6:	0742                	slli	a4,a4,0x10
     6f8:	8f49                	or	a4,a4,a0
     6fa:	02d586b3          	mul	a3,a1,a3
     6fe:	00d77863          	bgeu	a4,a3,70e <__umoddi3+0x1b2>
     702:	9722                	add	a4,a4,s0
     704:	00876563          	bltu	a4,s0,70e <__umoddi3+0x1b2>
     708:	00d77363          	bgeu	a4,a3,70e <__umoddi3+0x1b2>
     70c:	9722                	add	a4,a4,s0
     70e:	40d706b3          	sub	a3,a4,a3
     712:	02c6f733          	remu	a4,a3,a2
     716:	02c6d6b3          	divu	a3,a3,a2
     71a:	0742                	slli	a4,a4,0x10
     71c:	02d586b3          	mul	a3,a1,a3
     720:	01029593          	slli	a1,t0,0x10
     724:	81c1                	srli	a1,a1,0x10
     726:	8dd9                	or	a1,a1,a4
     728:	00d5f863          	bgeu	a1,a3,738 <__umoddi3+0x1dc>
     72c:	95a2                	add	a1,a1,s0
     72e:	0085e563          	bltu	a1,s0,738 <__umoddi3+0x1dc>
     732:	00d5f363          	bgeu	a1,a3,738 <__umoddi3+0x1dc>
     736:	95a2                	add	a1,a1,s0
     738:	8d95                	sub	a1,a1,a3
     73a:	b715                	j	65e <__umoddi3+0x102>
     73c:	ecd5ede3          	bltu	a1,a3,616 <__umoddi3+0xba>
     740:	6741                	lui	a4,0x10
     742:	04e6f563          	bgeu	a3,a4,78c <__umoddi3+0x230>
     746:	0ff00393          	li	t2,255
     74a:	00d3b733          	sltu	a4,t2,a3
     74e:	070e                	slli	a4,a4,0x3
     750:	00e6d3b3          	srl	t2,a3,a4
     754:	00005297          	auipc	t0,0x5
     758:	b7428293          	addi	t0,t0,-1164 # 52c8 <__clz_tab>
     75c:	929e                	add	t0,t0,t2
     75e:	0002c383          	lbu	t2,0(t0)
     762:	02000293          	li	t0,32
     766:	93ba                	add	t2,t2,a4
     768:	407282b3          	sub	t0,t0,t2
     76c:	02029763          	bnez	t0,79a <__umoddi3+0x23e>
     770:	00b6e463          	bltu	a3,a1,778 <__umoddi3+0x21c>
     774:	00c56963          	bltu	a0,a2,786 <__umoddi3+0x22a>
     778:	40c507b3          	sub	a5,a0,a2
     77c:	8d95                	sub	a1,a1,a3
     77e:	00f53533          	sltu	a0,a0,a5
     782:	40a58333          	sub	t1,a1,a0
     786:	853e                	mv	a0,a5
     788:	859a                	mv	a1,t1
     78a:	b571                	j	616 <__umoddi3+0xba>
     78c:	010002b7          	lui	t0,0x1000
     790:	4741                	li	a4,16
     792:	fa56efe3          	bltu	a3,t0,750 <__umoddi3+0x1f4>
     796:	4761                	li	a4,24
     798:	bf65                	j	750 <__umoddi3+0x1f4>
     79a:	007657b3          	srl	a5,a2,t2
     79e:	005696b3          	sll	a3,a3,t0
     7a2:	8edd                	or	a3,a3,a5
     7a4:	0075d4b3          	srl	s1,a1,t2
     7a8:	0106d413          	srli	s0,a3,0x10
     7ac:	00755733          	srl	a4,a0,t2
     7b0:	005517b3          	sll	a5,a0,t0
     7b4:	0284d533          	divu	a0,s1,s0
     7b8:	c03e                	sw	a5,0(sp)
     7ba:	005595b3          	sll	a1,a1,t0
     7be:	8dd9                	or	a1,a1,a4
     7c0:	01069713          	slli	a4,a3,0x10
     7c4:	8341                	srli	a4,a4,0x10
     7c6:	00561633          	sll	a2,a2,t0
     7ca:	0284f7b3          	remu	a5,s1,s0
     7ce:	02a704b3          	mul	s1,a4,a0
     7d2:	01079313          	slli	t1,a5,0x10
     7d6:	0105d793          	srli	a5,a1,0x10
     7da:	00f367b3          	or	a5,t1,a5
     7de:	832a                	mv	t1,a0
     7e0:	0097fc63          	bgeu	a5,s1,7f8 <__umoddi3+0x29c>
     7e4:	97b6                	add	a5,a5,a3
     7e6:	fff50313          	addi	t1,a0,-1
     7ea:	00d7e763          	bltu	a5,a3,7f8 <__umoddi3+0x29c>
     7ee:	0097f563          	bgeu	a5,s1,7f8 <__umoddi3+0x29c>
     7f2:	ffe50313          	addi	t1,a0,-2
     7f6:	97b6                	add	a5,a5,a3
     7f8:	8f85                	sub	a5,a5,s1
     7fa:	0287f533          	remu	a0,a5,s0
     7fe:	05c2                	slli	a1,a1,0x10
     800:	81c1                	srli	a1,a1,0x10
     802:	0287d433          	divu	s0,a5,s0
     806:	0542                	slli	a0,a0,0x10
     808:	8dc9                	or	a1,a1,a0
     80a:	02870733          	mul	a4,a4,s0
     80e:	87a2                	mv	a5,s0
     810:	00e5fc63          	bgeu	a1,a4,828 <__umoddi3+0x2cc>
     814:	95b6                	add	a1,a1,a3
     816:	fff40793          	addi	a5,s0,-1
     81a:	00d5e763          	bltu	a1,a3,828 <__umoddi3+0x2cc>
     81e:	00e5f563          	bgeu	a1,a4,828 <__umoddi3+0x2cc>
     822:	ffe40793          	addi	a5,s0,-2
     826:	95b6                	add	a1,a1,a3
     828:	0342                	slli	t1,t1,0x10
     82a:	6441                	lui	s0,0x10
     82c:	00f36333          	or	t1,t1,a5
     830:	40e58733          	sub	a4,a1,a4
     834:	fff40593          	addi	a1,s0,-1 # ffff <__ctor_end__+0x9f37>
     838:	00b377b3          	and	a5,t1,a1
     83c:	01065493          	srli	s1,a2,0x10
     840:	01035313          	srli	t1,t1,0x10
     844:	8df1                	and	a1,a1,a2
     846:	02b78533          	mul	a0,a5,a1
     84a:	02b305b3          	mul	a1,t1,a1
     84e:	029787b3          	mul	a5,a5,s1
     852:	02930333          	mul	t1,t1,s1
     856:	97ae                	add	a5,a5,a1
     858:	01055493          	srli	s1,a0,0x10
     85c:	97a6                	add	a5,a5,s1
     85e:	00b7f363          	bgeu	a5,a1,864 <__umoddi3+0x308>
     862:	9322                	add	t1,t1,s0
     864:	0107d593          	srli	a1,a5,0x10
     868:	932e                	add	t1,t1,a1
     86a:	65c1                	lui	a1,0x10
     86c:	15fd                	addi	a1,a1,-1
     86e:	8fed                	and	a5,a5,a1
     870:	07c2                	slli	a5,a5,0x10
     872:	8d6d                	and	a0,a0,a1
     874:	953e                	add	a0,a0,a5
     876:	00676763          	bltu	a4,t1,884 <__umoddi3+0x328>
     87a:	00671d63          	bne	a4,t1,894 <__umoddi3+0x338>
     87e:	4782                	lw	a5,0(sp)
     880:	00a7fa63          	bgeu	a5,a0,894 <__umoddi3+0x338>
     884:	40c50633          	sub	a2,a0,a2
     888:	00c53533          	sltu	a0,a0,a2
     88c:	96aa                	add	a3,a3,a0
     88e:	40d30333          	sub	t1,t1,a3
     892:	8532                	mv	a0,a2
     894:	4782                	lw	a5,0(sp)
     896:	40670333          	sub	t1,a4,t1
     89a:	40a78533          	sub	a0,a5,a0
     89e:	00a7b5b3          	sltu	a1,a5,a0
     8a2:	40b305b3          	sub	a1,t1,a1
     8a6:	007597b3          	sll	a5,a1,t2
     8aa:	00555533          	srl	a0,a0,t0
     8ae:	8d5d                	or	a0,a0,a5
     8b0:	0055d5b3          	srl	a1,a1,t0
     8b4:	b38d                	j	616 <__umoddi3+0xba>

000008b6 <__adddf3>:
     8b6:	001002b7          	lui	t0,0x100
     8ba:	12fd                	addi	t0,t0,-1
     8bc:	1131                	addi	sp,sp,-20
     8be:	00b2f333          	and	t1,t0,a1
     8c2:	030e                	slli	t1,t1,0x3
     8c4:	01d55793          	srli	a5,a0,0x1d
     8c8:	c622                	sw	s0,12(sp)
     8ca:	c426                	sw	s1,8(sp)
     8cc:	0145d413          	srli	s0,a1,0x14
     8d0:	01f5d493          	srli	s1,a1,0x1f
     8d4:	00d2f5b3          	and	a1,t0,a3
     8d8:	0146d293          	srli	t0,a3,0x14
     8dc:	7ff47413          	andi	s0,s0,2047
     8e0:	0067e7b3          	or	a5,a5,t1
     8e4:	7ff2f293          	andi	t0,t0,2047
     8e8:	01d65313          	srli	t1,a2,0x1d
     8ec:	058e                	slli	a1,a1,0x3
     8ee:	c806                	sw	ra,16(sp)
     8f0:	82fd                	srli	a3,a3,0x1f
     8f2:	00351713          	slli	a4,a0,0x3
     8f6:	00b36333          	or	t1,t1,a1
     8fa:	060e                	slli	a2,a2,0x3
     8fc:	40540533          	sub	a0,s0,t0
     900:	22d49663          	bne	s1,a3,b2c <__adddf3+0x276>
     904:	0ea05163          	blez	a0,9e6 <__adddf3+0x130>
     908:	02029863          	bnez	t0,938 <__adddf3+0x82>
     90c:	00c366b3          	or	a3,t1,a2
     910:	56068c63          	beqz	a3,e88 <__adddf3+0x5d2>
     914:	fff50593          	addi	a1,a0,-1
     918:	e989                	bnez	a1,92a <__adddf3+0x74>
     91a:	963a                	add	a2,a2,a4
     91c:	00e63733          	sltu	a4,a2,a4
     920:	979a                	add	a5,a5,t1
     922:	97ba                	add	a5,a5,a4
     924:	8732                	mv	a4,a2
     926:	4405                	li	s0,1
     928:	a8b1                	j	984 <__adddf3+0xce>
     92a:	7ff00693          	li	a3,2047
     92e:	00d51e63          	bne	a0,a3,94a <__adddf3+0x94>
     932:	7ff00413          	li	s0,2047
     936:	aa61                	j	ace <__adddf3+0x218>
     938:	7ff00693          	li	a3,2047
     93c:	18d40963          	beq	s0,a3,ace <__adddf3+0x218>
     940:	008006b7          	lui	a3,0x800
     944:	00d36333          	or	t1,t1,a3
     948:	85aa                	mv	a1,a0
     94a:	03800693          	li	a3,56
     94e:	08b6c763          	blt	a3,a1,9dc <__adddf3+0x126>
     952:	46fd                	li	a3,31
     954:	04b6cf63          	blt	a3,a1,9b2 <__adddf3+0xfc>
     958:	02000513          	li	a0,32
     95c:	8d0d                	sub	a0,a0,a1
     95e:	00a316b3          	sll	a3,t1,a0
     962:	00b652b3          	srl	t0,a2,a1
     966:	00a61633          	sll	a2,a2,a0
     96a:	0056e6b3          	or	a3,a3,t0
     96e:	00c03633          	snez	a2,a2
     972:	8e55                	or	a2,a2,a3
     974:	00b35333          	srl	t1,t1,a1
     978:	963a                	add	a2,a2,a4
     97a:	933e                	add	t1,t1,a5
     97c:	00e637b3          	sltu	a5,a2,a4
     980:	979a                	add	a5,a5,t1
     982:	8732                	mv	a4,a2
     984:	00879693          	slli	a3,a5,0x8
     988:	1406d363          	bgez	a3,ace <__adddf3+0x218>
     98c:	0405                	addi	s0,s0,1
     98e:	7ff00693          	li	a3,2047
     992:	48d40c63          	beq	s0,a3,e2a <__adddf3+0x574>
     996:	ff800637          	lui	a2,0xff800
     99a:	167d                	addi	a2,a2,-1
     99c:	8e7d                	and	a2,a2,a5
     99e:	00175693          	srli	a3,a4,0x1
     9a2:	8b05                	andi	a4,a4,1
     9a4:	01f61793          	slli	a5,a2,0x1f
     9a8:	8f55                	or	a4,a4,a3
     9aa:	8f5d                	or	a4,a4,a5
     9ac:	00165793          	srli	a5,a2,0x1
     9b0:	aa39                	j	ace <__adddf3+0x218>
     9b2:	fe058693          	addi	a3,a1,-32 # ffe0 <__ctor_end__+0x9f18>
     9b6:	02000293          	li	t0,32
     9ba:	00d356b3          	srl	a3,t1,a3
     9be:	4501                	li	a0,0
     9c0:	00558863          	beq	a1,t0,9d0 <__adddf3+0x11a>
     9c4:	04000513          	li	a0,64
     9c8:	40b505b3          	sub	a1,a0,a1
     9cc:	00b31533          	sll	a0,t1,a1
     9d0:	8e49                	or	a2,a2,a0
     9d2:	00c03633          	snez	a2,a2
     9d6:	8e55                	or	a2,a2,a3
     9d8:	4301                	li	t1,0
     9da:	bf79                	j	978 <__adddf3+0xc2>
     9dc:	00c36633          	or	a2,t1,a2
     9e0:	00c03633          	snez	a2,a2
     9e4:	bfd5                	j	9d8 <__adddf3+0x122>
     9e6:	c945                	beqz	a0,a96 <__adddf3+0x1e0>
     9e8:	408285b3          	sub	a1,t0,s0
     9ec:	e40d                	bnez	s0,a16 <__adddf3+0x160>
     9ee:	00e7e6b3          	or	a3,a5,a4
     9f2:	42068463          	beqz	a3,e1a <__adddf3+0x564>
     9f6:	fff58693          	addi	a3,a1,-1
     9fa:	e699                	bnez	a3,a08 <__adddf3+0x152>
     9fc:	9732                	add	a4,a4,a2
     9fe:	979a                	add	a5,a5,t1
     a00:	00c73633          	sltu	a2,a4,a2
     a04:	97b2                	add	a5,a5,a2
     a06:	b705                	j	926 <__adddf3+0x70>
     a08:	7ff00513          	li	a0,2047
     a0c:	00a59d63          	bne	a1,a0,a26 <__adddf3+0x170>
     a10:	879a                	mv	a5,t1
     a12:	8732                	mv	a4,a2
     a14:	bf39                	j	932 <__adddf3+0x7c>
     a16:	7ff00693          	li	a3,2047
     a1a:	fed28be3          	beq	t0,a3,a10 <__adddf3+0x15a>
     a1e:	008006b7          	lui	a3,0x800
     a22:	8fd5                	or	a5,a5,a3
     a24:	86ae                	mv	a3,a1
     a26:	03800593          	li	a1,56
     a2a:	06d5c263          	blt	a1,a3,a8e <__adddf3+0x1d8>
     a2e:	45fd                	li	a1,31
     a30:	02d5ca63          	blt	a1,a3,a64 <__adddf3+0x1ae>
     a34:	02000513          	li	a0,32
     a38:	8d15                	sub	a0,a0,a3
     a3a:	00d753b3          	srl	t2,a4,a3
     a3e:	00a795b3          	sll	a1,a5,a0
     a42:	00a71733          	sll	a4,a4,a0
     a46:	0075e5b3          	or	a1,a1,t2
     a4a:	00e03733          	snez	a4,a4
     a4e:	8f4d                	or	a4,a4,a1
     a50:	00d7d6b3          	srl	a3,a5,a3
     a54:	9732                	add	a4,a4,a2
     a56:	006687b3          	add	a5,a3,t1
     a5a:	00c73633          	sltu	a2,a4,a2
     a5e:	97b2                	add	a5,a5,a2
     a60:	8416                	mv	s0,t0
     a62:	b70d                	j	984 <__adddf3+0xce>
     a64:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f9f18>
     a68:	02000393          	li	t2,32
     a6c:	00b7d5b3          	srl	a1,a5,a1
     a70:	4501                	li	a0,0
     a72:	00768863          	beq	a3,t2,a82 <__adddf3+0x1cc>
     a76:	04000513          	li	a0,64
     a7a:	40d506b3          	sub	a3,a0,a3
     a7e:	00d79533          	sll	a0,a5,a3
     a82:	8f49                	or	a4,a4,a0
     a84:	00e03733          	snez	a4,a4
     a88:	8f4d                	or	a4,a4,a1
     a8a:	4681                	li	a3,0
     a8c:	b7e1                	j	a54 <__adddf3+0x19e>
     a8e:	8f5d                	or	a4,a4,a5
     a90:	00e03733          	snez	a4,a4
     a94:	bfdd                	j	a8a <__adddf3+0x1d4>
     a96:	00140593          	addi	a1,s0,1
     a9a:	7fe5f693          	andi	a3,a1,2046
     a9e:	e6a5                	bnez	a3,b06 <__adddf3+0x250>
     aa0:	00e7e6b3          	or	a3,a5,a4
     aa4:	e429                	bnez	s0,aee <__adddf3+0x238>
     aa6:	36068d63          	beqz	a3,e20 <__adddf3+0x56a>
     aaa:	00c366b3          	or	a3,t1,a2
     aae:	c285                	beqz	a3,ace <__adddf3+0x218>
     ab0:	963a                	add	a2,a2,a4
     ab2:	00e63733          	sltu	a4,a2,a4
     ab6:	979a                	add	a5,a5,t1
     ab8:	97ba                	add	a5,a5,a4
     aba:	00879693          	slli	a3,a5,0x8
     abe:	8732                	mv	a4,a2
     ac0:	0006d763          	bgez	a3,ace <__adddf3+0x218>
     ac4:	ff8006b7          	lui	a3,0xff800
     ac8:	16fd                	addi	a3,a3,-1
     aca:	8ff5                	and	a5,a5,a3
     acc:	4405                	li	s0,1
     ace:	00777693          	andi	a3,a4,7
     ad2:	34068e63          	beqz	a3,e2e <__adddf3+0x578>
     ad6:	00f77693          	andi	a3,a4,15
     ada:	4611                	li	a2,4
     adc:	34c68963          	beq	a3,a2,e2e <__adddf3+0x578>
     ae0:	00470693          	addi	a3,a4,4 # 10004 <__ctor_end__+0x9f3c>
     ae4:	00e6b733          	sltu	a4,a3,a4
     ae8:	97ba                	add	a5,a5,a4
     aea:	8736                	mv	a4,a3
     aec:	a689                	j	e2e <__adddf3+0x578>
     aee:	d28d                	beqz	a3,a10 <__adddf3+0x15a>
     af0:	00c36333          	or	t1,t1,a2
     af4:	e2030fe3          	beqz	t1,932 <__adddf3+0x7c>
     af8:	4481                	li	s1,0
     afa:	004007b7          	lui	a5,0x400
     afe:	4701                	li	a4,0
     b00:	7ff00413          	li	s0,2047
     b04:	a62d                	j	e2e <__adddf3+0x578>
     b06:	7ff00693          	li	a3,2047
     b0a:	30d58e63          	beq	a1,a3,e26 <__adddf3+0x570>
     b0e:	963a                	add	a2,a2,a4
     b10:	00e63733          	sltu	a4,a2,a4
     b14:	979a                	add	a5,a5,t1
     b16:	00e786b3          	add	a3,a5,a4
     b1a:	01f69793          	slli	a5,a3,0x1f
     b1e:	8205                	srli	a2,a2,0x1
     b20:	00c7e733          	or	a4,a5,a2
     b24:	0016d793          	srli	a5,a3,0x1
     b28:	842e                	mv	s0,a1
     b2a:	b755                	j	ace <__adddf3+0x218>
     b2c:	0ca05763          	blez	a0,bfa <__adddf3+0x344>
     b30:	08029163          	bnez	t0,bb2 <__adddf3+0x2fc>
     b34:	00c366b3          	or	a3,t1,a2
     b38:	34068863          	beqz	a3,e88 <__adddf3+0x5d2>
     b3c:	fff50593          	addi	a1,a0,-1
     b40:	e999                	bnez	a1,b56 <__adddf3+0x2a0>
     b42:	40c70633          	sub	a2,a4,a2
     b46:	00c73733          	sltu	a4,a4,a2
     b4a:	406787b3          	sub	a5,a5,t1
     b4e:	8f99                	sub	a5,a5,a4
     b50:	8732                	mv	a4,a2
     b52:	4405                	li	s0,1
     b54:	a0a9                	j	b9e <__adddf3+0x2e8>
     b56:	7ff00693          	li	a3,2047
     b5a:	dcd50ce3          	beq	a0,a3,932 <__adddf3+0x7c>
     b5e:	03800693          	li	a3,56
     b62:	08b6c763          	blt	a3,a1,bf0 <__adddf3+0x33a>
     b66:	46fd                	li	a3,31
     b68:	04b6cf63          	blt	a3,a1,bc6 <__adddf3+0x310>
     b6c:	02000513          	li	a0,32
     b70:	8d0d                	sub	a0,a0,a1
     b72:	00a316b3          	sll	a3,t1,a0
     b76:	00b652b3          	srl	t0,a2,a1
     b7a:	00a61633          	sll	a2,a2,a0
     b7e:	0056e6b3          	or	a3,a3,t0
     b82:	00c03633          	snez	a2,a2
     b86:	8e55                	or	a2,a2,a3
     b88:	00b35333          	srl	t1,t1,a1
     b8c:	40c70633          	sub	a2,a4,a2
     b90:	40678333          	sub	t1,a5,t1
     b94:	00c737b3          	sltu	a5,a4,a2
     b98:	40f307b3          	sub	a5,t1,a5
     b9c:	8732                	mv	a4,a2
     b9e:	00879693          	slli	a3,a5,0x8
     ba2:	f206d6e3          	bgez	a3,ace <__adddf3+0x218>
     ba6:	008005b7          	lui	a1,0x800
     baa:	15fd                	addi	a1,a1,-1
     bac:	8dfd                	and	a1,a1,a5
     bae:	82ba                	mv	t0,a4
     bb0:	a24d                	j	d52 <__adddf3+0x49c>
     bb2:	7ff00693          	li	a3,2047
     bb6:	f0d40ce3          	beq	s0,a3,ace <__adddf3+0x218>
     bba:	008006b7          	lui	a3,0x800
     bbe:	00d36333          	or	t1,t1,a3
     bc2:	85aa                	mv	a1,a0
     bc4:	bf69                	j	b5e <__adddf3+0x2a8>
     bc6:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9f18>
     bca:	02000293          	li	t0,32
     bce:	00d356b3          	srl	a3,t1,a3
     bd2:	4501                	li	a0,0
     bd4:	00558863          	beq	a1,t0,be4 <__adddf3+0x32e>
     bd8:	04000513          	li	a0,64
     bdc:	40b505b3          	sub	a1,a0,a1
     be0:	00b31533          	sll	a0,t1,a1
     be4:	8e49                	or	a2,a2,a0
     be6:	00c03633          	snez	a2,a2
     bea:	8e55                	or	a2,a2,a3
     bec:	4301                	li	t1,0
     bee:	bf79                	j	b8c <__adddf3+0x2d6>
     bf0:	00c36633          	or	a2,t1,a2
     bf4:	00c03633          	snez	a2,a2
     bf8:	bfd5                	j	bec <__adddf3+0x336>
     bfa:	c161                	beqz	a0,cba <__adddf3+0x404>
     bfc:	40828533          	sub	a0,t0,s0
     c00:	e815                	bnez	s0,c34 <__adddf3+0x37e>
     c02:	00e7e5b3          	or	a1,a5,a4
     c06:	28058363          	beqz	a1,e8c <__adddf3+0x5d6>
     c0a:	fff50593          	addi	a1,a0,-1
     c0e:	e991                	bnez	a1,c22 <__adddf3+0x36c>
     c10:	40e60733          	sub	a4,a2,a4
     c14:	40f307b3          	sub	a5,t1,a5
     c18:	00e63633          	sltu	a2,a2,a4
     c1c:	8f91                	sub	a5,a5,a2
     c1e:	84b6                	mv	s1,a3
     c20:	bf0d                	j	b52 <__adddf3+0x29c>
     c22:	7ff00393          	li	t2,2047
     c26:	00751f63          	bne	a0,t2,c44 <__adddf3+0x38e>
     c2a:	879a                	mv	a5,t1
     c2c:	8732                	mv	a4,a2
     c2e:	7ff00413          	li	s0,2047
     c32:	a05d                	j	cd8 <__adddf3+0x422>
     c34:	7ff00593          	li	a1,2047
     c38:	feb289e3          	beq	t0,a1,c2a <__adddf3+0x374>
     c3c:	008005b7          	lui	a1,0x800
     c40:	8fcd                	or	a5,a5,a1
     c42:	85aa                	mv	a1,a0
     c44:	03800513          	li	a0,56
     c48:	06b54563          	blt	a0,a1,cb2 <__adddf3+0x3fc>
     c4c:	457d                	li	a0,31
     c4e:	02b54c63          	blt	a0,a1,c86 <__adddf3+0x3d0>
     c52:	02000393          	li	t2,32
     c56:	40b383b3          	sub	t2,t2,a1
     c5a:	00b75433          	srl	s0,a4,a1
     c5e:	00779533          	sll	a0,a5,t2
     c62:	00771733          	sll	a4,a4,t2
     c66:	8d41                	or	a0,a0,s0
     c68:	00e03733          	snez	a4,a4
     c6c:	8f49                	or	a4,a4,a0
     c6e:	00b7d5b3          	srl	a1,a5,a1
     c72:	40e60733          	sub	a4,a2,a4
     c76:	40b307b3          	sub	a5,t1,a1
     c7a:	00e63633          	sltu	a2,a2,a4
     c7e:	8f91                	sub	a5,a5,a2
     c80:	8416                	mv	s0,t0
     c82:	84b6                	mv	s1,a3
     c84:	bf29                	j	b9e <__adddf3+0x2e8>
     c86:	fe058513          	addi	a0,a1,-32 # 7fffe0 <__ctor_end__+0x7f9f18>
     c8a:	02000413          	li	s0,32
     c8e:	00a7d533          	srl	a0,a5,a0
     c92:	4381                	li	t2,0
     c94:	00858863          	beq	a1,s0,ca4 <__adddf3+0x3ee>
     c98:	04000393          	li	t2,64
     c9c:	40b385b3          	sub	a1,t2,a1
     ca0:	00b793b3          	sll	t2,a5,a1
     ca4:	00e3e733          	or	a4,t2,a4
     ca8:	00e03733          	snez	a4,a4
     cac:	8f49                	or	a4,a4,a0
     cae:	4581                	li	a1,0
     cb0:	b7c9                	j	c72 <__adddf3+0x3bc>
     cb2:	8f5d                	or	a4,a4,a5
     cb4:	00e03733          	snez	a4,a4
     cb8:	bfdd                	j	cae <__adddf3+0x3f8>
     cba:	00140593          	addi	a1,s0,1
     cbe:	7fe5f593          	andi	a1,a1,2046
     cc2:	e5a5                	bnez	a1,d2a <__adddf3+0x474>
     cc4:	00e7e533          	or	a0,a5,a4
     cc8:	00c365b3          	or	a1,t1,a2
     ccc:	e429                	bnez	s0,d16 <__adddf3+0x460>
     cce:	e519                	bnez	a0,cdc <__adddf3+0x426>
     cd0:	1c058263          	beqz	a1,e94 <__adddf3+0x5de>
     cd4:	879a                	mv	a5,t1
     cd6:	8732                	mv	a4,a2
     cd8:	84b6                	mv	s1,a3
     cda:	bbd5                	j	ace <__adddf3+0x218>
     cdc:	de0589e3          	beqz	a1,ace <__adddf3+0x218>
     ce0:	40c70533          	sub	a0,a4,a2
     ce4:	00a732b3          	sltu	t0,a4,a0
     ce8:	406785b3          	sub	a1,a5,t1
     cec:	405585b3          	sub	a1,a1,t0
     cf0:	00859293          	slli	t0,a1,0x8
     cf4:	0002da63          	bgez	t0,d08 <__adddf3+0x452>
     cf8:	40e60733          	sub	a4,a2,a4
     cfc:	40f307b3          	sub	a5,t1,a5
     d00:	00e63633          	sltu	a2,a2,a4
     d04:	8f91                	sub	a5,a5,a2
     d06:	bfc9                	j	cd8 <__adddf3+0x422>
     d08:	00b56733          	or	a4,a0,a1
     d0c:	18070863          	beqz	a4,e9c <__adddf3+0x5e6>
     d10:	87ae                	mv	a5,a1
     d12:	872a                	mv	a4,a0
     d14:	bb6d                	j	ace <__adddf3+0x218>
     d16:	e519                	bnez	a0,d24 <__adddf3+0x46e>
     d18:	18058463          	beqz	a1,ea0 <__adddf3+0x5ea>
     d1c:	879a                	mv	a5,t1
     d1e:	8732                	mv	a4,a2
     d20:	84b6                	mv	s1,a3
     d22:	b901                	j	932 <__adddf3+0x7c>
     d24:	c00587e3          	beqz	a1,932 <__adddf3+0x7c>
     d28:	bbc1                	j	af8 <__adddf3+0x242>
     d2a:	40c702b3          	sub	t0,a4,a2
     d2e:	00573533          	sltu	a0,a4,t0
     d32:	406785b3          	sub	a1,a5,t1
     d36:	8d89                	sub	a1,a1,a0
     d38:	00859513          	slli	a0,a1,0x8
     d3c:	06055d63          	bgez	a0,db6 <__adddf3+0x500>
     d40:	40e602b3          	sub	t0,a2,a4
     d44:	40f307b3          	sub	a5,t1,a5
     d48:	00563633          	sltu	a2,a2,t0
     d4c:	40c785b3          	sub	a1,a5,a2
     d50:	84b6                	mv	s1,a3
     d52:	c9a5                	beqz	a1,dc2 <__adddf3+0x50c>
     d54:	852e                	mv	a0,a1
     d56:	c216                	sw	t0,4(sp)
     d58:	c02e                	sw	a1,0(sp)
     d5a:	446010ef          	jal	ra,21a0 <__clzsi2>
     d5e:	4582                	lw	a1,0(sp)
     d60:	4292                	lw	t0,4(sp)
     d62:	ff850693          	addi	a3,a0,-8
     d66:	47fd                	li	a5,31
     d68:	06d7c763          	blt	a5,a3,dd6 <__adddf3+0x520>
     d6c:	02000793          	li	a5,32
     d70:	8f95                	sub	a5,a5,a3
     d72:	00d595b3          	sll	a1,a1,a3
     d76:	00f2d7b3          	srl	a5,t0,a5
     d7a:	8ddd                	or	a1,a1,a5
     d7c:	00d29733          	sll	a4,t0,a3
     d80:	0886c763          	blt	a3,s0,e0e <__adddf3+0x558>
     d84:	40868433          	sub	s0,a3,s0
     d88:	00140613          	addi	a2,s0,1
     d8c:	47fd                	li	a5,31
     d8e:	04c7ca63          	blt	a5,a2,de2 <__adddf3+0x52c>
     d92:	02000513          	li	a0,32
     d96:	8d11                	sub	a0,a0,a2
     d98:	00c757b3          	srl	a5,a4,a2
     d9c:	00a596b3          	sll	a3,a1,a0
     da0:	8edd                	or	a3,a3,a5
     da2:	00a717b3          	sll	a5,a4,a0
     da6:	00f037b3          	snez	a5,a5
     daa:	00f6e733          	or	a4,a3,a5
     dae:	00c5d7b3          	srl	a5,a1,a2
     db2:	4401                	li	s0,0
     db4:	bb29                	j	ace <__adddf3+0x218>
     db6:	00b2e733          	or	a4,t0,a1
     dba:	ff41                	bnez	a4,d52 <__adddf3+0x49c>
     dbc:	4781                	li	a5,0
     dbe:	4401                	li	s0,0
     dc0:	a8e1                	j	e98 <__adddf3+0x5e2>
     dc2:	8516                	mv	a0,t0
     dc4:	c22e                	sw	a1,4(sp)
     dc6:	c016                	sw	t0,0(sp)
     dc8:	3d8010ef          	jal	ra,21a0 <__clzsi2>
     dcc:	02050513          	addi	a0,a0,32
     dd0:	4592                	lw	a1,4(sp)
     dd2:	4282                	lw	t0,0(sp)
     dd4:	b779                	j	d62 <__adddf3+0x4ac>
     dd6:	fd850593          	addi	a1,a0,-40
     dda:	00b295b3          	sll	a1,t0,a1
     dde:	4701                	li	a4,0
     de0:	b745                	j	d80 <__adddf3+0x4ca>
     de2:	1405                	addi	s0,s0,-31
     de4:	02000793          	li	a5,32
     de8:	0085d433          	srl	s0,a1,s0
     dec:	4281                	li	t0,0
     dee:	00f60863          	beq	a2,a5,dfe <__adddf3+0x548>
     df2:	04000293          	li	t0,64
     df6:	40c282b3          	sub	t0,t0,a2
     dfa:	005592b3          	sll	t0,a1,t0
     dfe:	005767b3          	or	a5,a4,t0
     e02:	00f037b3          	snez	a5,a5
     e06:	00f46733          	or	a4,s0,a5
     e0a:	4781                	li	a5,0
     e0c:	b75d                	j	db2 <__adddf3+0x4fc>
     e0e:	ff8007b7          	lui	a5,0xff800
     e12:	17fd                	addi	a5,a5,-1
     e14:	8c15                	sub	s0,s0,a3
     e16:	8fed                	and	a5,a5,a1
     e18:	b95d                	j	ace <__adddf3+0x218>
     e1a:	879a                	mv	a5,t1
     e1c:	8732                	mv	a4,a2
     e1e:	b329                	j	b28 <__adddf3+0x272>
     e20:	879a                	mv	a5,t1
     e22:	8732                	mv	a4,a2
     e24:	b16d                	j	ace <__adddf3+0x218>
     e26:	7ff00413          	li	s0,2047
     e2a:	4781                	li	a5,0
     e2c:	4701                	li	a4,0
     e2e:	00879693          	slli	a3,a5,0x8
     e32:	0006db63          	bgez	a3,e48 <__adddf3+0x592>
     e36:	0405                	addi	s0,s0,1
     e38:	7ff00693          	li	a3,2047
     e3c:	06d40763          	beq	s0,a3,eaa <__adddf3+0x5f4>
     e40:	ff8006b7          	lui	a3,0xff800
     e44:	16fd                	addi	a3,a3,-1
     e46:	8ff5                	and	a5,a5,a3
     e48:	01d79513          	slli	a0,a5,0x1d
     e4c:	830d                	srli	a4,a4,0x3
     e4e:	7ff00693          	li	a3,2047
     e52:	8f49                	or	a4,a4,a0
     e54:	838d                	srli	a5,a5,0x3
     e56:	00d41963          	bne	s0,a3,e68 <__adddf3+0x5b2>
     e5a:	8f5d                	or	a4,a4,a5
     e5c:	4781                	li	a5,0
     e5e:	c709                	beqz	a4,e68 <__adddf3+0x5b2>
     e60:	000807b7          	lui	a5,0x80
     e64:	4701                	li	a4,0
     e66:	4481                	li	s1,0
     e68:	07b2                	slli	a5,a5,0xc
     e6a:	7ff47413          	andi	s0,s0,2047
     e6e:	0452                	slli	s0,s0,0x14
     e70:	83b1                	srli	a5,a5,0xc
     e72:	8fc1                	or	a5,a5,s0
     e74:	40c2                	lw	ra,16(sp)
     e76:	4432                	lw	s0,12(sp)
     e78:	04fe                	slli	s1,s1,0x1f
     e7a:	0097e6b3          	or	a3,a5,s1
     e7e:	853a                	mv	a0,a4
     e80:	44a2                	lw	s1,8(sp)
     e82:	85b6                	mv	a1,a3
     e84:	0151                	addi	sp,sp,20
     e86:	8082                	ret
     e88:	842a                	mv	s0,a0
     e8a:	b191                	j	ace <__adddf3+0x218>
     e8c:	879a                	mv	a5,t1
     e8e:	8732                	mv	a4,a2
     e90:	842a                	mv	s0,a0
     e92:	b599                	j	cd8 <__adddf3+0x422>
     e94:	4781                	li	a5,0
     e96:	4701                	li	a4,0
     e98:	4481                	li	s1,0
     e9a:	bf51                	j	e2e <__adddf3+0x578>
     e9c:	4781                	li	a5,0
     e9e:	bfed                	j	e98 <__adddf3+0x5e2>
     ea0:	4701                	li	a4,0
     ea2:	4481                	li	s1,0
     ea4:	004007b7          	lui	a5,0x400
     ea8:	b9a1                	j	b00 <__adddf3+0x24a>
     eaa:	4781                	li	a5,0
     eac:	4701                	li	a4,0
     eae:	bf69                	j	e48 <__adddf3+0x592>

00000eb0 <__divdf3>:
     eb0:	fdc10113          	addi	sp,sp,-36
     eb4:	872a                	mv	a4,a0
     eb6:	832a                	mv	t1,a0
     eb8:	01f5d793          	srli	a5,a1,0x1f
     ebc:	0145d513          	srli	a0,a1,0x14
     ec0:	cc26                	sw	s1,24(sp)
     ec2:	d006                	sw	ra,32(sp)
     ec4:	00c59493          	slli	s1,a1,0xc
     ec8:	ce22                	sw	s0,28(sp)
     eca:	7ff57513          	andi	a0,a0,2047
     ece:	c43e                	sw	a5,8(sp)
     ed0:	80b1                	srli	s1,s1,0xc
     ed2:	c941                	beqz	a0,f62 <__divdf3+0xb2>
     ed4:	7ff00593          	li	a1,2047
     ed8:	0eb50763          	beq	a0,a1,fc6 <__divdf3+0x116>
     edc:	00349793          	slli	a5,s1,0x3
     ee0:	01d75413          	srli	s0,a4,0x1d
     ee4:	8c5d                	or	s0,s0,a5
     ee6:	008007b7          	lui	a5,0x800
     eea:	8c5d                	or	s0,s0,a5
     eec:	00371313          	slli	t1,a4,0x3
     ef0:	c0150493          	addi	s1,a0,-1023
     ef4:	4381                	li	t2,0
     ef6:	0146d513          	srli	a0,a3,0x14
     efa:	01f6d713          	srli	a4,a3,0x1f
     efe:	00c69293          	slli	t0,a3,0xc
     f02:	7ff57513          	andi	a0,a0,2047
     f06:	c63a                	sw	a4,12(sp)
     f08:	87b2                	mv	a5,a2
     f0a:	00c2d293          	srli	t0,t0,0xc
     f0e:	cd69                	beqz	a0,fe8 <__divdf3+0x138>
     f10:	7ff00713          	li	a4,2047
     f14:	14e50463          	beq	a0,a4,105c <__divdf3+0x1ac>
     f18:	01d65713          	srli	a4,a2,0x1d
     f1c:	028e                	slli	t0,t0,0x3
     f1e:	005762b3          	or	t0,a4,t0
     f22:	00800737          	lui	a4,0x800
     f26:	00e2e733          	or	a4,t0,a4
     f2a:	00361793          	slli	a5,a2,0x3
     f2e:	c0150513          	addi	a0,a0,-1023
     f32:	4681                	li	a3,0
     f34:	45b2                	lw	a1,12(sp)
     f36:	4622                	lw	a2,8(sp)
     f38:	8e2d                	xor	a2,a2,a1
     f3a:	c032                	sw	a2,0(sp)
     f3c:	40a48633          	sub	a2,s1,a0
     f40:	c232                	sw	a2,4(sp)
     f42:	00239613          	slli	a2,t2,0x2
     f46:	8e55                	or	a2,a2,a3
     f48:	167d                	addi	a2,a2,-1
     f4a:	45b9                	li	a1,14
     f4c:	12c5e963          	bltu	a1,a2,107e <__divdf3+0x1ce>
     f50:	00004597          	auipc	a1,0x4
     f54:	30058593          	addi	a1,a1,768 # 5250 <__srodata>
     f58:	060a                	slli	a2,a2,0x2
     f5a:	962e                	add	a2,a2,a1
     f5c:	4210                	lw	a2,0(a2)
     f5e:	95b2                	add	a1,a1,a2
     f60:	8582                	jr	a1
     f62:	00e4e433          	or	s0,s1,a4
     f66:	c825                	beqz	s0,fd6 <__divdf3+0x126>
     f68:	c636                	sw	a3,12(sp)
     f6a:	c232                	sw	a2,4(sp)
     f6c:	cc8d                	beqz	s1,fa6 <__divdf3+0xf6>
     f6e:	8526                	mv	a0,s1
     f70:	c03a                	sw	a4,0(sp)
     f72:	22e010ef          	jal	ra,21a0 <__clzsi2>
     f76:	4702                	lw	a4,0(sp)
     f78:	4612                	lw	a2,4(sp)
     f7a:	46b2                	lw	a3,12(sp)
     f7c:	ff550593          	addi	a1,a0,-11
     f80:	4371                	li	t1,28
     f82:	02b34c63          	blt	t1,a1,fba <__divdf3+0x10a>
     f86:	4475                	li	s0,29
     f88:	ff850313          	addi	t1,a0,-8
     f8c:	8c0d                	sub	s0,s0,a1
     f8e:	006497b3          	sll	a5,s1,t1
     f92:	00875433          	srl	s0,a4,s0
     f96:	8c5d                	or	s0,s0,a5
     f98:	00671333          	sll	t1,a4,t1
     f9c:	c0d00593          	li	a1,-1011
     fa0:	40a584b3          	sub	s1,a1,a0
     fa4:	bf81                	j	ef4 <__divdf3+0x44>
     fa6:	853a                	mv	a0,a4
     fa8:	c03a                	sw	a4,0(sp)
     faa:	1f6010ef          	jal	ra,21a0 <__clzsi2>
     fae:	02050513          	addi	a0,a0,32
     fb2:	46b2                	lw	a3,12(sp)
     fb4:	4612                	lw	a2,4(sp)
     fb6:	4702                	lw	a4,0(sp)
     fb8:	b7d1                	j	f7c <__divdf3+0xcc>
     fba:	fd850413          	addi	s0,a0,-40
     fbe:	00871433          	sll	s0,a4,s0
     fc2:	4301                	li	t1,0
     fc4:	bfe1                	j	f9c <__divdf3+0xec>
     fc6:	00e4e433          	or	s0,s1,a4
     fca:	c811                	beqz	s0,fde <__divdf3+0x12e>
     fcc:	8426                	mv	s0,s1
     fce:	438d                	li	t2,3
     fd0:	7ff00493          	li	s1,2047
     fd4:	b70d                	j	ef6 <__divdf3+0x46>
     fd6:	4301                	li	t1,0
     fd8:	4481                	li	s1,0
     fda:	4385                	li	t2,1
     fdc:	bf29                	j	ef6 <__divdf3+0x46>
     fde:	4301                	li	t1,0
     fe0:	7ff00493          	li	s1,2047
     fe4:	4389                	li	t2,2
     fe6:	bf01                	j	ef6 <__divdf3+0x46>
     fe8:	00c2e733          	or	a4,t0,a2
     fec:	c341                	beqz	a4,106c <__divdf3+0x1bc>
     fee:	04028363          	beqz	t0,1034 <__divdf3+0x184>
     ff2:	8516                	mv	a0,t0
     ff4:	ca32                	sw	a2,20(sp)
     ff6:	c81e                	sw	t2,16(sp)
     ff8:	c21a                	sw	t1,4(sp)
     ffa:	c016                	sw	t0,0(sp)
     ffc:	1a4010ef          	jal	ra,21a0 <__clzsi2>
    1000:	4282                	lw	t0,0(sp)
    1002:	4312                	lw	t1,4(sp)
    1004:	43c2                	lw	t2,16(sp)
    1006:	4652                	lw	a2,20(sp)
    1008:	ff550693          	addi	a3,a0,-11
    100c:	47f1                	li	a5,28
    100e:	04d7c163          	blt	a5,a3,1050 <__divdf3+0x1a0>
    1012:	4775                	li	a4,29
    1014:	ff850793          	addi	a5,a0,-8
    1018:	8f15                	sub	a4,a4,a3
    101a:	00f292b3          	sll	t0,t0,a5
    101e:	00e65733          	srl	a4,a2,a4
    1022:	00576733          	or	a4,a4,t0
    1026:	00f617b3          	sll	a5,a2,a5
    102a:	c0d00693          	li	a3,-1011
    102e:	40a68533          	sub	a0,a3,a0
    1032:	b701                	j	f32 <__divdf3+0x82>
    1034:	8532                	mv	a0,a2
    1036:	ca16                	sw	t0,20(sp)
    1038:	c81e                	sw	t2,16(sp)
    103a:	c21a                	sw	t1,4(sp)
    103c:	c032                	sw	a2,0(sp)
    103e:	162010ef          	jal	ra,21a0 <__clzsi2>
    1042:	02050513          	addi	a0,a0,32
    1046:	42d2                	lw	t0,20(sp)
    1048:	43c2                	lw	t2,16(sp)
    104a:	4312                	lw	t1,4(sp)
    104c:	4602                	lw	a2,0(sp)
    104e:	bf6d                	j	1008 <__divdf3+0x158>
    1050:	fd850293          	addi	t0,a0,-40
    1054:	00561733          	sll	a4,a2,t0
    1058:	4781                	li	a5,0
    105a:	bfc1                	j	102a <__divdf3+0x17a>
    105c:	00c2e733          	or	a4,t0,a2
    1060:	cb11                	beqz	a4,1074 <__divdf3+0x1c4>
    1062:	8716                	mv	a4,t0
    1064:	7ff00513          	li	a0,2047
    1068:	468d                	li	a3,3
    106a:	b5e9                	j	f34 <__divdf3+0x84>
    106c:	4781                	li	a5,0
    106e:	4501                	li	a0,0
    1070:	4685                	li	a3,1
    1072:	b5c9                	j	f34 <__divdf3+0x84>
    1074:	4781                	li	a5,0
    1076:	7ff00513          	li	a0,2047
    107a:	4689                	li	a3,2
    107c:	bd65                	j	f34 <__divdf3+0x84>
    107e:	00876663          	bltu	a4,s0,108a <__divdf3+0x1da>
    1082:	2ce41563          	bne	s0,a4,134c <__divdf3+0x49c>
    1086:	2cf36363          	bltu	t1,a5,134c <__divdf3+0x49c>
    108a:	01f41593          	slli	a1,s0,0x1f
    108e:	00135693          	srli	a3,t1,0x1
    1092:	01f31613          	slli	a2,t1,0x1f
    1096:	8005                	srli	s0,s0,0x1
    1098:	00d5e333          	or	t1,a1,a3
    109c:	00871293          	slli	t0,a4,0x8
    10a0:	0187d713          	srli	a4,a5,0x18
    10a4:	005762b3          	or	t0,a4,t0
    10a8:	0102d493          	srli	s1,t0,0x10
    10ac:	02945733          	divu	a4,s0,s1
    10b0:	00879693          	slli	a3,a5,0x8
    10b4:	01029793          	slli	a5,t0,0x10
    10b8:	83c1                	srli	a5,a5,0x10
    10ba:	c43e                	sw	a5,8(sp)
    10bc:	01035593          	srli	a1,t1,0x10
    10c0:	02947433          	remu	s0,s0,s1
    10c4:	02e787b3          	mul	a5,a5,a4
    10c8:	0442                	slli	s0,s0,0x10
    10ca:	8c4d                	or	s0,s0,a1
    10cc:	85ba                	mv	a1,a4
    10ce:	00f47c63          	bgeu	s0,a5,10e6 <__divdf3+0x236>
    10d2:	9416                	add	s0,s0,t0
    10d4:	fff70593          	addi	a1,a4,-1 # 7fffff <__ctor_end__+0x7f9f37>
    10d8:	00546763          	bltu	s0,t0,10e6 <__divdf3+0x236>
    10dc:	00f47563          	bgeu	s0,a5,10e6 <__divdf3+0x236>
    10e0:	ffe70593          	addi	a1,a4,-2
    10e4:	9416                	add	s0,s0,t0
    10e6:	40f407b3          	sub	a5,s0,a5
    10ea:	0297d533          	divu	a0,a5,s1
    10ee:	01029713          	slli	a4,t0,0x10
    10f2:	8341                	srli	a4,a4,0x10
    10f4:	0342                	slli	t1,t1,0x10
    10f6:	01035313          	srli	t1,t1,0x10
    10fa:	0297f7b3          	remu	a5,a5,s1
    10fe:	83aa                	mv	t2,a0
    1100:	02a70733          	mul	a4,a4,a0
    1104:	07c2                	slli	a5,a5,0x10
    1106:	00f36333          	or	t1,t1,a5
    110a:	00e37c63          	bgeu	t1,a4,1122 <__divdf3+0x272>
    110e:	9316                	add	t1,t1,t0
    1110:	fff50393          	addi	t2,a0,-1
    1114:	00536763          	bltu	t1,t0,1122 <__divdf3+0x272>
    1118:	00e37563          	bgeu	t1,a4,1122 <__divdf3+0x272>
    111c:	ffe50393          	addi	t2,a0,-2
    1120:	9316                	add	t1,t1,t0
    1122:	05c2                	slli	a1,a1,0x10
    1124:	6441                	lui	s0,0x10
    1126:	0075e5b3          	or	a1,a1,t2
    112a:	fff40793          	addi	a5,s0,-1 # ffff <__ctor_end__+0x9f37>
    112e:	00f5f533          	and	a0,a1,a5
    1132:	40e30333          	sub	t1,t1,a4
    1136:	8ff5                	and	a5,a5,a3
    1138:	0105d713          	srli	a4,a1,0x10
    113c:	02f503b3          	mul	t2,a0,a5
    1140:	c43e                	sw	a5,8(sp)
    1142:	02f707b3          	mul	a5,a4,a5
    1146:	c63e                	sw	a5,12(sp)
    1148:	0106d793          	srli	a5,a3,0x10
    114c:	02a78533          	mul	a0,a5,a0
    1150:	02f70733          	mul	a4,a4,a5
    1154:	47b2                	lw	a5,12(sp)
    1156:	953e                	add	a0,a0,a5
    1158:	0103d793          	srli	a5,t2,0x10
    115c:	97aa                	add	a5,a5,a0
    115e:	4532                	lw	a0,12(sp)
    1160:	00a7f363          	bgeu	a5,a0,1166 <__divdf3+0x2b6>
    1164:	9722                	add	a4,a4,s0
    1166:	0107d413          	srli	s0,a5,0x10
    116a:	943a                	add	s0,s0,a4
    116c:	6741                	lui	a4,0x10
    116e:	177d                	addi	a4,a4,-1
    1170:	8ff9                	and	a5,a5,a4
    1172:	07c2                	slli	a5,a5,0x10
    1174:	00e3f3b3          	and	t2,t2,a4
    1178:	93be                	add	t2,t2,a5
    117a:	00836763          	bltu	t1,s0,1188 <__divdf3+0x2d8>
    117e:	872e                	mv	a4,a1
    1180:	02831e63          	bne	t1,s0,11bc <__divdf3+0x30c>
    1184:	02767c63          	bgeu	a2,t2,11bc <__divdf3+0x30c>
    1188:	9636                	add	a2,a2,a3
    118a:	00d637b3          	sltu	a5,a2,a3
    118e:	9796                	add	a5,a5,t0
    1190:	933e                	add	t1,t1,a5
    1192:	fff58713          	addi	a4,a1,-1
    1196:	0062e663          	bltu	t0,t1,11a2 <__divdf3+0x2f2>
    119a:	02629163          	bne	t0,t1,11bc <__divdf3+0x30c>
    119e:	00d66f63          	bltu	a2,a3,11bc <__divdf3+0x30c>
    11a2:	00836663          	bltu	t1,s0,11ae <__divdf3+0x2fe>
    11a6:	00641b63          	bne	s0,t1,11bc <__divdf3+0x30c>
    11aa:	00767963          	bgeu	a2,t2,11bc <__divdf3+0x30c>
    11ae:	9636                	add	a2,a2,a3
    11b0:	00d637b3          	sltu	a5,a2,a3
    11b4:	9796                	add	a5,a5,t0
    11b6:	ffe58713          	addi	a4,a1,-2
    11ba:	933e                	add	t1,t1,a5
    11bc:	407603b3          	sub	t2,a2,t2
    11c0:	40830333          	sub	t1,t1,s0
    11c4:	00763633          	sltu	a2,a2,t2
    11c8:	40c30633          	sub	a2,t1,a2
    11cc:	57fd                	li	a5,-1
    11ce:	10c28263          	beq	t0,a2,12d2 <__divdf3+0x422>
    11d2:	02965533          	divu	a0,a2,s1
    11d6:	01029793          	slli	a5,t0,0x10
    11da:	83c1                	srli	a5,a5,0x10
    11dc:	0103d593          	srli	a1,t2,0x10
    11e0:	02967633          	remu	a2,a2,s1
    11e4:	02a787b3          	mul	a5,a5,a0
    11e8:	0642                	slli	a2,a2,0x10
    11ea:	8e4d                	or	a2,a2,a1
    11ec:	85aa                	mv	a1,a0
    11ee:	00f67c63          	bgeu	a2,a5,1206 <__divdf3+0x356>
    11f2:	9616                	add	a2,a2,t0
    11f4:	fff50593          	addi	a1,a0,-1
    11f8:	00566763          	bltu	a2,t0,1206 <__divdf3+0x356>
    11fc:	00f67563          	bgeu	a2,a5,1206 <__divdf3+0x356>
    1200:	ffe50593          	addi	a1,a0,-2
    1204:	9616                	add	a2,a2,t0
    1206:	8e1d                	sub	a2,a2,a5
    1208:	02965333          	divu	t1,a2,s1
    120c:	01029793          	slli	a5,t0,0x10
    1210:	83c1                	srli	a5,a5,0x10
    1212:	03c2                	slli	t2,t2,0x10
    1214:	0103d393          	srli	t2,t2,0x10
    1218:	02967633          	remu	a2,a2,s1
    121c:	841a                	mv	s0,t1
    121e:	02678533          	mul	a0,a5,t1
    1222:	01061793          	slli	a5,a2,0x10
    1226:	00f3e633          	or	a2,t2,a5
    122a:	00a67c63          	bgeu	a2,a0,1242 <__divdf3+0x392>
    122e:	9616                	add	a2,a2,t0
    1230:	fff30413          	addi	s0,t1,-1
    1234:	00566763          	bltu	a2,t0,1242 <__divdf3+0x392>
    1238:	00a67563          	bgeu	a2,a0,1242 <__divdf3+0x392>
    123c:	ffe30413          	addi	s0,t1,-2
    1240:	9616                	add	a2,a2,t0
    1242:	01059793          	slli	a5,a1,0x10
    1246:	8fc1                	or	a5,a5,s0
    1248:	4422                	lw	s0,8(sp)
    124a:	8e09                	sub	a2,a2,a0
    124c:	4522                	lw	a0,8(sp)
    124e:	0107d393          	srli	t2,a5,0x10
    1252:	01079593          	slli	a1,a5,0x10
    1256:	02838333          	mul	t1,t2,s0
    125a:	81c1                	srli	a1,a1,0x10
    125c:	0106d413          	srli	s0,a3,0x10
    1260:	02a58533          	mul	a0,a1,a0
    1264:	02b405b3          	mul	a1,s0,a1
    1268:	027403b3          	mul	t2,s0,t2
    126c:	959a                	add	a1,a1,t1
    126e:	01055413          	srli	s0,a0,0x10
    1272:	95a2                	add	a1,a1,s0
    1274:	0065f463          	bgeu	a1,t1,127c <__divdf3+0x3cc>
    1278:	6341                	lui	t1,0x10
    127a:	939a                	add	t2,t2,t1
    127c:	0105d313          	srli	t1,a1,0x10
    1280:	939a                	add	t2,t2,t1
    1282:	6341                	lui	t1,0x10
    1284:	137d                	addi	t1,t1,-1
    1286:	0065f5b3          	and	a1,a1,t1
    128a:	05c2                	slli	a1,a1,0x10
    128c:	00657533          	and	a0,a0,t1
    1290:	952e                	add	a0,a0,a1
    1292:	00766563          	bltu	a2,t2,129c <__divdf3+0x3ec>
    1296:	1a761263          	bne	a2,t2,143a <__divdf3+0x58a>
    129a:	cd05                	beqz	a0,12d2 <__divdf3+0x422>
    129c:	9616                	add	a2,a2,t0
    129e:	fff78593          	addi	a1,a5,-1 # 7fffff <__ctor_end__+0x7f9f37>
    12a2:	02566163          	bltu	a2,t0,12c4 <__divdf3+0x414>
    12a6:	00766663          	bltu	a2,t2,12b2 <__divdf3+0x402>
    12aa:	18761763          	bne	a2,t2,1438 <__divdf3+0x588>
    12ae:	00a6fd63          	bgeu	a3,a0,12c8 <__divdf3+0x418>
    12b2:	ffe78593          	addi	a1,a5,-2
    12b6:	00169793          	slli	a5,a3,0x1
    12ba:	00d7b6b3          	sltu	a3,a5,a3
    12be:	92b6                	add	t0,t0,a3
    12c0:	9616                	add	a2,a2,t0
    12c2:	86be                	mv	a3,a5
    12c4:	00761563          	bne	a2,t2,12ce <__divdf3+0x41e>
    12c8:	87ae                	mv	a5,a1
    12ca:	00d50463          	beq	a0,a3,12d2 <__divdf3+0x422>
    12ce:	0015e793          	ori	a5,a1,1
    12d2:	4692                	lw	a3,4(sp)
    12d4:	3ff68613          	addi	a2,a3,1023 # ff8003ff <__heap_end+0xdf7d03ff>
    12d8:	0ac05963          	blez	a2,138a <__divdf3+0x4da>
    12dc:	0077f693          	andi	a3,a5,7
    12e0:	ce81                	beqz	a3,12f8 <__divdf3+0x448>
    12e2:	00f7f693          	andi	a3,a5,15
    12e6:	4591                	li	a1,4
    12e8:	00b68863          	beq	a3,a1,12f8 <__divdf3+0x448>
    12ec:	00478693          	addi	a3,a5,4
    12f0:	00f6b7b3          	sltu	a5,a3,a5
    12f4:	973e                	add	a4,a4,a5
    12f6:	87b6                	mv	a5,a3
    12f8:	00771693          	slli	a3,a4,0x7
    12fc:	0006d963          	bgez	a3,130e <__divdf3+0x45e>
    1300:	ff0006b7          	lui	a3,0xff000
    1304:	16fd                	addi	a3,a3,-1
    1306:	8f75                	and	a4,a4,a3
    1308:	4692                	lw	a3,4(sp)
    130a:	40068613          	addi	a2,a3,1024 # ff000400 <__heap_end+0xdefd0400>
    130e:	7fe00693          	li	a3,2046
    1312:	10c6ca63          	blt	a3,a2,1426 <__divdf3+0x576>
    1316:	838d                	srli	a5,a5,0x3
    1318:	01d71693          	slli	a3,a4,0x1d
    131c:	8fd5                	or	a5,a5,a3
    131e:	00375293          	srli	t0,a4,0x3
    1322:	4702                	lw	a4,0(sp)
    1324:	7ff67693          	andi	a3,a2,2047
    1328:	02b2                	slli	t0,t0,0xc
    132a:	5082                	lw	ra,32(sp)
    132c:	4472                	lw	s0,28(sp)
    132e:	06d2                	slli	a3,a3,0x14
    1330:	00c2d293          	srli	t0,t0,0xc
    1334:	01f71613          	slli	a2,a4,0x1f
    1338:	00d2e2b3          	or	t0,t0,a3
    133c:	00c2e733          	or	a4,t0,a2
    1340:	44e2                	lw	s1,24(sp)
    1342:	853e                	mv	a0,a5
    1344:	85ba                	mv	a1,a4
    1346:	02410113          	addi	sp,sp,36
    134a:	8082                	ret
    134c:	4692                	lw	a3,4(sp)
    134e:	4601                	li	a2,0
    1350:	16fd                	addi	a3,a3,-1
    1352:	c236                	sw	a3,4(sp)
    1354:	b3a1                	j	109c <__divdf3+0x1ec>
    1356:	47a2                	lw	a5,8(sp)
    1358:	8722                	mv	a4,s0
    135a:	869e                	mv	a3,t2
    135c:	c03e                	sw	a5,0(sp)
    135e:	879a                	mv	a5,t1
    1360:	4609                	li	a2,2
    1362:	0cc68263          	beq	a3,a2,1426 <__divdf3+0x576>
    1366:	460d                	li	a2,3
    1368:	0ac68863          	beq	a3,a2,1418 <__divdf3+0x568>
    136c:	4605                	li	a2,1
    136e:	f6c692e3          	bne	a3,a2,12d2 <__divdf3+0x422>
    1372:	4281                	li	t0,0
    1374:	4781                	li	a5,0
    1376:	a89d                	j	13ec <__divdf3+0x53c>
    1378:	4632                	lw	a2,12(sp)
    137a:	c032                	sw	a2,0(sp)
    137c:	b7d5                	j	1360 <__divdf3+0x4b0>
    137e:	00080737          	lui	a4,0x80
    1382:	4781                	li	a5,0
    1384:	c002                	sw	zero,0(sp)
    1386:	468d                	li	a3,3
    1388:	bfe1                	j	1360 <__divdf3+0x4b0>
    138a:	4285                	li	t0,1
    138c:	40c282b3          	sub	t0,t0,a2
    1390:	03800693          	li	a3,56
    1394:	fc56cfe3          	blt	a3,t0,1372 <__divdf3+0x4c2>
    1398:	46fd                	li	a3,31
    139a:	0456cb63          	blt	a3,t0,13f0 <__divdf3+0x540>
    139e:	4692                	lw	a3,4(sp)
    13a0:	0057d633          	srl	a2,a5,t0
    13a4:	005752b3          	srl	t0,a4,t0
    13a8:	41e68593          	addi	a1,a3,1054
    13ac:	00b716b3          	sll	a3,a4,a1
    13b0:	00b797b3          	sll	a5,a5,a1
    13b4:	8ed1                	or	a3,a3,a2
    13b6:	00f037b3          	snez	a5,a5
    13ba:	8fd5                	or	a5,a5,a3
    13bc:	0077f713          	andi	a4,a5,7
    13c0:	cf01                	beqz	a4,13d8 <__divdf3+0x528>
    13c2:	00f7f713          	andi	a4,a5,15
    13c6:	4691                	li	a3,4
    13c8:	00d70863          	beq	a4,a3,13d8 <__divdf3+0x528>
    13cc:	00478713          	addi	a4,a5,4
    13d0:	00f737b3          	sltu	a5,a4,a5
    13d4:	92be                	add	t0,t0,a5
    13d6:	87ba                	mv	a5,a4
    13d8:	00829713          	slli	a4,t0,0x8
    13dc:	04074a63          	bltz	a4,1430 <__divdf3+0x580>
    13e0:	01d29713          	slli	a4,t0,0x1d
    13e4:	838d                	srli	a5,a5,0x3
    13e6:	8fd9                	or	a5,a5,a4
    13e8:	0032d293          	srli	t0,t0,0x3
    13ec:	4601                	li	a2,0
    13ee:	bf15                	j	1322 <__divdf3+0x472>
    13f0:	5685                	li	a3,-31
    13f2:	8e91                	sub	a3,a3,a2
    13f4:	02000613          	li	a2,32
    13f8:	00d756b3          	srl	a3,a4,a3
    13fc:	4581                	li	a1,0
    13fe:	00c28763          	beq	t0,a2,140c <__divdf3+0x55c>
    1402:	4612                	lw	a2,4(sp)
    1404:	43e60593          	addi	a1,a2,1086 # ff80043e <__heap_end+0xdf7d043e>
    1408:	00b715b3          	sll	a1,a4,a1
    140c:	8fcd                	or	a5,a5,a1
    140e:	00f037b3          	snez	a5,a5
    1412:	8fd5                	or	a5,a5,a3
    1414:	4281                	li	t0,0
    1416:	b75d                	j	13bc <__divdf3+0x50c>
    1418:	000802b7          	lui	t0,0x80
    141c:	4781                	li	a5,0
    141e:	7ff00613          	li	a2,2047
    1422:	c002                	sw	zero,0(sp)
    1424:	bdfd                	j	1322 <__divdf3+0x472>
    1426:	4281                	li	t0,0
    1428:	4781                	li	a5,0
    142a:	7ff00613          	li	a2,2047
    142e:	bdd5                	j	1322 <__divdf3+0x472>
    1430:	4281                	li	t0,0
    1432:	4781                	li	a5,0
    1434:	4605                	li	a2,1
    1436:	b5f5                	j	1322 <__divdf3+0x472>
    1438:	87ae                	mv	a5,a1
    143a:	85be                	mv	a1,a5
    143c:	bd49                	j	12ce <__divdf3+0x41e>

0000143e <__eqdf2>:
    143e:	001007b7          	lui	a5,0x100
    1442:	17fd                	addi	a5,a5,-1
    1444:	1151                	addi	sp,sp,-12
    1446:	00b7f333          	and	t1,a5,a1
    144a:	0145d713          	srli	a4,a1,0x14
    144e:	81fd                	srli	a1,a1,0x1f
    1450:	c422                	sw	s0,8(sp)
    1452:	c226                	sw	s1,4(sp)
    1454:	82aa                	mv	t0,a0
    1456:	842a                	mv	s0,a0
    1458:	c02e                	sw	a1,0(sp)
    145a:	7ff77713          	andi	a4,a4,2047
    145e:	0146d593          	srli	a1,a3,0x14
    1462:	7ff00513          	li	a0,2047
    1466:	8ff5                	and	a5,a5,a3
    1468:	84b2                	mv	s1,a2
    146a:	7ff5f593          	andi	a1,a1,2047
    146e:	82fd                	srli	a3,a3,0x1f
    1470:	00a71a63          	bne	a4,a0,1484 <__eqdf2+0x46>
    1474:	005363b3          	or	t2,t1,t0
    1478:	4505                	li	a0,1
    147a:	02039963          	bnez	t2,14ac <__eqdf2+0x6e>
    147e:	02e59763          	bne	a1,a4,14ac <__eqdf2+0x6e>
    1482:	a019                	j	1488 <__eqdf2+0x4a>
    1484:	00a59563          	bne	a1,a0,148e <__eqdf2+0x50>
    1488:	8e5d                	or	a2,a2,a5
    148a:	4505                	li	a0,1
    148c:	e205                	bnez	a2,14ac <__eqdf2+0x6e>
    148e:	4505                	li	a0,1
    1490:	00b71e63          	bne	a4,a1,14ac <__eqdf2+0x6e>
    1494:	00f31c63          	bne	t1,a5,14ac <__eqdf2+0x6e>
    1498:	00941a63          	bne	s0,s1,14ac <__eqdf2+0x6e>
    149c:	4782                	lw	a5,0(sp)
    149e:	00d78b63          	beq	a5,a3,14b4 <__eqdf2+0x76>
    14a2:	e709                	bnez	a4,14ac <__eqdf2+0x6e>
    14a4:	00536533          	or	a0,t1,t0
    14a8:	00a03533          	snez	a0,a0
    14ac:	4422                	lw	s0,8(sp)
    14ae:	4492                	lw	s1,4(sp)
    14b0:	0131                	addi	sp,sp,12
    14b2:	8082                	ret
    14b4:	4501                	li	a0,0
    14b6:	bfdd                	j	14ac <__eqdf2+0x6e>

000014b8 <__gedf2>:
    14b8:	001007b7          	lui	a5,0x100
    14bc:	17fd                	addi	a5,a5,-1
    14be:	1151                	addi	sp,sp,-12
    14c0:	00b7f2b3          	and	t0,a5,a1
    14c4:	0145d313          	srli	t1,a1,0x14
    14c8:	0146d713          	srli	a4,a3,0x14
    14cc:	8ff5                	and	a5,a5,a3
    14ce:	82fd                	srli	a3,a3,0x1f
    14d0:	c422                	sw	s0,8(sp)
    14d2:	c226                	sw	s1,4(sp)
    14d4:	c036                	sw	a3,0(sp)
    14d6:	7ff37313          	andi	t1,t1,2047
    14da:	7ff00693          	li	a3,2047
    14de:	83aa                	mv	t2,a0
    14e0:	842a                	mv	s0,a0
    14e2:	81fd                	srli	a1,a1,0x1f
    14e4:	84b2                	mv	s1,a2
    14e6:	7ff77713          	andi	a4,a4,2047
    14ea:	00d31a63          	bne	t1,a3,14fe <__gedf2+0x46>
    14ee:	00a2e6b3          	or	a3,t0,a0
    14f2:	5579                	li	a0,-2
    14f4:	c6bd                	beqz	a3,1562 <__gedf2+0xaa>
    14f6:	4422                	lw	s0,8(sp)
    14f8:	4492                	lw	s1,4(sp)
    14fa:	0131                	addi	sp,sp,12
    14fc:	8082                	ret
    14fe:	00d71663          	bne	a4,a3,150a <__gedf2+0x52>
    1502:	00c7e6b3          	or	a3,a5,a2
    1506:	5579                	li	a0,-2
    1508:	f6fd                	bnez	a3,14f6 <__gedf2+0x3e>
    150a:	04031e63          	bnez	t1,1566 <__gedf2+0xae>
    150e:	0072e533          	or	a0,t0,t2
    1512:	00153513          	seqz	a0,a0
    1516:	e319                	bnez	a4,151c <__gedf2+0x64>
    1518:	8e5d                	or	a2,a2,a5
    151a:	ce15                	beqz	a2,1556 <__gedf2+0x9e>
    151c:	e519                	bnez	a0,152a <__gedf2+0x72>
    151e:	4682                	lw	a3,0(sp)
    1520:	00d58963          	beq	a1,a3,1532 <__gedf2+0x7a>
    1524:	4505                	li	a0,1
    1526:	d9e1                	beqz	a1,14f6 <__gedf2+0x3e>
    1528:	a019                	j	152e <__gedf2+0x76>
    152a:	4782                	lw	a5,0(sp)
    152c:	f7e9                	bnez	a5,14f6 <__gedf2+0x3e>
    152e:	557d                	li	a0,-1
    1530:	b7d9                	j	14f6 <__gedf2+0x3e>
    1532:	fe6749e3          	blt	a4,t1,1524 <__gedf2+0x6c>
    1536:	00e35663          	bge	t1,a4,1542 <__gedf2+0x8a>
    153a:	557d                	li	a0,-1
    153c:	ddcd                	beqz	a1,14f6 <__gedf2+0x3e>
    153e:	4505                	li	a0,1
    1540:	bf5d                	j	14f6 <__gedf2+0x3e>
    1542:	fe57e1e3          	bltu	a5,t0,1524 <__gedf2+0x6c>
    1546:	00f29b63          	bne	t0,a5,155c <__gedf2+0xa4>
    154a:	fc84ede3          	bltu	s1,s0,1524 <__gedf2+0x6c>
    154e:	4501                	li	a0,0
    1550:	fa9473e3          	bgeu	s0,s1,14f6 <__gedf2+0x3e>
    1554:	b7dd                	j	153a <__gedf2+0x82>
    1556:	d579                	beqz	a0,1524 <__gedf2+0x6c>
    1558:	4501                	li	a0,0
    155a:	bf71                	j	14f6 <__gedf2+0x3e>
    155c:	fcf2efe3          	bltu	t0,a5,153a <__gedf2+0x82>
    1560:	bfe5                	j	1558 <__gedf2+0xa0>
    1562:	fa6700e3          	beq	a4,t1,1502 <__gedf2+0x4a>
    1566:	ff45                	bnez	a4,151e <__gedf2+0x66>
    1568:	4501                	li	a0,0
    156a:	b77d                	j	1518 <__gedf2+0x60>

0000156c <__ledf2>:
    156c:	001007b7          	lui	a5,0x100
    1570:	17fd                	addi	a5,a5,-1
    1572:	1151                	addi	sp,sp,-12
    1574:	00b7f2b3          	and	t0,a5,a1
    1578:	0145d313          	srli	t1,a1,0x14
    157c:	0146d713          	srli	a4,a3,0x14
    1580:	8ff5                	and	a5,a5,a3
    1582:	82fd                	srli	a3,a3,0x1f
    1584:	c422                	sw	s0,8(sp)
    1586:	c226                	sw	s1,4(sp)
    1588:	c036                	sw	a3,0(sp)
    158a:	7ff37313          	andi	t1,t1,2047
    158e:	7ff00693          	li	a3,2047
    1592:	83aa                	mv	t2,a0
    1594:	842a                	mv	s0,a0
    1596:	81fd                	srli	a1,a1,0x1f
    1598:	84b2                	mv	s1,a2
    159a:	7ff77713          	andi	a4,a4,2047
    159e:	00d31a63          	bne	t1,a3,15b2 <__ledf2+0x46>
    15a2:	00a2e6b3          	or	a3,t0,a0
    15a6:	4509                	li	a0,2
    15a8:	c6bd                	beqz	a3,1616 <__ledf2+0xaa>
    15aa:	4422                	lw	s0,8(sp)
    15ac:	4492                	lw	s1,4(sp)
    15ae:	0131                	addi	sp,sp,12
    15b0:	8082                	ret
    15b2:	00d71663          	bne	a4,a3,15be <__ledf2+0x52>
    15b6:	00c7e6b3          	or	a3,a5,a2
    15ba:	4509                	li	a0,2
    15bc:	f6fd                	bnez	a3,15aa <__ledf2+0x3e>
    15be:	04031e63          	bnez	t1,161a <__ledf2+0xae>
    15c2:	0072e533          	or	a0,t0,t2
    15c6:	00153513          	seqz	a0,a0
    15ca:	e319                	bnez	a4,15d0 <__ledf2+0x64>
    15cc:	8e5d                	or	a2,a2,a5
    15ce:	ce15                	beqz	a2,160a <__ledf2+0x9e>
    15d0:	e519                	bnez	a0,15de <__ledf2+0x72>
    15d2:	4682                	lw	a3,0(sp)
    15d4:	00d58963          	beq	a1,a3,15e6 <__ledf2+0x7a>
    15d8:	4505                	li	a0,1
    15da:	d9e1                	beqz	a1,15aa <__ledf2+0x3e>
    15dc:	a019                	j	15e2 <__ledf2+0x76>
    15de:	4782                	lw	a5,0(sp)
    15e0:	f7e9                	bnez	a5,15aa <__ledf2+0x3e>
    15e2:	557d                	li	a0,-1
    15e4:	b7d9                	j	15aa <__ledf2+0x3e>
    15e6:	fe6749e3          	blt	a4,t1,15d8 <__ledf2+0x6c>
    15ea:	00e35663          	bge	t1,a4,15f6 <__ledf2+0x8a>
    15ee:	557d                	li	a0,-1
    15f0:	ddcd                	beqz	a1,15aa <__ledf2+0x3e>
    15f2:	4505                	li	a0,1
    15f4:	bf5d                	j	15aa <__ledf2+0x3e>
    15f6:	fe57e1e3          	bltu	a5,t0,15d8 <__ledf2+0x6c>
    15fa:	00f29b63          	bne	t0,a5,1610 <__ledf2+0xa4>
    15fe:	fc84ede3          	bltu	s1,s0,15d8 <__ledf2+0x6c>
    1602:	4501                	li	a0,0
    1604:	fa9473e3          	bgeu	s0,s1,15aa <__ledf2+0x3e>
    1608:	b7dd                	j	15ee <__ledf2+0x82>
    160a:	d579                	beqz	a0,15d8 <__ledf2+0x6c>
    160c:	4501                	li	a0,0
    160e:	bf71                	j	15aa <__ledf2+0x3e>
    1610:	fcf2efe3          	bltu	t0,a5,15ee <__ledf2+0x82>
    1614:	bfe5                	j	160c <__ledf2+0xa0>
    1616:	fa6700e3          	beq	a4,t1,15b6 <__ledf2+0x4a>
    161a:	ff45                	bnez	a4,15d2 <__ledf2+0x66>
    161c:	4501                	li	a0,0
    161e:	b77d                	j	15cc <__ledf2+0x60>

00001620 <__muldf3>:
    1620:	fd810113          	addi	sp,sp,-40
    1624:	872a                	mv	a4,a0
    1626:	832a                	mv	t1,a0
    1628:	01f5d793          	srli	a5,a1,0x1f
    162c:	0145d513          	srli	a0,a1,0x14
    1630:	d022                	sw	s0,32(sp)
    1632:	ce26                	sw	s1,28(sp)
    1634:	d206                	sw	ra,36(sp)
    1636:	00c59493          	slli	s1,a1,0xc
    163a:	7ff57513          	andi	a0,a0,2047
    163e:	c43e                	sw	a5,8(sp)
    1640:	8436                	mv	s0,a3
    1642:	80b1                	srli	s1,s1,0xc
    1644:	c941                	beqz	a0,16d4 <__muldf3+0xb4>
    1646:	7ff00693          	li	a3,2047
    164a:	0ed50563          	beq	a0,a3,1734 <__muldf3+0x114>
    164e:	01d75693          	srli	a3,a4,0x1d
    1652:	00349793          	slli	a5,s1,0x3
    1656:	8fd5                	or	a5,a5,a3
    1658:	008006b7          	lui	a3,0x800
    165c:	00d7e3b3          	or	t2,a5,a3
    1660:	00371313          	slli	t1,a4,0x3
    1664:	c0150593          	addi	a1,a0,-1023
    1668:	4481                	li	s1,0
    166a:	01445513          	srli	a0,s0,0x14
    166e:	00c41293          	slli	t0,s0,0xc
    1672:	7ff57513          	andi	a0,a0,2047
    1676:	8732                	mv	a4,a2
    1678:	00c2d293          	srli	t0,t0,0xc
    167c:	807d                	srli	s0,s0,0x1f
    167e:	cd69                	beqz	a0,1758 <__muldf3+0x138>
    1680:	7ff00793          	li	a5,2047
    1684:	14f50863          	beq	a0,a5,17d4 <__muldf3+0x1b4>
    1688:	01d65793          	srli	a5,a2,0x1d
    168c:	028e                	slli	t0,t0,0x3
    168e:	0057e2b3          	or	t0,a5,t0
    1692:	008007b7          	lui	a5,0x800
    1696:	00f2e7b3          	or	a5,t0,a5
    169a:	00361713          	slli	a4,a2,0x3
    169e:	c0150513          	addi	a0,a0,-1023
    16a2:	4681                	li	a3,0
    16a4:	4622                	lw	a2,8(sp)
    16a6:	8e21                	xor	a2,a2,s0
    16a8:	c032                	sw	a2,0(sp)
    16aa:	00a58633          	add	a2,a1,a0
    16ae:	c632                	sw	a2,12(sp)
    16b0:	0605                	addi	a2,a2,1
    16b2:	c232                	sw	a2,4(sp)
    16b4:	00249613          	slli	a2,s1,0x2
    16b8:	8e55                	or	a2,a2,a3
    16ba:	167d                	addi	a2,a2,-1
    16bc:	45b9                	li	a1,14
    16be:	12c5ec63          	bltu	a1,a2,17f6 <__muldf3+0x1d6>
    16c2:	00004597          	auipc	a1,0x4
    16c6:	bca58593          	addi	a1,a1,-1078 # 528c <__srodata+0x3c>
    16ca:	060a                	slli	a2,a2,0x2
    16cc:	962e                	add	a2,a2,a1
    16ce:	4210                	lw	a2,0(a2)
    16d0:	95b2                	add	a1,a1,a2
    16d2:	8582                	jr	a1
    16d4:	00e4e3b3          	or	t2,s1,a4
    16d8:	06038763          	beqz	t2,1746 <__muldf3+0x126>
    16dc:	c232                	sw	a2,4(sp)
    16de:	cc85                	beqz	s1,1716 <__muldf3+0xf6>
    16e0:	8526                	mv	a0,s1
    16e2:	c03a                	sw	a4,0(sp)
    16e4:	2bd000ef          	jal	ra,21a0 <__clzsi2>
    16e8:	4702                	lw	a4,0(sp)
    16ea:	4612                	lw	a2,4(sp)
    16ec:	ff550593          	addi	a1,a0,-11
    16f0:	46f1                	li	a3,28
    16f2:	02b6cb63          	blt	a3,a1,1728 <__muldf3+0x108>
    16f6:	46f5                	li	a3,29
    16f8:	ff850313          	addi	t1,a0,-8
    16fc:	8e8d                	sub	a3,a3,a1
    16fe:	006497b3          	sll	a5,s1,t1
    1702:	00d756b3          	srl	a3,a4,a3
    1706:	00f6e3b3          	or	t2,a3,a5
    170a:	00671333          	sll	t1,a4,t1
    170e:	c0d00593          	li	a1,-1011
    1712:	8d89                	sub	a1,a1,a0
    1714:	bf91                	j	1668 <__muldf3+0x48>
    1716:	853a                	mv	a0,a4
    1718:	c03a                	sw	a4,0(sp)
    171a:	287000ef          	jal	ra,21a0 <__clzsi2>
    171e:	02050513          	addi	a0,a0,32
    1722:	4612                	lw	a2,4(sp)
    1724:	4702                	lw	a4,0(sp)
    1726:	b7d9                	j	16ec <__muldf3+0xcc>
    1728:	fd850793          	addi	a5,a0,-40
    172c:	00f713b3          	sll	t2,a4,a5
    1730:	4301                	li	t1,0
    1732:	bff1                	j	170e <__muldf3+0xee>
    1734:	00e4e3b3          	or	t2,s1,a4
    1738:	00038b63          	beqz	t2,174e <__muldf3+0x12e>
    173c:	83a6                	mv	t2,s1
    173e:	7ff00593          	li	a1,2047
    1742:	448d                	li	s1,3
    1744:	b71d                	j	166a <__muldf3+0x4a>
    1746:	4301                	li	t1,0
    1748:	4581                	li	a1,0
    174a:	4485                	li	s1,1
    174c:	bf39                	j	166a <__muldf3+0x4a>
    174e:	4301                	li	t1,0
    1750:	7ff00593          	li	a1,2047
    1754:	4489                	li	s1,2
    1756:	bf11                	j	166a <__muldf3+0x4a>
    1758:	00c2e7b3          	or	a5,t0,a2
    175c:	c7c1                	beqz	a5,17e4 <__muldf3+0x1c4>
    175e:	04028563          	beqz	t0,17a8 <__muldf3+0x188>
    1762:	8516                	mv	a0,t0
    1764:	ca32                	sw	a2,20(sp)
    1766:	c81a                	sw	t1,16(sp)
    1768:	c61e                	sw	t2,12(sp)
    176a:	c22e                	sw	a1,4(sp)
    176c:	c016                	sw	t0,0(sp)
    176e:	233000ef          	jal	ra,21a0 <__clzsi2>
    1772:	4282                	lw	t0,0(sp)
    1774:	4592                	lw	a1,4(sp)
    1776:	43b2                	lw	t2,12(sp)
    1778:	4342                	lw	t1,16(sp)
    177a:	4652                	lw	a2,20(sp)
    177c:	ff550693          	addi	a3,a0,-11
    1780:	47f1                	li	a5,28
    1782:	04d7c363          	blt	a5,a3,17c8 <__muldf3+0x1a8>
    1786:	47f5                	li	a5,29
    1788:	ff850713          	addi	a4,a0,-8
    178c:	8f95                	sub	a5,a5,a3
    178e:	00e292b3          	sll	t0,t0,a4
    1792:	00f657b3          	srl	a5,a2,a5
    1796:	0057e7b3          	or	a5,a5,t0
    179a:	00e61733          	sll	a4,a2,a4
    179e:	c0d00693          	li	a3,-1011
    17a2:	40a68533          	sub	a0,a3,a0
    17a6:	bdf5                	j	16a2 <__muldf3+0x82>
    17a8:	8532                	mv	a0,a2
    17aa:	ca16                	sw	t0,20(sp)
    17ac:	c81a                	sw	t1,16(sp)
    17ae:	c61e                	sw	t2,12(sp)
    17b0:	c22e                	sw	a1,4(sp)
    17b2:	c032                	sw	a2,0(sp)
    17b4:	1ed000ef          	jal	ra,21a0 <__clzsi2>
    17b8:	02050513          	addi	a0,a0,32
    17bc:	42d2                	lw	t0,20(sp)
    17be:	4342                	lw	t1,16(sp)
    17c0:	43b2                	lw	t2,12(sp)
    17c2:	4592                	lw	a1,4(sp)
    17c4:	4602                	lw	a2,0(sp)
    17c6:	bf5d                	j	177c <__muldf3+0x15c>
    17c8:	fd850293          	addi	t0,a0,-40
    17cc:	005617b3          	sll	a5,a2,t0
    17d0:	4701                	li	a4,0
    17d2:	b7f1                	j	179e <__muldf3+0x17e>
    17d4:	00c2e7b3          	or	a5,t0,a2
    17d8:	cb91                	beqz	a5,17ec <__muldf3+0x1cc>
    17da:	8796                	mv	a5,t0
    17dc:	7ff00513          	li	a0,2047
    17e0:	468d                	li	a3,3
    17e2:	b5c9                	j	16a4 <__muldf3+0x84>
    17e4:	4701                	li	a4,0
    17e6:	4501                	li	a0,0
    17e8:	4685                	li	a3,1
    17ea:	bd6d                	j	16a4 <__muldf3+0x84>
    17ec:	4701                	li	a4,0
    17ee:	7ff00513          	li	a0,2047
    17f2:	4689                	li	a3,2
    17f4:	bd45                	j	16a4 <__muldf3+0x84>
    17f6:	01035613          	srli	a2,t1,0x10
    17fa:	01075493          	srli	s1,a4,0x10
    17fe:	66c1                	lui	a3,0x10
    1800:	fff68293          	addi	t0,a3,-1 # ffff <__ctor_end__+0x9f37>
    1804:	029606b3          	mul	a3,a2,s1
    1808:	00537333          	and	t1,t1,t0
    180c:	00577733          	and	a4,a4,t0
    1810:	02e60433          	mul	s0,a2,a4
    1814:	c436                	sw	a3,8(sp)
    1816:	026486b3          	mul	a3,s1,t1
    181a:	026705b3          	mul	a1,a4,t1
    181e:	96a2                	add	a3,a3,s0
    1820:	8536                	mv	a0,a3
    1822:	0105d693          	srli	a3,a1,0x10
    1826:	96aa                	add	a3,a3,a0
    1828:	0086f763          	bgeu	a3,s0,1836 <__muldf3+0x216>
    182c:	02960433          	mul	s0,a2,s1
    1830:	6541                	lui	a0,0x10
    1832:	9522                	add	a0,a0,s0
    1834:	c42a                	sw	a0,8(sp)
    1836:	0106d513          	srli	a0,a3,0x10
    183a:	0056f6b3          	and	a3,a3,t0
    183e:	0055f5b3          	and	a1,a1,t0
    1842:	06c2                	slli	a3,a3,0x10
    1844:	96ae                	add	a3,a3,a1
    1846:	0057f2b3          	and	t0,a5,t0
    184a:	0107d593          	srli	a1,a5,0x10
    184e:	ca36                	sw	a3,20(sp)
    1850:	026287b3          	mul	a5,t0,t1
    1854:	025606b3          	mul	a3,a2,t0
    1858:	0107d413          	srli	s0,a5,0x10
    185c:	02658333          	mul	t1,a1,t1
    1860:	9336                	add	t1,t1,a3
    1862:	9322                	add	t1,t1,s0
    1864:	02b60633          	mul	a2,a2,a1
    1868:	00d37463          	bgeu	t1,a3,1870 <__muldf3+0x250>
    186c:	66c1                	lui	a3,0x10
    186e:	9636                	add	a2,a2,a3
    1870:	01035413          	srli	s0,t1,0x10
    1874:	00c406b3          	add	a3,s0,a2
    1878:	c836                	sw	a3,16(sp)
    187a:	66c1                	lui	a3,0x10
    187c:	fff68613          	addi	a2,a3,-1 # ffff <__ctor_end__+0x9f37>
    1880:	00c37333          	and	t1,t1,a2
    1884:	8ff1                	and	a5,a5,a2
    1886:	0342                	slli	t1,t1,0x10
    1888:	933e                	add	t1,t1,a5
    188a:	006507b3          	add	a5,a0,t1
    188e:	00c3f633          	and	a2,t2,a2
    1892:	0103d513          	srli	a0,t2,0x10
    1896:	cc3e                	sw	a5,24(sp)
    1898:	02a483b3          	mul	t2,s1,a0
    189c:	02c707b3          	mul	a5,a4,a2
    18a0:	02c484b3          	mul	s1,s1,a2
    18a4:	0107d413          	srli	s0,a5,0x10
    18a8:	02e50733          	mul	a4,a0,a4
    18ac:	94ba                	add	s1,s1,a4
    18ae:	94a2                	add	s1,s1,s0
    18b0:	00e4f363          	bgeu	s1,a4,18b6 <__muldf3+0x296>
    18b4:	93b6                	add	t2,t2,a3
    18b6:	02c28433          	mul	s0,t0,a2
    18ba:	0104d713          	srli	a4,s1,0x10
    18be:	93ba                	add	t2,t2,a4
    18c0:	6741                	lui	a4,0x10
    18c2:	fff70693          	addi	a3,a4,-1 # ffff <__ctor_end__+0x9f37>
    18c6:	8cf5                	and	s1,s1,a3
    18c8:	04c2                	slli	s1,s1,0x10
    18ca:	8ff5                	and	a5,a5,a3
    18cc:	94be                	add	s1,s1,a5
    18ce:	025502b3          	mul	t0,a0,t0
    18d2:	02c58633          	mul	a2,a1,a2
    18d6:	02a58533          	mul	a0,a1,a0
    18da:	9616                	add	a2,a2,t0
    18dc:	01045593          	srli	a1,s0,0x10
    18e0:	95b2                	add	a1,a1,a2
    18e2:	0055f363          	bgeu	a1,t0,18e8 <__muldf3+0x2c8>
    18e6:	953a                	add	a0,a0,a4
    18e8:	47a2                	lw	a5,8(sp)
    18ea:	4762                	lw	a4,24(sp)
    18ec:	00e786b3          	add	a3,a5,a4
    18f0:	67c1                	lui	a5,0x10
    18f2:	17fd                	addi	a5,a5,-1
    18f4:	00f5f633          	and	a2,a1,a5
    18f8:	8c7d                	and	s0,s0,a5
    18fa:	47c2                	lw	a5,16(sp)
    18fc:	0642                	slli	a2,a2,0x10
    18fe:	9622                	add	a2,a2,s0
    1900:	0066b333          	sltu	t1,a3,t1
    1904:	963e                	add	a2,a2,a5
    1906:	4742                	lw	a4,16(sp)
    1908:	96a6                	add	a3,a3,s1
    190a:	00660433          	add	s0,a2,t1
    190e:	0096b7b3          	sltu	a5,a3,s1
    1912:	007402b3          	add	t0,s0,t2
    1916:	00f284b3          	add	s1,t0,a5
    191a:	00e63633          	sltu	a2,a2,a4
    191e:	00643333          	sltu	t1,s0,t1
    1922:	00f4b7b3          	sltu	a5,s1,a5
    1926:	00666633          	or	a2,a2,t1
    192a:	81c1                	srli	a1,a1,0x10
    192c:	0072b2b3          	sltu	t0,t0,t2
    1930:	962e                	add	a2,a2,a1
    1932:	00f2e2b3          	or	t0,t0,a5
    1936:	92b2                	add	t0,t0,a2
    1938:	4652                	lw	a2,20(sp)
    193a:	00969713          	slli	a4,a3,0x9
    193e:	9516                	add	a0,a0,t0
    1940:	0174d793          	srli	a5,s1,0x17
    1944:	00951293          	slli	t0,a0,0x9
    1948:	8f51                	or	a4,a4,a2
    194a:	82dd                	srli	a3,a3,0x17
    194c:	00f2e7b3          	or	a5,t0,a5
    1950:	00e03733          	snez	a4,a4
    1954:	8f55                	or	a4,a4,a3
    1956:	04a6                	slli	s1,s1,0x9
    1958:	00779693          	slli	a3,a5,0x7
    195c:	8f45                	or	a4,a4,s1
    195e:	0a06d963          	bgez	a3,1a10 <__muldf3+0x3f0>
    1962:	00175693          	srli	a3,a4,0x1
    1966:	8b05                	andi	a4,a4,1
    1968:	8f55                	or	a4,a4,a3
    196a:	01f79693          	slli	a3,a5,0x1f
    196e:	8f55                	or	a4,a4,a3
    1970:	8385                	srli	a5,a5,0x1
    1972:	4692                	lw	a3,4(sp)
    1974:	3ff68613          	addi	a2,a3,1023
    1978:	08c05f63          	blez	a2,1a16 <__muldf3+0x3f6>
    197c:	00777693          	andi	a3,a4,7
    1980:	ce81                	beqz	a3,1998 <__muldf3+0x378>
    1982:	00f77693          	andi	a3,a4,15
    1986:	4591                	li	a1,4
    1988:	00b68863          	beq	a3,a1,1998 <__muldf3+0x378>
    198c:	00470693          	addi	a3,a4,4
    1990:	00e6b733          	sltu	a4,a3,a4
    1994:	97ba                	add	a5,a5,a4
    1996:	8736                	mv	a4,a3
    1998:	00779693          	slli	a3,a5,0x7
    199c:	0006d963          	bgez	a3,19ae <__muldf3+0x38e>
    19a0:	ff0006b7          	lui	a3,0xff000
    19a4:	16fd                	addi	a3,a3,-1
    19a6:	8ff5                	and	a5,a5,a3
    19a8:	4692                	lw	a3,4(sp)
    19aa:	40068613          	addi	a2,a3,1024 # ff000400 <__heap_end+0xdefd0400>
    19ae:	7fe00693          	li	a3,2046
    19b2:	10c6c063          	blt	a3,a2,1ab2 <__muldf3+0x492>
    19b6:	830d                	srli	a4,a4,0x3
    19b8:	01d79693          	slli	a3,a5,0x1d
    19bc:	8f55                	or	a4,a4,a3
    19be:	0037d293          	srli	t0,a5,0x3
    19c2:	4782                	lw	a5,0(sp)
    19c4:	02b2                	slli	t0,t0,0xc
    19c6:	7ff67693          	andi	a3,a2,2047
    19ca:	06d2                	slli	a3,a3,0x14
    19cc:	5092                	lw	ra,36(sp)
    19ce:	5402                	lw	s0,32(sp)
    19d0:	00c2d293          	srli	t0,t0,0xc
    19d4:	07fe                	slli	a5,a5,0x1f
    19d6:	00d2e2b3          	or	t0,t0,a3
    19da:	00f2e6b3          	or	a3,t0,a5
    19de:	44f2                	lw	s1,28(sp)
    19e0:	853a                	mv	a0,a4
    19e2:	85b6                	mv	a1,a3
    19e4:	02810113          	addi	sp,sp,40
    19e8:	8082                	ret
    19ea:	47a2                	lw	a5,8(sp)
    19ec:	c03e                	sw	a5,0(sp)
    19ee:	879e                	mv	a5,t2
    19f0:	871a                	mv	a4,t1
    19f2:	86a6                	mv	a3,s1
    19f4:	4609                	li	a2,2
    19f6:	0ac68e63          	beq	a3,a2,1ab2 <__muldf3+0x492>
    19fa:	460d                	li	a2,3
    19fc:	0ac68463          	beq	a3,a2,1aa4 <__muldf3+0x484>
    1a00:	4605                	li	a2,1
    1a02:	f6c698e3          	bne	a3,a2,1972 <__muldf3+0x352>
    1a06:	4281                	li	t0,0
    1a08:	4701                	li	a4,0
    1a0a:	a0bd                	j	1a78 <__muldf3+0x458>
    1a0c:	c022                	sw	s0,0(sp)
    1a0e:	b7dd                	j	19f4 <__muldf3+0x3d4>
    1a10:	46b2                	lw	a3,12(sp)
    1a12:	c236                	sw	a3,4(sp)
    1a14:	bfb9                	j	1972 <__muldf3+0x352>
    1a16:	4285                	li	t0,1
    1a18:	40c282b3          	sub	t0,t0,a2
    1a1c:	03800693          	li	a3,56
    1a20:	fe56c3e3          	blt	a3,t0,1a06 <__muldf3+0x3e6>
    1a24:	46fd                	li	a3,31
    1a26:	0456cb63          	blt	a3,t0,1a7c <__muldf3+0x45c>
    1a2a:	4692                	lw	a3,4(sp)
    1a2c:	005755b3          	srl	a1,a4,t0
    1a30:	0057d2b3          	srl	t0,a5,t0
    1a34:	41e68613          	addi	a2,a3,1054
    1a38:	00c796b3          	sll	a3,a5,a2
    1a3c:	00c71733          	sll	a4,a4,a2
    1a40:	8ecd                	or	a3,a3,a1
    1a42:	00e03733          	snez	a4,a4
    1a46:	8f55                	or	a4,a4,a3
    1a48:	00777793          	andi	a5,a4,7
    1a4c:	cf81                	beqz	a5,1a64 <__muldf3+0x444>
    1a4e:	00f77793          	andi	a5,a4,15
    1a52:	4691                	li	a3,4
    1a54:	00d78863          	beq	a5,a3,1a64 <__muldf3+0x444>
    1a58:	00470793          	addi	a5,a4,4
    1a5c:	00e7b733          	sltu	a4,a5,a4
    1a60:	92ba                	add	t0,t0,a4
    1a62:	873e                	mv	a4,a5
    1a64:	00829793          	slli	a5,t0,0x8
    1a68:	0407ca63          	bltz	a5,1abc <__muldf3+0x49c>
    1a6c:	01d29793          	slli	a5,t0,0x1d
    1a70:	830d                	srli	a4,a4,0x3
    1a72:	8f5d                	or	a4,a4,a5
    1a74:	0032d293          	srli	t0,t0,0x3
    1a78:	4601                	li	a2,0
    1a7a:	b7a1                	j	19c2 <__muldf3+0x3a2>
    1a7c:	5685                	li	a3,-31
    1a7e:	8e91                	sub	a3,a3,a2
    1a80:	02000593          	li	a1,32
    1a84:	00d7d6b3          	srl	a3,a5,a3
    1a88:	4601                	li	a2,0
    1a8a:	00b28763          	beq	t0,a1,1a98 <__muldf3+0x478>
    1a8e:	4612                	lw	a2,4(sp)
    1a90:	43e60613          	addi	a2,a2,1086
    1a94:	00c79633          	sll	a2,a5,a2
    1a98:	8f51                	or	a4,a4,a2
    1a9a:	00e03733          	snez	a4,a4
    1a9e:	8f55                	or	a4,a4,a3
    1aa0:	4281                	li	t0,0
    1aa2:	b75d                	j	1a48 <__muldf3+0x428>
    1aa4:	000802b7          	lui	t0,0x80
    1aa8:	4701                	li	a4,0
    1aaa:	7ff00613          	li	a2,2047
    1aae:	c002                	sw	zero,0(sp)
    1ab0:	bf09                	j	19c2 <__muldf3+0x3a2>
    1ab2:	4281                	li	t0,0
    1ab4:	4701                	li	a4,0
    1ab6:	7ff00613          	li	a2,2047
    1aba:	b721                	j	19c2 <__muldf3+0x3a2>
    1abc:	4281                	li	t0,0
    1abe:	4701                	li	a4,0
    1ac0:	4605                	li	a2,1
    1ac2:	b701                	j	19c2 <__muldf3+0x3a2>

00001ac4 <__subdf3>:
    1ac4:	001002b7          	lui	t0,0x100
    1ac8:	12fd                	addi	t0,t0,-1
    1aca:	1131                	addi	sp,sp,-20
    1acc:	00b2f333          	and	t1,t0,a1
    1ad0:	030e                	slli	t1,t1,0x3
    1ad2:	c622                	sw	s0,12(sp)
    1ad4:	c426                	sw	s1,8(sp)
    1ad6:	0145d413          	srli	s0,a1,0x14
    1ada:	01f5d493          	srli	s1,a1,0x1f
    1ade:	01d55793          	srli	a5,a0,0x1d
    1ae2:	00d2f5b3          	and	a1,t0,a3
    1ae6:	0067e7b3          	or	a5,a5,t1
    1aea:	0146d293          	srli	t0,a3,0x14
    1aee:	01d65313          	srli	t1,a2,0x1d
    1af2:	058e                	slli	a1,a1,0x3
    1af4:	00b365b3          	or	a1,t1,a1
    1af8:	c806                	sw	ra,16(sp)
    1afa:	00361313          	slli	t1,a2,0x3
    1afe:	7ff2f293          	andi	t0,t0,2047
    1b02:	7ff00613          	li	a2,2047
    1b06:	7ff47413          	andi	s0,s0,2047
    1b0a:	00351713          	slli	a4,a0,0x3
    1b0e:	82fd                	srli	a3,a3,0x1f
    1b10:	00c29563          	bne	t0,a2,1b1a <__subdf3+0x56>
    1b14:	0065e633          	or	a2,a1,t1
    1b18:	e219                	bnez	a2,1b1e <__subdf3+0x5a>
    1b1a:	0016c693          	xori	a3,a3,1
    1b1e:	40540533          	sub	a0,s0,t0
    1b22:	22969563          	bne	a3,s1,1d4c <__subdf3+0x288>
    1b26:	0ea05e63          	blez	a0,1c22 <__subdf3+0x15e>
    1b2a:	04029463          	bnez	t0,1b72 <__subdf3+0xae>
    1b2e:	0065e6b3          	or	a3,a1,t1
    1b32:	c285                	beqz	a3,1b52 <__subdf3+0x8e>
    1b34:	fff40513          	addi	a0,s0,-1
    1b38:	e909                	bnez	a0,1b4a <__subdf3+0x86>
    1b3a:	933a                	add	t1,t1,a4
    1b3c:	00e33733          	sltu	a4,t1,a4
    1b40:	97ae                	add	a5,a5,a1
    1b42:	97ba                	add	a5,a5,a4
    1b44:	871a                	mv	a4,t1
    1b46:	4405                	li	s0,1
    1b48:	a895                	j	1bbc <__subdf3+0xf8>
    1b4a:	7ff00693          	li	a3,2047
    1b4e:	02d41963          	bne	s0,a3,1b80 <__subdf3+0xbc>
    1b52:	00777693          	andi	a3,a4,7
    1b56:	4e068f63          	beqz	a3,2054 <__subdf3+0x590>
    1b5a:	00f77693          	andi	a3,a4,15
    1b5e:	4611                	li	a2,4
    1b60:	4ec68a63          	beq	a3,a2,2054 <__subdf3+0x590>
    1b64:	00470693          	addi	a3,a4,4
    1b68:	00e6b733          	sltu	a4,a3,a4
    1b6c:	97ba                	add	a5,a5,a4
    1b6e:	8736                	mv	a4,a3
    1b70:	a1d5                	j	2054 <__subdf3+0x590>
    1b72:	7ff00693          	li	a3,2047
    1b76:	fcd40ee3          	beq	s0,a3,1b52 <__subdf3+0x8e>
    1b7a:	008006b7          	lui	a3,0x800
    1b7e:	8dd5                	or	a1,a1,a3
    1b80:	03800693          	li	a3,56
    1b84:	08a6ca63          	blt	a3,a0,1c18 <__subdf3+0x154>
    1b88:	46fd                	li	a3,31
    1b8a:	06a6c063          	blt	a3,a0,1bea <__subdf3+0x126>
    1b8e:	02000613          	li	a2,32
    1b92:	8e09                	sub	a2,a2,a0
    1b94:	00c596b3          	sll	a3,a1,a2
    1b98:	00a352b3          	srl	t0,t1,a0
    1b9c:	00c31333          	sll	t1,t1,a2
    1ba0:	0056e6b3          	or	a3,a3,t0
    1ba4:	00603333          	snez	t1,t1
    1ba8:	0066e333          	or	t1,a3,t1
    1bac:	00a5d5b3          	srl	a1,a1,a0
    1bb0:	933a                	add	t1,t1,a4
    1bb2:	95be                	add	a1,a1,a5
    1bb4:	00e337b3          	sltu	a5,t1,a4
    1bb8:	97ae                	add	a5,a5,a1
    1bba:	871a                	mv	a4,t1
    1bbc:	00879693          	slli	a3,a5,0x8
    1bc0:	f806d9e3          	bgez	a3,1b52 <__subdf3+0x8e>
    1bc4:	0405                	addi	s0,s0,1
    1bc6:	7ff00693          	li	a3,2047
    1bca:	48d40363          	beq	s0,a3,2050 <__subdf3+0x58c>
    1bce:	ff800637          	lui	a2,0xff800
    1bd2:	167d                	addi	a2,a2,-1
    1bd4:	8e7d                	and	a2,a2,a5
    1bd6:	00175693          	srli	a3,a4,0x1
    1bda:	8b05                	andi	a4,a4,1
    1bdc:	01f61793          	slli	a5,a2,0x1f
    1be0:	8f55                	or	a4,a4,a3
    1be2:	8f5d                	or	a4,a4,a5
    1be4:	00165793          	srli	a5,a2,0x1
    1be8:	b7ad                	j	1b52 <__subdf3+0x8e>
    1bea:	fe050693          	addi	a3,a0,-32 # ffe0 <__ctor_end__+0x9f18>
    1bee:	02000293          	li	t0,32
    1bf2:	00d5d6b3          	srl	a3,a1,a3
    1bf6:	4601                	li	a2,0
    1bf8:	00550863          	beq	a0,t0,1c08 <__subdf3+0x144>
    1bfc:	04000613          	li	a2,64
    1c00:	40a60533          	sub	a0,a2,a0
    1c04:	00a59633          	sll	a2,a1,a0
    1c08:	00666333          	or	t1,a2,t1
    1c0c:	00603333          	snez	t1,t1
    1c10:	0066e333          	or	t1,a3,t1
    1c14:	4581                	li	a1,0
    1c16:	bf69                	j	1bb0 <__subdf3+0xec>
    1c18:	0065e333          	or	t1,a1,t1
    1c1c:	00603333          	snez	t1,t1
    1c20:	bfd5                	j	1c14 <__subdf3+0x150>
    1c22:	c945                	beqz	a0,1cd2 <__subdf3+0x20e>
    1c24:	40828633          	sub	a2,t0,s0
    1c28:	e40d                	bnez	s0,1c52 <__subdf3+0x18e>
    1c2a:	00e7e6b3          	or	a3,a5,a4
    1c2e:	40068863          	beqz	a3,203e <__subdf3+0x57a>
    1c32:	fff60693          	addi	a3,a2,-1 # ff7fffff <__heap_end+0xdf7cffff>
    1c36:	e699                	bnez	a3,1c44 <__subdf3+0x180>
    1c38:	971a                	add	a4,a4,t1
    1c3a:	97ae                	add	a5,a5,a1
    1c3c:	00673333          	sltu	t1,a4,t1
    1c40:	979a                	add	a5,a5,t1
    1c42:	b711                	j	1b46 <__subdf3+0x82>
    1c44:	7ff00513          	li	a0,2047
    1c48:	00a61d63          	bne	a2,a0,1c62 <__subdf3+0x19e>
    1c4c:	87ae                	mv	a5,a1
    1c4e:	871a                	mv	a4,t1
    1c50:	ace5                	j	1f48 <__subdf3+0x484>
    1c52:	7ff00693          	li	a3,2047
    1c56:	fed28be3          	beq	t0,a3,1c4c <__subdf3+0x188>
    1c5a:	008006b7          	lui	a3,0x800
    1c5e:	8fd5                	or	a5,a5,a3
    1c60:	86b2                	mv	a3,a2
    1c62:	03800613          	li	a2,56
    1c66:	06d64263          	blt	a2,a3,1cca <__subdf3+0x206>
    1c6a:	467d                	li	a2,31
    1c6c:	02d64a63          	blt	a2,a3,1ca0 <__subdf3+0x1dc>
    1c70:	02000513          	li	a0,32
    1c74:	8d15                	sub	a0,a0,a3
    1c76:	00d753b3          	srl	t2,a4,a3
    1c7a:	00a79633          	sll	a2,a5,a0
    1c7e:	00a71733          	sll	a4,a4,a0
    1c82:	00766633          	or	a2,a2,t2
    1c86:	00e03733          	snez	a4,a4
    1c8a:	8f51                	or	a4,a4,a2
    1c8c:	00d7d6b3          	srl	a3,a5,a3
    1c90:	971a                	add	a4,a4,t1
    1c92:	00b687b3          	add	a5,a3,a1
    1c96:	00673333          	sltu	t1,a4,t1
    1c9a:	979a                	add	a5,a5,t1
    1c9c:	8416                	mv	s0,t0
    1c9e:	bf39                	j	1bbc <__subdf3+0xf8>
    1ca0:	fe068613          	addi	a2,a3,-32 # 7fffe0 <__ctor_end__+0x7f9f18>
    1ca4:	02000393          	li	t2,32
    1ca8:	00c7d633          	srl	a2,a5,a2
    1cac:	4501                	li	a0,0
    1cae:	00768863          	beq	a3,t2,1cbe <__subdf3+0x1fa>
    1cb2:	04000513          	li	a0,64
    1cb6:	40d506b3          	sub	a3,a0,a3
    1cba:	00d79533          	sll	a0,a5,a3
    1cbe:	8f49                	or	a4,a4,a0
    1cc0:	00e03733          	snez	a4,a4
    1cc4:	8f51                	or	a4,a4,a2
    1cc6:	4681                	li	a3,0
    1cc8:	b7e1                	j	1c90 <__subdf3+0x1cc>
    1cca:	8f5d                	or	a4,a4,a5
    1ccc:	00e03733          	snez	a4,a4
    1cd0:	bfdd                	j	1cc6 <__subdf3+0x202>
    1cd2:	00140693          	addi	a3,s0,1
    1cd6:	7fe6f613          	andi	a2,a3,2046
    1cda:	e631                	bnez	a2,1d26 <__subdf3+0x262>
    1cdc:	00e7e6b3          	or	a3,a5,a4
    1ce0:	e41d                	bnez	s0,1d0e <__subdf3+0x24a>
    1ce2:	36068263          	beqz	a3,2046 <__subdf3+0x582>
    1ce6:	0065e6b3          	or	a3,a1,t1
    1cea:	e60684e3          	beqz	a3,1b52 <__subdf3+0x8e>
    1cee:	933a                	add	t1,t1,a4
    1cf0:	00e33733          	sltu	a4,t1,a4
    1cf4:	97ae                	add	a5,a5,a1
    1cf6:	97ba                	add	a5,a5,a4
    1cf8:	00879693          	slli	a3,a5,0x8
    1cfc:	871a                	mv	a4,t1
    1cfe:	e406dae3          	bgez	a3,1b52 <__subdf3+0x8e>
    1d02:	ff8006b7          	lui	a3,0xff800
    1d06:	16fd                	addi	a3,a3,-1
    1d08:	8ff5                	and	a5,a5,a3
    1d0a:	4405                	li	s0,1
    1d0c:	b599                	j	1b52 <__subdf3+0x8e>
    1d0e:	de9d                	beqz	a3,1c4c <__subdf3+0x188>
    1d10:	0065e333          	or	t1,a1,t1
    1d14:	22030a63          	beqz	t1,1f48 <__subdf3+0x484>
    1d18:	4481                	li	s1,0
    1d1a:	004007b7          	lui	a5,0x400
    1d1e:	4701                	li	a4,0
    1d20:	7ff00413          	li	s0,2047
    1d24:	ae05                	j	2054 <__subdf3+0x590>
    1d26:	7ff00613          	li	a2,2047
    1d2a:	32c68163          	beq	a3,a2,204c <__subdf3+0x588>
    1d2e:	933a                	add	t1,t1,a4
    1d30:	95be                	add	a1,a1,a5
    1d32:	00e337b3          	sltu	a5,t1,a4
    1d36:	95be                	add	a1,a1,a5
    1d38:	01f59793          	slli	a5,a1,0x1f
    1d3c:	00135313          	srli	t1,t1,0x1
    1d40:	0067e733          	or	a4,a5,t1
    1d44:	8436                	mv	s0,a3
    1d46:	0015d793          	srli	a5,a1,0x1
    1d4a:	b521                	j	1b52 <__subdf3+0x8e>
    1d4c:	0ca05763          	blez	a0,1e1a <__subdf3+0x356>
    1d50:	08029163          	bnez	t0,1dd2 <__subdf3+0x30e>
    1d54:	0065e6b3          	or	a3,a1,t1
    1d58:	de068de3          	beqz	a3,1b52 <__subdf3+0x8e>
    1d5c:	fff40513          	addi	a0,s0,-1
    1d60:	e911                	bnez	a0,1d74 <__subdf3+0x2b0>
    1d62:	40670333          	sub	t1,a4,t1
    1d66:	00673733          	sltu	a4,a4,t1
    1d6a:	8f8d                	sub	a5,a5,a1
    1d6c:	8f99                	sub	a5,a5,a4
    1d6e:	871a                	mv	a4,t1
    1d70:	4405                	li	s0,1
    1d72:	a0b1                	j	1dbe <__subdf3+0x2fa>
    1d74:	7ff00693          	li	a3,2047
    1d78:	dcd40de3          	beq	s0,a3,1b52 <__subdf3+0x8e>
    1d7c:	03800693          	li	a3,56
    1d80:	08a6c863          	blt	a3,a0,1e10 <__subdf3+0x34c>
    1d84:	46fd                	li	a3,31
    1d86:	04a6ce63          	blt	a3,a0,1de2 <__subdf3+0x31e>
    1d8a:	02000613          	li	a2,32
    1d8e:	8e09                	sub	a2,a2,a0
    1d90:	00c596b3          	sll	a3,a1,a2
    1d94:	00a352b3          	srl	t0,t1,a0
    1d98:	00c31333          	sll	t1,t1,a2
    1d9c:	0056e6b3          	or	a3,a3,t0
    1da0:	00603333          	snez	t1,t1
    1da4:	0066e333          	or	t1,a3,t1
    1da8:	00a5d5b3          	srl	a1,a1,a0
    1dac:	40670333          	sub	t1,a4,t1
    1db0:	40b785b3          	sub	a1,a5,a1
    1db4:	006737b3          	sltu	a5,a4,t1
    1db8:	40f587b3          	sub	a5,a1,a5
    1dbc:	871a                	mv	a4,t1
    1dbe:	00879693          	slli	a3,a5,0x8
    1dc2:	d806d8e3          	bgez	a3,1b52 <__subdf3+0x8e>
    1dc6:	00800637          	lui	a2,0x800
    1dca:	167d                	addi	a2,a2,-1
    1dcc:	8e7d                	and	a2,a2,a5
    1dce:	82ba                	mv	t0,a4
    1dd0:	a26d                	j	1f7a <__subdf3+0x4b6>
    1dd2:	7ff00693          	li	a3,2047
    1dd6:	d6d40ee3          	beq	s0,a3,1b52 <__subdf3+0x8e>
    1dda:	008006b7          	lui	a3,0x800
    1dde:	8dd5                	or	a1,a1,a3
    1de0:	bf71                	j	1d7c <__subdf3+0x2b8>
    1de2:	fe050693          	addi	a3,a0,-32
    1de6:	02000293          	li	t0,32
    1dea:	00d5d6b3          	srl	a3,a1,a3
    1dee:	4601                	li	a2,0
    1df0:	00550863          	beq	a0,t0,1e00 <__subdf3+0x33c>
    1df4:	04000613          	li	a2,64
    1df8:	40a60533          	sub	a0,a2,a0
    1dfc:	00a59633          	sll	a2,a1,a0
    1e00:	00666333          	or	t1,a2,t1
    1e04:	00603333          	snez	t1,t1
    1e08:	0066e333          	or	t1,a3,t1
    1e0c:	4581                	li	a1,0
    1e0e:	bf79                	j	1dac <__subdf3+0x2e8>
    1e10:	0065e333          	or	t1,a1,t1
    1e14:	00603333          	snez	t1,t1
    1e18:	bfd5                	j	1e0c <__subdf3+0x348>
    1e1a:	c171                	beqz	a0,1ede <__subdf3+0x41a>
    1e1c:	40828533          	sub	a0,t0,s0
    1e20:	e81d                	bnez	s0,1e56 <__subdf3+0x392>
    1e22:	00e7e633          	or	a2,a5,a4
    1e26:	28060463          	beqz	a2,20ae <__subdf3+0x5ea>
    1e2a:	fff50613          	addi	a2,a0,-1
    1e2e:	ea19                	bnez	a2,1e44 <__subdf3+0x380>
    1e30:	40e30733          	sub	a4,t1,a4
    1e34:	40f587b3          	sub	a5,a1,a5
    1e38:	00e33333          	sltu	t1,t1,a4
    1e3c:	406787b3          	sub	a5,a5,t1
    1e40:	84b6                	mv	s1,a3
    1e42:	b73d                	j	1d70 <__subdf3+0x2ac>
    1e44:	7ff00393          	li	t2,2047
    1e48:	00751f63          	bne	a0,t2,1e66 <__subdf3+0x3a2>
    1e4c:	87ae                	mv	a5,a1
    1e4e:	871a                	mv	a4,t1
    1e50:	7ff00413          	li	s0,2047
    1e54:	a065                	j	1efc <__subdf3+0x438>
    1e56:	7ff00613          	li	a2,2047
    1e5a:	fec289e3          	beq	t0,a2,1e4c <__subdf3+0x388>
    1e5e:	00800637          	lui	a2,0x800
    1e62:	8fd1                	or	a5,a5,a2
    1e64:	862a                	mv	a2,a0
    1e66:	03800513          	li	a0,56
    1e6a:	06c54663          	blt	a0,a2,1ed6 <__subdf3+0x412>
    1e6e:	457d                	li	a0,31
    1e70:	02c54d63          	blt	a0,a2,1eaa <__subdf3+0x3e6>
    1e74:	02000393          	li	t2,32
    1e78:	40c383b3          	sub	t2,t2,a2
    1e7c:	00c75433          	srl	s0,a4,a2
    1e80:	00779533          	sll	a0,a5,t2
    1e84:	00771733          	sll	a4,a4,t2
    1e88:	8d41                	or	a0,a0,s0
    1e8a:	00e03733          	snez	a4,a4
    1e8e:	8f49                	or	a4,a4,a0
    1e90:	00c7d633          	srl	a2,a5,a2
    1e94:	40e30733          	sub	a4,t1,a4
    1e98:	40c587b3          	sub	a5,a1,a2
    1e9c:	00e33333          	sltu	t1,t1,a4
    1ea0:	406787b3          	sub	a5,a5,t1
    1ea4:	8416                	mv	s0,t0
    1ea6:	84b6                	mv	s1,a3
    1ea8:	bf19                	j	1dbe <__subdf3+0x2fa>
    1eaa:	fe060513          	addi	a0,a2,-32 # 7fffe0 <__ctor_end__+0x7f9f18>
    1eae:	02000413          	li	s0,32
    1eb2:	00a7d533          	srl	a0,a5,a0
    1eb6:	4381                	li	t2,0
    1eb8:	00860863          	beq	a2,s0,1ec8 <__subdf3+0x404>
    1ebc:	04000393          	li	t2,64
    1ec0:	40c38633          	sub	a2,t2,a2
    1ec4:	00c793b3          	sll	t2,a5,a2
    1ec8:	00e3e733          	or	a4,t2,a4
    1ecc:	00e03733          	snez	a4,a4
    1ed0:	8f49                	or	a4,a4,a0
    1ed2:	4601                	li	a2,0
    1ed4:	b7c1                	j	1e94 <__subdf3+0x3d0>
    1ed6:	8f5d                	or	a4,a4,a5
    1ed8:	00e03733          	snez	a4,a4
    1edc:	bfdd                	j	1ed2 <__subdf3+0x40e>
    1ede:	00140613          	addi	a2,s0,1
    1ee2:	7fe67613          	andi	a2,a2,2046
    1ee6:	e635                	bnez	a2,1f52 <__subdf3+0x48e>
    1ee8:	00e7e533          	or	a0,a5,a4
    1eec:	0065e633          	or	a2,a1,t1
    1ef0:	e431                	bnez	s0,1f3c <__subdf3+0x478>
    1ef2:	e519                	bnez	a0,1f00 <__subdf3+0x43c>
    1ef4:	1c060163          	beqz	a2,20b6 <__subdf3+0x5f2>
    1ef8:	87ae                	mv	a5,a1
    1efa:	871a                	mv	a4,t1
    1efc:	84b6                	mv	s1,a3
    1efe:	b991                	j	1b52 <__subdf3+0x8e>
    1f00:	c40609e3          	beqz	a2,1b52 <__subdf3+0x8e>
    1f04:	40670533          	sub	a0,a4,t1
    1f08:	00a732b3          	sltu	t0,a4,a0
    1f0c:	40b78633          	sub	a2,a5,a1
    1f10:	40560633          	sub	a2,a2,t0
    1f14:	00861293          	slli	t0,a2,0x8
    1f18:	0002db63          	bgez	t0,1f2e <__subdf3+0x46a>
    1f1c:	40e30733          	sub	a4,t1,a4
    1f20:	40f587b3          	sub	a5,a1,a5
    1f24:	00e33333          	sltu	t1,t1,a4
    1f28:	406787b3          	sub	a5,a5,t1
    1f2c:	bfc1                	j	1efc <__subdf3+0x438>
    1f2e:	00c56733          	or	a4,a0,a2
    1f32:	18070663          	beqz	a4,20be <__subdf3+0x5fa>
    1f36:	87b2                	mv	a5,a2
    1f38:	872a                	mv	a4,a0
    1f3a:	b921                	j	1b52 <__subdf3+0x8e>
    1f3c:	e909                	bnez	a0,1f4e <__subdf3+0x48a>
    1f3e:	18060263          	beqz	a2,20c2 <__subdf3+0x5fe>
    1f42:	87ae                	mv	a5,a1
    1f44:	871a                	mv	a4,t1
    1f46:	84b6                	mv	s1,a3
    1f48:	7ff00413          	li	s0,2047
    1f4c:	b119                	j	1b52 <__subdf3+0x8e>
    1f4e:	de6d                	beqz	a2,1f48 <__subdf3+0x484>
    1f50:	b3e1                	j	1d18 <__subdf3+0x254>
    1f52:	406702b3          	sub	t0,a4,t1
    1f56:	00573533          	sltu	a0,a4,t0
    1f5a:	40b78633          	sub	a2,a5,a1
    1f5e:	8e09                	sub	a2,a2,a0
    1f60:	00861513          	slli	a0,a2,0x8
    1f64:	06055c63          	bgez	a0,1fdc <__subdf3+0x518>
    1f68:	40e302b3          	sub	t0,t1,a4
    1f6c:	40f587b3          	sub	a5,a1,a5
    1f70:	00533333          	sltu	t1,t1,t0
    1f74:	40678633          	sub	a2,a5,t1
    1f78:	84b6                	mv	s1,a3
    1f7a:	c63d                	beqz	a2,1fe8 <__subdf3+0x524>
    1f7c:	8532                	mv	a0,a2
    1f7e:	c216                	sw	t0,4(sp)
    1f80:	c032                	sw	a2,0(sp)
    1f82:	2c39                	jal	21a0 <__clzsi2>
    1f84:	4602                	lw	a2,0(sp)
    1f86:	4292                	lw	t0,4(sp)
    1f88:	ff850693          	addi	a3,a0,-8
    1f8c:	47fd                	li	a5,31
    1f8e:	06d7c663          	blt	a5,a3,1ffa <__subdf3+0x536>
    1f92:	02000793          	li	a5,32
    1f96:	8f95                	sub	a5,a5,a3
    1f98:	00d61633          	sll	a2,a2,a3
    1f9c:	00f2d7b3          	srl	a5,t0,a5
    1fa0:	8e5d                	or	a2,a2,a5
    1fa2:	00d29733          	sll	a4,t0,a3
    1fa6:	0886c663          	blt	a3,s0,2032 <__subdf3+0x56e>
    1faa:	40868433          	sub	s0,a3,s0
    1fae:	00140593          	addi	a1,s0,1
    1fb2:	47fd                	li	a5,31
    1fb4:	04b7c963          	blt	a5,a1,2006 <__subdf3+0x542>
    1fb8:	02000513          	li	a0,32
    1fbc:	8d0d                	sub	a0,a0,a1
    1fbe:	00b757b3          	srl	a5,a4,a1
    1fc2:	00a616b3          	sll	a3,a2,a0
    1fc6:	8edd                	or	a3,a3,a5
    1fc8:	00a717b3          	sll	a5,a4,a0
    1fcc:	00f037b3          	snez	a5,a5
    1fd0:	00f6e733          	or	a4,a3,a5
    1fd4:	00b657b3          	srl	a5,a2,a1
    1fd8:	4401                	li	s0,0
    1fda:	bea5                	j	1b52 <__subdf3+0x8e>
    1fdc:	00c2e733          	or	a4,t0,a2
    1fe0:	ff49                	bnez	a4,1f7a <__subdf3+0x4b6>
    1fe2:	4781                	li	a5,0
    1fe4:	4401                	li	s0,0
    1fe6:	a8d1                	j	20ba <__subdf3+0x5f6>
    1fe8:	8516                	mv	a0,t0
    1fea:	c232                	sw	a2,4(sp)
    1fec:	c016                	sw	t0,0(sp)
    1fee:	2a4d                	jal	21a0 <__clzsi2>
    1ff0:	02050513          	addi	a0,a0,32
    1ff4:	4612                	lw	a2,4(sp)
    1ff6:	4282                	lw	t0,0(sp)
    1ff8:	bf41                	j	1f88 <__subdf3+0x4c4>
    1ffa:	fd850613          	addi	a2,a0,-40
    1ffe:	00c29633          	sll	a2,t0,a2
    2002:	4701                	li	a4,0
    2004:	b74d                	j	1fa6 <__subdf3+0x4e2>
    2006:	1405                	addi	s0,s0,-31
    2008:	02000793          	li	a5,32
    200c:	00865433          	srl	s0,a2,s0
    2010:	4281                	li	t0,0
    2012:	00f58863          	beq	a1,a5,2022 <__subdf3+0x55e>
    2016:	04000293          	li	t0,64
    201a:	40b282b3          	sub	t0,t0,a1
    201e:	005612b3          	sll	t0,a2,t0
    2022:	005767b3          	or	a5,a4,t0
    2026:	00f037b3          	snez	a5,a5
    202a:	00f46733          	or	a4,s0,a5
    202e:	4781                	li	a5,0
    2030:	b765                	j	1fd8 <__subdf3+0x514>
    2032:	ff8007b7          	lui	a5,0xff800
    2036:	17fd                	addi	a5,a5,-1
    2038:	8c15                	sub	s0,s0,a3
    203a:	8ff1                	and	a5,a5,a2
    203c:	be19                	j	1b52 <__subdf3+0x8e>
    203e:	87ae                	mv	a5,a1
    2040:	871a                	mv	a4,t1
    2042:	8432                	mv	s0,a2
    2044:	b639                	j	1b52 <__subdf3+0x8e>
    2046:	87ae                	mv	a5,a1
    2048:	871a                	mv	a4,t1
    204a:	b621                	j	1b52 <__subdf3+0x8e>
    204c:	7ff00413          	li	s0,2047
    2050:	4781                	li	a5,0
    2052:	4701                	li	a4,0
    2054:	00879693          	slli	a3,a5,0x8
    2058:	0006db63          	bgez	a3,206e <__subdf3+0x5aa>
    205c:	0405                	addi	s0,s0,1
    205e:	7ff00693          	li	a3,2047
    2062:	06d40563          	beq	s0,a3,20cc <__subdf3+0x608>
    2066:	ff8006b7          	lui	a3,0xff800
    206a:	16fd                	addi	a3,a3,-1
    206c:	8ff5                	and	a5,a5,a3
    206e:	01d79513          	slli	a0,a5,0x1d
    2072:	830d                	srli	a4,a4,0x3
    2074:	7ff00693          	li	a3,2047
    2078:	8f49                	or	a4,a4,a0
    207a:	838d                	srli	a5,a5,0x3
    207c:	00d41963          	bne	s0,a3,208e <__subdf3+0x5ca>
    2080:	8f5d                	or	a4,a4,a5
    2082:	4781                	li	a5,0
    2084:	c709                	beqz	a4,208e <__subdf3+0x5ca>
    2086:	000807b7          	lui	a5,0x80
    208a:	4701                	li	a4,0
    208c:	4481                	li	s1,0
    208e:	07b2                	slli	a5,a5,0xc
    2090:	7ff47413          	andi	s0,s0,2047
    2094:	0452                	slli	s0,s0,0x14
    2096:	83b1                	srli	a5,a5,0xc
    2098:	8fc1                	or	a5,a5,s0
    209a:	40c2                	lw	ra,16(sp)
    209c:	4432                	lw	s0,12(sp)
    209e:	04fe                	slli	s1,s1,0x1f
    20a0:	0097e6b3          	or	a3,a5,s1
    20a4:	853a                	mv	a0,a4
    20a6:	44a2                	lw	s1,8(sp)
    20a8:	85b6                	mv	a1,a3
    20aa:	0151                	addi	sp,sp,20
    20ac:	8082                	ret
    20ae:	87ae                	mv	a5,a1
    20b0:	871a                	mv	a4,t1
    20b2:	842a                	mv	s0,a0
    20b4:	b5a1                	j	1efc <__subdf3+0x438>
    20b6:	4781                	li	a5,0
    20b8:	4701                	li	a4,0
    20ba:	4481                	li	s1,0
    20bc:	bf61                	j	2054 <__subdf3+0x590>
    20be:	4781                	li	a5,0
    20c0:	bfed                	j	20ba <__subdf3+0x5f6>
    20c2:	4701                	li	a4,0
    20c4:	4481                	li	s1,0
    20c6:	004007b7          	lui	a5,0x400
    20ca:	b999                	j	1d20 <__subdf3+0x25c>
    20cc:	4781                	li	a5,0
    20ce:	4701                	li	a4,0
    20d0:	bf79                	j	206e <__subdf3+0x5aa>

000020d2 <__fixdfsi>:
    20d2:	0145d713          	srli	a4,a1,0x14
    20d6:	001006b7          	lui	a3,0x100
    20da:	fff68793          	addi	a5,a3,-1 # fffff <__ctor_end__+0xf9f37>
    20de:	7ff77713          	andi	a4,a4,2047
    20e2:	3fe00613          	li	a2,1022
    20e6:	8fed                	and	a5,a5,a1
    20e8:	81fd                	srli	a1,a1,0x1f
    20ea:	04e65463          	bge	a2,a4,2132 <__fixdfsi+0x60>
    20ee:	41d00613          	li	a2,1053
    20f2:	00e65863          	bge	a2,a4,2102 <__fixdfsi+0x30>
    20f6:	80000537          	lui	a0,0x80000
    20fa:	fff54513          	not	a0,a0
    20fe:	952e                	add	a0,a0,a1
    2100:	8082                	ret
    2102:	8fd5                	or	a5,a5,a3
    2104:	43300693          	li	a3,1075
    2108:	8e99                	sub	a3,a3,a4
    210a:	467d                	li	a2,31
    210c:	00d64d63          	blt	a2,a3,2126 <__fixdfsi+0x54>
    2110:	bed70713          	addi	a4,a4,-1043
    2114:	00e797b3          	sll	a5,a5,a4
    2118:	00d55533          	srl	a0,a0,a3
    211c:	8d5d                	or	a0,a0,a5
    211e:	c999                	beqz	a1,2134 <__fixdfsi+0x62>
    2120:	40a00533          	neg	a0,a0
    2124:	8082                	ret
    2126:	41300513          	li	a0,1043
    212a:	8d19                	sub	a0,a0,a4
    212c:	00a7d533          	srl	a0,a5,a0
    2130:	b7fd                	j	211e <__fixdfsi+0x4c>
    2132:	4501                	li	a0,0
    2134:	8082                	ret

00002136 <__floatsidf>:
    2136:	1151                	addi	sp,sp,-12
    2138:	c406                	sw	ra,8(sp)
    213a:	c222                	sw	s0,4(sp)
    213c:	c026                	sw	s1,0(sp)
    213e:	cd21                	beqz	a0,2196 <__floatsidf+0x60>
    2140:	41f55793          	srai	a5,a0,0x1f
    2144:	00a7c433          	xor	s0,a5,a0
    2148:	8c1d                	sub	s0,s0,a5
    214a:	01f55493          	srli	s1,a0,0x1f
    214e:	8522                	mv	a0,s0
    2150:	2881                	jal	21a0 <__clzsi2>
    2152:	41e00713          	li	a4,1054
    2156:	47a9                	li	a5,10
    2158:	8f09                	sub	a4,a4,a0
    215a:	02a7c963          	blt	a5,a0,218c <__floatsidf+0x56>
    215e:	47ad                	li	a5,11
    2160:	8f89                	sub	a5,a5,a0
    2162:	0555                	addi	a0,a0,21
    2164:	00f457b3          	srl	a5,s0,a5
    2168:	00a41433          	sll	s0,s0,a0
    216c:	07b2                	slli	a5,a5,0xc
    216e:	7ff77713          	andi	a4,a4,2047
    2172:	0752                	slli	a4,a4,0x14
    2174:	8522                	mv	a0,s0
    2176:	40a2                	lw	ra,8(sp)
    2178:	4412                	lw	s0,4(sp)
    217a:	83b1                	srli	a5,a5,0xc
    217c:	04fe                	slli	s1,s1,0x1f
    217e:	8fd9                	or	a5,a5,a4
    2180:	0097e733          	or	a4,a5,s1
    2184:	85ba                	mv	a1,a4
    2186:	4482                	lw	s1,0(sp)
    2188:	0131                	addi	sp,sp,12
    218a:	8082                	ret
    218c:	1555                	addi	a0,a0,-11
    218e:	00a417b3          	sll	a5,s0,a0
    2192:	4401                	li	s0,0
    2194:	bfe1                	j	216c <__floatsidf+0x36>
    2196:	4781                	li	a5,0
    2198:	4401                	li	s0,0
    219a:	4701                	li	a4,0
    219c:	4481                	li	s1,0
    219e:	b7f9                	j	216c <__floatsidf+0x36>

000021a0 <__clzsi2>:
    21a0:	67c1                	lui	a5,0x10
    21a2:	02f57663          	bgeu	a0,a5,21ce <__clzsi2+0x2e>
    21a6:	0ff00793          	li	a5,255
    21aa:	00a7b7b3          	sltu	a5,a5,a0
    21ae:	078e                	slli	a5,a5,0x3
    21b0:	02000713          	li	a4,32
    21b4:	8f1d                	sub	a4,a4,a5
    21b6:	00f557b3          	srl	a5,a0,a5
    21ba:	00003517          	auipc	a0,0x3
    21be:	10e50513          	addi	a0,a0,270 # 52c8 <__clz_tab>
    21c2:	97aa                	add	a5,a5,a0
    21c4:	0007c503          	lbu	a0,0(a5) # 10000 <__ctor_end__+0x9f38>
    21c8:	40a70533          	sub	a0,a4,a0
    21cc:	8082                	ret
    21ce:	01000737          	lui	a4,0x1000
    21d2:	47c1                	li	a5,16
    21d4:	fce56ee3          	bltu	a0,a4,21b0 <__clzsi2+0x10>
    21d8:	47e1                	li	a5,24
    21da:	bfd9                	j	21b0 <__clzsi2+0x10>

000021dc <memmove>:
    21dc:	04a5f363          	bgeu	a1,a0,2222 <memmove+0x46>
    21e0:	00c586b3          	add	a3,a1,a2
    21e4:	02d57f63          	bgeu	a0,a3,2222 <memmove+0x46>
    21e8:	fff64593          	not	a1,a2
    21ec:	4781                	li	a5,0
    21ee:	17fd                	addi	a5,a5,-1
    21f0:	00f59363          	bne	a1,a5,21f6 <memmove+0x1a>
    21f4:	8082                	ret
    21f6:	00f68733          	add	a4,a3,a5
    21fa:	00074303          	lbu	t1,0(a4) # 1000000 <__ctor_end__+0xff9f38>
    21fe:	00c78733          	add	a4,a5,a2
    2202:	972a                	add	a4,a4,a0
    2204:	00670023          	sb	t1,0(a4)
    2208:	b7dd                	j	21ee <memmove+0x12>
    220a:	00f58733          	add	a4,a1,a5
    220e:	00074683          	lbu	a3,0(a4)
    2212:	00f50733          	add	a4,a0,a5
    2216:	0785                	addi	a5,a5,1
    2218:	00d70023          	sb	a3,0(a4)
    221c:	fef617e3          	bne	a2,a5,220a <memmove+0x2e>
    2220:	8082                	ret
    2222:	4781                	li	a5,0
    2224:	bfe5                	j	221c <memmove+0x40>
	...

00002228 <memset>:
    2228:	433d                	li	t1,15
    222a:	872a                	mv	a4,a0
    222c:	02c37363          	bgeu	t1,a2,2252 <memset+0x2a>
    2230:	00f77793          	andi	a5,a4,15
    2234:	efbd                	bnez	a5,22b2 <memset+0x8a>
    2236:	e5ad                	bnez	a1,22a0 <memset+0x78>
    2238:	ff067693          	andi	a3,a2,-16
    223c:	8a3d                	andi	a2,a2,15
    223e:	96ba                	add	a3,a3,a4
    2240:	c30c                	sw	a1,0(a4)
    2242:	c34c                	sw	a1,4(a4)
    2244:	c70c                	sw	a1,8(a4)
    2246:	c74c                	sw	a1,12(a4)
    2248:	0741                	addi	a4,a4,16
    224a:	fed76be3          	bltu	a4,a3,2240 <memset+0x18>
    224e:	e211                	bnez	a2,2252 <memset+0x2a>
    2250:	8082                	ret
    2252:	40c306b3          	sub	a3,t1,a2
    2256:	068a                	slli	a3,a3,0x2
    2258:	00000297          	auipc	t0,0x0
    225c:	9696                	add	a3,a3,t0
    225e:	00a68067          	jr	10(a3)
    2262:	00b70723          	sb	a1,14(a4)
    2266:	00b706a3          	sb	a1,13(a4)
    226a:	00b70623          	sb	a1,12(a4)
    226e:	00b705a3          	sb	a1,11(a4)
    2272:	00b70523          	sb	a1,10(a4)
    2276:	00b704a3          	sb	a1,9(a4)
    227a:	00b70423          	sb	a1,8(a4)
    227e:	00b703a3          	sb	a1,7(a4)
    2282:	00b70323          	sb	a1,6(a4)
    2286:	00b702a3          	sb	a1,5(a4)
    228a:	00b70223          	sb	a1,4(a4)
    228e:	00b701a3          	sb	a1,3(a4)
    2292:	00b70123          	sb	a1,2(a4)
    2296:	00b700a3          	sb	a1,1(a4)
    229a:	00b70023          	sb	a1,0(a4)
    229e:	8082                	ret
    22a0:	0ff5f593          	andi	a1,a1,255
    22a4:	00859693          	slli	a3,a1,0x8
    22a8:	8dd5                	or	a1,a1,a3
    22aa:	01059693          	slli	a3,a1,0x10
    22ae:	8dd5                	or	a1,a1,a3
    22b0:	b761                	j	2238 <memset+0x10>
    22b2:	00279693          	slli	a3,a5,0x2
    22b6:	00000297          	auipc	t0,0x0
    22ba:	9696                	add	a3,a3,t0
    22bc:	8286                	mv	t0,ra
    22be:	fa8680e7          	jalr	-88(a3)
    22c2:	8096                	mv	ra,t0
    22c4:	17c1                	addi	a5,a5,-16
    22c6:	8f1d                	sub	a4,a4,a5
    22c8:	963e                	add	a2,a2,a5
    22ca:	f8c374e3          	bgeu	t1,a2,2252 <memset+0x2a>
    22ce:	b7a5                	j	2236 <memset+0xe>
	...

000022d2 <strchr>:
    22d2:	0ff5f593          	andi	a1,a1,255
    22d6:	00054783          	lbu	a5,0(a0)
    22da:	c791                	beqz	a5,22e6 <strchr+0x14>
    22dc:	00b79363          	bne	a5,a1,22e2 <strchr+0x10>
    22e0:	8082                	ret
    22e2:	0505                	addi	a0,a0,1
    22e4:	bfcd                	j	22d6 <strchr+0x4>
    22e6:	c191                	beqz	a1,22ea <strchr+0x18>
    22e8:	4501                	li	a0,0
    22ea:	8082                	ret

000022ec <strcpy>:
    22ec:	87aa                	mv	a5,a0
    22ee:	0005c703          	lbu	a4,0(a1)
    22f2:	0785                	addi	a5,a5,1
    22f4:	0585                	addi	a1,a1,1
    22f6:	fee78fa3          	sb	a4,-1(a5)
    22fa:	fb75                	bnez	a4,22ee <strcpy+0x2>
    22fc:	8082                	ret

000022fe <_strerror_r>:
    22fe:	87ae                	mv	a5,a1
    2300:	08e00713          	li	a4,142
    2304:	85b2                	mv	a1,a2
    2306:	32f76763          	bltu	a4,a5,2634 <_strerror_r+0x336>
    230a:	00003317          	auipc	t1,0x3
    230e:	0be30313          	addi	t1,t1,190 # 53c8 <__clz_tab+0x100>
    2312:	00279613          	slli	a2,a5,0x2
    2316:	961a                	add	a2,a2,t1
    2318:	4218                	lw	a4,0(a2)
    231a:	971a                	add	a4,a4,t1
    231c:	8702                	jr	a4
    231e:	00003517          	auipc	a0,0x3
    2322:	69a50513          	addi	a0,a0,1690 # 59b8 <pad_line+0x20>
    2326:	8082                	ret
    2328:	00003517          	auipc	a0,0x3
    232c:	69c50513          	addi	a0,a0,1692 # 59c4 <pad_line+0x2c>
    2330:	8082                	ret
    2332:	00003517          	auipc	a0,0x3
    2336:	6ae50513          	addi	a0,a0,1710 # 59e0 <pad_line+0x48>
    233a:	8082                	ret
    233c:	00003517          	auipc	a0,0x3
    2340:	6b450513          	addi	a0,a0,1716 # 59f0 <pad_line+0x58>
    2344:	8082                	ret
    2346:	00003517          	auipc	a0,0x3
    234a:	6c250513          	addi	a0,a0,1730 # 5a08 <pad_line+0x70>
    234e:	8082                	ret
    2350:	00003517          	auipc	a0,0x3
    2354:	6c450513          	addi	a0,a0,1732 # 5a14 <pad_line+0x7c>
    2358:	8082                	ret
    235a:	00003517          	auipc	a0,0x3
    235e:	6d650513          	addi	a0,a0,1750 # 5a30 <pad_line+0x98>
    2362:	8082                	ret
    2364:	00003517          	auipc	a0,0x3
    2368:	6e050513          	addi	a0,a0,1760 # 5a44 <pad_line+0xac>
    236c:	8082                	ret
    236e:	00003517          	auipc	a0,0x3
    2372:	6ea50513          	addi	a0,a0,1770 # 5a58 <pad_line+0xc0>
    2376:	8082                	ret
    2378:	00003517          	auipc	a0,0x3
    237c:	6fc50513          	addi	a0,a0,1788 # 5a74 <pad_line+0xdc>
    2380:	8082                	ret
    2382:	00003517          	auipc	a0,0x3
    2386:	70250513          	addi	a0,a0,1794 # 5a84 <pad_line+0xec>
    238a:	8082                	ret
    238c:	00003517          	auipc	a0,0x3
    2390:	70450513          	addi	a0,a0,1796 # 5a90 <pad_line+0xf8>
    2394:	8082                	ret
    2396:	00003517          	auipc	a0,0x3
    239a:	71a50513          	addi	a0,a0,1818 # 5ab0 <pad_line+0x118>
    239e:	8082                	ret
    23a0:	00003517          	auipc	a0,0x3
    23a4:	72450513          	addi	a0,a0,1828 # 5ac4 <pad_line+0x12c>
    23a8:	8082                	ret
    23aa:	00003517          	auipc	a0,0x3
    23ae:	72e50513          	addi	a0,a0,1838 # 5ad8 <pad_line+0x140>
    23b2:	8082                	ret
    23b4:	00003517          	auipc	a0,0x3
    23b8:	73850513          	addi	a0,a0,1848 # 5aec <pad_line+0x154>
    23bc:	8082                	ret
    23be:	00003517          	auipc	a0,0x3
    23c2:	73a50513          	addi	a0,a0,1850 # 5af8 <pad_line+0x160>
    23c6:	8082                	ret
    23c8:	00003517          	auipc	a0,0x3
    23cc:	74850513          	addi	a0,a0,1864 # 5b10 <pad_line+0x178>
    23d0:	8082                	ret
    23d2:	00003517          	auipc	a0,0x3
    23d6:	74a50513          	addi	a0,a0,1866 # 5b1c <pad_line+0x184>
    23da:	8082                	ret
    23dc:	00003517          	auipc	a0,0x3
    23e0:	75450513          	addi	a0,a0,1876 # 5b30 <pad_line+0x198>
    23e4:	8082                	ret
    23e6:	00003517          	auipc	a0,0x3
    23ea:	75a50513          	addi	a0,a0,1882 # 5b40 <pad_line+0x1a8>
    23ee:	8082                	ret
    23f0:	00003517          	auipc	a0,0x3
    23f4:	76050513          	addi	a0,a0,1888 # 5b50 <pad_line+0x1b8>
    23f8:	8082                	ret
    23fa:	00003517          	auipc	a0,0x3
    23fe:	76650513          	addi	a0,a0,1894 # 5b60 <pad_line+0x1c8>
    2402:	8082                	ret
    2404:	00003517          	auipc	a0,0x3
    2408:	77c50513          	addi	a0,a0,1916 # 5b80 <pad_line+0x1e8>
    240c:	8082                	ret
    240e:	00003517          	auipc	a0,0x3
    2412:	78250513          	addi	a0,a0,1922 # 5b90 <pad_line+0x1f8>
    2416:	8082                	ret
    2418:	00003517          	auipc	a0,0x3
    241c:	78c50513          	addi	a0,a0,1932 # 5ba4 <pad_line+0x20c>
    2420:	8082                	ret
    2422:	00003517          	auipc	a0,0x3
    2426:	7a650513          	addi	a0,a0,1958 # 5bc8 <pad_line+0x230>
    242a:	8082                	ret
    242c:	00003517          	auipc	a0,0x3
    2430:	7bc50513          	addi	a0,a0,1980 # 5be8 <pad_line+0x250>
    2434:	8082                	ret
    2436:	00003517          	auipc	a0,0x3
    243a:	7d250513          	addi	a0,a0,2002 # 5c08 <pad_line+0x270>
    243e:	8082                	ret
    2440:	00003517          	auipc	a0,0x3
    2444:	7e850513          	addi	a0,a0,2024 # 5c28 <pad_line+0x290>
    2448:	8082                	ret
    244a:	00003517          	auipc	a0,0x3
    244e:	7f650513          	addi	a0,a0,2038 # 5c40 <pad_line+0x2a8>
    2452:	8082                	ret
    2454:	00003517          	auipc	a0,0x3
    2458:	7fc50513          	addi	a0,a0,2044 # 5c50 <pad_line+0x2b8>
    245c:	8082                	ret
    245e:	00004517          	auipc	a0,0x4
    2462:	80250513          	addi	a0,a0,-2046 # 5c60 <pad_line+0x2c8>
    2466:	8082                	ret
    2468:	00004517          	auipc	a0,0x4
    246c:	80c50513          	addi	a0,a0,-2036 # 5c74 <pad_line+0x2dc>
    2470:	8082                	ret
    2472:	00004517          	auipc	a0,0x4
    2476:	81a50513          	addi	a0,a0,-2022 # 5c8c <pad_line+0x2f4>
    247a:	8082                	ret
    247c:	00004517          	auipc	a0,0x4
    2480:	82050513          	addi	a0,a0,-2016 # 5c9c <pad_line+0x304>
    2484:	8082                	ret
    2486:	00004517          	auipc	a0,0x4
    248a:	82650513          	addi	a0,a0,-2010 # 5cac <pad_line+0x314>
    248e:	8082                	ret
    2490:	00004517          	auipc	a0,0x4
    2494:	83450513          	addi	a0,a0,-1996 # 5cc4 <pad_line+0x32c>
    2498:	8082                	ret
    249a:	00004517          	auipc	a0,0x4
    249e:	83a50513          	addi	a0,a0,-1990 # 5cd4 <pad_line+0x33c>
    24a2:	8082                	ret
    24a4:	00004517          	auipc	a0,0x4
    24a8:	83c50513          	addi	a0,a0,-1988 # 5ce0 <pad_line+0x348>
    24ac:	8082                	ret
    24ae:	00004517          	auipc	a0,0x4
    24b2:	86250513          	addi	a0,a0,-1950 # 5d10 <pad_line+0x378>
    24b6:	8082                	ret
    24b8:	00004517          	auipc	a0,0x4
    24bc:	86c50513          	addi	a0,a0,-1940 # 5d24 <pad_line+0x38c>
    24c0:	8082                	ret
    24c2:	00004517          	auipc	a0,0x4
    24c6:	87e50513          	addi	a0,a0,-1922 # 5d40 <pad_line+0x3a8>
    24ca:	8082                	ret
    24cc:	00004517          	auipc	a0,0x4
    24d0:	88850513          	addi	a0,a0,-1912 # 5d54 <pad_line+0x3bc>
    24d4:	8082                	ret
    24d6:	00004517          	auipc	a0,0x4
    24da:	89650513          	addi	a0,a0,-1898 # 5d6c <pad_line+0x3d4>
    24de:	8082                	ret
    24e0:	00004517          	auipc	a0,0x4
    24e4:	89850513          	addi	a0,a0,-1896 # 5d78 <pad_line+0x3e0>
    24e8:	8082                	ret
    24ea:	00004517          	auipc	a0,0x4
    24ee:	8a650513          	addi	a0,a0,-1882 # 5d90 <pad_line+0x3f8>
    24f2:	8082                	ret
    24f4:	00004517          	auipc	a0,0x4
    24f8:	8a450513          	addi	a0,a0,-1884 # 5d98 <pad_line+0x400>
    24fc:	8082                	ret
    24fe:	00004517          	auipc	a0,0x4
    2502:	8aa50513          	addi	a0,a0,-1878 # 5da8 <pad_line+0x410>
    2506:	8082                	ret
    2508:	00004517          	auipc	a0,0x4
    250c:	8b850513          	addi	a0,a0,-1864 # 5dc0 <pad_line+0x428>
    2510:	8082                	ret
    2512:	00004517          	auipc	a0,0x4
    2516:	8c250513          	addi	a0,a0,-1854 # 5dd4 <pad_line+0x43c>
    251a:	8082                	ret
    251c:	00004517          	auipc	a0,0x4
    2520:	8d050513          	addi	a0,a0,-1840 # 5dec <pad_line+0x454>
    2524:	8082                	ret
    2526:	00004517          	auipc	a0,0x4
    252a:	8d650513          	addi	a0,a0,-1834 # 5dfc <pad_line+0x464>
    252e:	8082                	ret
    2530:	00004517          	auipc	a0,0x4
    2534:	8e050513          	addi	a0,a0,-1824 # 5e10 <pad_line+0x478>
    2538:	8082                	ret
    253a:	00004517          	auipc	a0,0x4
    253e:	8ea50513          	addi	a0,a0,-1814 # 5e24 <pad_line+0x48c>
    2542:	8082                	ret
    2544:	00004517          	auipc	a0,0x4
    2548:	8ec50513          	addi	a0,a0,-1812 # 5e30 <pad_line+0x498>
    254c:	8082                	ret
    254e:	00004517          	auipc	a0,0x4
    2552:	8fe50513          	addi	a0,a0,-1794 # 5e4c <pad_line+0x4b4>
    2556:	8082                	ret
    2558:	00004517          	auipc	a0,0x4
    255c:	90850513          	addi	a0,a0,-1784 # 5e60 <pad_line+0x4c8>
    2560:	8082                	ret
    2562:	00004517          	auipc	a0,0x4
    2566:	91a50513          	addi	a0,a0,-1766 # 5e7c <pad_line+0x4e4>
    256a:	8082                	ret
    256c:	00004517          	auipc	a0,0x4
    2570:	92850513          	addi	a0,a0,-1752 # 5e94 <pad_line+0x4fc>
    2574:	8082                	ret
    2576:	00004517          	auipc	a0,0x4
    257a:	93a50513          	addi	a0,a0,-1734 # 5eb0 <pad_line+0x518>
    257e:	8082                	ret
    2580:	00004517          	auipc	a0,0x4
    2584:	93850513          	addi	a0,a0,-1736 # 5eb8 <pad_line+0x520>
    2588:	8082                	ret
    258a:	00004517          	auipc	a0,0x4
    258e:	95e50513          	addi	a0,a0,-1698 # 5ee8 <pad_line+0x550>
    2592:	8082                	ret
    2594:	00004517          	auipc	a0,0x4
    2598:	97450513          	addi	a0,a0,-1676 # 5f08 <pad_line+0x570>
    259c:	8082                	ret
    259e:	00004517          	auipc	a0,0x4
    25a2:	98a50513          	addi	a0,a0,-1654 # 5f28 <pad_line+0x590>
    25a6:	8082                	ret
    25a8:	00004517          	auipc	a0,0x4
    25ac:	99850513          	addi	a0,a0,-1640 # 5f40 <pad_line+0x5a8>
    25b0:	8082                	ret
    25b2:	00004517          	auipc	a0,0x4
    25b6:	9a250513          	addi	a0,a0,-1630 # 5f54 <pad_line+0x5bc>
    25ba:	8082                	ret
    25bc:	00004517          	auipc	a0,0x4
    25c0:	9b450513          	addi	a0,a0,-1612 # 5f70 <pad_line+0x5d8>
    25c4:	8082                	ret
    25c6:	00004517          	auipc	a0,0x4
    25ca:	9c250513          	addi	a0,a0,-1598 # 5f88 <pad_line+0x5f0>
    25ce:	8082                	ret
    25d0:	00004517          	auipc	a0,0x4
    25d4:	9d050513          	addi	a0,a0,-1584 # 5fa0 <pad_line+0x608>
    25d8:	8082                	ret
    25da:	00004517          	auipc	a0,0x4
    25de:	9ea50513          	addi	a0,a0,-1558 # 5fc4 <pad_line+0x62c>
    25e2:	8082                	ret
    25e4:	00004517          	auipc	a0,0x4
    25e8:	9f850513          	addi	a0,a0,-1544 # 5fdc <pad_line+0x644>
    25ec:	8082                	ret
    25ee:	00004517          	auipc	a0,0x4
    25f2:	a0a50513          	addi	a0,a0,-1526 # 5ff8 <pad_line+0x660>
    25f6:	8082                	ret
    25f8:	00004517          	auipc	a0,0x4
    25fc:	a1450513          	addi	a0,a0,-1516 # 600c <pad_line+0x674>
    2600:	8082                	ret
    2602:	00004517          	auipc	a0,0x4
    2606:	a2250513          	addi	a0,a0,-1502 # 6024 <pad_line+0x68c>
    260a:	8082                	ret
    260c:	00004517          	auipc	a0,0x4
    2610:	a2c50513          	addi	a0,a0,-1492 # 6038 <pad_line+0x6a0>
    2614:	8082                	ret
    2616:	00004517          	auipc	a0,0x4
    261a:	a4650513          	addi	a0,a0,-1466 # 605c <pad_line+0x6c4>
    261e:	8082                	ret
    2620:	00004517          	auipc	a0,0x4
    2624:	a6450513          	addi	a0,a0,-1436 # 6084 <pad_line+0x6ec>
    2628:	8082                	ret
    262a:	00004517          	auipc	a0,0x4
    262e:	a6e50513          	addi	a0,a0,-1426 # 6098 <pad_line+0x700>
    2632:	8082                	ret
    2634:	1151                	addi	sp,sp,-12
    2636:	c406                	sw	ra,8(sp)
    2638:	e291                	bnez	a3,263c <_strerror_r+0x33e>
    263a:	86aa                	mv	a3,a0
    263c:	8636                	mv	a2,a3
    263e:	853e                	mv	a0,a5
    2640:	2e25                	jal	2978 <_user_strerror>
    2642:	e509                	bnez	a0,264c <_strerror_r+0x34e>
    2644:	00003517          	auipc	a0,0x3
    2648:	1f850513          	addi	a0,a0,504 # 583c <sg_usi_config+0x74>
    264c:	40a2                	lw	ra,8(sp)
    264e:	0131                	addi	sp,sp,12
    2650:	8082                	ret
    2652:	00004517          	auipc	a0,0x4
    2656:	a5e50513          	addi	a0,a0,-1442 # 60b0 <pad_line+0x718>
    265a:	8082                	ret

0000265c <strerror>:
    265c:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    2660:	85aa                	mv	a1,a0
    2662:	4388                	lw	a0,0(a5)
    2664:	4681                	li	a3,0
    2666:	4601                	li	a2,0
    2668:	b959                	j	22fe <_strerror_r>

0000266a <strerror_l>:
    266a:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    266e:	85aa                	mv	a1,a0
    2670:	4388                	lw	a0,0(a5)
    2672:	4681                	li	a3,0
    2674:	4601                	li	a2,0
    2676:	b161                	j	22fe <_strerror_r>

00002678 <strlen>:
    2678:	87aa                	mv	a5,a0
    267a:	0785                	addi	a5,a5,1
    267c:	fff7c703          	lbu	a4,-1(a5)
    2680:	ff6d                	bnez	a4,267a <strlen+0x2>
    2682:	40a78533          	sub	a0,a5,a0
    2686:	157d                	addi	a0,a0,-1
    2688:	8082                	ret

0000268a <_strtol_l.isra.0>:
    268a:	fdc10113          	addi	sp,sp,-36
    268e:	cc26                	sw	s1,24(sp)
    2690:	d006                	sw	ra,32(sp)
    2692:	ce22                	sw	s0,28(sp)
    2694:	c42a                	sw	a0,8(sp)
    2696:	84ae                	mv	s1,a1
    2698:	00148413          	addi	s0,s1,1
    269c:	fff44783          	lbu	a5,-1(s0)
    26a0:	853a                	mv	a0,a4
    26a2:	ca36                	sw	a3,20(sp)
    26a4:	c832                	sw	a2,16(sp)
    26a6:	c62e                	sw	a1,12(sp)
    26a8:	c23e                	sw	a5,4(sp)
    26aa:	c03a                	sw	a4,0(sp)
    26ac:	2e1d                	jal	29e2 <__locale_ctype_ptr_l>
    26ae:	4792                	lw	a5,4(sp)
    26b0:	4702                	lw	a4,0(sp)
    26b2:	45b2                	lw	a1,12(sp)
    26b4:	953e                	add	a0,a0,a5
    26b6:	00154503          	lbu	a0,1(a0)
    26ba:	4642                	lw	a2,16(sp)
    26bc:	46d2                	lw	a3,20(sp)
    26be:	8921                	andi	a0,a0,8
    26c0:	ed51                	bnez	a0,275c <_strtol_l.isra.0+0xd2>
    26c2:	02d00713          	li	a4,45
    26c6:	08e79d63          	bne	a5,a4,2760 <_strtol_l.isra.0+0xd6>
    26ca:	00044783          	lbu	a5,0(s0)
    26ce:	4385                	li	t2,1
    26d0:	00248413          	addi	s0,s1,2
    26d4:	cae5                	beqz	a3,27c4 <_strtol_l.isra.0+0x13a>
    26d6:	4741                	li	a4,16
    26d8:	02e69263          	bne	a3,a4,26fc <_strtol_l.isra.0+0x72>
    26dc:	03000713          	li	a4,48
    26e0:	00e79e63          	bne	a5,a4,26fc <_strtol_l.isra.0+0x72>
    26e4:	00044783          	lbu	a5,0(s0)
    26e8:	05800713          	li	a4,88
    26ec:	0df7f793          	andi	a5,a5,223
    26f0:	0ce79563          	bne	a5,a4,27ba <_strtol_l.isra.0+0x130>
    26f4:	00144783          	lbu	a5,1(s0)
    26f8:	46c1                	li	a3,16
    26fa:	0409                	addi	s0,s0,2
    26fc:	800002b7          	lui	t0,0x80000
    2700:	00039463          	bnez	t2,2708 <_strtol_l.isra.0+0x7e>
    2704:	fff2c293          	not	t0,t0
    2708:	02d2f733          	remu	a4,t0,a3
    270c:	4301                	li	t1,0
    270e:	4501                	li	a0,0
    2710:	c23a                	sw	a4,4(sp)
    2712:	02d2d733          	divu	a4,t0,a3
    2716:	c03a                	sw	a4,0(sp)
    2718:	fd078713          	addi	a4,a5,-48
    271c:	44a5                	li	s1,9
    271e:	00e4f963          	bgeu	s1,a4,2730 <_strtol_l.isra.0+0xa6>
    2722:	fbf78713          	addi	a4,a5,-65
    2726:	44e5                	li	s1,25
    2728:	04e4e763          	bltu	s1,a4,2776 <_strtol_l.isra.0+0xec>
    272c:	fc978713          	addi	a4,a5,-55
    2730:	04d75b63          	bge	a4,a3,2786 <_strtol_l.isra.0+0xfc>
    2734:	57fd                	li	a5,-1
    2736:	00f30f63          	beq	t1,a5,2754 <_strtol_l.isra.0+0xca>
    273a:	4782                	lw	a5,0(sp)
    273c:	537d                	li	t1,-1
    273e:	00a7eb63          	bltu	a5,a0,2754 <_strtol_l.isra.0+0xca>
    2742:	00a79563          	bne	a5,a0,274c <_strtol_l.isra.0+0xc2>
    2746:	4792                	lw	a5,4(sp)
    2748:	00e7c663          	blt	a5,a4,2754 <_strtol_l.isra.0+0xca>
    274c:	02a68533          	mul	a0,a3,a0
    2750:	4305                	li	t1,1
    2752:	953a                	add	a0,a0,a4
    2754:	0405                	addi	s0,s0,1
    2756:	fff44783          	lbu	a5,-1(s0)
    275a:	bf7d                	j	2718 <_strtol_l.isra.0+0x8e>
    275c:	84a2                	mv	s1,s0
    275e:	bf2d                	j	2698 <_strtol_l.isra.0+0xe>
    2760:	02b00713          	li	a4,43
    2764:	00e78463          	beq	a5,a4,276c <_strtol_l.isra.0+0xe2>
    2768:	4381                	li	t2,0
    276a:	b7ad                	j	26d4 <_strtol_l.isra.0+0x4a>
    276c:	00044783          	lbu	a5,0(s0)
    2770:	00248413          	addi	s0,s1,2
    2774:	bfd5                	j	2768 <_strtol_l.isra.0+0xde>
    2776:	f9f78713          	addi	a4,a5,-97
    277a:	44e5                	li	s1,25
    277c:	00e4e563          	bltu	s1,a4,2786 <_strtol_l.isra.0+0xfc>
    2780:	fa978713          	addi	a4,a5,-87
    2784:	b775                	j	2730 <_strtol_l.isra.0+0xa6>
    2786:	57fd                	li	a5,-1
    2788:	00f31e63          	bne	t1,a5,27a4 <_strtol_l.isra.0+0x11a>
    278c:	4722                	lw	a4,8(sp)
    278e:	02200793          	li	a5,34
    2792:	8516                	mv	a0,t0
    2794:	c31c                	sw	a5,0(a4)
    2796:	ee11                	bnez	a2,27b2 <_strtol_l.isra.0+0x128>
    2798:	5082                	lw	ra,32(sp)
    279a:	4472                	lw	s0,28(sp)
    279c:	44e2                	lw	s1,24(sp)
    279e:	02410113          	addi	sp,sp,36
    27a2:	8082                	ret
    27a4:	00038463          	beqz	t2,27ac <_strtol_l.isra.0+0x122>
    27a8:	40a00533          	neg	a0,a0
    27ac:	d675                	beqz	a2,2798 <_strtol_l.isra.0+0x10e>
    27ae:	00030463          	beqz	t1,27b6 <_strtol_l.isra.0+0x12c>
    27b2:	fff40593          	addi	a1,s0,-1
    27b6:	c20c                	sw	a1,0(a2)
    27b8:	b7c5                	j	2798 <_strtol_l.isra.0+0x10e>
    27ba:	03000793          	li	a5,48
    27be:	fe9d                	bnez	a3,26fc <_strtol_l.isra.0+0x72>
    27c0:	46a1                	li	a3,8
    27c2:	bf2d                	j	26fc <_strtol_l.isra.0+0x72>
    27c4:	03000713          	li	a4,48
    27c8:	f0e78ee3          	beq	a5,a4,26e4 <_strtol_l.isra.0+0x5a>
    27cc:	46a9                	li	a3,10
    27ce:	b73d                	j	26fc <_strtol_l.isra.0+0x72>

000027d0 <_strtol_r>:
    27d0:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    27d4:	439c                	lw	a5,0(a5)
    27d6:	5bd8                	lw	a4,52(a5)
    27d8:	e319                	bnez	a4,27de <_strtol_r+0xe>
    27da:	e9418713          	addi	a4,gp,-364 # 200004f0 <__global_locale>
    27de:	b575                	j	268a <_strtol_l.isra.0>

000027e0 <strtol_l>:
    27e0:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    27e4:	8736                	mv	a4,a3
    27e6:	86b2                	mv	a3,a2
    27e8:	862e                	mv	a2,a1
    27ea:	85aa                	mv	a1,a0
    27ec:	4388                	lw	a0,0(a5)
    27ee:	bd71                	j	268a <_strtol_l.isra.0>

000027f0 <strtol>:
    27f0:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    27f4:	439c                	lw	a5,0(a5)
    27f6:	86b2                	mv	a3,a2
    27f8:	5bd8                	lw	a4,52(a5)
    27fa:	e319                	bnez	a4,2800 <strtol+0x10>
    27fc:	e9418713          	addi	a4,gp,-364 # 200004f0 <__global_locale>
    2800:	862e                	mv	a2,a1
    2802:	85aa                	mv	a1,a0
    2804:	853e                	mv	a0,a5
    2806:	b551                	j	268a <_strtol_l.isra.0>

00002808 <_strtoul_l.isra.0>:
    2808:	fdc10113          	addi	sp,sp,-36
    280c:	cc26                	sw	s1,24(sp)
    280e:	d006                	sw	ra,32(sp)
    2810:	ce22                	sw	s0,28(sp)
    2812:	c22a                	sw	a0,4(sp)
    2814:	84ae                	mv	s1,a1
    2816:	00148413          	addi	s0,s1,1
    281a:	fff44783          	lbu	a5,-1(s0)
    281e:	853a                	mv	a0,a4
    2820:	ca36                	sw	a3,20(sp)
    2822:	c832                	sw	a2,16(sp)
    2824:	c62e                	sw	a1,12(sp)
    2826:	c43e                	sw	a5,8(sp)
    2828:	c03a                	sw	a4,0(sp)
    282a:	2a65                	jal	29e2 <__locale_ctype_ptr_l>
    282c:	47a2                	lw	a5,8(sp)
    282e:	4702                	lw	a4,0(sp)
    2830:	45b2                	lw	a1,12(sp)
    2832:	953e                	add	a0,a0,a5
    2834:	00154503          	lbu	a0,1(a0)
    2838:	4642                	lw	a2,16(sp)
    283a:	46d2                	lw	a3,20(sp)
    283c:	8921                	andi	a0,a0,8
    283e:	e551                	bnez	a0,28ca <_strtoul_l.isra.0+0xc2>
    2840:	02d00713          	li	a4,45
    2844:	08e79563          	bne	a5,a4,28ce <_strtoul_l.isra.0+0xc6>
    2848:	00044783          	lbu	a5,0(s0)
    284c:	4285                	li	t0,1
    284e:	00248413          	addi	s0,s1,2
    2852:	c2ed                	beqz	a3,2934 <_strtoul_l.isra.0+0x12c>
    2854:	4741                	li	a4,16
    2856:	02e69263          	bne	a3,a4,287a <_strtoul_l.isra.0+0x72>
    285a:	03000713          	li	a4,48
    285e:	00e79e63          	bne	a5,a4,287a <_strtoul_l.isra.0+0x72>
    2862:	00044783          	lbu	a5,0(s0)
    2866:	05800713          	li	a4,88
    286a:	0df7f793          	andi	a5,a5,223
    286e:	0ae79e63          	bne	a5,a4,292a <_strtoul_l.isra.0+0x122>
    2872:	00144783          	lbu	a5,1(s0)
    2876:	46c1                	li	a3,16
    2878:	0409                	addi	s0,s0,2
    287a:	577d                	li	a4,-1
    287c:	02d754b3          	divu	s1,a4,a3
    2880:	4301                	li	t1,0
    2882:	4501                	li	a0,0
    2884:	02d77733          	remu	a4,a4,a3
    2888:	c03a                	sw	a4,0(sp)
    288a:	fd078713          	addi	a4,a5,-48
    288e:	43a5                	li	t2,9
    2890:	00e3f963          	bgeu	t2,a4,28a2 <_strtoul_l.isra.0+0x9a>
    2894:	fbf78713          	addi	a4,a5,-65
    2898:	43e5                	li	t2,25
    289a:	04e3e563          	bltu	t2,a4,28e4 <_strtoul_l.isra.0+0xdc>
    289e:	fc978713          	addi	a4,a5,-55
    28a2:	04d75b63          	bge	a4,a3,28f8 <_strtoul_l.isra.0+0xf0>
    28a6:	04034763          	bltz	t1,28f4 <_strtoul_l.isra.0+0xec>
    28aa:	537d                	li	t1,-1
    28ac:	00a4eb63          	bltu	s1,a0,28c2 <_strtoul_l.isra.0+0xba>
    28b0:	00a49563          	bne	s1,a0,28ba <_strtoul_l.isra.0+0xb2>
    28b4:	4782                	lw	a5,0(sp)
    28b6:	00e7c663          	blt	a5,a4,28c2 <_strtoul_l.isra.0+0xba>
    28ba:	02a68533          	mul	a0,a3,a0
    28be:	4305                	li	t1,1
    28c0:	953a                	add	a0,a0,a4
    28c2:	0405                	addi	s0,s0,1
    28c4:	fff44783          	lbu	a5,-1(s0)
    28c8:	b7c9                	j	288a <_strtoul_l.isra.0+0x82>
    28ca:	84a2                	mv	s1,s0
    28cc:	b7a9                	j	2816 <_strtoul_l.isra.0+0xe>
    28ce:	02b00713          	li	a4,43
    28d2:	00e78463          	beq	a5,a4,28da <_strtoul_l.isra.0+0xd2>
    28d6:	4281                	li	t0,0
    28d8:	bfad                	j	2852 <_strtoul_l.isra.0+0x4a>
    28da:	00044783          	lbu	a5,0(s0)
    28de:	00248413          	addi	s0,s1,2
    28e2:	bfd5                	j	28d6 <_strtoul_l.isra.0+0xce>
    28e4:	f9f78713          	addi	a4,a5,-97
    28e8:	43e5                	li	t2,25
    28ea:	00e3e763          	bltu	t2,a4,28f8 <_strtoul_l.isra.0+0xf0>
    28ee:	fa978713          	addi	a4,a5,-87
    28f2:	bf45                	j	28a2 <_strtoul_l.isra.0+0x9a>
    28f4:	537d                	li	t1,-1
    28f6:	b7f1                	j	28c2 <_strtoul_l.isra.0+0xba>
    28f8:	00035e63          	bgez	t1,2914 <_strtoul_l.isra.0+0x10c>
    28fc:	4712                	lw	a4,4(sp)
    28fe:	02200793          	li	a5,34
    2902:	557d                	li	a0,-1
    2904:	c31c                	sw	a5,0(a4)
    2906:	ee11                	bnez	a2,2922 <_strtoul_l.isra.0+0x11a>
    2908:	5082                	lw	ra,32(sp)
    290a:	4472                	lw	s0,28(sp)
    290c:	44e2                	lw	s1,24(sp)
    290e:	02410113          	addi	sp,sp,36
    2912:	8082                	ret
    2914:	00028463          	beqz	t0,291c <_strtoul_l.isra.0+0x114>
    2918:	40a00533          	neg	a0,a0
    291c:	d675                	beqz	a2,2908 <_strtoul_l.isra.0+0x100>
    291e:	00030463          	beqz	t1,2926 <_strtoul_l.isra.0+0x11e>
    2922:	fff40593          	addi	a1,s0,-1
    2926:	c20c                	sw	a1,0(a2)
    2928:	b7c5                	j	2908 <_strtoul_l.isra.0+0x100>
    292a:	03000793          	li	a5,48
    292e:	f6b1                	bnez	a3,287a <_strtoul_l.isra.0+0x72>
    2930:	46a1                	li	a3,8
    2932:	b7a1                	j	287a <_strtoul_l.isra.0+0x72>
    2934:	03000713          	li	a4,48
    2938:	f2e785e3          	beq	a5,a4,2862 <_strtoul_l.isra.0+0x5a>
    293c:	46a9                	li	a3,10
    293e:	bf35                	j	287a <_strtoul_l.isra.0+0x72>

00002940 <_strtoul_r>:
    2940:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    2944:	439c                	lw	a5,0(a5)
    2946:	5bd8                	lw	a4,52(a5)
    2948:	e319                	bnez	a4,294e <_strtoul_r+0xe>
    294a:	e9418713          	addi	a4,gp,-364 # 200004f0 <__global_locale>
    294e:	bd6d                	j	2808 <_strtoul_l.isra.0>

00002950 <strtoul_l>:
    2950:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    2954:	8736                	mv	a4,a3
    2956:	86b2                	mv	a3,a2
    2958:	862e                	mv	a2,a1
    295a:	85aa                	mv	a1,a0
    295c:	4388                	lw	a0,0(a5)
    295e:	b56d                	j	2808 <_strtoul_l.isra.0>

00002960 <strtoul>:
    2960:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    2964:	439c                	lw	a5,0(a5)
    2966:	86b2                	mv	a3,a2
    2968:	5bd8                	lw	a4,52(a5)
    296a:	e319                	bnez	a4,2970 <strtoul+0x10>
    296c:	e9418713          	addi	a4,gp,-364 # 200004f0 <__global_locale>
    2970:	862e                	mv	a2,a1
    2972:	85aa                	mv	a1,a0
    2974:	853e                	mv	a0,a5
    2976:	bd49                	j	2808 <_strtoul_l.isra.0>

00002978 <_user_strerror>:
    2978:	4501                	li	a0,0
    297a:	8082                	ret

0000297c <_setlocale_r>:
    297c:	ee11                	bnez	a2,2998 <_setlocale_r+0x1c>
    297e:	00003517          	auipc	a0,0x3
    2982:	73a50513          	addi	a0,a0,1850 # 60b8 <pad_line+0x720>
    2986:	8082                	ret
    2988:	00003517          	auipc	a0,0x3
    298c:	73050513          	addi	a0,a0,1840 # 60b8 <pad_line+0x720>
    2990:	40a2                	lw	ra,8(sp)
    2992:	4412                	lw	s0,4(sp)
    2994:	0131                	addi	sp,sp,12
    2996:	8082                	ret
    2998:	1151                	addi	sp,sp,-12
    299a:	00003597          	auipc	a1,0x3
    299e:	72258593          	addi	a1,a1,1826 # 60bc <pad_line+0x724>
    29a2:	8532                	mv	a0,a2
    29a4:	c222                	sw	s0,4(sp)
    29a6:	c406                	sw	ra,8(sp)
    29a8:	8432                	mv	s0,a2
    29aa:	207d                	jal	2a58 <strcmp>
    29ac:	dd71                	beqz	a0,2988 <_setlocale_r+0xc>
    29ae:	00003597          	auipc	a1,0x3
    29b2:	70a58593          	addi	a1,a1,1802 # 60b8 <pad_line+0x720>
    29b6:	8522                	mv	a0,s0
    29b8:	2045                	jal	2a58 <strcmp>
    29ba:	d579                	beqz	a0,2988 <_setlocale_r+0xc>
    29bc:	00003597          	auipc	a1,0x3
    29c0:	e8058593          	addi	a1,a1,-384 # 583c <sg_usi_config+0x74>
    29c4:	8522                	mv	a0,s0
    29c6:	2849                	jal	2a58 <strcmp>
    29c8:	d161                	beqz	a0,2988 <_setlocale_r+0xc>
    29ca:	4501                	li	a0,0
    29cc:	b7d1                	j	2990 <_setlocale_r+0x14>

000029ce <__locale_mb_cur_max>:
    29ce:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    29d2:	439c                	lw	a5,0(a5)
    29d4:	5bdc                	lw	a5,52(a5)
    29d6:	e399                	bnez	a5,29dc <__locale_mb_cur_max+0xe>
    29d8:	e9418793          	addi	a5,gp,-364 # 200004f0 <__global_locale>
    29dc:	1287c503          	lbu	a0,296(a5)
    29e0:	8082                	ret

000029e2 <__locale_ctype_ptr_l>:
    29e2:	0ec52503          	lw	a0,236(a0)
    29e6:	8082                	ret

000029e8 <__locale_ctype_ptr>:
    29e8:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    29ec:	439c                	lw	a5,0(a5)
    29ee:	5bdc                	lw	a5,52(a5)
    29f0:	e399                	bnez	a5,29f6 <__locale_ctype_ptr+0xe>
    29f2:	e9418793          	addi	a5,gp,-364 # 200004f0 <__global_locale>
    29f6:	0ec7a503          	lw	a0,236(a5)
    29fa:	8082                	ret

000029fc <setlocale>:
    29fc:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    2a00:	862e                	mv	a2,a1
    2a02:	85aa                	mv	a1,a0
    2a04:	4388                	lw	a0,0(a5)
    2a06:	bf9d                	j	297c <_setlocale_r>

00002a08 <_mbtowc_r>:
    2a08:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    2a0c:	439c                	lw	a5,0(a5)
    2a0e:	5bdc                	lw	a5,52(a5)
    2a10:	e399                	bnez	a5,2a16 <_mbtowc_r+0xe>
    2a12:	e9418793          	addi	a5,gp,-364 # 200004f0 <__global_locale>
    2a16:	0e47a303          	lw	t1,228(a5)
    2a1a:	8302                	jr	t1

00002a1c <__ascii_mbtowc>:
    2a1c:	e185                	bnez	a1,2a3c <__ascii_mbtowc+0x20>
    2a1e:	1171                	addi	sp,sp,-4
    2a20:	858a                	mv	a1,sp
    2a22:	4501                	li	a0,0
    2a24:	ca11                	beqz	a2,2a38 <__ascii_mbtowc+0x1c>
    2a26:	5579                	li	a0,-2
    2a28:	ca81                	beqz	a3,2a38 <__ascii_mbtowc+0x1c>
    2a2a:	00064783          	lbu	a5,0(a2)
    2a2e:	c19c                	sw	a5,0(a1)
    2a30:	00064503          	lbu	a0,0(a2)
    2a34:	00a03533          	snez	a0,a0
    2a38:	0111                	addi	sp,sp,4
    2a3a:	8082                	ret
    2a3c:	4501                	li	a0,0
    2a3e:	ca19                	beqz	a2,2a54 <__ascii_mbtowc+0x38>
    2a40:	5579                	li	a0,-2
    2a42:	ca89                	beqz	a3,2a54 <__ascii_mbtowc+0x38>
    2a44:	00064783          	lbu	a5,0(a2)
    2a48:	c19c                	sw	a5,0(a1)
    2a4a:	00064503          	lbu	a0,0(a2)
    2a4e:	00a03533          	snez	a0,a0
    2a52:	8082                	ret
    2a54:	8082                	ret
	...

00002a58 <strcmp>:
    2a58:	00b56733          	or	a4,a0,a1
    2a5c:	53fd                	li	t2,-1
    2a5e:	8b0d                	andi	a4,a4,3
    2a60:	e779                	bnez	a4,2b2e <strcmp+0xd6>
    2a62:	7f7f87b7          	lui	a5,0x7f7f8
    2a66:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    2a6a:	4110                	lw	a2,0(a0)
    2a6c:	4194                	lw	a3,0(a1)
    2a6e:	00f672b3          	and	t0,a2,a5
    2a72:	00f66333          	or	t1,a2,a5
    2a76:	92be                	add	t0,t0,a5
    2a78:	0062e2b3          	or	t0,t0,t1
    2a7c:	0c729763          	bne	t0,t2,2b4a <strcmp+0xf2>
    2a80:	06d61863          	bne	a2,a3,2af0 <strcmp+0x98>
    2a84:	4150                	lw	a2,4(a0)
    2a86:	41d4                	lw	a3,4(a1)
    2a88:	00f672b3          	and	t0,a2,a5
    2a8c:	00f66333          	or	t1,a2,a5
    2a90:	92be                	add	t0,t0,a5
    2a92:	0062e2b3          	or	t0,t0,t1
    2a96:	0a729863          	bne	t0,t2,2b46 <strcmp+0xee>
    2a9a:	04d61b63          	bne	a2,a3,2af0 <strcmp+0x98>
    2a9e:	4510                	lw	a2,8(a0)
    2aa0:	4594                	lw	a3,8(a1)
    2aa2:	00f672b3          	and	t0,a2,a5
    2aa6:	00f66333          	or	t1,a2,a5
    2aaa:	92be                	add	t0,t0,a5
    2aac:	0062e2b3          	or	t0,t0,t1
    2ab0:	0a729163          	bne	t0,t2,2b52 <strcmp+0xfa>
    2ab4:	02d61e63          	bne	a2,a3,2af0 <strcmp+0x98>
    2ab8:	4550                	lw	a2,12(a0)
    2aba:	45d4                	lw	a3,12(a1)
    2abc:	00f672b3          	and	t0,a2,a5
    2ac0:	00f66333          	or	t1,a2,a5
    2ac4:	92be                	add	t0,t0,a5
    2ac6:	0062e2b3          	or	t0,t0,t1
    2aca:	08729a63          	bne	t0,t2,2b5e <strcmp+0x106>
    2ace:	02d61163          	bne	a2,a3,2af0 <strcmp+0x98>
    2ad2:	4910                	lw	a2,16(a0)
    2ad4:	4994                	lw	a3,16(a1)
    2ad6:	00f672b3          	and	t0,a2,a5
    2ada:	00f66333          	or	t1,a2,a5
    2ade:	92be                	add	t0,t0,a5
    2ae0:	0062e2b3          	or	t0,t0,t1
    2ae4:	08729363          	bne	t0,t2,2b6a <strcmp+0x112>
    2ae8:	0551                	addi	a0,a0,20
    2aea:	05d1                	addi	a1,a1,20
    2aec:	f6d60fe3          	beq	a2,a3,2a6a <strcmp+0x12>
    2af0:	01061713          	slli	a4,a2,0x10
    2af4:	01069793          	slli	a5,a3,0x10
    2af8:	00f71c63          	bne	a4,a5,2b10 <strcmp+0xb8>
    2afc:	01065713          	srli	a4,a2,0x10
    2b00:	0106d793          	srli	a5,a3,0x10
    2b04:	40f70533          	sub	a0,a4,a5
    2b08:	0ff57593          	andi	a1,a0,255
    2b0c:	e991                	bnez	a1,2b20 <strcmp+0xc8>
    2b0e:	8082                	ret
    2b10:	8341                	srli	a4,a4,0x10
    2b12:	83c1                	srli	a5,a5,0x10
    2b14:	40f70533          	sub	a0,a4,a5
    2b18:	0ff57593          	andi	a1,a0,255
    2b1c:	e191                	bnez	a1,2b20 <strcmp+0xc8>
    2b1e:	8082                	ret
    2b20:	0ff77713          	andi	a4,a4,255
    2b24:	0ff7f793          	andi	a5,a5,255
    2b28:	40f70533          	sub	a0,a4,a5
    2b2c:	8082                	ret
    2b2e:	00054603          	lbu	a2,0(a0)
    2b32:	0005c683          	lbu	a3,0(a1)
    2b36:	0505                	addi	a0,a0,1
    2b38:	0585                	addi	a1,a1,1
    2b3a:	00d61363          	bne	a2,a3,2b40 <strcmp+0xe8>
    2b3e:	fa65                	bnez	a2,2b2e <strcmp+0xd6>
    2b40:	40d60533          	sub	a0,a2,a3
    2b44:	8082                	ret
    2b46:	0511                	addi	a0,a0,4
    2b48:	0591                	addi	a1,a1,4
    2b4a:	fed612e3          	bne	a2,a3,2b2e <strcmp+0xd6>
    2b4e:	4501                	li	a0,0
    2b50:	8082                	ret
    2b52:	0521                	addi	a0,a0,8
    2b54:	05a1                	addi	a1,a1,8
    2b56:	fcd61ce3          	bne	a2,a3,2b2e <strcmp+0xd6>
    2b5a:	4501                	li	a0,0
    2b5c:	8082                	ret
    2b5e:	0531                	addi	a0,a0,12
    2b60:	05b1                	addi	a1,a1,12
    2b62:	fcd616e3          	bne	a2,a3,2b2e <strcmp+0xd6>
    2b66:	4501                	li	a0,0
    2b68:	8082                	ret
    2b6a:	0541                	addi	a0,a0,16
    2b6c:	05c1                	addi	a1,a1,16
    2b6e:	fcd610e3          	bne	a2,a3,2b2e <strcmp+0xd6>
    2b72:	4501                	li	a0,0
    2b74:	8082                	ret

00002b76 <_wctomb_r>:
    2b76:	a6418793          	addi	a5,gp,-1436 # 200000c0 <_impure_ptr>
    2b7a:	439c                	lw	a5,0(a5)
    2b7c:	5bdc                	lw	a5,52(a5)
    2b7e:	e399                	bnez	a5,2b84 <_wctomb_r+0xe>
    2b80:	e9418793          	addi	a5,gp,-364 # 200004f0 <__global_locale>
    2b84:	0e07a303          	lw	t1,224(a5)
    2b88:	8302                	jr	t1

00002b8a <__ascii_wctomb>:
    2b8a:	cd91                	beqz	a1,2ba6 <__ascii_wctomb+0x1c>
    2b8c:	0ff00793          	li	a5,255
    2b90:	00c7f763          	bgeu	a5,a2,2b9e <__ascii_wctomb+0x14>
    2b94:	08a00793          	li	a5,138
    2b98:	c11c                	sw	a5,0(a0)
    2b9a:	557d                	li	a0,-1
    2b9c:	8082                	ret
    2b9e:	00c58023          	sb	a2,0(a1)
    2ba2:	4505                	li	a0,1
    2ba4:	8082                	ret
    2ba6:	4501                	li	a0,0
    2ba8:	8082                	ret

00002baa <board_init>:

extern int clock_timer_init(void);
extern int clock_timer_start(void);

void board_init(void)
{
    2baa:	1151                	addi	sp,sp,-12
    2bac:	c406                	sw	ra,8(sp)
    int32_t ret = 0;
    /* init the console*/
    clock_timer_init();
    2bae:	162010ef          	jal	ra,3d10 <clock_timer_init>
    clock_timer_start();
    2bb2:	1da010ef          	jal	ra,3d8c <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2bb6:	4581                	li	a1,0
    2bb8:	4501                	li	a0,0
    2bba:	2c1000ef          	jal	ra,367a <csi_usart_initialize>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        return;
    }
}
    2bbe:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2bc0:	00a1ae23          	sw	a0,28(gp) # 20000678 <console_handle>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2bc4:	65f1                	lui	a1,0x1c
    2bc6:	478d                	li	a5,3
    2bc8:	4701                	li	a4,0
    2bca:	4681                	li	a3,0
    2bcc:	4601                	li	a2,0
    2bce:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x16138>
}
    2bd2:	0131                	addi	sp,sp,12
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2bd4:	2a90006f          	j	367c <csi_usart_config>

00002bd8 <drv_irq_enable>:
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__STATIC_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    CLIC->INTIE[IRQn] |= CLIC_INTIE_IE_Msk;
    2bd8:	e000e7b7          	lui	a5,0xe000e
    2bdc:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    2be0:	953e                	add	a0,a0,a5
    2be2:	40054783          	lbu	a5,1024(a0)
    2be6:	0017e793          	ori	a5,a5,1
    2bea:	40f50023          	sb	a5,1024(a0)
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}
    2bee:	8082                	ret

00002bf0 <drv_irq_register>:
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
    2bf0:	200027b7          	lui	a5,0x20002
    2bf4:	050a                	slli	a0,a0,0x2
    2bf6:	d6c78793          	addi	a5,a5,-660 # 20001d6c <g_irqvector>
    2bfa:	953e                	add	a0,a0,a5
    2bfc:	c10c                	sw	a1,0(a0)
}
    2bfe:	8082                	ret

00002c00 <wj_usi_set_rxfifo_th>:

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    2c00:	457c                	lw	a5,76(a0)
    2c02:	7741                	lui	a4,0xffff0
    2c04:	177d                	addi	a4,a4,-1
    2c06:	8ff9                	and	a5,a5,a4
    2c08:	c57c                	sw	a5,76(a0)
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;
    2c0a:	457c                	lw	a5,76(a0)
    2c0c:	cff7f793          	andi	a5,a5,-769
    2c10:	c57c                	sw	a5,76(a0)

    if (length >= USI_RX_MAX_FIFO) {
    2c12:	47bd                	li	a5,15
    2c14:	00b7f963          	bgeu	a5,a1,2c26 <wj_usi_set_rxfifo_th+0x26>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    2c18:	457c                	lw	a5,76(a0)
    2c1a:	6741                	lui	a4,0x10
    2c1c:	30070713          	addi	a4,a4,768 # 10300 <__ctor_end__+0xa238>
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2c20:	8fd9                	or	a5,a5,a4
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2c22:	c57c                	sw	a5,76(a0)
    }
}
    2c24:	8082                	ret
    } else if (length >= USI_RX_MAX_FIFO - 4) {
    2c26:	47ad                	li	a5,11
    2c28:	00b7f763          	bgeu	a5,a1,2c36 <wj_usi_set_rxfifo_th+0x36>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    2c2c:	6741                	lui	a4,0x10
    2c2e:	457c                	lw	a5,76(a0)
    2c30:	20070713          	addi	a4,a4,512 # 10200 <__ctor_end__+0xa138>
    2c34:	b7f5                	j	2c20 <wj_usi_set_rxfifo_th+0x20>
    } else if (length >= 4) {
    2c36:	478d                	li	a5,3
    2c38:	00b7f763          	bgeu	a5,a1,2c46 <wj_usi_set_rxfifo_th+0x46>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2c3c:	6741                	lui	a4,0x10
    2c3e:	457c                	lw	a5,76(a0)
    2c40:	10070713          	addi	a4,a4,256 # 10100 <__ctor_end__+0xa038>
    2c44:	bff1                	j	2c20 <wj_usi_set_rxfifo_th+0x20>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2c46:	457c                	lw	a5,76(a0)
    2c48:	1007e793          	ori	a5,a5,256
    2c4c:	bfd9                	j	2c22 <wj_usi_set_rxfifo_th+0x22>

00002c4e <wj_usi_irqhandler>:
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);
    2c4e:	200027b7          	lui	a5,0x20002
    2c52:	00351713          	slli	a4,a0,0x3
    2c56:	88478793          	addi	a5,a5,-1916 # 20001884 <usi_instance>
    2c5a:	97ba                	add	a5,a5,a4
    2c5c:	439c                	lw	a5,0(a5)

    switch (addr->USI_MODE_SEL & 0x3) {
    2c5e:	4705                	li	a4,1
    2c60:	43dc                	lw	a5,4(a5)
    2c62:	8b8d                	andi	a5,a5,3
    2c64:	00e78863          	beq	a5,a4,2c74 <wj_usi_irqhandler+0x26>
    2c68:	c789                	beqz	a5,2c72 <wj_usi_irqhandler+0x24>
    2c6a:	4709                	li	a4,2
    2c6c:	00e78563          	beq	a5,a4,2c76 <wj_usi_irqhandler+0x28>
    2c70:	8082                	ret
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
    2c72:	a70d                	j	3394 <wj_usi_usart_irqhandler>
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
    2c74:	a099                	j	2cba <wj_usi_i2c_irqhandler>
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
    2c76:	a619                	j	2f7c <wj_usi_spi_irqhandler>

00002c78 <drv_usi_initialize>:
            return;
    }
}

int32_t drv_usi_initialize(int32_t idx)
{
    2c78:	1131                	addi	sp,sp,-20
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);
    2c7a:	0050                	addi	a2,sp,4
    2c7c:	858a                	mv	a1,sp
{
    2c7e:	c622                	sw	s0,12(sp)
    2c80:	c806                	sw	ra,16(sp)
    2c82:	842a                	mv	s0,a0
    uint32_t base = 0u;
    2c84:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    2c86:	c202                	sw	zero,4(sp)
    int32_t ret = target_usi_init(idx, &base, &irq);
    2c88:	27f000ef          	jal	ra,3706 <target_usi_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    2c8c:	4789                	li	a5,2
    2c8e:	02a7e163          	bltu	a5,a0,2cb0 <drv_usi_initialize+0x38>
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    2c92:	4782                	lw	a5,0(sp)
    2c94:	20002537          	lui	a0,0x20002
    2c98:	040e                	slli	s0,s0,0x3
    2c9a:	88450513          	addi	a0,a0,-1916 # 20001884 <usi_instance>
    2c9e:	9522                	add	a0,a0,s0
    2ca0:	c11c                	sw	a5,0(a0)
    usi_priv->irq  = irq;
    2ca2:	4792                	lw	a5,4(sp)
    2ca4:	c15c                	sw	a5,4(a0)

    return 0;
    2ca6:	4501                	li	a0,0
}
    2ca8:	40c2                	lw	ra,16(sp)
    2caa:	4432                	lw	s0,12(sp)
    2cac:	0151                	addi	sp,sp,20
    2cae:	8082                	ret
        return ERR_USI(DRV_ERROR_PARAMETER);
    2cb0:	81180537          	lui	a0,0x81180
    2cb4:	08450513          	addi	a0,a0,132 # 81180084 <__heap_end+0x61150084>
    2cb8:	bfc5                	j	2ca8 <drv_usi_initialize+0x30>

00002cba <wj_usi_i2c_irqhandler>:

}
void wj_usi_i2c_irqhandler(int32_t idx)
{
    wj_usi_iic_priv_t *iic_priv = &iic_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2cba:	03000793          	li	a5,48
    2cbe:	02f507b3          	mul	a5,a0,a5
{
    2cc2:	1111                	addi	sp,sp,-28
    2cc4:	c826                	sw	s1,16(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2cc6:	200024b7          	lui	s1,0x20002
    2cca:	89c48713          	addi	a4,s1,-1892 # 2000189c <iic_instance>
{
    2cce:	ca22                	sw	s0,20(sp)
    2cd0:	cc06                	sw	ra,24(sp)
    2cd2:	862a                	mv	a2,a0
    2cd4:	89c48493          	addi	s1,s1,-1892
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2cd8:	97ba                	add	a5,a5,a4
    2cda:	4380                	lw	s0,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;

    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2cdc:	6719                	lui	a4,0x6
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2cde:	4874                	lw	a3,84(s0)
    2ce0:	00e69313          	slli	t1,a3,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2ce4:	8f75                	and	a4,a4,a3
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2ce6:	00e35313          	srli	t1,t1,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2cea:	c70d                	beqz	a4,2d14 <wj_usi_i2c_irqhandler+0x5a>
        /* If arbitration fault, it indicates either a slave device not
        * responding as expected, or other master which is not supported
        * by this SW.
        */
        iic_priv->status    = IIC_STATE_DONE;
    2cec:	4711                	li	a4,4
    2cee:	d798                	sw	a4,40(a5)
        addr->USI_EN = 0;
    2cf0:	00042023          	sw	zero,0(s0)
        addr->USI_INTR_UNMASK = 0;
    2cf4:	04042e23          	sw	zero,92(s0)
        addr->USI_INTR_EN = 0;
        addr->USI_INTR_CLR = intr_state;

        if (iic_priv->cb_event) {
    2cf8:	0087a383          	lw	t2,8(a5)
        addr->USI_INTR_EN = 0;
    2cfc:	04042823          	sw	zero,80(s0)
        addr->USI_INTR_CLR = intr_state;
    2d00:	06642023          	sw	t1,96(s0)
        if (iic_priv->cb_event) {
    2d04:	02038063          	beqz	t2,2d24 <wj_usi_i2c_irqhandler+0x6a>
            if (iic_priv->cb_event) {
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
            }
        }
    }
}
    2d08:	4452                	lw	s0,20(sp)
    2d0a:	40e2                	lw	ra,24(sp)
    2d0c:	44c2                	lw	s1,16(sp)
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d0e:	459d                	li	a1,7
}
    2d10:	0171                	addi	sp,sp,28
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d12:	8382                	jr	t2
    switch (iic_priv->status) {
    2d14:	578c                	lw	a1,40(a5)
    2d16:	872a                	mv	a4,a0
    2d18:	4505                	li	a0,1
    2d1a:	02a58963          	beq	a1,a0,2d4c <wj_usi_i2c_irqhandler+0x92>
    2d1e:	4509                	li	a0,2
    2d20:	10a58563          	beq	a1,a0,2e2a <wj_usi_i2c_irqhandler+0x170>
            if (iic_priv->cb_event) {
    2d24:	03000793          	li	a5,48
    2d28:	02f607b3          	mul	a5,a2,a5
            addr->USI_INTR_CLR = intr_state;
    2d2c:	06642023          	sw	t1,96(s0)
            addr->USI_INTR_UNMASK = 0;
    2d30:	04042e23          	sw	zero,92(s0)
            addr->USI_INTR_EN = 0;
    2d34:	04042823          	sw	zero,80(s0)
            addr->USI_EN = 0;
    2d38:	00042023          	sw	zero,0(s0)
            if (iic_priv->cb_event) {
    2d3c:	94be                	add	s1,s1,a5
    2d3e:	0084a303          	lw	t1,8(s1)
    2d42:	0c030663          	beqz	t1,2e0e <wj_usi_i2c_irqhandler+0x154>
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2d46:	4599                	li	a1,6
    2d48:	8532                	mv	a0,a2
    2d4a:	a2d9                	j	2f10 <wj_usi_i2c_irqhandler+0x256>
    if (intr_stat & USI_INT_TX_EMPTY) {
    2d4c:	0026f593          	andi	a1,a3,2
    uint8_t emptyfifo = 0;
    2d50:	4601                	li	a2,0
    if (intr_stat & USI_INT_TX_EMPTY) {
    2d52:	cd8d                	beqz	a1,2d8c <wj_usi_i2c_irqhandler+0xd2>
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2d54:	53d0                	lw	a2,36(a5)
    2d56:	4b8c                	lw	a1,16(a5)
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2d58:	445c                	lw	a5,12(s0)
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2d5a:	8d91                	sub	a1,a1,a2
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2d5c:	83a1                	srli	a5,a5,0x8
    2d5e:	4641                	li	a2,16
    2d60:	8bfd                	andi	a5,a5,31
    2d62:	40f607b3          	sub	a5,a2,a5
    2d66:	0ff5f613          	andi	a2,a1,255
    2d6a:	00b7f963          	bgeu	a5,a1,2d7c <wj_usi_i2c_irqhandler+0xc2>
    2d6e:	445c                	lw	a5,12(s0)
    2d70:	4641                	li	a2,16
    2d72:	83a1                	srli	a5,a5,0x8
    2d74:	8bfd                	andi	a5,a5,31
    2d76:	8e1d                	sub	a2,a2,a5
    2d78:	0ff67613          	andi	a2,a2,255
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2d7c:	03000793          	li	a5,48
    2d80:	02f707b3          	mul	a5,a4,a5
        for (i = 0; i < emptyfifo; i++) {
    2d84:	4501                	li	a0,0
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2d86:	97a6                	add	a5,a5,s1
        for (i = 0; i < emptyfifo; i++) {
    2d88:	08c56863          	bltu	a0,a2,2e18 <wj_usi_i2c_irqhandler+0x15e>
    if (iic_priv->tx_cnt == iic_priv->tx_total_num) {
    2d8c:	03000793          	li	a5,48
    2d90:	02f707b3          	mul	a5,a4,a5
    2d94:	97a6                	add	a5,a5,s1
    2d96:	53cc                	lw	a1,36(a5)
    2d98:	4b9c                	lw	a5,16(a5)
    2d9a:	00f59963          	bne	a1,a5,2dac <wj_usi_i2c_irqhandler+0xf2>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2d9e:	541c                	lw	a5,40(s0)
    2da0:	0027e793          	ori	a5,a5,2
    2da4:	d41c                	sw	a5,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    2da6:	483c                	lw	a5,80(s0)
    2da8:	9bf5                	andi	a5,a5,-3
    2daa:	c83c                	sw	a5,80(s0)
    if (intr_stat & USI_INT_I2C_STOP) {
    2dac:	01369793          	slli	a5,a3,0x13
    2db0:	0207d863          	bgez	a5,2de0 <wj_usi_i2c_irqhandler+0x126>
        iic_priv->status  = IIC_STATE_SEND_DONE;
    2db4:	03000793          	li	a5,48
    2db8:	02f707b3          	mul	a5,a4,a5
    2dbc:	4595                	li	a1,5
    2dbe:	97a6                	add	a5,a5,s1
    2dc0:	d78c                	sw	a1,40(a5)
        if (iic_priv->cb_event) {
    2dc2:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2dc4:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2dc8:	cf81                	beqz	a5,2de0 <wj_usi_i2c_irqhandler+0x126>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2dca:	853a                	mv	a0,a4
    2dcc:	4581                	li	a1,0
    2dce:	c632                	sw	a2,12(sp)
    2dd0:	c41a                	sw	t1,8(sp)
    2dd2:	c236                	sw	a3,4(sp)
    2dd4:	c03a                	sw	a4,0(sp)
    2dd6:	9782                	jalr	a5
    2dd8:	4632                	lw	a2,12(sp)
    2dda:	4322                	lw	t1,8(sp)
    2ddc:	4692                	lw	a3,4(sp)
    2dde:	4702                	lw	a4,0(sp)
    iic_priv->tx_cnt += emptyfifo;
    2de0:	03000793          	li	a5,48
    2de4:	02f707b3          	mul	a5,a4,a5
    if (intr_stat & USI_INT_TX_WERR) {
    2de8:	8ac1                	andi	a3,a3,16
    iic_priv->tx_cnt += emptyfifo;
    2dea:	94be                	add	s1,s1,a5
    2dec:	50dc                	lw	a5,36(s1)
    2dee:	963e                	add	a2,a2,a5
    2df0:	d0d0                	sw	a2,36(s1)
    if (intr_stat & USI_INT_TX_WERR) {
    2df2:	ce81                	beqz	a3,2e0a <wj_usi_i2c_irqhandler+0x150>
        iic_priv->status = IIC_STATE_ERROR;
    2df4:	479d                	li	a5,7
    2df6:	d49c                	sw	a5,40(s1)
        if (iic_priv->cb_event) {
    2df8:	449c                	lw	a5,8(s1)
        addr->USI_EN = 0;
    2dfa:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2dfe:	c791                	beqz	a5,2e0a <wj_usi_i2c_irqhandler+0x150>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2e00:	459d                	li	a1,7
    2e02:	853a                	mv	a0,a4
    2e04:	c01a                	sw	t1,0(sp)
    2e06:	9782                	jalr	a5
    2e08:	4302                	lw	t1,0(sp)
            addr->USI_INTR_CLR = intr_state;
    2e0a:	06642023          	sw	t1,96(s0)
}
    2e0e:	40e2                	lw	ra,24(sp)
    2e10:	4452                	lw	s0,20(sp)
    2e12:	44c2                	lw	s1,16(sp)
    2e14:	0171                	addi	sp,sp,28
    2e16:	8082                	ret
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2e18:	4f8c                	lw	a1,24(a5)
        for (i = 0; i < emptyfifo; i++) {
    2e1a:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = tx_data;
    2e1c:	0005c283          	lbu	t0,0(a1)
            iic_priv->tx_buf++;
    2e20:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = tx_data;
    2e22:	00542423          	sw	t0,8(s0)
            iic_priv->tx_buf++;
    2e26:	cf8c                	sw	a1,24(a5)
    2e28:	b785                	j	2d88 <wj_usi_i2c_irqhandler+0xce>
    if (intr_stat & USI_INT_RX_THOLD) {
    2e2a:	0206f613          	andi	a2,a3,32
    2e2e:	c635                	beqz	a2,2e9a <wj_usi_i2c_irqhandler+0x1e0>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    2e30:	02000613          	li	a2,32
    2e34:	d030                	sw	a2,96(s0)
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2e36:	444c                	lw	a1,12(s0)
        for (i = 0; i < rx_num; i++) {
    2e38:	4601                	li	a2,0
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2e3a:	81c1                	srli	a1,a1,0x10
    2e3c:	89fd                	andi	a1,a1,31
        for (i = 0; i < rx_num; i++) {
    2e3e:	0cb66e63          	bltu	a2,a1,2f1a <wj_usi_i2c_irqhandler+0x260>
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2e42:	03000793          	li	a5,48
    2e46:	02f707b3          	mul	a5,a4,a5
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2e4a:	4450                	lw	a2,12(s0)
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2e4c:	45c1                	li	a1,16
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2e4e:	8221                	srli	a2,a2,0x8
    2e50:	8a7d                	andi	a2,a2,31
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2e52:	8d91                	sub	a1,a1,a2
    2e54:	97a6                	add	a5,a5,s1
    2e56:	5388                	lw	a0,32(a5)
    2e58:	4785                	li	a5,1
    2e5a:	00a5f663          	bgeu	a1,a0,2e66 <wj_usi_i2c_irqhandler+0x1ac>
    2e5e:	47c1                	li	a5,16
    2e60:	8f91                	sub	a5,a5,a2
    2e62:	0ff7f793          	andi	a5,a5,255
        if (iic_priv->rx_clk == 0) {
    2e66:	03000613          	li	a2,48
    2e6a:	02c70633          	mul	a2,a4,a2
    2e6e:	9626                	add	a2,a2,s1
    2e70:	520c                	lw	a1,32(a2)
    2e72:	cde1                	beqz	a1,2f4a <wj_usi_i2c_irqhandler+0x290>
        for (i = 0; i < rxfifo; i++) {
    2e74:	4581                	li	a1,0
            addr->USI_TX_RX_FIFO = 0x100;
    2e76:	10000313          	li	t1,256
        for (i = 0; i < rxfifo; i++) {
    2e7a:	0af59f63          	bne	a1,a5,2f38 <wj_usi_i2c_irqhandler+0x27e>
        wj_usi_set_rxfifo_th(addr, rxfifo);
    2e7e:	85be                	mv	a1,a5
    2e80:	8522                	mv	a0,s0
    2e82:	c43a                	sw	a4,8(sp)
    2e84:	c236                	sw	a3,4(sp)
    2e86:	c03e                	sw	a5,0(sp)
    2e88:	3ba5                	jal	2c00 <wj_usi_set_rxfifo_th>
        if (rxfifo == 0) {
    2e8a:	4782                	lw	a5,0(sp)
    2e8c:	4692                	lw	a3,4(sp)
    2e8e:	4722                	lw	a4,8(sp)
    2e90:	e789                	bnez	a5,2e9a <wj_usi_i2c_irqhandler+0x1e0>
            addr->USI_INTR_EN |= USI_INT_I2C_STOP;
    2e92:	483c                	lw	a5,80(s0)
    2e94:	6605                	lui	a2,0x1
    2e96:	8fd1                	or	a5,a5,a2
    2e98:	c83c                	sw	a5,80(s0)
    if (iic_priv->rx_cnt == iic_priv->rx_total_num) {
    2e9a:	03000793          	li	a5,48
    2e9e:	02f707b3          	mul	a5,a4,a5
    2ea2:	97a6                	add	a5,a5,s1
    2ea4:	4fd0                	lw	a2,28(a5)
    2ea6:	47dc                	lw	a5,12(a5)
    2ea8:	00f61a63          	bne	a2,a5,2ebc <wj_usi_i2c_irqhandler+0x202>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2eac:	541c                	lw	a5,40(s0)
    2eae:	0027e793          	ori	a5,a5,2
    2eb2:	d41c                	sw	a5,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_RX_THOLD;
    2eb4:	483c                	lw	a5,80(s0)
    2eb6:	fdf7f793          	andi	a5,a5,-33
    2eba:	c83c                	sw	a5,80(s0)
    if ((intr_stat & USI_INT_RX_WERR) || (intr_stat & USI_INT_RX_RERR)) {
    2ebc:	3006f793          	andi	a5,a3,768
    2ec0:	c39d                	beqz	a5,2ee6 <wj_usi_i2c_irqhandler+0x22c>
        iic_priv->status = IIC_STATE_ERROR;
    2ec2:	03000793          	li	a5,48
    2ec6:	02f707b3          	mul	a5,a4,a5
    2eca:	461d                	li	a2,7
    2ecc:	97a6                	add	a5,a5,s1
    2ece:	d790                	sw	a2,40(a5)
        if (iic_priv->cb_event) {
    2ed0:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2ed2:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2ed6:	cb81                	beqz	a5,2ee6 <wj_usi_i2c_irqhandler+0x22c>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2ed8:	853a                	mv	a0,a4
    2eda:	459d                	li	a1,7
    2edc:	c236                	sw	a3,4(sp)
    2ede:	c03a                	sw	a4,0(sp)
    2ee0:	9782                	jalr	a5
    2ee2:	4692                	lw	a3,4(sp)
    2ee4:	4702                	lw	a4,0(sp)
    if (intr_stat & USI_INT_I2C_STOP) {
    2ee6:	01369793          	slli	a5,a3,0x13
    2eea:	f207d2e3          	bgez	a5,2e0e <wj_usi_i2c_irqhandler+0x154>
        addr->USI_INTR_CLR = USI_INT_I2C_STOP;
    2eee:	6785                	lui	a5,0x1
    2ef0:	d03c                	sw	a5,96(s0)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2ef2:	03000793          	li	a5,48
    2ef6:	02f707b3          	mul	a5,a4,a5
    2efa:	94be                	add	s1,s1,a5
        if (iic_priv->cb_event) {
    2efc:	0084a303          	lw	t1,8(s1)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f00:	4799                	li	a5,6
    2f02:	d49c                	sw	a5,40(s1)
        addr->USI_EN = 0;
    2f04:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f08:	f00303e3          	beqz	t1,2e0e <wj_usi_i2c_irqhandler+0x154>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2f0c:	4581                	li	a1,0
    2f0e:	853a                	mv	a0,a4
}
    2f10:	4452                	lw	s0,20(sp)
    2f12:	40e2                	lw	ra,24(sp)
    2f14:	44c2                	lw	s1,16(sp)
    2f16:	0171                	addi	sp,sp,28
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2f18:	8302                	jr	t1
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2f1a:	00842303          	lw	t1,8(s0)
    2f1e:	4bc8                	lw	a0,20(a5)
        for (i = 0; i < rx_num; i++) {
    2f20:	0605                	addi	a2,a2,1
    2f22:	0ff67613          	andi	a2,a2,255
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2f26:	00650023          	sb	t1,0(a0)
            iic_priv->rx_buf++;
    2f2a:	4bc8                	lw	a0,20(a5)
    2f2c:	0505                	addi	a0,a0,1
    2f2e:	cbc8                	sw	a0,20(a5)
            iic_priv->rx_cnt++;;
    2f30:	4fc8                	lw	a0,28(a5)
    2f32:	0505                	addi	a0,a0,1
    2f34:	cfc8                	sw	a0,28(a5)
    2f36:	b721                	j	2e3e <wj_usi_i2c_irqhandler+0x184>
            addr->USI_TX_RX_FIFO = 0x100;
    2f38:	00642423          	sw	t1,8(s0)
            iic_priv->rx_clk--;
    2f3c:	5208                	lw	a0,32(a2)
        for (i = 0; i < rxfifo; i++) {
    2f3e:	0585                	addi	a1,a1,1
    2f40:	0ff5f593          	andi	a1,a1,255
            iic_priv->rx_clk--;
    2f44:	157d                	addi	a0,a0,-1
    2f46:	d208                	sw	a0,32(a2)
    2f48:	bf0d                	j	2e7a <wj_usi_i2c_irqhandler+0x1c0>
            rxfifo = 0;
    2f4a:	4781                	li	a5,0
    2f4c:	bf0d                	j	2e7e <wj_usi_i2c_irqhandler+0x1c4>

00002f4e <wj_spi_ss_control.isra.0>:
/**
  \brief control ss line depend on controlled Output mode.
*/
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
{
    if (spi_priv->ss_mode == SPI_SS_MASTER_HW_OUTPUT) {
    2f4e:	4789                	li	a5,2
    2f50:	02f51463          	bne	a0,a5,2f78 <wj_spi_ss_control.isra.0+0x2a>
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
    2f54:	1151                	addi	sp,sp,-12
    2f56:	c406                	sw	ra,8(sp)
        if (stat == SPI_SS_INACTIVE) {
    2f58:	e991                	bnez	a1,2f6c <wj_spi_ss_control.isra.0+0x1e>
            csi_gpio_pin_write(pgpio_pin_handle, true);
    2f5a:	4585                	li	a1,1
        } else if (stat == SPI_SS_ACTIVE) {
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2f5c:	0041a503          	lw	a0,4(gp) # 20000660 <__bss_start__>
    2f60:	1bf000ef          	jal	ra,391e <csi_gpio_pin_write>
        } else {
            return -1;
        }
    }

    return 0;
    2f64:	4501                	li	a0,0
}
    2f66:	40a2                	lw	ra,8(sp)
    2f68:	0131                	addi	sp,sp,12
    2f6a:	8082                	ret
        } else if (stat == SPI_SS_ACTIVE) {
    2f6c:	4785                	li	a5,1
            return -1;
    2f6e:	557d                	li	a0,-1
        } else if (stat == SPI_SS_ACTIVE) {
    2f70:	fef59be3          	bne	a1,a5,2f66 <wj_spi_ss_control.isra.0+0x18>
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2f74:	4581                	li	a1,0
    2f76:	b7dd                	j	2f5c <wj_spi_ss_control.isra.0+0xe>
    return 0;
    2f78:	4501                	li	a0,0
}
    2f7a:	8082                	ret

00002f7c <wj_usi_spi_irqhandler>:
  \brief       handler the interrupt.
  \param[in]   spi      Pointer to \ref SPI_RESOURCES
*/
void wj_usi_spi_irqhandler(int32_t idx)
{
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    2f7c:	04c00793          	li	a5,76
    2f80:	02f507b3          	mul	a5,a0,a5
{
    2f84:	1101                	addi	sp,sp,-32
    2f86:	ca26                	sw	s1,20(sp)
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    2f88:	200024b7          	lui	s1,0x20002
    2f8c:	92c48613          	addi	a2,s1,-1748 # 2000192c <spi_instance>
{
    2f90:	cc22                	sw	s0,24(sp)
    2f92:	ce06                	sw	ra,28(sp)
    2f94:	86aa                	mv	a3,a0
    2f96:	92c48493          	addi	s1,s1,-1748
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    2f9a:	963e                	add	a2,a2,a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    2f9c:	4200                	lw	s0,0(a2)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2f9e:	05442303          	lw	t1,84(s0)
    2fa2:	00e31793          	slli	a5,t1,0xe
    2fa6:	83b9                	srli	a5,a5,0xe
    2fa8:	c03e                	sw	a5,0(sp)

    /* deal with receive FIFO full interrupt */
    if (intr_state & USI_INT_SPI_STOP) {
    2faa:	00e31793          	slli	a5,t1,0xe
    2fae:	0807d363          	bgez	a5,3034 <wj_usi_spi_irqhandler+0xb8>
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    2fb2:	445c                	lw	a5,12(s0)
    uint32_t length = spi_priv->recv_num;
    2fb4:	4a48                	lw	a0,20(a2)
    uint8_t *pbuffer = spi_priv->recv_buf;
    2fb6:	4e4c                	lw	a1,28(a2)
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    2fb8:	83c1                	srli	a5,a5,0x10
    uint32_t rxdata_num = (rxnum > length) ? length : rxnum;
    2fba:	8bfd                	andi	a5,a5,31
    2fbc:	00f57363          	bgeu	a0,a5,2fc2 <wj_usi_spi_irqhandler+0x46>
    2fc0:	87aa                	mv	a5,a0
    for (i = 0; i < rxdata_num; i++) {
    2fc2:	00f582b3          	add	t0,a1,a5
    2fc6:	10559763          	bne	a1,t0,30d4 <wj_usi_spi_irqhandler+0x158>
    length -= rxdata_num;
    2fca:	8d1d                	sub	a0,a0,a5
    if (length <= 0) {
    2fcc:	10051a63          	bnez	a0,30e0 <wj_usi_spi_irqhandler+0x164>
        addr->USI_INTR_EN &= ~USI_INT_SPI_STOP;
    2fd0:	483c                	lw	a5,80(s0)
    2fd2:	7581                	lui	a1,0xfffe0
    2fd4:	15fd                	addi	a1,a1,-1
    2fd6:	8fed                	and	a5,a5,a1
    2fd8:	c83c                	sw	a5,80(s0)
        spi_priv->status.busy = 0U;
    2fda:	04c00793          	li	a5,76
    2fde:	02f687b3          	mul	a5,a3,a5
    2fe2:	c81a                	sw	t1,16(sp)
    2fe4:	c636                	sw	a3,12(sp)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    2fe6:	c232                	sw	a2,4(sp)
        spi_priv->status.busy = 0U;
    2fe8:	97a6                	add	a5,a5,s1
    2fea:	0387c583          	lbu	a1,56(a5) # 1038 <__divdf3+0x188>
        spi_priv->recv_num = 0;
    2fee:	c43e                	sw	a5,8(sp)
        spi_priv->status.busy = 0U;
    2ff0:	99f9                	andi	a1,a1,-2
    2ff2:	02b78c23          	sb	a1,56(a5)
        addr->USI_EN = 0x0;
    2ff6:	00042023          	sw	zero,0(s0)
        addr->USI_EN = 0xf;
    2ffa:	45bd                	li	a1,15
    2ffc:	c00c                	sw	a1,0(s0)
        addr->USI_EN = 0x0;
    2ffe:	00042023          	sw	zero,0(s0)
        spi_priv->recv_num = 0;
    3002:	0007aa23          	sw	zero,20(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3006:	03464503          	lbu	a0,52(a2) # 1034 <__divdf3+0x184>
    300a:	4581                	li	a1,0
    300c:	3789                	jal	2f4e <wj_spi_ss_control.isra.0>
        if (spi_priv->cb_event) {
    300e:	47a2                	lw	a5,8(sp)
    3010:	4612                	lw	a2,4(sp)
    3012:	46b2                	lw	a3,12(sp)
    3014:	00c7a383          	lw	t2,12(a5)
    3018:	4342                	lw	t1,16(sp)
    301a:	00038a63          	beqz	t2,302e <wj_usi_spi_irqhandler+0xb2>
            spi_priv->cb_event(spi_priv->idx, SPI_EVENT_RX_COMPLETE);
    301e:	43a8                	lw	a0,64(a5)
    3020:	4589                	li	a1,2
    3022:	c432                	sw	a2,8(sp)
    3024:	c21a                	sw	t1,4(sp)
    3026:	9382                	jalr	t2
            return;
    3028:	4312                	lw	t1,4(sp)
    302a:	4622                	lw	a2,8(sp)
    302c:	46b2                	lw	a3,12(sp)
        wj_spi_intr_rx_full(spi_priv);
        addr->USI_INTR_CLR = USI_INT_SPI_STOP;
    302e:	000207b7          	lui	a5,0x20
    3032:	d03c                	sw	a5,96(s0)
    }

    /* deal with transmit FIFO empty interrupt */
    if (intr_state & USI_INT_TX_EMPTY) {
    3034:	00237313          	andi	t1,t1,2
    3038:	08030763          	beqz	t1,30c6 <wj_usi_spi_irqhandler+0x14a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    303c:	04c00793          	li	a5,76
    3040:	02f687b3          	mul	a5,a3,a5
    3044:	97a6                	add	a5,a5,s1
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    3046:	5b8c                	lw	a1,48(a5)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3048:	0007a303          	lw	t1,0(a5) # 20000 <__ctor_end__+0x19f38>
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    304c:	e9fd                	bnez	a1,3142 <wj_usi_spi_irqhandler+0x1c6>
        while (spi_priv->transfer_num) {
    304e:	53cc                	lw	a1,36(a5)
    3050:	e1e9                	bnez	a1,3112 <wj_usi_spi_irqhandler+0x196>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    3052:	5788                	lw	a0,40(a5)
    3054:	42bd                	li	t0,15
    3056:	00a2f363          	bgeu	t0,a0,305c <wj_usi_spi_irqhandler+0xe0>
            spi_priv->transfer_num = USI_TX_MAX_FIFO;
    305a:	4541                	li	a0,16
            spi_priv->transfer_num = spi_priv->clk_num;
    305c:	d3c8                	sw	a0,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    305e:	04c00793          	li	a5,76
    3062:	02f687b3          	mul	a5,a3,a5
    3066:	97a6                	add	a5,a5,s1
    3068:	0247a283          	lw	t0,36(a5)
    306c:	0a559f63          	bne	a1,t0,312a <wj_usi_spi_irqhandler+0x1ae>
    if (spi_priv->clk_num == 0) {
    3070:	04c00793          	li	a5,76
    3074:	02f687b3          	mul	a5,a3,a5
    3078:	97a6                	add	a5,a5,s1
    307a:	578c                	lw	a1,40(a5)
    307c:	10059263          	bnez	a1,3180 <wj_usi_spi_irqhandler+0x204>
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    3080:	05032583          	lw	a1,80(t1)
    3084:	c636                	sw	a3,12(sp)
    3086:	c41a                	sw	t1,8(sp)
    3088:	99f5                	andi	a1,a1,-3
    308a:	04b32823          	sw	a1,80(t1)
        spi_priv->status.busy = 0U;
    308e:	0387c583          	lbu	a1,56(a5)
        spi_priv->send_num = 0;
    3092:	0007a823          	sw	zero,16(a5)
    3096:	c23e                	sw	a5,4(sp)
        spi_priv->status.busy = 0U;
    3098:	99f9                	andi	a1,a1,-2
    309a:	02b78c23          	sb	a1,56(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    309e:	03464503          	lbu	a0,52(a2)
    30a2:	4581                	li	a1,0
    30a4:	356d                	jal	2f4e <wj_spi_ss_control.isra.0>
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30a6:	4792                	lw	a5,4(sp)
        addr->USI_EN = 0x0;
    30a8:	4322                	lw	t1,8(sp)
        addr->USI_EN = 0xf;
    30aa:	463d                	li	a2,15
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30ac:	5b8c                	lw	a1,48(a5)
        addr->USI_EN = 0x0;
    30ae:	00032023          	sw	zero,0(t1)
        addr->USI_EN = 0xf;
    30b2:	00c32023          	sw	a2,0(t1)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30b6:	46b2                	lw	a3,12(sp)
    30b8:	47d0                	lw	a2,12(a5)
    30ba:	e1e1                	bnez	a1,317a <wj_usi_spi_irqhandler+0x1fe>
            if (spi_priv->cb_event) {
    30bc:	c271                	beqz	a2,3180 <wj_usi_spi_irqhandler+0x204>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    30be:	43a8                	lw	a0,64(a5)
    30c0:	9602                	jalr	a2
        wj_spi_intr_tx_empty(spi_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    30c2:	4789                	li	a5,2
    30c4:	d03c                	sw	a5,96(s0)
    }

    addr->USI_INTR_CLR = intr_state;
    30c6:	4782                	lw	a5,0(sp)
}
    30c8:	40f2                	lw	ra,28(sp)
    30ca:	44d2                	lw	s1,20(sp)
    addr->USI_INTR_CLR = intr_state;
    30cc:	d03c                	sw	a5,96(s0)
}
    30ce:	4462                	lw	s0,24(sp)
    30d0:	6105                	addi	sp,sp,32
    30d2:	8082                	ret
        *pbuffer = addr->USI_TX_RX_FIFO;
    30d4:	00842383          	lw	t2,8(s0)
        pbuffer++;
    30d8:	0585                	addi	a1,a1,1
        *pbuffer = addr->USI_TX_RX_FIFO;
    30da:	fe758fa3          	sb	t2,-1(a1) # fffdffff <__heap_end+0xdffaffff>
        pbuffer++;
    30de:	b5e5                	j	2fc6 <wj_usi_spi_irqhandler+0x4a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30e0:	04c00793          	li	a5,76
    30e4:	02f687b3          	mul	a5,a3,a5
    30e8:	97a6                	add	a5,a5,s1
    30ea:	0007a283          	lw	t0,0(a5)
            addr->USI_SPI_CTRL &= ~WJ_USI_SPI_CTRL_TMODE;
    30ee:	0442a383          	lw	t2,68(t0) # 80000044 <__heap_end+0x5ffd0044>
    30f2:	fcf3f393          	andi	t2,t2,-49
    30f6:	0472a223          	sw	t2,68(t0)
            addr->USI_SPI_CTRL |= WJ_USI_SPI_CTRL_TMODE_RX;
    30fa:	0442a383          	lw	t2,68(t0)
    30fe:	0203e393          	ori	t2,t2,32
    3102:	0472a223          	sw	t2,68(t0)
    spi_priv->mode = mode;
    3106:	4289                	li	t0,2
    3108:	0257a823          	sw	t0,48(a5)
        spi_priv->recv_buf = pbuffer;
    310c:	cfcc                	sw	a1,28(a5)
        spi_priv->recv_num = length;
    310e:	cbc8                	sw	a0,20(a5)
    3110:	bf39                	j	302e <wj_usi_spi_irqhandler+0xb2>
            *spi_priv->recv_buf = addr->USI_TX_RX_FIFO;
    3112:	00832503          	lw	a0,8(t1)
    3116:	4fcc                	lw	a1,28(a5)
    3118:	00a58023          	sb	a0,0(a1)
            spi_priv->recv_buf++;
    311c:	4fcc                	lw	a1,28(a5)
    311e:	0585                	addi	a1,a1,1
    3120:	cfcc                	sw	a1,28(a5)
            spi_priv->transfer_num--;
    3122:	53cc                	lw	a1,36(a5)
    3124:	15fd                	addi	a1,a1,-1
    3126:	d3cc                	sw	a1,36(a5)
    3128:	b71d                	j	304e <wj_usi_spi_irqhandler+0xd2>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    312a:	4f88                	lw	a0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    312c:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    312e:	00054383          	lbu	t2,0(a0)
            spi_priv->send_buf++;
    3132:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3134:	00732423          	sw	t2,8(t1)
            spi_priv->send_buf++;
    3138:	cf88                	sw	a0,24(a5)
            spi_priv->send_num--;
    313a:	4b88                	lw	a0,16(a5)
    313c:	157d                	addi	a0,a0,-1
    313e:	cb88                	sw	a0,16(a5)
    3140:	b735                	j	306c <wj_usi_spi_irqhandler+0xf0>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    3142:	578c                	lw	a1,40(a5)
    3144:	453d                	li	a0,15
    3146:	00b57363          	bgeu	a0,a1,314c <wj_usi_spi_irqhandler+0x1d0>
            spi_priv->transfer_num = USI_TX_MAX_FIFO;
    314a:	45c1                	li	a1,16
            spi_priv->transfer_num = spi_priv->clk_num;
    314c:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    314e:	04c00793          	li	a5,76
    3152:	02f687b3          	mul	a5,a3,a5
    3156:	4501                	li	a0,0
    3158:	97a6                	add	a5,a5,s1
    315a:	0247a283          	lw	t0,36(a5)
    315e:	f05509e3          	beq	a0,t0,3070 <wj_usi_spi_irqhandler+0xf4>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3162:	4f8c                	lw	a1,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    3164:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3166:	0005c383          	lbu	t2,0(a1)
            spi_priv->send_buf++;
    316a:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    316c:	00732423          	sw	t2,8(t1)
            spi_priv->send_buf++;
    3170:	cf8c                	sw	a1,24(a5)
            spi_priv->send_num--;
    3172:	4b8c                	lw	a1,16(a5)
    3174:	15fd                	addi	a1,a1,-1
    3176:	cb8c                	sw	a1,16(a5)
    3178:	b7dd                	j	315e <wj_usi_spi_irqhandler+0x1e2>
            if (spi_priv->cb_event) {
    317a:	c219                	beqz	a2,3180 <wj_usi_spi_irqhandler+0x204>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    317c:	4585                	li	a1,1
    317e:	b781                	j	30be <wj_usi_spi_irqhandler+0x142>
    spi_priv->clk_num -= spi_priv->transfer_num;
    3180:	04c00793          	li	a5,76
    3184:	02f686b3          	mul	a3,a3,a5
    3188:	94b6                	add	s1,s1,a3
    318a:	549c                	lw	a5,40(s1)
    318c:	50d4                	lw	a3,36(s1)
    318e:	8f95                	sub	a5,a5,a3
    3190:	d49c                	sw	a5,40(s1)
    3192:	bf05                	j	30c2 <wj_usi_spi_irqhandler+0x146>

00003194 <ck_usart_intr_recv_data>:
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(wj_usi_usart_priv_t *usart_priv)
{
    if ((usart_priv->rx_total_num == 0) || (usart_priv->rx_buf == NULL)) {
    3194:	4558                	lw	a4,12(a0)
    3196:	c319                	beqz	a4,319c <ck_usart_intr_recv_data+0x8>
    3198:	495c                	lw	a5,20(a0)
    319a:	e791                	bnez	a5,31a6 <ck_usart_intr_recv_data+0x12>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    319c:	00852303          	lw	t1,8(a0)
    31a0:	45b9                	li	a1,14
        usart_priv->rx_buf = NULL;
        usart_priv->rx_busy = 0;
        usart_priv->rx_total_num = 0;

        if (usart_priv->cb_event) {
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    31a2:	5948                	lw	a0,52(a0)
    31a4:	8302                	jr	t1
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    31a6:	4110                	lw	a2,0(a0)
    uint32_t rxfifo_num = (addr->USI_FIFO_STA >> 16) & 0xf;
    31a8:	465c                	lw	a5,12(a2)
    31aa:	83c1                	srli	a5,a5,0x10
    31ac:	8bbd                	andi	a5,a5,15
    uint32_t rxdata_num = (rxfifo_num > usart_priv->rx_total_num) ? usart_priv->rx_total_num : rxfifo_num;
    31ae:	00f77363          	bgeu	a4,a5,31b4 <ck_usart_intr_recv_data+0x20>
    31b2:	87ba                	mv	a5,a4
    for (i = 0; i < rxdata_num; i++) {
    31b4:	4701                	li	a4,0
    31b6:	02f71563          	bne	a4,a5,31e0 <ck_usart_intr_recv_data+0x4c>
    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    31ba:	4d58                	lw	a4,28(a0)
    31bc:	455c                	lw	a5,12(a0)
    31be:	02f76d63          	bltu	a4,a5,31f8 <ck_usart_intr_recv_data+0x64>
        if (usart_priv->cb_event) {
    31c2:	00852303          	lw	t1,8(a0)
        usart_priv->rx_cnt = 0;
    31c6:	00052e23          	sw	zero,28(a0)
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    31ca:	d91c                	sw	a5,48(a0)
        usart_priv->rx_buf = NULL;
    31cc:	00052a23          	sw	zero,20(a0)
        usart_priv->rx_busy = 0;
    31d0:	02052423          	sw	zero,40(a0)
        usart_priv->rx_total_num = 0;
    31d4:	00052623          	sw	zero,12(a0)
        if (usart_priv->cb_event) {
    31d8:	02030063          	beqz	t1,31f8 <ck_usart_intr_recv_data+0x64>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    31dc:	4585                	li	a1,1
    31de:	b7d1                	j	31a2 <ck_usart_intr_recv_data+0xe>
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    31e0:	460c                	lw	a1,8(a2)
    31e2:	4954                	lw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    31e4:	0705                	addi	a4,a4,1
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    31e6:	00b68023          	sb	a1,0(a3)
        usart_priv->rx_cnt++;
    31ea:	4d54                	lw	a3,28(a0)
    31ec:	0685                	addi	a3,a3,1
    31ee:	cd54                	sw	a3,28(a0)
        usart_priv->rx_buf++;
    31f0:	4954                	lw	a3,20(a0)
    31f2:	0685                	addi	a3,a3,1
    31f4:	c954                	sw	a3,20(a0)
    31f6:	b7c1                	j	31b6 <ck_usart_intr_recv_data+0x22>
        }
    }
}
    31f8:	8082                	ret

000031fa <drv_usi_usart_config_baudrate>:
{
    31fa:	1141                	addi	sp,sp,-16
    31fc:	c422                	sw	s0,8(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    31fe:	4100                	lw	s0,0(a0)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3200:	5948                	lw	a0,52(a0)
{
    3202:	c606                	sw	ra,12(sp)
    addr->USI_EN = 0x0;
    3204:	00042023          	sw	zero,0(s0)
{
    3208:	c02e                	sw	a1,0(sp)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    320a:	1ff000ef          	jal	ra,3c08 <drv_get_usi_freq>
    320e:	4729                	li	a4,10
    3210:	02e50533          	mul	a0,a0,a4
    3214:	4582                	lw	a1,0(sp)
    3216:	02b555b3          	divu	a1,a0,a1
    321a:	8191                	srli	a1,a1,0x4
    if ((divisor % 10) >= 5) {
    321c:	02e5d7b3          	divu	a5,a1,a4
    3220:	02e5f5b3          	remu	a1,a1,a4
    3224:	4711                	li	a4,4
    3226:	00b76363          	bltu	a4,a1,322c <drv_usi_usart_config_baudrate+0x32>
        divisor = divisor / 10 - 1;
    322a:	17fd                	addi	a5,a5,-1
    addr->USI_CLK_DIV0 = divisor;
    322c:	c81c                	sw	a5,16(s0)
    addr->USI_EN = 0xf;
    322e:	47bd                	li	a5,15
    3230:	c01c                	sw	a5,0(s0)
}
    3232:	40b2                	lw	ra,12(sp)
    3234:	4422                	lw	s0,8(sp)
    3236:	4501                	li	a0,0
    3238:	0141                	addi	sp,sp,16
    323a:	8082                	ret

0000323c <drv_usi_usart_config_mode>:
    USART_NULL_PARAM_CHK(handle);
    323c:	cd11                	beqz	a0,3258 <drv_usi_usart_config_mode+0x1c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    323e:	411c                	lw	a5,0(a0)
        addr->USI_EN = 0xf;
    3240:	473d                	li	a4,15
    addr->USI_EN = 0x0;
    3242:	0007a023          	sw	zero,0(a5)
        addr->USI_EN = 0xf;
    3246:	c398                	sw	a4,0(a5)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    3248:	e199                	bnez	a1,324e <drv_usi_usart_config_mode+0x12>
        return 0;
    324a:	4501                	li	a0,0
    324c:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    324e:	81020537          	lui	a0,0x81020
    3252:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60ff0086>
    3256:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    3258:	81020537          	lui	a0,0x81020
    325c:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3260:	8082                	ret

00003262 <drv_usi_usart_config_parity>:
    USART_NULL_PARAM_CHK(handle);
    3262:	c939                	beqz	a0,32b8 <drv_usi_usart_config_parity+0x56>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3264:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    3266:	4705                	li	a4,1
    3268:	0007a023          	sw	zero,0(a5)
    switch (parity) {
    326c:	02e58b63          	beq	a1,a4,32a2 <drv_usi_usart_config_parity+0x40>
    3270:	c989                	beqz	a1,3282 <drv_usi_usart_config_parity+0x20>
    3272:	4709                	li	a4,2
    3274:	00e58e63          	beq	a1,a4,3290 <drv_usi_usart_config_parity+0x2e>
            return ERR_USART(USART_ERROR_PARITY);
    3278:	81020537          	lui	a0,0x81020
    327c:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60ff0089>
    3280:	8082                	ret
            addr->USI_UART_CTRL &= ~CTRL_PARITY_ENABLE;
    3282:	4f98                	lw	a4,24(a5)
    3284:	9b3d                	andi	a4,a4,-17
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    3286:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3288:	473d                	li	a4,15
    328a:	c398                	sw	a4,0(a5)
    return 0;
    328c:	4501                	li	a0,0
    328e:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    3290:	4f98                	lw	a4,24(a5)
    3292:	8b3d                	andi	a4,a4,15
    3294:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    3296:	4f98                	lw	a4,24(a5)
    3298:	01076713          	ori	a4,a4,16
    329c:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ODD;
    329e:	4f98                	lw	a4,24(a5)
    32a0:	b7dd                	j	3286 <drv_usi_usart_config_parity+0x24>
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    32a2:	4f98                	lw	a4,24(a5)
    32a4:	8b3d                	andi	a4,a4,15
    32a6:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    32a8:	4f98                	lw	a4,24(a5)
    32aa:	01076713          	ori	a4,a4,16
    32ae:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    32b0:	4f98                	lw	a4,24(a5)
    32b2:	02076713          	ori	a4,a4,32
    32b6:	bfc1                	j	3286 <drv_usi_usart_config_parity+0x24>
    USART_NULL_PARAM_CHK(handle);
    32b8:	81020537          	lui	a0,0x81020
    32bc:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    32c0:	8082                	ret

000032c2 <drv_usi_usart_config_stopbits>:
    USART_NULL_PARAM_CHK(handle);
    32c2:	c931                	beqz	a0,3316 <drv_usi_usart_config_stopbits+0x54>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32c4:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    32c6:	4705                	li	a4,1
    32c8:	0007a023          	sw	zero,0(a5)
    switch (stopbit) {
    32cc:	02e58d63          	beq	a1,a4,3306 <drv_usi_usart_config_stopbits+0x44>
    32d0:	c989                	beqz	a1,32e2 <drv_usi_usart_config_stopbits+0x20>
    32d2:	4709                	li	a4,2
    32d4:	02e58163          	beq	a1,a4,32f6 <drv_usi_usart_config_stopbits+0x34>
            return ERR_USART(USART_ERROR_STOP_BITS);
    32d8:	81020537          	lui	a0,0x81020
    32dc:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60ff008a>
    32e0:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    32e2:	4f98                	lw	a4,24(a5)
    32e4:	03377713          	andi	a4,a4,51
    32e8:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1;
    32ea:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    32ec:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    32ee:	473d                	li	a4,15
    32f0:	c398                	sw	a4,0(a5)
    return 0;
    32f2:	4501                	li	a0,0
    32f4:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    32f6:	4f98                	lw	a4,24(a5)
    32f8:	03377713          	andi	a4,a4,51
    32fc:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1_5;
    32fe:	4f98                	lw	a4,24(a5)
    3300:	00476713          	ori	a4,a4,4
    3304:	b7e5                	j	32ec <drv_usi_usart_config_stopbits+0x2a>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3306:	4f98                	lw	a4,24(a5)
    3308:	03377713          	andi	a4,a4,51
    330c:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    330e:	4f98                	lw	a4,24(a5)
    3310:	00876713          	ori	a4,a4,8
    3314:	bfe1                	j	32ec <drv_usi_usart_config_stopbits+0x2a>
    USART_NULL_PARAM_CHK(handle);
    3316:	81020537          	lui	a0,0x81020
    331a:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    331e:	8082                	ret

00003320 <drv_usi_usart_config_databits>:
    USART_NULL_PARAM_CHK(handle);
    3320:	c52d                	beqz	a0,338a <drv_usi_usart_config_databits+0x6a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3322:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    3324:	4705                	li	a4,1
    3326:	0007a023          	sw	zero,0(a5)
    switch (databits) {
    332a:	02e58863          	beq	a1,a4,335a <drv_usi_usart_config_databits+0x3a>
    332e:	cd81                	beqz	a1,3346 <drv_usi_usart_config_databits+0x26>
    3330:	4709                	li	a4,2
    3332:	02e58c63          	beq	a1,a4,336a <drv_usi_usart_config_databits+0x4a>
    3336:	470d                	li	a4,3
    3338:	04e58163          	beq	a1,a4,337a <drv_usi_usart_config_databits+0x5a>
            return ERR_USART(USART_ERROR_DATA_BITS);
    333c:	81020537          	lui	a0,0x81020
    3340:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60ff0088>
    3344:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    3346:	4f98                	lw	a4,24(a5)
    3348:	03c77713          	andi	a4,a4,60
    334c:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_5;
    334e:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    3350:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3352:	473d                	li	a4,15
    3354:	c398                	sw	a4,0(a5)
    return 0;
    3356:	4501                	li	a0,0
    3358:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    335a:	4f98                	lw	a4,24(a5)
    335c:	03c77713          	andi	a4,a4,60
    3360:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_6;
    3362:	4f98                	lw	a4,24(a5)
    3364:	00176713          	ori	a4,a4,1
    3368:	b7e5                	j	3350 <drv_usi_usart_config_databits+0x30>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    336a:	4f98                	lw	a4,24(a5)
    336c:	03c77713          	andi	a4,a4,60
    3370:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_7;
    3372:	4f98                	lw	a4,24(a5)
    3374:	00276713          	ori	a4,a4,2
    3378:	bfe1                	j	3350 <drv_usi_usart_config_databits+0x30>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    337a:	4f98                	lw	a4,24(a5)
    337c:	03c77713          	andi	a4,a4,60
    3380:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    3382:	4f98                	lw	a4,24(a5)
    3384:	00376713          	ori	a4,a4,3
    3388:	b7e1                	j	3350 <drv_usi_usart_config_databits+0x30>
    USART_NULL_PARAM_CHK(handle);
    338a:	81020537          	lui	a0,0x81020
    338e:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3392:	8082                	ret

00003394 <wj_usi_usart_irqhandler>:
    }
}

void wj_usi_usart_irqhandler(int idx)
{
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3394:	03800793          	li	a5,56
    3398:	02f507b3          	mul	a5,a0,a5
    339c:	200026b7          	lui	a3,0x20002
    33a0:	a1068713          	addi	a4,a3,-1520 # 20001a10 <usi_usart_instance>
{
    33a4:	1101                	addi	sp,sp,-32
    33a6:	ca26                	sw	s1,20(sp)
    33a8:	cc22                	sw	s0,24(sp)
    33aa:	ce06                	sw	ra,28(sp)
    33ac:	842a                	mv	s0,a0
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    33ae:	97ba                	add	a5,a5,a4
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33b0:	4384                	lw	s1,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    33b2:	48f8                	lw	a4,84(s1)
    33b4:	c03a                	sw	a4,0(sp)
    33b6:	073a                	slli	a4,a4,0xe
    33b8:	8339                	srli	a4,a4,0xe
    33ba:	c43a                	sw	a4,8(sp)

    if (intr_state & USI_INT_TX_EMPTY) {
    33bc:	4702                	lw	a4,0(sp)
    33be:	00277613          	andi	a2,a4,2
    33c2:	a1068713          	addi	a4,a3,-1520
    33c6:	c23a                	sw	a4,4(sp)
    33c8:	ce1d                	beqz	a2,3406 <wj_usi_usart_irqhandler+0x72>
    if (usart_priv->tx_total_num == 0) {
    33ca:	4b94                	lw	a3,16(a5)
    33cc:	ca9d                	beqz	a3,3402 <wj_usi_usart_irqhandler+0x6e>
    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    33ce:	5390                	lw	a2,32(a5)
    33d0:	0ad66f63          	bltu	a2,a3,348e <wj_usi_usart_irqhandler+0xfa>
        addr->USI_INTR_EN &= (~USI_INT_TX_EMPTY);
    33d4:	48b0                	lw	a2,80(s1)
    33d6:	9a75                	andi	a2,a2,-3
    33d8:	c8b0                	sw	a2,80(s1)
        addr->USI_INTR_EN |= USI_INT_UART_STOP;
    33da:	48b0                	lw	a2,80(s1)
    33dc:	40066613          	ori	a2,a2,1024
    33e0:	c8b0                	sw	a2,80(s1)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    33e2:	d7d4                	sw	a3,44(a5)
        if (usart_priv->cb_event) {
    33e4:	4794                	lw	a3,8(a5)
        usart_priv->tx_cnt = 0;
    33e6:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    33ea:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    33ee:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    33f2:	0007a823          	sw	zero,16(a5)
        if (usart_priv->cb_event) {
    33f6:	c691                	beqz	a3,3402 <wj_usi_usart_irqhandler+0x6e>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_SEND_COMPLETE);
    33f8:	5bc8                	lw	a0,52(a5)
    33fa:	4581                	li	a1,0
    33fc:	c63e                	sw	a5,12(sp)
    33fe:	9682                	jalr	a3
    3400:	47b2                	lw	a5,12(sp)
        ck_usart_intr_threshold_empty(usart_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    3402:	4689                	li	a3,2
    3404:	d0b4                	sw	a3,96(s1)
    }

    if (intr_state & USI_INT_RX_THOLD) {
    3406:	4702                	lw	a4,0(sp)
    3408:	02077693          	andi	a3,a4,32
    340c:	ca81                	beqz	a3,341c <wj_usi_usart_irqhandler+0x88>
        ck_usart_intr_recv_data(usart_priv);
    340e:	853e                	mv	a0,a5
    3410:	c63e                	sw	a5,12(sp)
    3412:	3349                	jal	3194 <ck_usart_intr_recv_data>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3414:	47b2                	lw	a5,12(sp)
    3416:	02000693          	li	a3,32
    341a:	d0b4                	sw	a3,96(s1)
    }

    if (intr_state & USI_INT_UART_STOP) {
    341c:	4702                	lw	a4,0(sp)
    341e:	40077693          	andi	a3,a4,1024
    3422:	c685                	beqz	a3,344a <wj_usi_usart_irqhandler+0xb6>
        if (USI_FIFO_STA_RX_NUM(addr) > 0) {
    3424:	44d4                	lw	a3,12(s1)
    3426:	82c1                	srli	a3,a3,0x10
    3428:	8afd                	andi	a3,a3,31
    342a:	ce89                	beqz	a3,3444 <wj_usi_usart_irqhandler+0xb0>
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    342c:	03800693          	li	a3,56
    3430:	02d406b3          	mul	a3,s0,a3
    3434:	4712                	lw	a4,4(sp)
    3436:	96ba                	add	a3,a3,a4
    3438:	46d0                	lw	a2,12(a3)
    343a:	ce41                	beqz	a2,34d2 <wj_usi_usart_irqhandler+0x13e>
    343c:	4ad4                	lw	a3,20(a3)
    343e:	cad1                	beqz	a3,34d2 <wj_usi_usart_irqhandler+0x13e>
        ck_usart_intr_recv_data(usart_priv);
    3440:	853e                	mv	a0,a5
    3442:	3b89                	jal	3194 <ck_usart_intr_recv_data>
            ck_usart_intr_char_timeout(usart_priv);     //receive small data
        }

        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3444:	02000793          	li	a5,32
    3448:	d0bc                	sw	a5,96(s1)
    }

    if (intr_state & USI_INT_UART_PERR) {
    344a:	4782                	lw	a5,0(sp)
    344c:	01479713          	slli	a4,a5,0x14
    3450:	02075863          	bgez	a4,3480 <wj_usi_usart_irqhandler+0xec>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3454:	03800793          	li	a5,56
    3458:	02f40433          	mul	s0,s0,a5
    345c:	4792                	lw	a5,4(sp)
    345e:	943e                	add	s0,s0,a5
    3460:	401c                	lw	a5,0(s0)
    addr->USI_EN &= ~USI_RX_FIFO_EN;
    3462:	4394                	lw	a3,0(a5)
    3464:	9add                	andi	a3,a3,-9
    3466:	c394                	sw	a3,0(a5)
    addr->USI_EN |= USI_RX_FIFO_EN;
    3468:	4394                	lw	a3,0(a5)
    346a:	0086e693          	ori	a3,a3,8
    346e:	c394                	sw	a3,0(a5)
    if (usart_priv->cb_event) {
    3470:	441c                	lw	a5,8(s0)
    3472:	c781                	beqz	a5,347a <wj_usi_usart_irqhandler+0xe6>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RX_PARITY_ERROR);
    3474:	5848                	lw	a0,52(s0)
    3476:	45a5                	li	a1,9
    3478:	9782                	jalr	a5
        ck_usart_intr_recv_line(usart_priv);
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    347a:	02000793          	li	a5,32
    347e:	d0bc                	sw	a5,96(s1)
    }

    addr->USI_INTR_CLR = intr_state;
    3480:	47a2                	lw	a5,8(sp)
}
    3482:	40f2                	lw	ra,28(sp)
    3484:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    3486:	d0bc                	sw	a5,96(s1)
}
    3488:	44d2                	lw	s1,20(sp)
    348a:	6105                	addi	sp,sp,32
    348c:	8082                	ret
        uint32_t remain_txdata  = usart_priv->tx_total_num - usart_priv->tx_cnt;
    348e:	538c                	lw	a1,32(a5)
    3490:	40b685b3          	sub	a1,a3,a1
        uint32_t txdata_num = (remain_txdata > (USI_TX_MAX_FIFO - 1)) ? (USI_TX_MAX_FIFO - 1) : remain_txdata;
    3494:	46bd                	li	a3,15
    3496:	00b6f363          	bgeu	a3,a1,349c <wj_usi_usart_irqhandler+0x108>
    349a:	45bd                	li	a1,15
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    349c:	03800693          	li	a3,56
    34a0:	02d406b3          	mul	a3,s0,a3
    34a4:	4712                	lw	a4,4(sp)
        volatile uint32_t i = 0u;
    34a6:	c802                	sw	zero,16(sp)
        for (i = 0; i < txdata_num; i++) {
    34a8:	c802                	sw	zero,16(sp)
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    34aa:	96ba                	add	a3,a3,a4
        for (i = 0; i < txdata_num; i++) {
    34ac:	4642                	lw	a2,16(sp)
    34ae:	00b66563          	bltu	a2,a1,34b8 <wj_usi_usart_irqhandler+0x124>
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    34b2:	4689                	li	a3,2
    34b4:	d0b4                	sw	a3,96(s1)
    34b6:	b7b1                	j	3402 <wj_usi_usart_irqhandler+0x6e>
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    34b8:	4e90                	lw	a2,24(a3)
    34ba:	00064503          	lbu	a0,0(a2)
            usart_priv->tx_buf++;
    34be:	0605                	addi	a2,a2,1
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    34c0:	c488                	sw	a0,8(s1)
            usart_priv->tx_cnt++;
    34c2:	5288                	lw	a0,32(a3)
            usart_priv->tx_buf++;
    34c4:	ce90                	sw	a2,24(a3)
            usart_priv->tx_cnt++;
    34c6:	0505                	addi	a0,a0,1
    34c8:	d288                	sw	a0,32(a3)
        for (i = 0; i < txdata_num; i++) {
    34ca:	4642                	lw	a2,16(sp)
    34cc:	0605                	addi	a2,a2,1
    34ce:	c832                	sw	a2,16(sp)
    34d0:	bff1                	j	34ac <wj_usi_usart_irqhandler+0x118>
    if (usart_priv->cb_event) {
    34d2:	03800793          	li	a5,56
    34d6:	02f407b3          	mul	a5,s0,a5
    34da:	4712                	lw	a4,4(sp)
    34dc:	97ba                	add	a5,a5,a4
    34de:	4794                	lw	a3,8(a5)
    34e0:	c689                	beqz	a3,34ea <wj_usi_usart_irqhandler+0x156>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    34e2:	5bc8                	lw	a0,52(a5)
    34e4:	45b9                	li	a1,14
    34e6:	9682                	jalr	a3
    34e8:	bfb1                	j	3444 <wj_usi_usart_irqhandler+0xb0>
        wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34ea:	439c                	lw	a5,0(a5)
        addr->USI_EN &= ~USI_RX_FIFO_EN;
    34ec:	4394                	lw	a3,0(a5)
    34ee:	9add                	andi	a3,a3,-9
    34f0:	c394                	sw	a3,0(a5)
        addr->USI_EN |= USI_RX_FIFO_EN;
    34f2:	4394                	lw	a3,0(a5)
    34f4:	0086e693          	ori	a3,a3,8
    34f8:	c394                	sw	a3,0(a5)
    34fa:	b7a9                	j	3444 <wj_usi_usart_irqhandler+0xb0>

000034fc <drv_usi_usart_putchar>:
  \return      error code
*/
int32_t drv_usi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34fc:	4118                	lw	a4,0(a0)
    //addr->USI_EN = 0xb;
    //addr->USI_EN = 0xf;
    addr->USI_TX_RX_FIFO = ch;
    34fe:	c70c                	sw	a1,8(a4)

    while (!(addr->USI_FIFO_STA & 0x1));
    3500:	475c                	lw	a5,12(a4)
    3502:	8b85                	andi	a5,a5,1
    3504:	dff5                	beqz	a5,3500 <drv_usi_usart_putchar+0x4>

    return 0;
}
    3506:	4501                	li	a0,0
    3508:	8082                	ret

0000350a <drv_usi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event event call back function \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t drv_usi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    350a:	1111                	addi	sp,sp,-28
    350c:	c02e                	sw	a1,0(sp)
    //initialize instace
    uint32_t base;
    uint32_t irq;
    void *handler;

    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    350e:	0074                	addi	a3,sp,12
    3510:	0030                	addi	a2,sp,8
    3512:	004c                	addi	a1,sp,4
{
    3514:	c826                	sw	s1,16(sp)
    3516:	cc06                	sw	ra,24(sp)
    3518:	ca22                	sw	s0,20(sp)
    351a:	84aa                	mv	s1,a0
    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    351c:	2c39                	jal	373a <target_usi_usart_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    351e:	4789                	li	a5,2
    3520:	00a7f963          	bgeu	a5,a0,3532 <drv_usi_usart_initialize+0x28>
        return NULL;
    3524:	4401                	li	s0,0
    addr->USI_MODE_SEL = USI_MODE_UART;
    drv_irq_register(usart_priv->irq, handler);
    drv_irq_enable(usart_priv->irq);

    return usart_priv;
}
    3526:	8522                	mv	a0,s0
    3528:	40e2                	lw	ra,24(sp)
    352a:	4452                	lw	s0,20(sp)
    352c:	44c2                	lw	s1,16(sp)
    352e:	0171                	addi	sp,sp,28
    3530:	8082                	ret
    ret = drv_usi_initialize(idx);
    3532:	8526                	mv	a0,s1
    3534:	f44ff0ef          	jal	ra,2c78 <drv_usi_initialize>
    if (ret < 0) {
    3538:	fe0546e3          	bltz	a0,3524 <drv_usi_usart_initialize+0x1a>
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    353c:	03800413          	li	s0,56
    3540:	028487b3          	mul	a5,s1,s0
    usart_priv->irq = irq;
    3544:	4722                	lw	a4,8(sp)
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3546:	20002437          	lui	s0,0x20002
    354a:	a1040413          	addi	s0,s0,-1520 # 20001a10 <usi_usart_instance>
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    354e:	45c1                	li	a1,16
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3550:	943e                	add	s0,s0,a5
    usart_priv->irq = irq;
    3552:	c058                	sw	a4,4(s0)
    usart_priv->base = base;
    3554:	4792                	lw	a5,4(sp)
    usart_priv->cb_event = cb_event;
    3556:	4702                	lw	a4,0(sp)
    usart_priv->idx = idx;
    3558:	d844                	sw	s1,52(s0)
    usart_priv->base = base;
    355a:	c01c                	sw	a5,0(s0)
    usart_priv->cb_event = cb_event;
    355c:	c418                	sw	a4,8(s0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    355e:	6705                	lui	a4,0x1
    3560:	f9870713          	addi	a4,a4,-104 # f98 <__divdf3+0xe8>
    addr->USI_EN = 0x0;
    3564:	0007a023          	sw	zero,0(a5)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    3568:	cff8                	sw	a4,92(a5)
    addr->USI_INTR_EN = WJ_UART_INT_ENABLE_DEFAUL;
    356a:	cbb8                	sw	a4,80(a5)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    356c:	853e                	mv	a0,a5
    356e:	c03e                	sw	a5,0(sp)
    3570:	e90ff0ef          	jal	ra,2c00 <wj_usi_set_rxfifo_th>
    addr->USI_MODE_SEL = USI_MODE_UART;
    3574:	4782                	lw	a5,0(sp)
    drv_irq_register(usart_priv->irq, handler);
    3576:	4048                	lw	a0,4(s0)
    3578:	45b2                	lw	a1,12(sp)
    addr->USI_MODE_SEL = USI_MODE_UART;
    357a:	0007a223          	sw	zero,4(a5)
    drv_irq_register(usart_priv->irq, handler);
    357e:	e72ff0ef          	jal	ra,2bf0 <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    3582:	4048                	lw	a0,4(s0)
    3584:	e54ff0ef          	jal	ra,2bd8 <drv_irq_enable>
    return usart_priv;
    3588:	bf79                	j	3526 <drv_usi_usart_initialize+0x1c>

0000358a <drv_usi_usart_config>:
                             uint32_t baud,
                             usart_mode_e mode,
                             usart_parity_e parity,
                             usart_stop_bits_e stopbits,
                             usart_data_bits_e bits)
{
    358a:	1111                	addi	sp,sp,-28
    358c:	c826                	sw	s1,16(sp)
    int32_t ret;
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    358e:	4104                	lw	s1,0(a0)
{
    3590:	ca22                	sw	s0,20(sp)
    3592:	cc06                	sw	ra,24(sp)

    addr->USI_EN = 0x0;
    3594:	0004a023          	sw	zero,0(s1)
{
    3598:	842a                	mv	s0,a0
    359a:	c632                	sw	a2,12(sp)
    359c:	c436                	sw	a3,8(sp)
    359e:	c03a                	sw	a4,0(sp)
    35a0:	c23e                	sw	a5,4(sp)
    /* control the data_bit of the usart*/
    ret = drv_usi_usart_config_baudrate(handle, baud);
    35a2:	39a1                	jal	31fa <drv_usi_usart_config_baudrate>

    if (ret < 0) {
    35a4:	02054b63          	bltz	a0,35da <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control the parity of the usart*/
    ret = drv_usi_usart_config_parity(handle, parity);
    35a8:	46a2                	lw	a3,8(sp)
    35aa:	8522                	mv	a0,s0
    35ac:	85b6                	mv	a1,a3
    35ae:	3955                	jal	3262 <drv_usi_usart_config_parity>

    if (ret < 0) {
    35b0:	02054563          	bltz	a0,35da <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control mode of the usart*/
    ret = drv_usi_usart_config_mode(handle, mode);
    35b4:	4632                	lw	a2,12(sp)
    35b6:	8522                	mv	a0,s0
    35b8:	85b2                	mv	a1,a2
    35ba:	3149                	jal	323c <drv_usi_usart_config_mode>

    if (ret < 0) {
    35bc:	00054f63          	bltz	a0,35da <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = drv_usi_usart_config_stopbits(handle, stopbits);
    35c0:	4582                	lw	a1,0(sp)
    35c2:	8522                	mv	a0,s0
    35c4:	39fd                	jal	32c2 <drv_usi_usart_config_stopbits>

    if (ret < 0) {
    35c6:	00054a63          	bltz	a0,35da <drv_usi_usart_config+0x50>
        return ret;
    }

    ret = drv_usi_usart_config_databits(handle, bits);
    35ca:	4592                	lw	a1,4(sp)
    35cc:	8522                	mv	a0,s0
    35ce:	3b89                	jal	3320 <drv_usi_usart_config_databits>

    if (ret < 0) {
    35d0:	00054563          	bltz	a0,35da <drv_usi_usart_config+0x50>
        return ret;
    }

    addr->USI_EN = 0xf;
    35d4:	47bd                	li	a5,15
    35d6:	c09c                	sw	a5,0(s1)
    return 0;
    35d8:	4501                	li	a0,0
}
    35da:	40e2                	lw	ra,24(sp)
    35dc:	4452                	lw	s0,20(sp)
    35de:	44c2                	lw	s1,16(sp)
    35e0:	0171                	addi	sp,sp,28
    35e2:	8082                	ret

000035e4 <drv_usi_usart_send>:
  \param[in]   num   Number of data items to send
  \return      error code
*/
int32_t drv_usi_usart_send(usart_handle_t handle, const void *data, uint32_t num)
{
    USART_NULL_PARAM_CHK(handle);
    35e4:	cd05                	beqz	a0,361c <drv_usi_usart_send+0x38>
    USART_NULL_PARAM_CHK(data);
    35e6:	c99d                	beqz	a1,361c <drv_usi_usart_send+0x38>

    if (num == 0) {
    35e8:	ca15                	beqz	a2,361c <drv_usi_usart_send+0x38>
        return ERR_USART(DRV_ERROR_PARAMETER);
    }

    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    35ea:	411c                	lw	a5,0(a0)

    usart_priv->tx_buf = (uint8_t *)data;
    usart_priv->tx_total_num = num;
    usart_priv->tx_cnt = 0;
    35ec:	02052023          	sw	zero,32(a0)
    usart_priv->tx_busy = 1;
    35f0:	4705                	li	a4,1
    35f2:	d158                	sw	a4,36(a0)
    usart_priv->last_tx_num = 0;

    /* enable the interrupt*/
    addr->USI_INTR_UNMASK   |= USI_INT_TX_EMPTY;
    35f4:	4ff8                	lw	a4,92(a5)
    usart_priv->tx_buf = (uint8_t *)data;
    35f6:	cd0c                	sw	a1,24(a0)
    usart_priv->tx_total_num = num;
    35f8:	c910                	sw	a2,16(a0)
    usart_priv->last_tx_num = 0;
    35fa:	02052623          	sw	zero,44(a0)
    addr->USI_INTR_UNMASK   |= USI_INT_TX_EMPTY;
    35fe:	00276713          	ori	a4,a4,2
    3602:	cff8                	sw	a4,92(a5)
    addr->USI_INTR_EN       |= USI_INT_TX_EMPTY;
    3604:	4bb8                	lw	a4,80(a5)
    addr->USI_INTR_EN       &= ~USI_INT_UART_STOP;

    addr->USI_EN = 0xf;
    return 0;
    3606:	4501                	li	a0,0
    addr->USI_INTR_EN       |= USI_INT_TX_EMPTY;
    3608:	00276713          	ori	a4,a4,2
    360c:	cbb8                	sw	a4,80(a5)
    addr->USI_INTR_EN       &= ~USI_INT_UART_STOP;
    360e:	4bb8                	lw	a4,80(a5)
    3610:	bff77713          	andi	a4,a4,-1025
    3614:	cbb8                	sw	a4,80(a5)
    addr->USI_EN = 0xf;
    3616:	473d                	li	a4,15
    3618:	c398                	sw	a4,0(a5)
    return 0;
    361a:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    361c:	81020537          	lui	a0,0x81020
    3620:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3624:	8082                	ret

00003626 <drv_usi_usart_receive>:
  \param[in]   num   Number of data items to receive
  \return      error code
*/
int32_t drv_usi_usart_receive(usart_handle_t handle, void *data, uint32_t num)
{
    USART_NULL_PARAM_CHK(handle);
    3626:	cd01                	beqz	a0,363e <drv_usi_usart_receive+0x18>
    USART_NULL_PARAM_CHK(data);
    3628:	c999                	beqz	a1,363e <drv_usi_usart_receive+0x18>

    wj_usi_usart_priv_t *usart_priv = handle;

    usart_priv->rx_buf = (uint8_t *)data;   // Save receive buffer usart
    usart_priv->rx_total_num = num;         // Save number of data to be received
    usart_priv->rx_cnt = 0;
    362a:	00052e23          	sw	zero,28(a0)
    usart_priv->rx_busy = 1;
    362e:	4785                	li	a5,1
    usart_priv->rx_buf = (uint8_t *)data;   // Save receive buffer usart
    3630:	c94c                	sw	a1,20(a0)
    usart_priv->rx_total_num = num;         // Save number of data to be received
    3632:	c550                	sw	a2,12(a0)
    usart_priv->rx_busy = 1;
    3634:	d51c                	sw	a5,40(a0)
    usart_priv->last_rx_num = 0;
    3636:	02052823          	sw	zero,48(a0)
    return 0;
    363a:	4501                	li	a0,0
    363c:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    363e:	81020537          	lui	a0,0x81020
    3642:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3646:	8082                	ret

00003648 <drv_usi_usart_abort_receive>:
  \param[in]   handle  usart handle to operate.
  \return      error code
*/
int32_t drv_usi_usart_abort_receive(usart_handle_t handle)
{
    USART_NULL_PARAM_CHK(handle);
    3648:	c509                	beqz	a0,3652 <drv_usi_usart_abort_receive+0xa>
    wj_usi_usart_priv_t *usart_priv = handle;

    usart_priv->rx_cnt = usart_priv->rx_total_num;
    364a:	455c                	lw	a5,12(a0)
    364c:	cd5c                	sw	a5,28(a0)
    return 0;
    364e:	4501                	li	a0,0
    3650:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    3652:	81020537          	lui	a0,0x81020
    3656:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    365a:	8082                	ret

0000365c <drv_usi_usart_get_status>:
  \brief       Get USART status.
  \param[in]   handle  usart handle to operate.
  \return      USART status \ref usart_status_t
*/
usart_status_t drv_usi_usart_get_status(usart_handle_t handle)
{
    365c:	1171                	addi	sp,sp,-4
    if (handle == NULL) {
    365e:	c919                	beqz	a0,3674 <drv_usi_usart_get_status+0x18>
    }

    usart_status_t usart_status = {0};
    wj_usi_usart_priv_t *usart_priv = handle;

    usart_status.tx_busy = usart_priv->tx_busy;
    3660:	515c                	lw	a5,36(a0)
    usart_status.rx_busy = usart_priv->rx_busy;
    3662:	5518                	lw	a4,40(a0)
    usart_status.tx_enable  = 1;
    usart_status.rx_enable  = 1;

    return usart_status;
    3664:	0017f513          	andi	a0,a5,1
    3668:	00177793          	andi	a5,a4,1
    366c:	0786                	slli	a5,a5,0x1
    366e:	8d5d                	or	a0,a0,a5
    3670:	18056513          	ori	a0,a0,384
}
    3674:	0111                	addi	sp,sp,4
    3676:	8082                	ret

00003678 <csi_usart_putchar>:
  \param[in]   ch  the input character
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    return drv_usi_usart_putchar(handle, ch);
    3678:	b551                	j	34fc <drv_usi_usart_putchar>

0000367a <csi_usart_initialize>:
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    return drv_usi_usart_initialize(idx, cb_event);
    367a:	bd41                	j	350a <drv_usi_usart_initialize>

0000367c <csi_usart_config>:
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    return drv_usi_usart_config(handle, baud, mode, parity, stopbits, bits);
    367c:	b739                	j	358a <drv_usi_usart_config>

0000367e <csi_usart_send>:
  \param[in]   num   Number of data items to send
  \return      error code
*/
int32_t csi_usart_send(usart_handle_t handle, const void *data, uint32_t num)
{
    return drv_usi_usart_send(handle, data, num);
    367e:	b79d                	j	35e4 <drv_usi_usart_send>

00003680 <csi_usart_receive>:
  \param[in]   num   Number of data items to receive
  \return      error code
*/
int32_t csi_usart_receive(usart_handle_t handle, void *data, uint32_t num)
{
    return drv_usi_usart_receive(handle, data, num);
    3680:	b75d                	j	3626 <drv_usi_usart_receive>

00003682 <csi_usart_abort_receive>:
  \param[in]   handle  usart handle to operate.
  \return      error code
*/
int32_t csi_usart_abort_receive(usart_handle_t handle)
{
    return drv_usi_usart_abort_receive(handle);
    3682:	b7d9                	j	3648 <drv_usi_usart_abort_receive>

00003684 <csi_usart_get_status>:
  \param[in]   handle  usart handle to operate.
  \return      USART status \ref usart_status_t
*/
usart_status_t csi_usart_get_status(usart_handle_t handle)
{
    return drv_usi_usart_get_status(handle);
    3684:	bfe1                	j	365c <drv_usi_usart_get_status>

00003686 <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
    3686:	47bd                	li	a5,15
    3688:	04a7c163          	blt	a5,a0,36ca <target_get_timer+0x44>
        return -1;
    }

    if (base != NULL) {
    368c:	c991                	beqz	a1,36a0 <target_get_timer+0x1a>
        *base = sg_timer_config[idx].base;
    368e:	47b1                	li	a5,12
    3690:	02f50733          	mul	a4,a0,a5
    3694:	6795                	lui	a5,0x5
    3696:	70878793          	addi	a5,a5,1800 # 5708 <sg_timer_config>
    369a:	97ba                	add	a5,a5,a4
    369c:	439c                	lw	a5,0(a5)
    369e:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    36a0:	ca11                	beqz	a2,36b4 <target_get_timer+0x2e>
        *irq = sg_timer_config[idx].irq;
    36a2:	47b1                	li	a5,12
    36a4:	02f50733          	mul	a4,a0,a5
    36a8:	6795                	lui	a5,0x5
    36aa:	70878793          	addi	a5,a5,1800 # 5708 <sg_timer_config>
    36ae:	97ba                	add	a5,a5,a4
    36b0:	43dc                	lw	a5,4(a5)
    36b2:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    36b4:	ce81                	beqz	a3,36cc <target_get_timer+0x46>
        *handler = sg_timer_config[idx].handler;
    36b6:	47b1                	li	a5,12
    36b8:	02f50733          	mul	a4,a0,a5
    36bc:	6795                	lui	a5,0x5
    36be:	70878793          	addi	a5,a5,1800 # 5708 <sg_timer_config>
    36c2:	97ba                	add	a5,a5,a4
    36c4:	479c                	lw	a5,8(a5)
    36c6:	c29c                	sw	a5,0(a3)
    36c8:	8082                	ret
        return -1;
    36ca:	557d                	li	a0,-1
    }

    return idx;
}
    36cc:	8082                	ret

000036ce <target_gpio_port_init>:
} gpio_pin_map_t;

int32_t target_gpio_port_init(port_name_e port, uint32_t *base, uint32_t *irq, void **handler, uint32_t *pin_num)
{
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
        return -1;
    36ce:	57fd                	li	a5,-1
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
    36d0:	c195                	beqz	a1,36f4 <target_gpio_port_init+0x26>
    36d2:	c20d                	beqz	a2,36f4 <target_gpio_port_init+0x26>
    36d4:	c285                	beqz	a3,36f4 <target_gpio_port_init+0x26>
    36d6:	cf19                	beqz	a4,36f4 <target_gpio_port_init+0x26>
    }

    if (sg_gpio_config[0].port == port) {
    36d8:	ed11                	bnez	a0,36f4 <target_gpio_port_init+0x26>
        if (base != NULL) {
            *base = sg_gpio_config[0].base;
    36da:	600187b7          	lui	a5,0x60018
    36de:	c19c                	sw	a5,0(a1)
        }

        if (irq != NULL) {
            *irq = sg_gpio_config[0].irq;
    36e0:	47c1                	li	a5,16
    36e2:	c21c                	sw	a5,0(a2)
        }

        if (pin_num != NULL) {
            *pin_num = sg_gpio_config[0].pin_num;
    36e4:	47fd                	li	a5,31
    36e6:	c31c                	sw	a5,0(a4)
        }

        if (handler != NULL) {
            *handler = (void *)GPIO0_IRQHandler;
    36e8:	000047b7          	lui	a5,0x4
    36ec:	ba278793          	addi	a5,a5,-1118 # 3ba2 <GPIO0_IRQHandler>
    36f0:	c29c                	sw	a5,0(a3)
        }

        return 0;
    36f2:	4781                	li	a5,0
    }

    return -1;
}
    36f4:	853e                	mv	a0,a5
    36f6:	8082                	ret

000036f8 <target_gpio_pin_init>:

int32_t target_gpio_pin_init(int32_t gpio_pin, uint32_t *port_idx)
{
    *port_idx = 0;
    36f8:	0005a023          	sw	zero,0(a1)

    if (gpio_pin >= PA0 && gpio_pin <= PA31) {
    36fc:	47fd                	li	a5,31
    36fe:	00a7f363          	bgeu	a5,a0,3704 <target_gpio_pin_init+0xc>
        return gpio_pin;
    }

    return -1;
    3702:	557d                	li	a0,-1
}
    3704:	8082                	ret

00003706 <target_usi_init>:
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
    3706:	4789                	li	a5,2
    3708:	02a7c763          	blt	a5,a0,3736 <target_usi_init+0x30>
        return -1;
    }

    if (base != NULL) {
    370c:	c991                	beqz	a1,3720 <target_usi_init+0x1a>
        *base = sg_usi_config[idx].base;
    370e:	47b1                	li	a5,12
    3710:	02f50733          	mul	a4,a0,a5
    3714:	6795                	lui	a5,0x5
    3716:	7c878793          	addi	a5,a5,1992 # 57c8 <sg_usi_config>
    371a:	97ba                	add	a5,a5,a4
    371c:	439c                	lw	a5,0(a5)
    371e:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3720:	ce01                	beqz	a2,3738 <target_usi_init+0x32>
        *irq = sg_usi_config[idx].irq;
    3722:	47b1                	li	a5,12
    3724:	02f50733          	mul	a4,a0,a5
    3728:	6795                	lui	a5,0x5
    372a:	7c878793          	addi	a5,a5,1992 # 57c8 <sg_usi_config>
    372e:	97ba                	add	a5,a5,a4
    3730:	43dc                	lw	a5,4(a5)
    3732:	c21c                	sw	a5,0(a2)
    3734:	8082                	ret
        return -1;
    3736:	557d                	li	a0,-1
    }

    return idx;
}
    3738:	8082                	ret

0000373a <target_usi_usart_init>:

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
    373a:	4789                	li	a5,2
    373c:	04a7c163          	blt	a5,a0,377e <target_usi_usart_init+0x44>
        return -1;
    }

    if (base != NULL) {
    3740:	c991                	beqz	a1,3754 <target_usi_usart_init+0x1a>
        *base = sg_usi_config[idx].base;
    3742:	47b1                	li	a5,12
    3744:	02f50733          	mul	a4,a0,a5
    3748:	6795                	lui	a5,0x5
    374a:	7c878793          	addi	a5,a5,1992 # 57c8 <sg_usi_config>
    374e:	97ba                	add	a5,a5,a4
    3750:	439c                	lw	a5,0(a5)
    3752:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3754:	ca11                	beqz	a2,3768 <target_usi_usart_init+0x2e>
        *irq = sg_usi_config[idx].irq;
    3756:	47b1                	li	a5,12
    3758:	02f50733          	mul	a4,a0,a5
    375c:	6795                	lui	a5,0x5
    375e:	7c878793          	addi	a5,a5,1992 # 57c8 <sg_usi_config>
    3762:	97ba                	add	a5,a5,a4
    3764:	43dc                	lw	a5,4(a5)
    3766:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    3768:	ce81                	beqz	a3,3780 <target_usi_usart_init+0x46>
        *handler = sg_usi_config[idx].handler;
    376a:	47b1                	li	a5,12
    376c:	02f50733          	mul	a4,a0,a5
    3770:	6795                	lui	a5,0x5
    3772:	7c878793          	addi	a5,a5,1992 # 57c8 <sg_usi_config>
    3776:	97ba                	add	a5,a5,a4
    3778:	479c                	lw	a5,8(a5)
    377a:	c29c                	sw	a5,0(a3)
    377c:	8082                	ret
        return -1;
    377e:	557d                	li	a0,-1
    }

    return idx;
}
    3780:	8082                	ret

00003782 <gpio_set_direction>:
    void *port,
    gpio_direction_e direction
)
{
    wj_oip_gpio_priv_t *gpio_priv = port;
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3782:	4118                	lw	a4,0(a0)

    if (direction == GPIO_DIRECTION_INPUT) {
    3784:	e989                	bnez	a1,3796 <gpio_set_direction+0x14>
        gpio_reg->SWPORT_DDR &= (~gpio_priv->mask);
    3786:	495c                	lw	a5,20(a0)
    3788:	4354                	lw	a3,4(a4)
    378a:	fff7c793          	not	a5,a5
    378e:	8ff5                	and	a5,a5,a3
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    3790:	c35c                	sw	a5,4(a4)
    } else {
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    }

    return 0;
    3792:	4501                	li	a0,0
    3794:	8082                	ret
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
    3796:	4785                	li	a5,1
    3798:	00f59663          	bne	a1,a5,37a4 <gpio_set_direction+0x22>
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    379c:	435c                	lw	a5,4(a4)
    379e:	4954                	lw	a3,20(a0)
    37a0:	8fd5                	or	a5,a5,a3
    37a2:	b7fd                	j	3790 <gpio_set_direction+0xe>
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    37a4:	81010537          	lui	a0,0x81010
    37a8:	08750513          	addi	a0,a0,135 # 81010087 <__heap_end+0x60fe0087>
}
    37ac:	8082                	ret

000037ae <wj_oip_gpio_irqhandler>:
    gpio_control_reg->INTEN = val;
}

void wj_oip_gpio_irqhandler(int idx)
{
    if (idx >= CONFIG_GPIO_NUM) {
    37ae:	06a04e63          	bgtz	a0,382a <wj_oip_gpio_irqhandler+0x7c>
        return;
    }

    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37b2:	46f1                	li	a3,28
    37b4:	02d50533          	mul	a0,a0,a3
    37b8:	20002737          	lui	a4,0x20002
    37bc:	ab870793          	addi	a5,a4,-1352 # 20001ab8 <gpio_handle>
{
    37c0:	1141                	addi	sp,sp,-16
    37c2:	c422                	sw	s0,8(sp)
    37c4:	20002437          	lui	s0,0x20002
    37c8:	c226                	sw	s1,4(sp)
    37ca:	c606                	sw	ra,12(sp)
    37cc:	ad440413          	addi	s0,s0,-1324 # 20001ad4 <gpio_pin_handle>

    uint32_t value = gpio_control_reg->INTSTATUS;
    37d0:	4481                	li	s1,0
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37d2:	953e                	add	a0,a0,a5
    37d4:	411c                	lw	a5,0(a0)
    uint32_t value = gpio_control_reg->INTSTATUS;
    37d6:	ab870713          	addi	a4,a4,-1352
    37da:	43b0                	lw	a2,64(a5)
    uint8_t i;

    /* find the interrput pin */
    for (i = 0; i < 32; i++) {
        if (value & (1U << i)) {
    37dc:	4685                	li	a3,1
    37de:	009696b3          	sll	a3,a3,s1
    37e2:	00c6f7b3          	and	a5,a3,a2
    37e6:	c79d                	beqz	a5,3814 <wj_oip_gpio_irqhandler+0x66>
                for (j = 0; j < idx; j++) {
                    pin_idx += gpio_handle[j].pin_num;
                }
            }

            if (pin_idx >= CONFIG_GPIO_PIN_NUM) {
    37e8:	47fd                	li	a5,31
    37ea:	02f48b63          	beq	s1,a5,3820 <wj_oip_gpio_irqhandler+0x72>
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    37ee:	00044783          	lbu	a5,0(s0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    37f2:	45f1                	li	a1,28
    37f4:	02b787b3          	mul	a5,a5,a1
    37f8:	97ba                	add	a5,a5,a4
    37fa:	439c                	lw	a5,0(a5)
    gpio_control_reg->PORTA_EOI = idx;
    37fc:	c7f4                	sw	a3,76(a5)
            wj_oip_gpio_pin_priv_t *gpio_pin_priv = (wj_oip_gpio_pin_priv_t *)&gpio_pin_handle[pin_idx];

            gpio_irq_clear(gpio_pin_priv, (1 << i));  //clear the gpio interrupt

            /* execute the callback function */
            if ((gpio_event_cb_t)(gpio_pin_priv->cb)) {
    37fe:	405c                	lw	a5,4(s0)
    3800:	cb91                	beqz	a5,3814 <wj_oip_gpio_irqhandler+0x66>
                ((gpio_event_cb_t)(gpio_pin_priv->cb))(gpio_pin_priv->offset);
    3802:	00244503          	lbu	a0,2(s0)
    3806:	c032                	sw	a2,0(sp)
    3808:	9782                	jalr	a5
    380a:	4602                	lw	a2,0(sp)
    380c:	200027b7          	lui	a5,0x20002
    3810:	ab878713          	addi	a4,a5,-1352 # 20001ab8 <gpio_handle>
    3814:	0485                	addi	s1,s1,1
    for (i = 0; i < 32; i++) {
    3816:	02000793          	li	a5,32
    381a:	0421                	addi	s0,s0,8
    381c:	fcf490e3          	bne	s1,a5,37dc <wj_oip_gpio_irqhandler+0x2e>
            }
        }
    }
}
    3820:	40b2                	lw	ra,12(sp)
    3822:	4422                	lw	s0,8(sp)
    3824:	4492                	lw	s1,4(sp)
    3826:	0141                	addi	sp,sp,16
    3828:	8082                	ret
    382a:	8082                	ret

0000382c <csi_gpio_port_initialize>:
                3.get gpio_port_handle
  \param[in]   port      port_name.
  \return      gpio_port_handle
*/
gpio_port_handle_t csi_gpio_port_initialize(int32_t port)
{
    382c:	1111                	addi	sp,sp,-28
    /* obtain the gpio port information */
    uint32_t base = 0u;
    uint32_t pin_num;
    uint32_t irq;
    void *handler;
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    382e:	0058                	addi	a4,sp,4
    3830:	0074                	addi	a3,sp,12
    3832:	0030                	addi	a2,sp,8
    3834:	858a                	mv	a1,sp
{
    3836:	cc06                	sw	ra,24(sp)
    3838:	ca22                	sw	s0,20(sp)
    383a:	c826                	sw	s1,16(sp)
    uint32_t base = 0u;
    383c:	c002                	sw	zero,0(sp)
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    383e:	3d41                	jal	36ce <target_gpio_port_init>

    if (idx < 0 || idx >= CONFIG_GPIO_NUM) {
    3840:	e905                	bnez	a0,3870 <csi_gpio_port_initialize+0x44>
        return NULL;
    }

    gpio_priv = &gpio_handle[idx];

    gpio_priv->base = base;
    3842:	4782                	lw	a5,0(sp)
    3844:	20002437          	lui	s0,0x20002
    3848:	ab840493          	addi	s1,s0,-1352 # 20001ab8 <gpio_handle>
    gpio_priv->irq  = irq;
    384c:	4522                	lw	a0,8(sp)
    gpio_priv->base = base;
    384e:	c09c                	sw	a5,0(s1)

#ifdef CONFIG_LPM
    csi_gpio_power_control(gpio_priv, DRV_POWER_FULL);
#endif

    drv_irq_register(gpio_priv->irq, handler);
    3850:	45b2                	lw	a1,12(sp)
    gpio_priv->pin_num  = pin_num;
    3852:	4792                	lw	a5,4(sp)
    gpio_priv->irq  = irq;
    3854:	c0c8                	sw	a0,4(s1)
    gpio_priv->pin_num  = pin_num;
    3856:	c49c                	sw	a5,8(s1)
    drv_irq_register(gpio_priv->irq, handler);
    3858:	b98ff0ef          	jal	ra,2bf0 <drv_irq_register>
    drv_irq_enable(gpio_priv->irq);
    385c:	40c8                	lw	a0,4(s1)
    385e:	b7aff0ef          	jal	ra,2bd8 <drv_irq_enable>

    return (gpio_port_handle_t)gpio_priv;
    3862:	ab840513          	addi	a0,s0,-1352
}
    3866:	40e2                	lw	ra,24(sp)
    3868:	4452                	lw	s0,20(sp)
    386a:	44c2                	lw	s1,16(sp)
    386c:	0171                	addi	sp,sp,28
    386e:	8082                	ret
        return NULL;
    3870:	4501                	li	a0,0
    3872:	bfd5                	j	3866 <csi_gpio_port_initialize+0x3a>

00003874 <csi_gpio_pin_initialize>:
  \return      gpio_pin_handle
*/
gpio_pin_handle_t csi_gpio_pin_initialize(int32_t gpio_pin, gpio_event_cb_t cb_event)
{

    if (gpio_pin < 0 || gpio_pin >= CONFIG_GPIO_PIN_NUM) {
    3874:	47f9                	li	a5,30
    3876:	00a7f563          	bgeu	a5,a0,3880 <csi_gpio_pin_initialize+0xc>
        return NULL;
    387a:	4781                	li	a5,0
    gpio_pin_priv->idx = pin_idx;
    gpio_pin_priv->cb = cb_event;
    gpio_pin_priv->offset = gpio_pin;

    return (gpio_pin_handle_t)gpio_pin_priv;
}
    387c:	853e                	mv	a0,a5
    387e:	8082                	ret
{
    3880:	1141                	addi	sp,sp,-16
    3882:	c422                	sw	s0,8(sp)
    3884:	842a                	mv	s0,a0
        csi_gpio_port_initialize(i);
    3886:	4501                	li	a0,0
{
    3888:	c606                	sw	ra,12(sp)
    388a:	c226                	sw	s1,4(sp)
    388c:	84ae                	mv	s1,a1
        csi_gpio_port_initialize(i);
    388e:	3f79                	jal	382c <csi_gpio_port_initialize>
    int32_t pin_idx = target_gpio_pin_init(gpio_pin, &port_idx);
    3890:	858a                	mv	a1,sp
    3892:	8522                	mv	a0,s0
    3894:	3595                	jal	36f8 <target_gpio_pin_init>
        return NULL;
    3896:	4781                	li	a5,0
    if (pin_idx < 0) {
    3898:	02054863          	bltz	a0,38c8 <csi_gpio_pin_initialize+0x54>
    for (i = 0; i < port_idx; i++) {
    389c:	4682                	lw	a3,0(sp)
    389e:	87aa                	mv	a5,a0
    38a0:	c691                	beqz	a3,38ac <csi_gpio_pin_initialize+0x38>
        idx += (gpio_handle[i].pin_num);
    38a2:	200027b7          	lui	a5,0x20002
    38a6:	ac07a783          	lw	a5,-1344(a5) # 20001ac0 <gpio_handle+0x8>
    38aa:	97aa                	add	a5,a5,a0
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = &(gpio_pin_handle[idx]);
    38ac:	00379713          	slli	a4,a5,0x3
    38b0:	200027b7          	lui	a5,0x20002
    38b4:	ad478793          	addi	a5,a5,-1324 # 20001ad4 <gpio_pin_handle>
    38b8:	97ba                	add	a5,a5,a4
    gpio_pin_priv->portidx = port_idx;
    38ba:	00d78023          	sb	a3,0(a5)
    gpio_pin_priv->idx = pin_idx;
    38be:	00a780a3          	sb	a0,1(a5)
    gpio_pin_priv->cb = cb_event;
    38c2:	c3c4                	sw	s1,4(a5)
    gpio_pin_priv->offset = gpio_pin;
    38c4:	00878123          	sb	s0,2(a5)
}
    38c8:	40b2                	lw	ra,12(sp)
    38ca:	4422                	lw	s0,8(sp)
    38cc:	4492                	lw	s1,4(sp)
    38ce:	853e                	mv	a0,a5
    38d0:	0141                	addi	sp,sp,16
    38d2:	8082                	ret

000038d4 <csi_gpio_pin_config_mode>:
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                                 gpio_mode_e mode)
{
    38d4:	862e                	mv	a2,a1
    GPIO_NULL_PARAM_CHK(handle);
    38d6:	c511                	beqz	a0,38e2 <csi_gpio_pin_config_mode+0xe>
    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    uint8_t offset = gpio_pin_priv->idx;

    int32_t ret = drv_pin_config_mode(gpio_pin_priv->portidx, offset, mode);
    38d8:	00154583          	lbu	a1,1(a0)
    38dc:	00054503          	lbu	a0,0(a0)
    38e0:	a615                	j	3c04 <drv_pin_config_mode>

    return ret;
}
    38e2:	81010537          	lui	a0,0x81010
    38e6:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    38ea:	8082                	ret

000038ec <csi_gpio_pin_config_direction>:
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                                      gpio_direction_e dir)
{
    GPIO_NULL_PARAM_CHK(handle);
    38ec:	c505                	beqz	a0,3914 <csi_gpio_pin_config_direction+0x28>

    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *gpio_priv = &gpio_handle[gpio_pin_priv->portidx];
    38ee:	00054783          	lbu	a5,0(a0)

    gpio_priv->dir = dir;
    38f2:	4771                	li	a4,28
    38f4:	02e78733          	mul	a4,a5,a4
    38f8:	200027b7          	lui	a5,0x20002
    38fc:	ab878793          	addi	a5,a5,-1352 # 20001ab8 <gpio_handle>
    3900:	97ba                	add	a5,a5,a4
    3902:	cb8c                	sw	a1,16(a5)
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    3904:	00154683          	lbu	a3,1(a0)
    3908:	4705                	li	a4,1

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    390a:	853e                	mv	a0,a5
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    390c:	00d71733          	sll	a4,a4,a3
    3910:	cbd8                	sw	a4,20(a5)
    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    3912:	bd85                	j	3782 <gpio_set_direction>
    if (ret) {
        return ret;
    }

    return 0;
}
    3914:	81010537          	lui	a0,0x81010
    3918:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    391c:	8082                	ret

0000391e <csi_gpio_pin_write>:
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    391e:	cd05                	beqz	a0,3956 <csi_gpio_pin_write+0x38>

    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    3920:	00054703          	lbu	a4,0(a0)

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    3924:	46f1                	li	a3,28
    uint32_t port_value = value << offset;
    3926:	00154603          	lbu	a2,1(a0)
    port_handle->value = port_value;
    392a:	02d706b3          	mul	a3,a4,a3
    392e:	20002737          	lui	a4,0x20002
    3932:	ab870713          	addi	a4,a4,-1352 # 20001ab8 <gpio_handle>
    uint32_t port_value = value << offset;
    3936:	00c595b3          	sll	a1,a1,a2
    gpio_write(port_handle, (1 << offset));
    393a:	4785                	li	a5,1
    393c:	00c797b3          	sll	a5,a5,a2
    value &= ~(mask);
    3940:	fff7c793          	not	a5,a5

    return 0;
    3944:	4501                	li	a0,0
    port_handle->value = port_value;
    3946:	9736                	add	a4,a4,a3
    3948:	cf0c                	sw	a1,24(a4)
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    394a:	4318                	lw	a4,0(a4)
    uint32_t value = gpio_reg->SWPORT_DR;
    394c:	4314                	lw	a3,0(a4)
    value &= ~(mask);
    394e:	8ff5                	and	a5,a5,a3
    value |= gpio_priv->value;
    3950:	8ddd                	or	a1,a1,a5
    gpio_reg->SWPORT_DR = value;
    3952:	c30c                	sw	a1,0(a4)
    return 0;
    3954:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3956:	81010537          	lui	a0,0x81010
    395a:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>

}
    395e:	8082                	ret

00003960 <wj_oip_timer_irqhandler>:
}

void wj_oip_timer_irqhandler(int idx)
{
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->timeout_flag = 1;
    3960:	47e1                	li	a5,24
    3962:	02f50733          	mul	a4,a0,a5
    3966:	200027b7          	lui	a5,0x20002
    396a:	bcc78793          	addi	a5,a5,-1076 # 20001bcc <timer_instance>
    396e:	97ba                	add	a5,a5,a4
    3970:	4705                	li	a4,1
    3972:	cbd8                	sw	a4,20(a5)

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3974:	43d8                	lw	a4,4(a5)

    addr->TxEOI;

    if (timer_priv->cb_event) {
    3976:	00c7a303          	lw	t1,12(a5)
    addr->TxEOI;
    397a:	4758                	lw	a4,12(a4)
    if (timer_priv->cb_event) {
    397c:	00030463          	beqz	t1,3984 <wj_oip_timer_irqhandler+0x24>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    3980:	4581                	li	a1,0
    3982:	8302                	jr	t1
    }

}
    3984:	8082                	ret

00003986 <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    3986:	1111                	addi	sp,sp,-28
    3988:	cc06                	sw	ra,24(sp)
    398a:	ca22                	sw	s0,20(sp)
    398c:	c826                	sw	s1,16(sp)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    398e:	47bd                	li	a5,15
    3990:	00a7f963          	bgeu	a5,a0,39a2 <csi_timer_initialize+0x1c>
        return NULL;
    3994:	4401                	li	s0,0
        drv_irq_register(timer_priv->irq, handler);
        drv_irq_enable(timer_priv->irq);
    }

    return (timer_handle_t)timer_priv;
}
    3996:	8522                	mv	a0,s0
    3998:	40e2                	lw	ra,24(sp)
    399a:	4452                	lw	s0,20(sp)
    399c:	44c2                	lw	s1,16(sp)
    399e:	0171                	addi	sp,sp,28
    39a0:	8082                	ret
    39a2:	84ae                	mv	s1,a1
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    39a4:	0074                	addi	a3,sp,12
    39a6:	0030                	addi	a2,sp,8
    39a8:	004c                	addi	a1,sp,4
    39aa:	c02a                	sw	a0,0(sp)
    uint32_t base = 0u;
    39ac:	c202                	sw	zero,4(sp)
    uint32_t irq = 0u;
    39ae:	c402                	sw	zero,8(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    39b0:	39d9                	jal	3686 <target_get_timer>
    if (real_idx != idx) {
    39b2:	4702                	lw	a4,0(sp)
    39b4:	fea710e3          	bne	a4,a0,3994 <csi_timer_initialize+0xe>
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    39b8:	4461                	li	s0,24
    39ba:	028707b3          	mul	a5,a4,s0
    39be:	20002437          	lui	s0,0x20002
    39c2:	bcc40413          	addi	s0,s0,-1076 # 20001bcc <timer_instance>
    timer_priv->irq  = irq;
    39c6:	46a2                	lw	a3,8(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    39c8:	4501                	li	a0,0
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    39ca:	943e                	add	s0,s0,a5
    timer_priv->base = base;
    39cc:	4792                	lw	a5,4(sp)
    timer_priv->irq  = irq;
    39ce:	c414                	sw	a3,8(s0)
    timer_priv->idx = idx;
    39d0:	00e40023          	sb	a4,0(s0)
    timer_priv->base = base;
    39d4:	c05c                	sw	a5,4(s0)
    39d6:	c03e                	sw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    39d8:	2c35                	jal	3c14 <drv_get_timer_freq>
    39da:	577d                	li	a4,-1
    39dc:	02a75533          	divu	a0,a4,a0
    39e0:	000f4737          	lui	a4,0xf4
    39e4:	24070713          	addi	a4,a4,576 # f4240 <__ctor_end__+0xee178>
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    39e8:	4782                	lw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    39ea:	02e50533          	mul	a0,a0,a4
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    39ee:	4798                	lw	a4,8(a5)
    39f0:	01e77693          	andi	a3,a4,30
    39f4:	0087c703          	lbu	a4,8(a5)
    39f8:	9b01                	andi	a4,a4,-32
    39fa:	8f55                	or	a4,a4,a3
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    39fc:	c808                	sw	a0,16(s0)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    39fe:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_INTMASK;
    3a02:	4798                	lw	a4,8(a5)
    3a04:	8b7d                	andi	a4,a4,31
    3a06:	00476693          	ori	a3,a4,4
    3a0a:	0087c703          	lbu	a4,8(a5)
    3a0e:	9b01                	andi	a4,a4,-32
    3a10:	8f55                	or	a4,a4,a3
    3a12:	00e78423          	sb	a4,8(a5)
    timer_priv->cb_event = cb_event;
    3a16:	c444                	sw	s1,12(s0)
    if (cb_event != NULL) {
    3a18:	dcbd                	beqz	s1,3996 <csi_timer_initialize+0x10>
        drv_irq_register(timer_priv->irq, handler);
    3a1a:	4408                	lw	a0,8(s0)
    3a1c:	45b2                	lw	a1,12(sp)
    3a1e:	9d2ff0ef          	jal	ra,2bf0 <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    3a22:	4408                	lw	a0,8(s0)
    3a24:	9b4ff0ef          	jal	ra,2bd8 <drv_irq_enable>
    3a28:	b7bd                	j	3996 <csi_timer_initialize+0x10>

00003a2a <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    3a2a:	c511                	beqz	a0,3a36 <csi_timer_config+0xc>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3a2c:	415c                	lw	a5,4(a0)

    switch (mode) {
    3a2e:	c989                	beqz	a1,3a40 <csi_timer_config+0x16>
    3a30:	4705                	li	a4,1
    3a32:	02e58c63          	beq	a1,a4,3a6a <csi_timer_config+0x40>
    TIMER_NULL_PARAM_CHK(handle);
    3a36:	81070537          	lui	a0,0x81070
    3a3a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
    }

    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);

    return 0;
}
    3a3e:	8082                	ret
            addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_MODE;
    3a40:	4798                	lw	a4,8(a5)
    3a42:	01d77693          	andi	a3,a4,29
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3a46:	0087c703          	lbu	a4,8(a5)
    return 0;
    3a4a:	4501                	li	a0,0
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3a4c:	9b01                	andi	a4,a4,-32
    3a4e:	8f55                	or	a4,a4,a3
    3a50:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);
    3a54:	4798                	lw	a4,8(a5)
    3a56:	8b7d                	andi	a4,a4,31
    3a58:	01076693          	ori	a3,a4,16
    3a5c:	0087c703          	lbu	a4,8(a5)
    3a60:	9b01                	andi	a4,a4,-32
    3a62:	8f55                	or	a4,a4,a3
    3a64:	00e78423          	sb	a4,8(a5)
    return 0;
    3a68:	8082                	ret
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3a6a:	4798                	lw	a4,8(a5)
    3a6c:	8b7d                	andi	a4,a4,31
    3a6e:	00276693          	ori	a3,a4,2
    3a72:	bfd1                	j	3a46 <csi_timer_config+0x1c>

00003a74 <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    3a74:	c501                	beqz	a0,3a7c <csi_timer_set_timeout+0x8>

    wj_oip_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    3a76:	c90c                	sw	a1,16(a0)
    return 0;
    3a78:	4501                	li	a0,0
    3a7a:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3a7c:	81070537          	lui	a0,0x81070
    3a80:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3a84:	8082                	ret

00003a86 <csi_timer_start>:
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    3a86:	c545                	beqz	a0,3b2e <csi_timer_start+0xa8>
{
    3a88:	1141                	addi	sp,sp,-16
    3a8a:	c606                	sw	ra,12(sp)
    3a8c:	c422                	sw	s0,8(sp)
    3a8e:	c226                	sw	s1,4(sp)
    3a90:	842a                	mv	s0,a0

    wj_oip_timer_priv_t *timer_priv = handle;

    timer_priv->timeout_flag = 0;
    3a92:	00052a23          	sw	zero,20(a0)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    3a96:	00054503          	lbu	a0,0(a0)
    3a9a:	000f44b7          	lui	s1,0xf4
    3a9e:	24048493          	addi	s1,s1,576 # f4240 <__ctor_end__+0xee178>
    3aa2:	2a8d                	jal	3c14 <drv_get_timer_freq>
    3aa4:	029544b3          	div	s1,a0,s1
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    3aa8:	00044503          	lbu	a0,0(s0)
    3aac:	22a5                	jal	3c14 <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    3aae:	481c                	lw	a5,16(s0)
        load = (uint32_t)(timer_priv->timeout * min_us);
    3ab0:	02f48533          	mul	a0,s1,a5
    if (min_us) {
    3ab4:	e08d                	bnez	s1,3ad6 <csi_timer_start+0x50>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    3ab6:	00044503          	lbu	a0,0(s0)
    3aba:	c03e                	sw	a5,0(sp)
    3abc:	2aa1                	jal	3c14 <drv_get_timer_freq>
    3abe:	4782                	lw	a5,0(sp)
    3ac0:	000f4637          	lui	a2,0xf4
    3ac4:	24060613          	addi	a2,a2,576 # f4240 <__ctor_end__+0xee178>
    3ac8:	4681                	li	a3,0
    3aca:	02f525b3          	mulhsu	a1,a0,a5
    3ace:	02a78533          	mul	a0,a5,a0
    3ad2:	f22fc0ef          	jal	ra,1f4 <__udivdi3>
    }

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);

    if (timer_priv->timeout == 0) {
    3ad6:	4818                	lw	a4,16(s0)
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3ad8:	405c                	lw	a5,4(s0)
    if (timer_priv->timeout == 0) {
    3ada:	e729                	bnez	a4,3b24 <csi_timer_start+0x9e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    3adc:	577d                	li	a4,-1
    3ade:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3ae0:	4798                	lw	a4,8(a5)
    }

#endif

    return 0;
}
    3ae2:	40b2                	lw	ra,12(sp)
    3ae4:	4422                	lw	s0,8(sp)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3ae6:	01e77693          	andi	a3,a4,30
    3aea:	0087c703          	lbu	a4,8(a5)
}
    3aee:	4492                	lw	s1,4(sp)
    return 0;
    3af0:	4501                	li	a0,0
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3af2:	9b01                	andi	a4,a4,-32
    3af4:	8f55                	or	a4,a4,a3
    3af6:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3afa:	4798                	lw	a4,8(a5)
    3afc:	8b7d                	andi	a4,a4,31
    3afe:	00176693          	ori	a3,a4,1
    3b02:	0087c703          	lbu	a4,8(a5)
    3b06:	9b01                	andi	a4,a4,-32
    3b08:	8f55                	or	a4,a4,a3
    3b0a:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3b0e:	4798                	lw	a4,8(a5)
    3b10:	01b77693          	andi	a3,a4,27
    3b14:	0087c703          	lbu	a4,8(a5)
    3b18:	9b01                	andi	a4,a4,-32
    3b1a:	8f55                	or	a4,a4,a3
    3b1c:	00e78423          	sb	a4,8(a5)
}
    3b20:	0141                	addi	sp,sp,16
    3b22:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    3b24:	4798                	lw	a4,8(a5)
    3b26:	8b75                	andi	a4,a4,29
    3b28:	db55                	beqz	a4,3adc <csi_timer_start+0x56>
            addr->TxLoadCount = load;                           /* load time(us) */
    3b2a:	c388                	sw	a0,0(a5)
    3b2c:	bf55                	j	3ae0 <csi_timer_start+0x5a>
    TIMER_NULL_PARAM_CHK(handle);
    3b2e:	81070537          	lui	a0,0x81070
    3b32:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b36:	8082                	ret

00003b38 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b38:	c519                	beqz	a0,3b46 <csi_timer_get_current_value+0xe>
    TIMER_NULL_PARAM_CHK(value);
    3b3a:	c591                	beqz	a1,3b46 <csi_timer_get_current_value+0xe>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3b3c:	415c                	lw	a5,4(a0)

    *value = addr->TxCurrentValue;
    return 0;
    3b3e:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    3b40:	43dc                	lw	a5,4(a5)
    3b42:	c19c                	sw	a5,0(a1)
    return 0;
    3b44:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3b46:	81070537          	lui	a0,0x81070
    3b4a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b4e:	8082                	ret

00003b50 <TIM0_IRQHandler>:
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(0);
    3b50:	4501                	li	a0,0
    3b52:	b539                	j	3960 <wj_oip_timer_irqhandler>

00003b54 <TIM1_IRQHandler>:
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(1);
    3b54:	4505                	li	a0,1
    3b56:	b529                	j	3960 <wj_oip_timer_irqhandler>

00003b58 <TIM2_IRQHandler>:
    CSI_INTRPT_EXIT();
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(2);
    3b58:	4509                	li	a0,2
    3b5a:	b519                	j	3960 <wj_oip_timer_irqhandler>

00003b5c <TIM3_IRQHandler>:
}

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(3);
    3b5c:	450d                	li	a0,3
    3b5e:	b509                	j	3960 <wj_oip_timer_irqhandler>

00003b60 <TIM4_IRQHandler>:
}

ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(4);
    3b60:	4511                	li	a0,4
    3b62:	bbfd                	j	3960 <wj_oip_timer_irqhandler>

00003b64 <TIM5_IRQHandler>:
}

ATTRIBUTE_ISR void TIM5_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(5);
    3b64:	4515                	li	a0,5
    3b66:	bbed                	j	3960 <wj_oip_timer_irqhandler>

00003b68 <TIM6_IRQHandler>:
}

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(6);
    3b68:	4519                	li	a0,6
    3b6a:	bbdd                	j	3960 <wj_oip_timer_irqhandler>

00003b6c <TIM7_IRQHandler>:
}

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(7);
    3b6c:	451d                	li	a0,7
    3b6e:	bbcd                	j	3960 <wj_oip_timer_irqhandler>

00003b70 <TIM8_IRQHandler>:
}

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(8);
    3b70:	4521                	li	a0,8
    3b72:	b3fd                	j	3960 <wj_oip_timer_irqhandler>

00003b74 <TIM9_IRQHandler>:
}

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(9);
    3b74:	4525                	li	a0,9
    3b76:	b3ed                	j	3960 <wj_oip_timer_irqhandler>

00003b78 <TIM10_IRQHandler>:
}

ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(10);
    3b78:	4529                	li	a0,10
    3b7a:	b3dd                	j	3960 <wj_oip_timer_irqhandler>

00003b7c <TIM11_IRQHandler>:
}

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(11);
    3b7c:	452d                	li	a0,11
    3b7e:	b3cd                	j	3960 <wj_oip_timer_irqhandler>

00003b80 <TIM12_IRQHandler>:
}

ATTRIBUTE_ISR void TIM12_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(12);
    3b80:	4531                	li	a0,12
    3b82:	bbf9                	j	3960 <wj_oip_timer_irqhandler>

00003b84 <TIM13_IRQHandler>:
}

ATTRIBUTE_ISR void TIM13_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(13);
    3b84:	4535                	li	a0,13
    3b86:	bbe9                	j	3960 <wj_oip_timer_irqhandler>

00003b88 <TIM14_IRQHandler>:
}

ATTRIBUTE_ISR void TIM14_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(14);
    3b88:	4539                	li	a0,14
    3b8a:	bbd9                	j	3960 <wj_oip_timer_irqhandler>

00003b8c <TIM15_IRQHandler>:
}

ATTRIBUTE_ISR void TIM15_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(15);
    3b8c:	453d                	li	a0,15
    3b8e:	bbc9                	j	3960 <wj_oip_timer_irqhandler>

00003b90 <USI0_IRQHandler>:
}

ATTRIBUTE_ISR void USI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(0);
    3b90:	4501                	li	a0,0
    3b92:	8bcff06f          	j	2c4e <wj_usi_irqhandler>

00003b96 <USI1_IRQHandler>:
}

ATTRIBUTE_ISR void USI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(1);
    3b96:	4505                	li	a0,1
    3b98:	8b6ff06f          	j	2c4e <wj_usi_irqhandler>

00003b9c <USI2_IRQHandler>:
}

ATTRIBUTE_ISR void USI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(2);
    3b9c:	4509                	li	a0,2
    3b9e:	8b0ff06f          	j	2c4e <wj_usi_irqhandler>

00003ba2 <GPIO0_IRQHandler>:
}

ATTRIBUTE_ISR void GPIO0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_gpio_irqhandler(0);
    3ba2:	4501                	li	a0,0
    3ba4:	b129                	j	37ae <wj_oip_gpio_irqhandler>

00003ba6 <mdelay>:
    }
}

void mdelay(uint32_t ms)
{
    if (ms == 0) {
    3ba6:	cd29                	beqz	a0,3c00 <mdelay+0x5a>
{
    3ba8:	1141                	addi	sp,sp,-16
    3baa:	c422                	sw	s0,8(sp)
    3bac:	c606                	sw	ra,12(sp)
    3bae:	c226                	sw	s1,4(sp)
    3bb0:	fff50413          	addi	s0,a0,-1
        return;
    }

    while (ms--) {
    3bb4:	57fd                	li	a5,-1
    3bb6:	00f41763          	bne	s0,a5,3bc4 <mdelay+0x1e>
        _mdelay();
    }
}
    3bba:	40b2                	lw	ra,12(sp)
    3bbc:	4422                	lw	s0,8(sp)
    3bbe:	4492                	lw	s1,4(sp)
    3bc0:	0141                	addi	sp,sp,16
    3bc2:	8082                	ret
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_load(void)
{
    return CORET->LOAD;
    3bc4:	e000e7b7          	lui	a5,0xe000e
    3bc8:	4bc4                	lw	s1,20(a5)
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_value(void)
{
    return CORET->VAL;
    3bca:	4f98                	lw	a4,24(a5)
    3bcc:	c03a                	sw	a4,0(sp)
    uint32_t cnt = (drv_get_sys_freq() / 1000000);
    3bce:	2081                	jal	3c0e <drv_get_sys_freq>
    3bd0:	000f47b7          	lui	a5,0xf4
    3bd4:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xee178>
    3bd8:	02f54533          	div	a0,a0,a5
            if (load - cur + start > cnt) {
    3bdc:	4702                	lw	a4,0(sp)
    3bde:	e000e6b7          	lui	a3,0xe000e
    3be2:	94ba                	add	s1,s1,a4
    3be4:	4e9c                	lw	a5,24(a3)
        if (start > cur) {
    3be6:	00e7f863          	bgeu	a5,a4,3bf6 <mdelay+0x50>
            if (start - cur >= cnt) {
    3bea:	40f707b3          	sub	a5,a4,a5
    3bee:	fea7ebe3          	bltu	a5,a0,3be4 <mdelay+0x3e>
    3bf2:	147d                	addi	s0,s0,-1
    3bf4:	b7c1                	j	3bb4 <mdelay+0xe>
            if (load - cur + start > cnt) {
    3bf6:	40f487b3          	sub	a5,s1,a5
    3bfa:	fef575e3          	bgeu	a0,a5,3be4 <mdelay+0x3e>
    3bfe:	bfd5                	j	3bf2 <mdelay+0x4c>
    3c00:	8082                	ret

00003c02 <udelay>:
    3c02:	b755                	j	3ba6 <mdelay>

00003c04 <drv_pin_config_mode>:
}

int32_t drv_pin_config_mode(port_name_e port, uint8_t offset, gpio_mode_e pin_mode)
{
    return 0;
}
    3c04:	4501                	li	a0,0
    3c06:	8082                	ret

00003c08 <drv_get_usi_freq>:
    3c08:	0001a503          	lw	a0,0(gp) # 2000065c <g_system_clock>
    3c0c:	8082                	ret

00003c0e <drv_get_sys_freq>:
}

int32_t drv_get_sys_freq(void)
{
    return g_system_clock;
}
    3c0e:	0001a503          	lw	a0,0(gp) # 2000065c <g_system_clock>
    3c12:	8082                	ret

00003c14 <drv_get_timer_freq>:
    3c14:	0001a503          	lw	a0,0(gp) # 2000065c <g_system_clock>
    3c18:	8082                	ret

00003c1a <SystemInit>:
  */
void SystemInit(void)
{
    int i;

    CLIC->CLICCFG = 0x4UL;
    3c1a:	e000e7b7          	lui	a5,0xe000e
{
    3c1e:	1151                	addi	sp,sp,-12
    CLIC->CLICCFG = 0x4UL;
    3c20:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    3c24:	6705                	lui	a4,0x1
{
    3c26:	c222                	sw	s0,4(sp)
    CLIC->CLICCFG = 0x4UL;
    3c28:	973e                	add	a4,a4,a5
    3c2a:	4691                	li	a3,4
{
    3c2c:	c406                	sw	ra,8(sp)
    CLIC->CLICCFG = 0x4UL;
    3c2e:	b0d70023          	sb	a3,-1280(a4) # b00 <__adddf3+0x24a>

    for (i = 0; i < 12; i++) {
        CLIC->INTIP[i] = 0;
    3c32:	e000e437          	lui	s0,0xe000e
    for (i = 0; i < 12; i++) {
    3c36:	4701                	li	a4,0
    3c38:	46b1                	li	a3,12
        CLIC->INTIP[i] = 0;
    3c3a:	00e78633          	add	a2,a5,a4
    3c3e:	00060023          	sb	zero,0(a2)
    for (i = 0; i < 12; i++) {
    3c42:	0705                	addi	a4,a4,1
    3c44:	fed71be3          	bne	a4,a3,3c3a <SystemInit+0x20>
    }

    drv_irq_enable(Machine_Software_IRQn);
    3c48:	450d                	li	a0,3
    3c4a:	f8ffe0ef          	jal	ra,2bd8 <drv_irq_enable>
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
    3c4e:	30046073          	csrsi	mstatus,8
    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    3c52:	3f75                	jal	3c0e <drv_get_sys_freq>
    3c54:	06400793          	li	a5,100
    3c58:	02f54533          	div	a0,a0,a5
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    3c5c:	010007b7          	lui	a5,0x1000
    3c60:	157d                	addi	a0,a0,-1
    3c62:	00f57763          	bgeu	a0,a5,3c70 <SystemInit+0x56>
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
    3c66:	c848                	sw	a0,20(s0)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    3c68:	00042c23          	sw	zero,24(s0) # e000e018 <__heap_end+0xbffde018>
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
    3c6c:	479d                	li	a5,7
    3c6e:	c81c                	sw	a5,16(s0)
#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
#else
    _system_init_for_kernel();
#endif
}
    3c70:	4412                	lw	s0,4(sp)
    3c72:	40a2                	lw	ra,8(sp)
    3c74:	0131                	addi	sp,sp,12
    mm_heap_initialize();
    3c76:	ac59                	j	3f0c <mm_heap_initialize>

00003c78 <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3c78:	1131                	addi	sp,sp,-20
    3c7a:	c622                	sw	s0,12(sp)
    3c7c:	c806                	sw	ra,16(sp)
    3c7e:	c426                	sw	s1,8(sp)
    3c80:	842a                	mv	s0,a0
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MCAUSE(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3c82:	342025f3          	csrr	a1,mcause
    int i;
    uint32_t vec = 0;

    vec = __get_MCAUSE() & 0x3FF;

    printf("CPU Exception: NO.%d", vec);
    3c86:	00005537          	lui	a0,0x5
    3c8a:	3ff5f593          	andi	a1,a1,1023
    3c8e:	7ec50513          	addi	a0,a0,2028 # 57ec <sg_usi_config+0x24>
    3c92:	411000ef          	jal	ra,48a2 <printf>
    printf("\n");
    3c96:	4529                	li	a0,10
    3c98:	523000ef          	jal	ra,49ba <putchar>

    for (i = 0; i < 15; i++) {
    3c9c:	84a2                	mv	s1,s0
    3c9e:	4781                	li	a5,0
        printf("x%d: %08x\t", i + 1, regs[i]);
    3ca0:	4090                	lw	a2,0(s1)
    3ca2:	00178713          	addi	a4,a5,1 # 1000001 <__ctor_end__+0xff9f39>
    3ca6:	c23e                	sw	a5,4(sp)
    3ca8:	000067b7          	lui	a5,0x6
    3cac:	80478513          	addi	a0,a5,-2044 # 5804 <sg_usi_config+0x3c>
    3cb0:	85ba                	mv	a1,a4
    3cb2:	c03a                	sw	a4,0(sp)
    3cb4:	3ef000ef          	jal	ra,48a2 <printf>

        if ((i % 4) == 3) {
    3cb8:	4792                	lw	a5,4(sp)
    3cba:	468d                	li	a3,3
    3cbc:	8b8d                	andi	a5,a5,3
    3cbe:	00d79563          	bne	a5,a3,3cc8 <trap_c+0x50>
            printf("\n");
    3cc2:	4529                	li	a0,10
    3cc4:	4f7000ef          	jal	ra,49ba <putchar>
    3cc8:	4782                	lw	a5,0(sp)
    for (i = 0; i < 15; i++) {
    3cca:	46bd                	li	a3,15
    3ccc:	0491                	addi	s1,s1,4
    3cce:	fcd799e3          	bne	a5,a3,3ca0 <trap_c+0x28>
        }
    }

    printf("\n");
    3cd2:	4529                	li	a0,10
    3cd4:	4e7000ef          	jal	ra,49ba <putchar>
    printf("mepc   : %08x\n", regs[15]);
    3cd8:	5c4c                	lw	a1,60(s0)
    3cda:	00006537          	lui	a0,0x6
    3cde:	81050513          	addi	a0,a0,-2032 # 5810 <sg_usi_config+0x48>
    3ce2:	3c1000ef          	jal	ra,48a2 <printf>
    printf("mstatus: %08x\n", regs[16]);
    3ce6:	402c                	lw	a1,64(s0)
    3ce8:	00006537          	lui	a0,0x6
    3cec:	82050513          	addi	a0,a0,-2016 # 5820 <sg_usi_config+0x58>
    3cf0:	3b3000ef          	jal	ra,48a2 <printf>

    if (trap_c_callback) {
    3cf4:	200027b7          	lui	a5,0x20002
    3cf8:	e2c7a783          	lw	a5,-468(a5) # 20001e2c <trap_c_callback>
    3cfc:	c391                	beqz	a5,3d00 <trap_c+0x88>
        trap_c_callback();
    3cfe:	9782                	jalr	a5
    }

    while (1);
    3d00:	a001                	j	3d00 <trap_c+0x88>

00003d02 <timer_cb_fun>:
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    if (TIMER_EVENT_TIMEOUT == event) {
    3d02:	e591                	bnez	a1,3d0e <timer_cb_fun+0xc>
        Timer_LoopCount++;
    3d04:	01018793          	addi	a5,gp,16 # 2000066c <Timer_LoopCount>
    3d08:	4398                	lw	a4,0(a5)
    3d0a:	0705                	addi	a4,a4,1
    3d0c:	c398                	sw	a4,0(a5)
    }
}
    3d0e:	8082                	ret

00003d10 <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3d10:	1131                	addi	sp,sp,-20
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3d12:	000045b7          	lui	a1,0x4
{
    3d16:	c622                	sw	s0,12(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3d18:	d0258593          	addi	a1,a1,-766 # 3d02 <timer_cb_fun>
    3d1c:	4501                	li	a0,0
{
    3d1e:	c806                	sw	ra,16(sp)
    3d20:	c426                	sw	s1,8(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3d22:	01818413          	addi	s0,gp,24 # 20000674 <timer_handle>
    3d26:	3185                	jal	3986 <csi_timer_initialize>
    3d28:	c008                	sw	a0,0(s0)

    if (timer_handle == NULL) {
    3d2a:	e901                	bnez	a0,3d3a <clock_timer_init+0x2a>
        return -1;
    3d2c:	54fd                	li	s1,-1
    if (cv2 > cv1) {
        timer_count_rise = 1;
    }

    return 0;
}
    3d2e:	40c2                	lw	ra,16(sp)
    3d30:	4432                	lw	s0,12(sp)
    3d32:	8526                	mv	a0,s1
    3d34:	44a2                	lw	s1,8(sp)
    3d36:	0151                	addi	sp,sp,20
    3d38:	8082                	ret
    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3d3a:	4501                	li	a0,0
    3d3c:	3de1                	jal	3c14 <drv_get_timer_freq>
    3d3e:	00a1a423          	sw	a0,8(gp) # 20000664 <APB_FREQ>
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3d42:	000f47b7          	lui	a5,0xf4
    3d46:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xee178>
    3d4a:	02f55533          	divu	a0,a0,a5
    3d4e:	009894b7          	lui	s1,0x989
    3d52:	68048493          	addi	s1,s1,1664 # 989680 <__ctor_end__+0x9835b8>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3d56:	4585                	li	a1,1
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3d58:	02950533          	mul	a0,a0,s1
    3d5c:	00a1a623          	sw	a0,12(gp) # 20000668 <TIMER_LOADCOUNT>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3d60:	4008                	lw	a0,0(s0)
    3d62:	31e1                	jal	3a2a <csi_timer_config>
    if (ret != 0) {
    3d64:	f561                	bnez	a0,3d2c <clock_timer_init+0x1c>
    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3d66:	4008                	lw	a0,0(s0)
    3d68:	85a6                	mv	a1,s1
    3d6a:	3329                	jal	3a74 <csi_timer_set_timeout>
    3d6c:	84aa                	mv	s1,a0
    if (ret != 0) {
    3d6e:	fd5d                	bnez	a0,3d2c <clock_timer_init+0x1c>
    csi_timer_get_current_value(timer_handle, &cv1);
    3d70:	4008                	lw	a0,0(s0)
    3d72:	858a                	mv	a1,sp
    3d74:	33d1                	jal	3b38 <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3d76:	4008                	lw	a0,0(s0)
    3d78:	004c                	addi	a1,sp,4
    3d7a:	3b7d                	jal	3b38 <csi_timer_get_current_value>
    if (cv2 > cv1) {
    3d7c:	4712                	lw	a4,4(sp)
    3d7e:	4782                	lw	a5,0(sp)
    3d80:	fae7f7e3          	bgeu	a5,a4,3d2e <clock_timer_init+0x1e>
        timer_count_rise = 1;
    3d84:	4705                	li	a4,1
    3d86:	00e18a23          	sb	a4,20(gp) # 20000670 <timer_count_rise>
    3d8a:	b755                	j	3d2e <clock_timer_init+0x1e>

00003d8c <clock_timer_start>:
}

int clock_timer_start(void)
{
    int ret = -1;
    Timer_LoopCount = 0;
    3d8c:	0001a823          	sw	zero,16(gp) # 2000066c <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3d90:	0181a503          	lw	a0,24(gp) # 20000674 <timer_handle>
{
    3d94:	1151                	addi	sp,sp,-12
    3d96:	c406                	sw	ra,8(sp)
    ret = csi_timer_start(timer_handle);
    3d98:	31fd                	jal	3a86 <csi_timer_start>
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
}
    3d9a:	40a2                	lw	ra,8(sp)
    if (ret != 0) {
    3d9c:	00a03533          	snez	a0,a0
    3da0:	40a00533          	neg	a0,a0
}
    3da4:	0131                	addi	sp,sp,12
    3da6:	8082                	ret

00003da8 <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3da8:	1151                	addi	sp,sp,-12
    3daa:	c222                	sw	s0,4(sp)
    3dac:	c026                	sw	s1,0(sp)
    3dae:	6419                	lui	s0,0x6
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3db0:	6499                	lui	s1,0x6
{
    3db2:	c406                	sw	ra,8(sp)
    3db4:	0c840413          	addi	s0,s0,200 # 60c8 <__ctor_end__>
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3db8:	0c848493          	addi	s1,s1,200 # 60c8 <__ctor_end__>
    3dbc:	1471                	addi	s0,s0,-4
    3dbe:	00947763          	bgeu	s0,s1,3dcc <_init+0x24>
        (*p) ();
    }
}
    3dc2:	40a2                	lw	ra,8(sp)
    3dc4:	4412                	lw	s0,4(sp)
    3dc6:	4482                	lw	s1,0(sp)
    3dc8:	0131                	addi	sp,sp,12
    3dca:	8082                	ret
        (*p) ();
    3dcc:	401c                	lw	a5,0(s0)
    3dce:	9782                	jalr	a5
    3dd0:	b7f5                	j	3dbc <_init+0x14>

00003dd2 <_fini>:

CPP_WEAK void _fini(void)
{
    3dd2:	1151                	addi	sp,sp,-12
    3dd4:	c222                	sw	s0,4(sp)
    3dd6:	c026                	sw	s1,0(sp)
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3dd8:	6419                	lui	s0,0x6
    3dda:	6499                	lui	s1,0x6
{
    3ddc:	c406                	sw	ra,8(sp)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3dde:	0c840413          	addi	s0,s0,200 # 60c8 <__ctor_end__>
    3de2:	0c448493          	addi	s1,s1,196 # 60c4 <pad_line+0x72c>
    3de6:	0084f763          	bgeu	s1,s0,3df4 <_fini+0x22>
        (*p) ();
    }
}
    3dea:	40a2                	lw	ra,8(sp)
    3dec:	4412                	lw	s0,4(sp)
    3dee:	4482                	lw	s1,0(sp)
    3df0:	0131                	addi	sp,sp,12
    3df2:	8082                	ret
        (*p) ();
    3df4:	401c                	lw	a5,0(s0)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3df6:	0411                	addi	s0,s0,4
        (*p) ();
    3df8:	9782                	jalr	a5
    3dfa:	b7f5                	j	3de6 <_fini+0x14>

00003dfc <fputc>:
{
    return 0;
}

int fputc(int ch, FILE *stream)
{
    3dfc:	1151                	addi	sp,sp,-12
    3dfe:	c026                	sw	s1,0(sp)
    3e00:	84aa                	mv	s1,a0
    (void)stream;

    if (console_handle == NULL) {
    3e02:	01c1a503          	lw	a0,28(gp) # 20000678 <console_handle>
{
    3e06:	c406                	sw	ra,8(sp)
    3e08:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    3e0a:	c505                	beqz	a0,3e32 <fputc+0x36>
    3e0c:	01c18413          	addi	s0,gp,28 # 20000678 <console_handle>
        return -1;
    }

    if (ch == '\n') {
    3e10:	47a9                	li	a5,10
    3e12:	00f49563          	bne	s1,a5,3e1c <fputc+0x20>
        csi_usart_putchar(console_handle, '\r');
    3e16:	45b5                	li	a1,13
    3e18:	861ff0ef          	jal	ra,3678 <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, ch);
    3e1c:	4008                	lw	a0,0(s0)
    3e1e:	0ff4f593          	andi	a1,s1,255
    3e22:	857ff0ef          	jal	ra,3678 <csi_usart_putchar>

    return 0;
    3e26:	4501                	li	a0,0
}
    3e28:	40a2                	lw	ra,8(sp)
    3e2a:	4412                	lw	s0,4(sp)
    3e2c:	4482                	lw	s1,0(sp)
    3e2e:	0131                	addi	sp,sp,12
    3e30:	8082                	ret
        return -1;
    3e32:	557d                	li	a0,-1
    3e34:	bfd5                	j	3e28 <fputc+0x2c>

00003e36 <os_critical_enter>:
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
}
    3e36:	4501                	li	a0,0
    3e38:	8082                	ret

00003e3a <os_critical_exit>:
    3e3a:	4501                	li	a0,0
    3e3c:	8082                	ret

00003e3e <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    3e3e:	1141                	addi	sp,sp,-16
    3e40:	c422                	sw	s0,8(sp)
    3e42:	842a                	mv	s0,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    3e44:	4188                	lw	a0,0(a1)
    3e46:	c02e                	sw	a1,0(sp)
{
    3e48:	c606                	sw	ra,12(sp)
  int ndx = mm_size2ndx(node->size);
    3e4a:	20d5                	jal	3f2e <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    3e4c:	0505                	addi	a0,a0,1
    3e4e:	0512                	slli	a0,a0,0x4
    3e50:	00850713          	addi	a4,a0,8
    3e54:	9722                	add	a4,a4,s0
    3e56:	942a                	add	s0,s0,a0
    3e58:	481c                	lw	a5,16(s0)
    3e5a:	4582                	lw	a1,0(sp)
    3e5c:	c791                	beqz	a5,3e68 <mm_addfreechunk+0x2a>
       next && next->size && next->size < node->size;
    3e5e:	4394                	lw	a3,0(a5)
    3e60:	c681                	beqz	a3,3e68 <mm_addfreechunk+0x2a>
    3e62:	4190                	lw	a2,0(a1)
    3e64:	00c6eb63          	bltu	a3,a2,3e7a <mm_addfreechunk+0x3c>
       prev = next, next = next->flink);

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    3e68:	c70c                	sw	a1,8(a4)
  node->blink = prev;
    3e6a:	c5d8                	sw	a4,12(a1)
  node->flink = next;
    3e6c:	c59c                	sw	a5,8(a1)

  if (next)
    3e6e:	c391                	beqz	a5,3e72 <mm_addfreechunk+0x34>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    3e70:	c7cc                	sw	a1,12(a5)
    }
}
    3e72:	40b2                	lw	ra,12(sp)
    3e74:	4422                	lw	s0,8(sp)
    3e76:	0141                	addi	sp,sp,16
    3e78:	8082                	ret
       prev = next, next = next->flink);
    3e7a:	873e                	mv	a4,a5
    3e7c:	479c                	lw	a5,8(a5)
    3e7e:	bff9                	j	3e5c <mm_addfreechunk+0x1e>

00003e80 <mm_addregion>:

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3e80:	00f58713          	addi	a4,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3e84:	962e                	add	a2,a2,a1

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    3e86:	454c                	lw	a1,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3e88:	9b41                	andi	a4,a4,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3e8a:	9a41                	andi	a2,a2,-16
  heapsize = heapend - heapbase;
    3e8c:	40e607b3          	sub	a5,a2,a4
  heap->mm_heapsize += heapsize;
    3e90:	95be                	add	a1,a1,a5
    3e92:	c54c                	sw	a1,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    3e94:	c918                	sw	a4,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3e96:	4321                	li	t1,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3e98:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3e9c:	17c1                	addi	a5,a5,-16
    3e9e:	c71c                	sw	a5,8(a4)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3ea0:	00672023          	sw	t1,0(a4)
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3ea4:	00572223          	sw	t0,4(a4)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    3ea8:	00870593          	addi	a1,a4,8
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    3eac:	0065a223          	sw	t1,4(a1)

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    3eb0:	ff860713          	addi	a4,a2,-8
    3eb4:	c958                	sw	a4,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3eb6:	0057e7b3          	or	a5,a5,t0
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    3eba:	fe662c23          	sw	t1,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3ebe:	fef62e23          	sw	a5,-4(a2)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    3ec2:	bfb5                	j	3e3e <mm_addfreechunk>

00003ec4 <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    3ec4:	1141                	addi	sp,sp,-16
    3ec6:	c422                	sw	s0,8(sp)
    3ec8:	c226                	sw	s1,4(sp)
    3eca:	c606                	sw	ra,12(sp)
    3ecc:	842a                	mv	s0,a0
    3ece:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    3ed0:	00052623          	sw	zero,12(a0)
{
    3ed4:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    3ed6:	13000613          	li	a2,304
    3eda:	4581                	li	a1,0
    3edc:	0561                	addi	a0,a0,24
    3ede:	b4afe0ef          	jal	ra,2228 <memset>
  for (i = 1; i < MM_NNODES; i++)
    3ee2:	4702                	lw	a4,0(sp)
    3ee4:	02840793          	addi	a5,s0,40
    3ee8:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3eec:	ff078613          	addi	a2,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    3ef0:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3ef4:	c7d0                	sw	a2,12(a5)
    3ef6:	07c1                	addi	a5,a5,16
  for (i = 1; i < MM_NNODES; i++)
    3ef8:	fed79ae3          	bne	a5,a3,3eec <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    3efc:	8522                	mv	a0,s0
}
    3efe:	4422                	lw	s0,8(sp)
    3f00:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    3f02:	85a6                	mv	a1,s1
}
    3f04:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    3f06:	863a                	mv	a2,a4
}
    3f08:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    3f0a:	bf9d                	j	3e80 <mm_addregion>

00003f0c <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    3f0c:	200025b7          	lui	a1,0x20002
    3f10:	200307b7          	lui	a5,0x20030
    3f14:	f9058613          	addi	a2,a1,-112 # 20001f90 <__bss_end__>
    3f18:	00078793          	mv	a5,a5
    3f1c:	20002537          	lui	a0,0x20002
    3f20:	40c78633          	sub	a2,a5,a2
    3f24:	f9058593          	addi	a1,a1,-112
    3f28:	e3050513          	addi	a0,a0,-464 # 20001e30 <g_mmheap>
    3f2c:	bf61                	j	3ec4 <mm_initialize>

00003f2e <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    3f2e:	004007b7          	lui	a5,0x400
    3f32:	00f57c63          	bgeu	a0,a5,3f4a <mm_size2ndx+0x1c>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    3f36:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    3f3a:	4705                	li	a4,1
  int ndx = 0;
    3f3c:	4501                	li	a0,0
  while (size > 1)
    3f3e:	00f76363          	bltu	a4,a5,3f44 <mm_size2ndx+0x16>
    3f42:	8082                	ret
    {
      ndx++;
    3f44:	0505                	addi	a0,a0,1
      size >>= 1;
    3f46:	8385                	srli	a5,a5,0x1
    3f48:	bfdd                	j	3f3e <mm_size2ndx+0x10>
       return MM_NNODES-1;
    3f4a:	4549                	li	a0,18
    }

  return ndx;
}
    3f4c:	8082                	ret

00003f4e <usart_receive_sync>:
uint8_t data_rev[10];
usart_handle_t p_csi_usart;


 int32_t usart_receive_sync(usart_handle_t usart, void *data, uint32_t num)
{
    3f4e:	1151                	addi	sp,sp,-12
    3f50:	c222                	sw	s0,4(sp)
    int time_out = 0x7ffff;
    3f52:	00080437          	lui	s0,0x80
{
    3f56:	c026                	sw	s1,0(sp)
    3f58:	c406                	sw	ra,8(sp)
    3f5a:	84aa                	mv	s1,a0
    int time_out = 0x7ffff;
    3f5c:	147d                	addi	s0,s0,-1
    usart_status_t status;

    csi_usart_receive(usart, data, num);
    3f5e:	f22ff0ef          	jal	ra,3680 <csi_usart_receive>

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(usart);
    3f62:	8526                	mv	a0,s1
    3f64:	f20ff0ef          	jal	ra,3684 <csi_usart_get_status>

        if (!status.rx_busy) {
    3f68:	8909                	andi	a0,a0,2
        time_out--;
    3f6a:	147d                	addi	s0,s0,-1
        if (!status.rx_busy) {
    3f6c:	c901                	beqz	a0,3f7c <usart_receive_sync+0x2e>
    while (time_out) {
    3f6e:	f875                	bnez	s0,3f62 <usart_receive_sync+0x14>
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    3f70:	557d                	li	a0,-1
    }

    return 0;
}
    3f72:	40a2                	lw	ra,8(sp)
    3f74:	4412                	lw	s0,4(sp)
    3f76:	4482                	lw	s1,0(sp)
    3f78:	0131                	addi	sp,sp,12
    3f7a:	8082                	ret
    if (0 == time_out) {
    3f7c:	00143513          	seqz	a0,s0
    3f80:	40a00533          	neg	a0,a0
    3f84:	b7fd                	j	3f72 <usart_receive_sync+0x24>

00003f86 <usart_send_sync>:

 int32_t usart_send_sync(usart_handle_t usart, const void *data, uint32_t num)
{
    3f86:	1151                	addi	sp,sp,-12
    3f88:	c222                	sw	s0,4(sp)
    int time_out = 0x7ffff;
    3f8a:	00080437          	lui	s0,0x80
{
    3f8e:	c026                	sw	s1,0(sp)
    3f90:	c406                	sw	ra,8(sp)
    3f92:	84aa                	mv	s1,a0
    int time_out = 0x7ffff;
    3f94:	147d                	addi	s0,s0,-1
    usart_status_t status;

    csi_usart_send(usart, data, num);
    3f96:	ee8ff0ef          	jal	ra,367e <csi_usart_send>

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(usart);
    3f9a:	8526                	mv	a0,s1
    3f9c:	ee8ff0ef          	jal	ra,3684 <csi_usart_get_status>

        if (!status.tx_busy) {
    3fa0:	8905                	andi	a0,a0,1
        time_out--;
    3fa2:	147d                	addi	s0,s0,-1
        if (!status.tx_busy) {
    3fa4:	c901                	beqz	a0,3fb4 <usart_send_sync+0x2e>
    while (time_out) {
    3fa6:	f875                	bnez	s0,3f9a <usart_send_sync+0x14>
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    3fa8:	557d                	li	a0,-1
    }

    return 0;
}
    3faa:	40a2                	lw	ra,8(sp)
    3fac:	4412                	lw	s0,4(sp)
    3fae:	4482                	lw	s1,0(sp)
    3fb0:	0131                	addi	sp,sp,12
    3fb2:	8082                	ret
    if (0 == time_out) {
    3fb4:	00143513          	seqz	a0,s0
    3fb8:	40a00533          	neg	a0,a0
    3fbc:	b7fd                	j	3faa <usart_send_sync+0x24>

00003fbe <GPIO_Init>:
    }

    return 0;
}
void GPIO_Init()
{
    3fbe:	1151                	addi	sp,sp,-12
    pin1=csi_gpio_pin_initialize(PA2,NULL); //模拟PWM
    3fc0:	4581                	li	a1,0
    3fc2:	4509                	li	a0,2
{
    3fc4:	c406                	sw	ra,8(sp)
    3fc6:	c222                	sw	s0,4(sp)
    pin1=csi_gpio_pin_initialize(PA2,NULL); //模拟PWM
    3fc8:	8adff0ef          	jal	ra,3874 <csi_gpio_pin_initialize>
    3fcc:	20002437          	lui	s0,0x20002
    3fd0:	d5440413          	addi	s0,s0,-684 # 20001d54 <pin1>
    csi_gpio_pin_config_mode(pin1, GPIO_MODE_OPEN_DRAIN);
    3fd4:	458d                	li	a1,3
    pin1=csi_gpio_pin_initialize(PA2,NULL); //模拟PWM
    3fd6:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin1, GPIO_MODE_OPEN_DRAIN);
    3fd8:	8fdff0ef          	jal	ra,38d4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin1, GPIO_DIRECTION_OUTPUT);	
    3fdc:	4008                	lw	a0,0(s0)
    3fde:	4585                	li	a1,1
    3fe0:	90dff0ef          	jal	ra,38ec <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(pin1,0);//low
    3fe4:	4008                	lw	a0,0(s0)
    3fe6:	4581                	li	a1,0
	pin2=csi_gpio_pin_initialize(PA4,NULL);//模拟PWM
    3fe8:	20002437          	lui	s0,0x20002
	csi_gpio_pin_write(pin1,0);//low
    3fec:	933ff0ef          	jal	ra,391e <csi_gpio_pin_write>
	pin2=csi_gpio_pin_initialize(PA4,NULL);//模拟PWM
    3ff0:	4581                	li	a1,0
    3ff2:	4511                	li	a0,4
    3ff4:	881ff0ef          	jal	ra,3874 <csi_gpio_pin_initialize>
    3ff8:	d6040413          	addi	s0,s0,-672 # 20001d60 <pin2>
    csi_gpio_pin_config_mode(pin2, GPIO_MODE_OPEN_DRAIN);
    3ffc:	458d                	li	a1,3
	pin2=csi_gpio_pin_initialize(PA4,NULL);//模拟PWM
    3ffe:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin2, GPIO_MODE_OPEN_DRAIN);
    4000:	8d5ff0ef          	jal	ra,38d4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin2, GPIO_DIRECTION_OUTPUT);	
    4004:	4008                	lw	a0,0(s0)
    4006:	4585                	li	a1,1
    4008:	8e5ff0ef          	jal	ra,38ec <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(pin2,0);//low
    400c:	4008                	lw	a0,0(s0)
    400e:	4581                	li	a1,0
	 
    pin1_d1=csi_gpio_pin_initialize(PA0,NULL);
    4010:	20002437          	lui	s0,0x20002
	csi_gpio_pin_write(pin2,0);//low
    4014:	90bff0ef          	jal	ra,391e <csi_gpio_pin_write>
    pin1_d1=csi_gpio_pin_initialize(PA0,NULL);
    4018:	4581                	li	a1,0
    401a:	4501                	li	a0,0
    401c:	859ff0ef          	jal	ra,3874 <csi_gpio_pin_initialize>
    4020:	d5840413          	addi	s0,s0,-680 # 20001d58 <pin1_d1>
    csi_gpio_pin_config_mode(pin1_d1, GPIO_MODE_OPEN_DRAIN);
    4024:	458d                	li	a1,3
    pin1_d1=csi_gpio_pin_initialize(PA0,NULL);
    4026:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin1_d1, GPIO_MODE_OPEN_DRAIN);
    4028:	8adff0ef          	jal	ra,38d4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin1_d1, GPIO_DIRECTION_OUTPUT);	
    402c:	4008                	lw	a0,0(s0)
    402e:	4585                	li	a1,1
    4030:	8bdff0ef          	jal	ra,38ec <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin1_d1,1);//HIGH
    4034:	4008                	lw	a0,0(s0)
    4036:	4585                	li	a1,1
    pin1_d2=csi_gpio_pin_initialize(PA1,NULL);
    4038:	20002437          	lui	s0,0x20002
    csi_gpio_pin_write(pin1_d1,1);//HIGH
    403c:	8e3ff0ef          	jal	ra,391e <csi_gpio_pin_write>
    pin1_d2=csi_gpio_pin_initialize(PA1,NULL);
    4040:	4581                	li	a1,0
    4042:	4505                	li	a0,1
    4044:	831ff0ef          	jal	ra,3874 <csi_gpio_pin_initialize>
    4048:	d5c40413          	addi	s0,s0,-676 # 20001d5c <pin1_d2>
    csi_gpio_pin_config_mode(pin1_d2, GPIO_MODE_OPEN_DRAIN);
    404c:	458d                	li	a1,3
    pin1_d2=csi_gpio_pin_initialize(PA1,NULL);
    404e:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin1_d2, GPIO_MODE_OPEN_DRAIN);
    4050:	885ff0ef          	jal	ra,38d4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin1_d2, GPIO_DIRECTION_OUTPUT);	
    4054:	4008                	lw	a0,0(s0)
    4056:	4585                	li	a1,1
    4058:	895ff0ef          	jal	ra,38ec <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin1_d2,0);//low
    405c:	4008                	lw	a0,0(s0)
    405e:	4581                	li	a1,0
	
    pin2_d1=csi_gpio_pin_initialize(PA3,NULL);
    4060:	20002437          	lui	s0,0x20002
    csi_gpio_pin_write(pin1_d2,0);//low
    4064:	8bbff0ef          	jal	ra,391e <csi_gpio_pin_write>
    pin2_d1=csi_gpio_pin_initialize(PA3,NULL);
    4068:	4581                	li	a1,0
    406a:	450d                	li	a0,3
    406c:	809ff0ef          	jal	ra,3874 <csi_gpio_pin_initialize>
    4070:	d6440413          	addi	s0,s0,-668 # 20001d64 <pin2_d1>
    csi_gpio_pin_config_mode(pin2_d1, GPIO_MODE_OPEN_DRAIN);
    4074:	458d                	li	a1,3
    pin2_d1=csi_gpio_pin_initialize(PA3,NULL);
    4076:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin2_d1, GPIO_MODE_OPEN_DRAIN);
    4078:	85dff0ef          	jal	ra,38d4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin2_d1, GPIO_DIRECTION_OUTPUT);	
    407c:	4008                	lw	a0,0(s0)
    407e:	4585                	li	a1,1
    4080:	86dff0ef          	jal	ra,38ec <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin2_d1,1);//HIGH	
    4084:	4008                	lw	a0,0(s0)
    4086:	4585                	li	a1,1
    pin2_d2=csi_gpio_pin_initialize(PA5,NULL);
    4088:	20002437          	lui	s0,0x20002
    csi_gpio_pin_write(pin2_d1,1);//HIGH	
    408c:	893ff0ef          	jal	ra,391e <csi_gpio_pin_write>
    pin2_d2=csi_gpio_pin_initialize(PA5,NULL);
    4090:	4581                	li	a1,0
    4092:	4515                	li	a0,5
    4094:	fe0ff0ef          	jal	ra,3874 <csi_gpio_pin_initialize>
    4098:	d6840413          	addi	s0,s0,-664 # 20001d68 <pin2_d2>
    csi_gpio_pin_config_mode(pin2_d2, GPIO_MODE_OPEN_DRAIN);
    409c:	458d                	li	a1,3
    pin2_d2=csi_gpio_pin_initialize(PA5,NULL);
    409e:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin2_d2, GPIO_MODE_OPEN_DRAIN);
    40a0:	835ff0ef          	jal	ra,38d4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin2_d2, GPIO_DIRECTION_OUTPUT);	
    40a4:	4008                	lw	a0,0(s0)
    40a6:	4585                	li	a1,1
    40a8:	845ff0ef          	jal	ra,38ec <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin2_d2,0);//low	
    40ac:	4008                	lw	a0,0(s0)
	
}
    40ae:	4412                	lw	s0,4(sp)
    40b0:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(pin2_d2,0);//low	
    40b2:	4581                	li	a1,0
}
    40b4:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(pin2_d2,0);//low	
    40b6:	869ff06f          	j	391e <csi_gpio_pin_write>

000040ba <usart_init>:



int usart_init(void)
{
    40ba:	1151                	addi	sp,sp,-12
    int32_t ret;

    /* init the USART*/
    p_csi_usart = csi_usart_initialize(0, NULL);
    40bc:	4581                	li	a1,0
    40be:	4501                	li	a0,0
{
    40c0:	c406                	sw	ra,8(sp)
    40c2:	c222                	sw	s0,4(sp)
    p_csi_usart = csi_usart_initialize(0, NULL);
    40c4:	db6ff0ef          	jal	ra,367a <csi_usart_initialize>
    40c8:	200027b7          	lui	a5,0x20002

    /* config the USART */
    ret = csi_usart_config(p_csi_usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    40cc:	65f1                	lui	a1,0x1c
    40ce:	4701                	li	a4,0
    40d0:	4681                	li	a3,0
    40d2:	4601                	li	a2,0
    40d4:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x16138>
    p_csi_usart = csi_usart_initialize(0, NULL);
    40d8:	f6a7ae23          	sw	a0,-132(a5) # 20001f7c <p_csi_usart>
    ret = csi_usart_config(p_csi_usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    40dc:	478d                	li	a5,3
    40de:	d9eff0ef          	jal	ra,367c <csi_usart_config>
    printf("************\n");
    40e2:	00006437          	lui	s0,0x6
    40e6:	83040513          	addi	a0,s0,-2000 # 5830 <sg_usi_config+0x68>
    40ea:	0e5000ef          	jal	ra,49ce <puts>
	printf("Welcome to motor controlling system\n");
    40ee:	00006537          	lui	a0,0x6
    40f2:	84050513          	addi	a0,a0,-1984 # 5840 <sg_usi_config+0x78>
    40f6:	0d9000ef          	jal	ra,49ce <puts>
	printf("************\n");
    40fa:	83040513          	addi	a0,s0,-2000
    40fe:	0d1000ef          	jal	ra,49ce <puts>
	printf("Menu\n");
    4102:	00006537          	lui	a0,0x6
    4106:	86450513          	addi	a0,a0,-1948 # 5864 <sg_usi_config+0x9c>
    410a:	0c5000ef          	jal	ra,49ce <puts>
	printf("enter 'xxxxxx' to turn angle  \n");
    410e:	00006537          	lui	a0,0x6
    4112:	86c50513          	addi	a0,a0,-1940 # 586c <sg_usi_config+0xa4>
    4116:	0b9000ef          	jal	ra,49ce <puts>
	printf("first bit is direction: '+' is clockwise \n");
    411a:	00006537          	lui	a0,0x6
    411e:	88c50513          	addi	a0,a0,-1908 # 588c <sg_usi_config+0xc4>
    4122:	0ad000ef          	jal	ra,49ce <puts>
	printf("last bit is motor loc: '1' is bottom \n");
    4126:	00006537          	lui	a0,0x6
    412a:	8b850513          	addi	a0,a0,-1864 # 58b8 <sg_usi_config+0xf0>
    412e:	0a1000ef          	jal	ra,49ce <puts>
	printf("middle four bits is angle: 00000~9999 \n");
    4132:	00006537          	lui	a0,0x6
    4136:	8e050513          	addi	a0,a0,-1824 # 58e0 <sg_usi_config+0x118>
    413a:	095000ef          	jal	ra,49ce <puts>
    printf("eg: +10001 represents bottom motor turns 1000 uint angles in clockwise \n");
    413e:	00006537          	lui	a0,0x6
    4142:	90850513          	addi	a0,a0,-1784 # 5908 <sg_usi_config+0x140>
    4146:	089000ef          	jal	ra,49ce <puts>
			
	
    return 0;
}
    414a:	40a2                	lw	ra,8(sp)
    414c:	4412                	lw	s0,4(sp)
    414e:	4501                	li	a0,0
    4150:	0131                	addi	sp,sp,12
    4152:	8082                	ret

00004154 <change_angle>:

//正值顺时针，负值逆时针，顺逆时针方向自定义
//loc是电机标号，num=0~9999 num和角度对应关系(近似线性)由于未闭环需要实测
void change_angle(int32_t num,uint8_t loc)
{
    4154:	1151                	addi	sp,sp,-12
    4156:	c222                	sw	s0,4(sp)
    4158:	c406                	sw	ra,8(sp)
    415a:	c026                	sw	s1,0(sp)
	int count_pulse=0;	
	if(loc==motor1)
    415c:	4785                	li	a5,1
{
    415e:	842a                	mv	s0,a0
	if(loc==motor1)
    4160:	06f59f63          	bne	a1,a5,41de <change_angle+0x8a>
	{
		//确定方向
		if(num<0)//逆时针
    4164:	200027b7          	lui	a5,0x20002
    4168:	200024b7          	lui	s1,0x20002
    416c:	d587a503          	lw	a0,-680(a5) # 20001d58 <pin1_d1>
    4170:	d5c48493          	addi	s1,s1,-676 # 20001d5c <pin1_d2>
    4174:	04045d63          	bgez	s0,41ce <change_angle+0x7a>
		{
			csi_gpio_pin_write(pin1_d1,1);
    4178:	fa6ff0ef          	jal	ra,391e <csi_gpio_pin_write>
			csi_gpio_pin_write(pin1_d2,0);	
    417c:	4088                	lw	a0,0(s1)
    417e:	4581                	li	a1,0
			num=-num;
    4180:	40800433          	neg	s0,s0
			csi_gpio_pin_write(pin1_d2,0);	
    4184:	f9aff0ef          	jal	ra,391e <csi_gpio_pin_write>
{
    4188:	4481                	li	s1,0
			csi_gpio_pin_write(pin1_d2,1);				
		}
		//产生固定数脉冲
		while(count_pulse<=num)
		{  
			 csi_gpio_pin_write(pin1,1);//high
    418a:	20002737          	lui	a4,0x20002
    418e:	d5470793          	addi	a5,a4,-684 # 20001d54 <pin1>
    4192:	4388                	lw	a0,0(a5)
    4194:	4585                	li	a1,1
			 udelay(100);
			 csi_gpio_pin_write(pin1,0);//low
			 udelay(100);
			 count_pulse++;
    4196:	0485                	addi	s1,s1,1
			 csi_gpio_pin_write(pin1,1);//high
    4198:	f86ff0ef          	jal	ra,391e <csi_gpio_pin_write>
			 udelay(100);
    419c:	06400513          	li	a0,100
    41a0:	a63ff0ef          	jal	ra,3c02 <udelay>
			 csi_gpio_pin_write(pin1,0);//low
    41a4:	200027b7          	lui	a5,0x20002
    41a8:	d5478793          	addi	a5,a5,-684 # 20001d54 <pin1>
    41ac:	4388                	lw	a0,0(a5)
    41ae:	4581                	li	a1,0
    41b0:	f6eff0ef          	jal	ra,391e <csi_gpio_pin_write>
			 udelay(100);
    41b4:	06400513          	li	a0,100
    41b8:	a4bff0ef          	jal	ra,3c02 <udelay>
		while(count_pulse<=num)
    41bc:	20002737          	lui	a4,0x20002
    41c0:	fc9457e3          	bge	s0,s1,418e <change_angle+0x3a>
			 udelay(100);
			 count_pulse++;
		}	
	}
	
}
    41c4:	40a2                	lw	ra,8(sp)
    41c6:	4412                	lw	s0,4(sp)
    41c8:	4482                	lw	s1,0(sp)
    41ca:	0131                	addi	sp,sp,12
    41cc:	8082                	ret
			csi_gpio_pin_write(pin1_d1,0);
    41ce:	4581                	li	a1,0
    41d0:	f4eff0ef          	jal	ra,391e <csi_gpio_pin_write>
			csi_gpio_pin_write(pin1_d2,1);				
    41d4:	4088                	lw	a0,0(s1)
    41d6:	4585                	li	a1,1
    41d8:	f46ff0ef          	jal	ra,391e <csi_gpio_pin_write>
    41dc:	b775                	j	4188 <change_angle+0x34>
		if(num<0)//逆时针
    41de:	200027b7          	lui	a5,0x20002
    41e2:	200024b7          	lui	s1,0x20002
    41e6:	d647a503          	lw	a0,-668(a5) # 20001d64 <pin2_d1>
    41ea:	d6848493          	addi	s1,s1,-664 # 20001d68 <pin2_d2>
    41ee:	04045a63          	bgez	s0,4242 <change_angle+0xee>
			csi_gpio_pin_write(pin2_d1,1);
    41f2:	4585                	li	a1,1
    41f4:	f2aff0ef          	jal	ra,391e <csi_gpio_pin_write>
			csi_gpio_pin_write(pin2_d2,0);	
    41f8:	4088                	lw	a0,0(s1)
    41fa:	4581                	li	a1,0
			num=-num;
    41fc:	40800433          	neg	s0,s0
			csi_gpio_pin_write(pin2_d2,0);	
    4200:	f1eff0ef          	jal	ra,391e <csi_gpio_pin_write>
{
    4204:	4481                	li	s1,0
			 csi_gpio_pin_write(pin2,1);//high
    4206:	20002737          	lui	a4,0x20002
    420a:	d6070793          	addi	a5,a4,-672 # 20001d60 <pin2>
    420e:	4388                	lw	a0,0(a5)
    4210:	4585                	li	a1,1
			 count_pulse++;
    4212:	0485                	addi	s1,s1,1
			 csi_gpio_pin_write(pin2,1);//high
    4214:	f0aff0ef          	jal	ra,391e <csi_gpio_pin_write>
			 udelay(100);//100 us
    4218:	06400513          	li	a0,100
    421c:	9e7ff0ef          	jal	ra,3c02 <udelay>
			 csi_gpio_pin_write(pin2,0);//low
    4220:	200027b7          	lui	a5,0x20002
    4224:	d6078793          	addi	a5,a5,-672 # 20001d60 <pin2>
    4228:	4388                	lw	a0,0(a5)
    422a:	4581                	li	a1,0
    422c:	ef2ff0ef          	jal	ra,391e <csi_gpio_pin_write>
			 udelay(100);
    4230:	06400513          	li	a0,100
    4234:	9cfff0ef          	jal	ra,3c02 <udelay>
		while(count_pulse<=num)
    4238:	20002737          	lui	a4,0x20002
    423c:	fc9457e3          	bge	s0,s1,420a <change_angle+0xb6>
    4240:	b751                	j	41c4 <change_angle+0x70>
			csi_gpio_pin_write(pin2_d1,0);
    4242:	4581                	li	a1,0
    4244:	edaff0ef          	jal	ra,391e <csi_gpio_pin_write>
			csi_gpio_pin_write(pin2_d2,1);			
    4248:	4088                	lw	a0,0(s1)
    424a:	4585                	li	a1,1
    424c:	ed2ff0ef          	jal	ra,391e <csi_gpio_pin_write>
    4250:	bf55                	j	4204 <change_angle+0xb0>

00004252 <main>:

int32_t aim_degree=0;//目标旋转角度
uint8_t aim_loc;//目标电机
uint8_t flag=0;//控制位
int main(void)
{
    4252:	1151                	addi	sp,sp,-12
    4254:	c406                	sw	ra,8(sp)
    4256:	c222                	sw	s0,4(sp)
    4258:	c026                	sw	s1,0(sp)

	GPIO_Init();
    425a:	3395                	jal	3fbe <GPIO_Init>
  	//timer_init(1,1000);
	usart_init();
    425c:	3db9                	jal	40ba <usart_init>

    //循环进行：读取串口是否有数据->有数据进行解算、控制电机旋转->标志清零
	while(1)
	{			
			usart_receive_sync(p_csi_usart,&data_rev,6);
    425e:	20002437          	lui	s0,0x20002
    4262:	f7c42503          	lw	a0,-132(s0) # 20001f7c <p_csi_usart>
    4266:	20002737          	lui	a4,0x20002
    426a:	f8070593          	addi	a1,a4,-128 # 20001f80 <data_rev>
    426e:	4619                	li	a2,6
    4270:	39f9                	jal	3f4e <usart_receive_sync>
			if(data_rev[0]!='\0')
    4272:	20002737          	lui	a4,0x20002
    4276:	f8074683          	lbu	a3,-128(a4) # 20001f80 <data_rev>
    427a:	200024b7          	lui	s1,0x20002
    427e:	d5048493          	addi	s1,s1,-688 # 20001d50 <flag>
    4282:	cee1                	beqz	a3,435a <main+0x108>
			 {	
				//把接收到的数据回传过去并换行，然后终止接收
				usart_send_sync(p_csi_usart,data_rev,sizeof(data_rev));
    4284:	f7c42503          	lw	a0,-132(s0)
    4288:	f8070593          	addi	a1,a4,-128
    428c:	4629                	li	a2,10
    428e:	39e5                	jal	3f86 <usart_send_sync>
				printf("\n");
    4290:	4529                	li	a0,10
    4292:	2725                	jal	49ba <putchar>
				csi_usart_abort_receive(p_csi_usart);
    4294:	f7c42503          	lw	a0,-132(s0)
    4298:	beaff0ef          	jal	ra,3682 <csi_usart_abort_receive>

				//计算目标旋转角度和目标电机
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
    429c:	20002737          	lui	a4,0x20002
    42a0:	f8070613          	addi	a2,a4,-128 # 20001f80 <data_rev>
    42a4:	00164783          	lbu	a5,1(a2)
    42a8:	3e800693          	li	a3,1000
    42ac:	06400593          	li	a1,100
    42b0:	fd078793          	addi	a5,a5,-48
    42b4:	02d787b3          	mul	a5,a5,a3
    42b8:	00264683          	lbu	a3,2(a2)
    42bc:	fd068693          	addi	a3,a3,-48 # e000dfd0 <__heap_end+0xbffddfd0>
    42c0:	02b686b3          	mul	a3,a3,a1
    42c4:	45a9                	li	a1,10
    42c6:	97b6                	add	a5,a5,a3
    42c8:	00364683          	lbu	a3,3(a2)
    42cc:	fd068693          	addi	a3,a3,-48
    42d0:	02b686b3          	mul	a3,a3,a1
				
				if(data_rev[0]=='-') aim_degree=-aim_degree;
    42d4:	02d00593          	li	a1,45
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
    42d8:	97b6                	add	a5,a5,a3
    42da:	00464683          	lbu	a3,4(a2)
				if(data_rev[0]=='-') aim_degree=-aim_degree;
    42de:	f8074603          	lbu	a2,-128(a4)
    42e2:	f8070713          	addi	a4,a4,-128
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
    42e6:	fd068693          	addi	a3,a3,-48
    42ea:	97b6                	add	a5,a5,a3
    42ec:	200026b7          	lui	a3,0x20002
    42f0:	d4c68693          	addi	a3,a3,-692 # 20001d4c <aim_degree>
    42f4:	c29c                	sw	a5,0(a3)
				if(data_rev[0]=='-') aim_degree=-aim_degree;
    42f6:	04b61b63          	bne	a2,a1,434c <main+0xfa>
    42fa:	40f007b3          	neg	a5,a5
    42fe:	c29c                	sw	a5,0(a3)
				else if(data_rev[0]=='+') aim_degree=aim_degree;
				else  aim_degree=0;
				aim_loc=data_rev[5]-0x30;
    4300:	00574783          	lbu	a5,5(a4)
    4304:	200026b7          	lui	a3,0x20002
    4308:	fd078793          	addi	a5,a5,-48
    430c:	f6f68c23          	sb	a5,-136(a3) # 20001f78 <aim_loc>
				flag=1;
    4310:	4785                	li	a5,1
    4312:	00f48023          	sb	a5,0(s1)
				//data_rev清零
				int i=0;
				while(i<10) {data_rev[i]='\0';i++;}					 
    4316:	46a9                	li	a3,10
				int i=0;
    4318:	4781                	li	a5,0
				while(i<10) {data_rev[i]='\0';i++;}					 
    431a:	00f70633          	add	a2,a4,a5
    431e:	00060023          	sb	zero,0(a2)
    4322:	0785                	addi	a5,a5,1
    4324:	fed79be3          	bne	a5,a3,431a <main+0xc8>
			 }	 
		if(flag)
		{   
			//旋转和复位
			change_angle(aim_degree,aim_loc);
    4328:	200027b7          	lui	a5,0x20002
    432c:	843e                	mv	s0,a5
    432e:	20002737          	lui	a4,0x20002
    4332:	d4c78793          	addi	a5,a5,-692 # 20001d4c <aim_degree>
    4336:	4388                	lw	a0,0(a5)
    4338:	f7874583          	lbu	a1,-136(a4) # 20001f78 <aim_loc>
    433c:	3d21                	jal	4154 <change_angle>
			flag=0;
			aim_degree=0;
    433e:	d4c40793          	addi	a5,s0,-692
			flag=0;
    4342:	00048023          	sb	zero,0(s1)
			aim_degree=0;
    4346:	0007a023          	sw	zero,0(a5)
    434a:	bf11                	j	425e <main+0xc>
				else if(data_rev[0]=='+') aim_degree=aim_degree;
    434c:	02b00793          	li	a5,43
    4350:	faf608e3          	beq	a2,a5,4300 <main+0xae>
				else  aim_degree=0;
    4354:	0006a023          	sw	zero,0(a3)
    4358:	b765                	j	4300 <main+0xae>
		if(flag)
    435a:	0004c703          	lbu	a4,0(s1)
    435e:	f00702e3          	beqz	a4,4262 <main+0x10>
    4362:	b7d9                	j	4328 <main+0xd6>

00004364 <copystring>:
    4364:	4781                	li	a5,0
    4366:	470d                	li	a4,3
    4368:	00b7c463          	blt	a5,a1,4370 <copystring+0xc>
    436c:	853e                	mv	a0,a5
    436e:	8082                	ret
    4370:	00f606b3          	add	a3,a2,a5
    4374:	0006c303          	lbu	t1,0(a3)
    4378:	00f506b3          	add	a3,a0,a5
    437c:	0785                	addi	a5,a5,1
    437e:	00668023          	sb	t1,0(a3)
    4382:	fee793e3          	bne	a5,a4,4368 <copystring+0x4>
    4386:	feb7d3e3          	bge	a5,a1,436c <copystring+0x8>
    438a:	000501a3          	sb	zero,3(a0)
    438e:	4791                	li	a5,4
    4390:	bff1                	j	436c <copystring+0x8>

00004392 <__dtostr>:
    4392:	fa810113          	addi	sp,sp,-88
    4396:	c8a2                	sw	s0,80(sp)
    4398:	ca86                	sw	ra,84(sp)
    439a:	c6a6                	sw	s1,76(sp)
    439c:	d02a                	sw	a0,32(sp)
    439e:	c42e                	sw	a1,8(sp)
    43a0:	c032                	sw	a2,0(sp)
    43a2:	8436                	mv	s0,a3
    43a4:	d43a                	sw	a4,40(sp)
    43a6:	c23e                	sw	a5,4(sp)
    43a8:	2139                	jal	47b6 <__isinf>
    43aa:	cd09                	beqz	a0,43c4 <__dtostr+0x32>
    43ac:	00006637          	lui	a2,0x6
    43b0:	98860613          	addi	a2,a2,-1656 # 5988 <sg_usi_config+0x1c0>
    43b4:	85a2                	mv	a1,s0
    43b6:	4446                	lw	s0,80(sp)
    43b8:	4502                	lw	a0,0(sp)
    43ba:	40d6                	lw	ra,84(sp)
    43bc:	44b6                	lw	s1,76(sp)
    43be:	05810113          	addi	sp,sp,88
    43c2:	b74d                	j	4364 <copystring>
    43c4:	5702                	lw	a4,32(sp)
    43c6:	47a2                	lw	a5,8(sp)
    43c8:	853a                	mv	a0,a4
    43ca:	85be                	mv	a1,a5
    43cc:	23b9                	jal	491a <__isnan>
    43ce:	d22a                	sw	a0,36(sp)
    43d0:	c511                	beqz	a0,43dc <__dtostr+0x4a>
    43d2:	00006637          	lui	a2,0x6
    43d6:	98c60613          	addi	a2,a2,-1652 # 598c <sg_usi_config+0x1c4>
    43da:	bfe9                	j	43b4 <__dtostr+0x22>
    43dc:	5702                	lw	a4,32(sp)
    43de:	47a2                	lw	a5,8(sp)
    43e0:	4601                	li	a2,0
    43e2:	4681                	li	a3,0
    43e4:	853a                	mv	a0,a4
    43e6:	85be                	mv	a1,a5
    43e8:	856fd0ef          	jal	ra,143e <__eqdf2>
    43ec:	e925                	bnez	a0,445c <__dtostr+0xca>
    43ee:	4792                	lw	a5,4(sp)
    43f0:	3a078e63          	beqz	a5,47ac <__dtostr+0x41a>
    43f4:	0789                	addi	a5,a5,2
    43f6:	02f46163          	bltu	s0,a5,4418 <__dtostr+0x86>
    43fa:	cb85                	beqz	a5,442a <__dtostr+0x98>
    43fc:	4722                	lw	a4,8(sp)
    43fe:	04075c63          	bgez	a4,4456 <__dtostr+0xc4>
    4402:	4682                	lw	a3,0(sp)
    4404:	02d00713          	li	a4,45
    4408:	00e68023          	sb	a4,0(a3)
    440c:	00178713          	addi	a4,a5,1
    4410:	4785                	li	a5,1
    4412:	03000693          	li	a3,48
    4416:	a801                	j	4426 <__dtostr+0x94>
    4418:	47a1                	li	a5,8
    441a:	b7cd                	j	43fc <__dtostr+0x6a>
    441c:	4602                	lw	a2,0(sp)
    441e:	963e                	add	a2,a2,a5
    4420:	00d60023          	sb	a3,0(a2)
    4424:	0785                	addi	a5,a5,1
    4426:	fee7ebe3          	bltu	a5,a4,441c <__dtostr+0x8a>
    442a:	4702                	lw	a4,0(sp)
    442c:	03000693          	li	a3,48
    4430:	00074603          	lbu	a2,0(a4)
    4434:	4705                	li	a4,1
    4436:	00d60363          	beq	a2,a3,443c <__dtostr+0xaa>
    443a:	4709                	li	a4,2
    443c:	4682                	lw	a3,0(sp)
    443e:	9736                	add	a4,a4,a3
    4440:	02e00693          	li	a3,46
    4444:	00d70023          	sb	a3,0(a4)
    4448:	4702                	lw	a4,0(sp)
    444a:	00f704b3          	add	s1,a4,a5
    444e:	00048023          	sb	zero,0(s1)
    4452:	d23e                	sw	a5,36(sp)
    4454:	ac69                	j	46ee <__dtostr+0x35c>
    4456:	873e                	mv	a4,a5
    4458:	4781                	li	a5,0
    445a:	bf65                	j	4412 <__dtostr+0x80>
    445c:	5702                	lw	a4,32(sp)
    445e:	47a2                	lw	a5,8(sp)
    4460:	4601                	li	a2,0
    4462:	4681                	li	a3,0
    4464:	853a                	mv	a0,a4
    4466:	85be                	mv	a1,a5
    4468:	904fd0ef          	jal	ra,156c <__ledf2>
    446c:	18055963          	bgez	a0,45fe <__dtostr+0x26c>
    4470:	47a2                	lw	a5,8(sp)
    4472:	4702                	lw	a4,0(sp)
    4474:	800002b7          	lui	t0,0x80000
    4478:	00f2c2b3          	xor	t0,t0,a5
    447c:	02d00793          	li	a5,45
    4480:	00f70023          	sb	a5,0(a4)
    4484:	147d                	addi	s0,s0,-1
    4486:	00170493          	addi	s1,a4,1
    448a:	000067b7          	lui	a5,0x6
    448e:	9507a503          	lw	a0,-1712(a5) # 5950 <sg_usi_config+0x188>
    4492:	9547a583          	lw	a1,-1708(a5)
    4496:	000067b7          	lui	a5,0x6
    449a:	9607a703          	lw	a4,-1696(a5) # 5960 <sg_usi_config+0x198>
    449e:	9647a783          	lw	a5,-1692(a5)
    44a2:	4381                	li	t2,0
    44a4:	4692                	lw	a3,4(sp)
    44a6:	14d39f63          	bne	t2,a3,4604 <__dtostr+0x272>
    44aa:	5702                	lw	a4,32(sp)
    44ac:	862a                	mv	a2,a0
    44ae:	86ae                	mv	a3,a1
    44b0:	853a                	mv	a0,a4
    44b2:	8596                	mv	a1,t0
    44b4:	c02fc0ef          	jal	ra,8b6 <__adddf3>
    44b8:	000067b7          	lui	a5,0x6
    44bc:	9687a603          	lw	a2,-1688(a5) # 5968 <sg_usi_config+0x1a0>
    44c0:	96c7a683          	lw	a3,-1684(a5)
    44c4:	c82a                	sw	a0,16(sp)
    44c6:	ca2e                	sw	a1,20(sp)
    44c8:	8a4fd0ef          	jal	ra,156c <__ledf2>
    44cc:	00055863          	bgez	a0,44dc <__dtostr+0x14a>
    44d0:	03000793          	li	a5,48
    44d4:	00f48023          	sb	a5,0(s1)
    44d8:	147d                	addi	s0,s0,-1
    44da:	0485                	addi	s1,s1,1
    44dc:	47a2                	lw	a5,8(sp)
    44de:	0147d513          	srli	a0,a5,0x14
    44e2:	7ff57513          	andi	a0,a0,2047
    44e6:	c0150513          	addi	a0,a0,-1023
    44ea:	c4dfd0ef          	jal	ra,2136 <__floatsidf>
    44ee:	000067b7          	lui	a5,0x6
    44f2:	9707a603          	lw	a2,-1680(a5) # 5970 <sg_usi_config+0x1a8>
    44f6:	9747a683          	lw	a3,-1676(a5)
    44fa:	926fd0ef          	jal	ra,1620 <__muldf3>
    44fe:	bd5fd0ef          	jal	ra,20d2 <__fixdfsi>
    4502:	00150793          	addi	a5,a0,1
    4506:	cc3e                	sw	a5,24(sp)
    4508:	22f05d63          	blez	a5,4742 <__dtostr+0x3b0>
    450c:	000066b7          	lui	a3,0x6
    4510:	9786a603          	lw	a2,-1672(a3) # 5978 <sg_usi_config+0x1b0>
    4514:	82be                	mv	t0,a5
    4516:	97c6a683          	lw	a3,-1668(a3)
    451a:	000067b7          	lui	a5,0x6
    451e:	9587a703          	lw	a4,-1704(a5) # 5958 <sg_usi_config+0x190>
    4522:	95c7a783          	lw	a5,-1700(a5)
    4526:	43a9                	li	t2,10
    4528:	d632                	sw	a2,44(sp)
    452a:	d836                	sw	a3,48(sp)
    452c:	0e53ea63          	bltu	t2,t0,4620 <__dtostr+0x28e>
    4530:	000066b7          	lui	a3,0x6
    4534:	9586a603          	lw	a2,-1704(a3) # 5958 <sg_usi_config+0x190>
    4538:	95c6a683          	lw	a3,-1700(a3)
    453c:	4385                	li	t2,1
    453e:	d632                	sw	a2,44(sp)
    4540:	d836                	sw	a3,48(sp)
    4542:	0e729c63          	bne	t0,t2,463a <__dtostr+0x2a8>
    4546:	4685                	li	a3,1
    4548:	d636                	sw	a3,44(sp)
    454a:	000066b7          	lui	a3,0x6
    454e:	9806a603          	lw	a2,-1664(a3) # 5980 <sg_usi_config+0x1b8>
    4552:	9846a683          	lw	a3,-1660(a3)
    4556:	da32                	sw	a2,52(sp)
    4558:	dc36                	sw	a3,56(sp)
    455a:	000066b7          	lui	a3,0x6
    455e:	9586a603          	lw	a2,-1704(a3) # 5958 <sg_usi_config+0x190>
    4562:	95c6a683          	lw	a3,-1700(a3)
    4566:	de32                	sw	a2,60(sp)
    4568:	c0b6                	sw	a3,64(sp)
    456a:	5652                	lw	a2,52(sp)
    456c:	56e2                	lw	a3,56(sp)
    456e:	853a                	mv	a0,a4
    4570:	85be                	mv	a1,a5
    4572:	c2ba                	sw	a4,68(sp)
    4574:	c4be                	sw	a5,72(sp)
    4576:	f43fc0ef          	jal	ra,14b8 <__gedf2>
    457a:	4716                	lw	a4,68(sp)
    457c:	47a6                	lw	a5,72(sp)
    457e:	0ca04b63          	bgtz	a0,4654 <__dtostr+0x2c2>
    4582:	4682                	lw	a3,0(sp)
    4584:	00d49a63          	bne	s1,a3,4598 <__dtostr+0x206>
    4588:	16040363          	beqz	s0,46ee <__dtostr+0x35c>
    458c:	03000693          	li	a3,48
    4590:	00d48023          	sb	a3,0(s1)
    4594:	147d                	addi	s0,s0,-1
    4596:	0485                	addi	s1,s1,1
    4598:	4692                	lw	a3,4(sp)
    459a:	ea81                	bnez	a3,45aa <__dtostr+0x218>
    459c:	4682                	lw	a3,0(sp)
    459e:	5622                	lw	a2,40(sp)
    45a0:	40d486b3          	sub	a3,s1,a3
    45a4:	0685                	addi	a3,a3,1
    45a6:	04c6f663          	bgeu	a3,a2,45f2 <__dtostr+0x260>
    45aa:	14040263          	beqz	s0,46ee <__dtostr+0x35c>
    45ae:	02e00693          	li	a3,46
    45b2:	00d48023          	sb	a3,0(s1)
    45b6:	4692                	lw	a3,4(sp)
    45b8:	147d                	addi	s0,s0,-1
    45ba:	00148293          	addi	t0,s1,1
    45be:	ea81                	bnez	a3,45ce <__dtostr+0x23c>
    45c0:	56a2                	lw	a3,40(sp)
    45c2:	4602                	lw	a2,0(sp)
    45c4:	0685                	addi	a3,a3,1
    45c6:	40c28633          	sub	a2,t0,a2
    45ca:	8e91                	sub	a3,a3,a2
    45cc:	c236                	sw	a3,4(sp)
    45ce:	4692                	lw	a3,4(sp)
    45d0:	10d46f63          	bltu	s0,a3,46ee <__dtostr+0x35c>
    45d4:	8426                	mv	s0,s1
    45d6:	94b6                	add	s1,s1,a3
    45d8:	000066b7          	lui	a3,0x6
    45dc:	9586a603          	lw	a2,-1704(a3) # 5958 <sg_usi_config+0x190>
    45e0:	95c6a683          	lw	a3,-1700(a3)
    45e4:	c432                	sw	a2,8(sp)
    45e6:	c636                	sw	a3,12(sp)
    45e8:	16941463          	bne	s0,s1,4750 <__dtostr+0x3be>
    45ec:	4792                	lw	a5,4(sp)
    45ee:	00f284b3          	add	s1,t0,a5
    45f2:	4782                	lw	a5,0(sp)
    45f4:	00048023          	sb	zero,0(s1)
    45f8:	40f487b3          	sub	a5,s1,a5
    45fc:	bd99                	j	4452 <__dtostr+0xc0>
    45fe:	4482                	lw	s1,0(sp)
    4600:	42a2                	lw	t0,8(sp)
    4602:	b561                	j	448a <__dtostr+0xf8>
    4604:	863a                	mv	a2,a4
    4606:	86be                	mv	a3,a5
    4608:	d616                	sw	t0,44(sp)
    460a:	cc1e                	sw	t2,24(sp)
    460c:	c83a                	sw	a4,16(sp)
    460e:	ca3e                	sw	a5,20(sp)
    4610:	810fd0ef          	jal	ra,1620 <__muldf3>
    4614:	43e2                	lw	t2,24(sp)
    4616:	52b2                	lw	t0,44(sp)
    4618:	4742                	lw	a4,16(sp)
    461a:	0385                	addi	t2,t2,1
    461c:	47d2                	lw	a5,20(sp)
    461e:	b559                	j	44a4 <__dtostr+0x112>
    4620:	5632                	lw	a2,44(sp)
    4622:	56c2                	lw	a3,48(sp)
    4624:	853a                	mv	a0,a4
    4626:	85be                	mv	a1,a5
    4628:	da16                	sw	t0,52(sp)
    462a:	ff7fc0ef          	jal	ra,1620 <__muldf3>
    462e:	52d2                	lw	t0,52(sp)
    4630:	872a                	mv	a4,a0
    4632:	87ae                	mv	a5,a1
    4634:	12d9                	addi	t0,t0,-10
    4636:	43a9                	li	t2,10
    4638:	bdd5                	j	452c <__dtostr+0x19a>
    463a:	5632                	lw	a2,44(sp)
    463c:	56c2                	lw	a3,48(sp)
    463e:	853a                	mv	a0,a4
    4640:	85be                	mv	a1,a5
    4642:	da16                	sw	t0,52(sp)
    4644:	fddfc0ef          	jal	ra,1620 <__muldf3>
    4648:	52d2                	lw	t0,52(sp)
    464a:	872a                	mv	a4,a0
    464c:	87ae                	mv	a5,a1
    464e:	12fd                	addi	t0,t0,-1
    4650:	4385                	li	t2,1
    4652:	bdc5                	j	4542 <__dtostr+0x1b0>
    4654:	4542                	lw	a0,16(sp)
    4656:	45d2                	lw	a1,20(sp)
    4658:	863a                	mv	a2,a4
    465a:	86be                	mv	a3,a5
    465c:	c2ba                	sw	a4,68(sp)
    465e:	c4be                	sw	a5,72(sp)
    4660:	851fc0ef          	jal	ra,eb0 <__divdf3>
    4664:	a6ffd0ef          	jal	ra,20d2 <__fixdfsi>
    4668:	5632                	lw	a2,44(sp)
    466a:	0ff57693          	andi	a3,a0,255
    466e:	4716                	lw	a4,68(sp)
    4670:	47a6                	lw	a5,72(sp)
    4672:	c211                	beqz	a2,4676 <__dtostr+0x2e4>
    4674:	ced5                	beqz	a3,4730 <__dtostr+0x39e>
    4676:	03068693          	addi	a3,a3,48
    467a:	00d48023          	sb	a3,0(s1)
    467e:	0485                	addi	s1,s1,1
    4680:	ec35                	bnez	s0,46fc <__dtostr+0x36a>
    4682:	863a                	mv	a2,a4
    4684:	86be                	mv	a3,a5
    4686:	5702                	lw	a4,32(sp)
    4688:	47a2                	lw	a5,8(sp)
    468a:	853a                	mv	a0,a4
    468c:	85be                	mv	a1,a5
    468e:	823fc0ef          	jal	ra,eb0 <__divdf3>
    4692:	4792                	lw	a5,4(sp)
    4694:	5722                	lw	a4,40(sp)
    4696:	4602                	lw	a2,0(sp)
    4698:	4681                	li	a3,0
    469a:	39e5                	jal	4392 <__dtostr>
    469c:	c929                	beqz	a0,46ee <__dtostr+0x35c>
    469e:	00a48333          	add	t1,s1,a0
    46a2:	06500793          	li	a5,101
    46a6:	00f30023          	sb	a5,0(t1)
    46aa:	00130493          	addi	s1,t1,1
    46ae:	fff54513          	not	a0,a0
    46b2:	4711                	li	a4,4
    46b4:	4685                	li	a3,1
    46b6:	3e800793          	li	a5,1000
    46ba:	4629                	li	a2,10
    46bc:	45e2                	lw	a1,24(sp)
    46be:	00f5d363          	bge	a1,a5,46c4 <__dtostr+0x332>
    46c2:	e285                	bnez	a3,46e2 <__dtostr+0x350>
    46c4:	c909                	beqz	a0,46d6 <__dtostr+0x344>
    46c6:	46e2                	lw	a3,24(sp)
    46c8:	0485                	addi	s1,s1,1
    46ca:	02f6c6b3          	div	a3,a3,a5
    46ce:	03068693          	addi	a3,a3,48
    46d2:	fed48fa3          	sb	a3,-1(s1)
    46d6:	46e2                	lw	a3,24(sp)
    46d8:	157d                	addi	a0,a0,-1
    46da:	02f6e6b3          	rem	a3,a3,a5
    46de:	cc36                	sw	a3,24(sp)
    46e0:	4681                	li	a3,0
    46e2:	177d                	addi	a4,a4,-1
    46e4:	02c7c7b3          	div	a5,a5,a2
    46e8:	fb71                	bnez	a4,46bc <__dtostr+0x32a>
    46ea:	f00514e3          	bnez	a0,45f2 <__dtostr+0x260>
    46ee:	40d6                	lw	ra,84(sp)
    46f0:	4446                	lw	s0,80(sp)
    46f2:	5512                	lw	a0,36(sp)
    46f4:	44b6                	lw	s1,76(sp)
    46f6:	05810113          	addi	sp,sp,88
    46fa:	8082                	ret
    46fc:	0ff57513          	andi	a0,a0,255
    4700:	d63a                	sw	a4,44(sp)
    4702:	d83e                	sw	a5,48(sp)
    4704:	a33fd0ef          	jal	ra,2136 <__floatsidf>
    4708:	5732                	lw	a4,44(sp)
    470a:	57c2                	lw	a5,48(sp)
    470c:	147d                	addi	s0,s0,-1
    470e:	863a                	mv	a2,a4
    4710:	86be                	mv	a3,a5
    4712:	c2ba                	sw	a4,68(sp)
    4714:	c4be                	sw	a5,72(sp)
    4716:	f0bfc0ef          	jal	ra,1620 <__muldf3>
    471a:	862a                	mv	a2,a0
    471c:	86ae                	mv	a3,a1
    471e:	4542                	lw	a0,16(sp)
    4720:	45d2                	lw	a1,20(sp)
    4722:	ba2fd0ef          	jal	ra,1ac4 <__subdf3>
    4726:	4716                	lw	a4,68(sp)
    4728:	47a6                	lw	a5,72(sp)
    472a:	c82a                	sw	a0,16(sp)
    472c:	ca2e                	sw	a1,20(sp)
    472e:	d602                	sw	zero,44(sp)
    4730:	5672                	lw	a2,60(sp)
    4732:	4686                	lw	a3,64(sp)
    4734:	853a                	mv	a0,a4
    4736:	85be                	mv	a1,a5
    4738:	f78fc0ef          	jal	ra,eb0 <__divdf3>
    473c:	872a                	mv	a4,a0
    473e:	87ae                	mv	a5,a1
    4740:	b52d                	j	456a <__dtostr+0x1d8>
    4742:	000067b7          	lui	a5,0x6
    4746:	9607a703          	lw	a4,-1696(a5) # 5960 <sg_usi_config+0x198>
    474a:	9647a783          	lw	a5,-1692(a5)
    474e:	bd15                	j	4582 <__dtostr+0x1f0>
    4750:	4542                	lw	a0,16(sp)
    4752:	45d2                	lw	a1,20(sp)
    4754:	863a                	mv	a2,a4
    4756:	86be                	mv	a3,a5
    4758:	d016                	sw	t0,32(sp)
    475a:	cc3a                	sw	a4,24(sp)
    475c:	ce3e                	sw	a5,28(sp)
    475e:	f52fc0ef          	jal	ra,eb0 <__divdf3>
    4762:	971fd0ef          	jal	ra,20d2 <__fixdfsi>
    4766:	03050693          	addi	a3,a0,48
    476a:	00d400a3          	sb	a3,1(s0)
    476e:	0ff57513          	andi	a0,a0,255
    4772:	9c5fd0ef          	jal	ra,2136 <__floatsidf>
    4776:	4762                	lw	a4,24(sp)
    4778:	47f2                	lw	a5,28(sp)
    477a:	0405                	addi	s0,s0,1
    477c:	863a                	mv	a2,a4
    477e:	86be                	mv	a3,a5
    4780:	ea1fc0ef          	jal	ra,1620 <__muldf3>
    4784:	862a                	mv	a2,a0
    4786:	86ae                	mv	a3,a1
    4788:	4542                	lw	a0,16(sp)
    478a:	45d2                	lw	a1,20(sp)
    478c:	b38fd0ef          	jal	ra,1ac4 <__subdf3>
    4790:	4762                	lw	a4,24(sp)
    4792:	47f2                	lw	a5,28(sp)
    4794:	4622                	lw	a2,8(sp)
    4796:	46b2                	lw	a3,12(sp)
    4798:	c82a                	sw	a0,16(sp)
    479a:	ca2e                	sw	a1,20(sp)
    479c:	853a                	mv	a0,a4
    479e:	85be                	mv	a1,a5
    47a0:	f10fc0ef          	jal	ra,eb0 <__divdf3>
    47a4:	872a                	mv	a4,a0
    47a6:	87ae                	mv	a5,a1
    47a8:	5282                	lw	t0,32(sp)
    47aa:	bd3d                	j	45e8 <__dtostr+0x256>
    47ac:	47a1                	li	a5,8
    47ae:	c40407e3          	beqz	s0,43fc <__dtostr+0x6a>
    47b2:	4785                	li	a5,1
    47b4:	b1a1                	j	43fc <__dtostr+0x6a>

000047b6 <__isinf>:
    47b6:	e509                	bnez	a0,47c0 <__isinf+0xa>
    47b8:	7ff007b7          	lui	a5,0x7ff00
    47bc:	00f58b63          	beq	a1,a5,47d2 <__isinf+0x1c>
    47c0:	fff007b7          	lui	a5,0xfff00
    47c4:	8fad                	xor	a5,a5,a1
    47c6:	8d5d                	or	a0,a0,a5
    47c8:	00153513          	seqz	a0,a0
    47cc:	40a00533          	neg	a0,a0
    47d0:	8082                	ret
    47d2:	4505                	li	a0,1
    47d4:	8082                	ret

000047d6 <__lltostr>:
    47d6:	fdc10113          	addi	sp,sp,-36
    47da:	15fd                	addi	a1,a1,-1
    47dc:	ce22                	sw	s0,28(sp)
    47de:	d006                	sw	ra,32(sp)
    47e0:	cc26                	sw	s1,24(sp)
    47e2:	95aa                	add	a1,a1,a0
    47e4:	00058023          	sb	zero,0(a1)
    47e8:	842a                	mv	s0,a0
    47ea:	82b2                	mv	t0,a2
    47ec:	8336                	mv	t1,a3
    47ee:	c709                	beqz	a4,47f8 <__lltostr+0x22>
    47f0:	02400693          	li	a3,36
    47f4:	00e6d363          	bge	a3,a4,47fa <__lltostr+0x24>
    47f8:	4729                	li	a4,10
    47fa:	0062e6b3          	or	a3,t0,t1
    47fe:	4601                	li	a2,0
    4800:	e699                	bnez	a3,480e <__lltostr+0x38>
    4802:	03000693          	li	a3,48
    4806:	fed58fa3          	sb	a3,-1(a1)
    480a:	4605                	li	a2,1
    480c:	15fd                	addi	a1,a1,-1
    480e:	02700693          	li	a3,39
    4812:	c391                	beqz	a5,4816 <__lltostr+0x40>
    4814:	469d                	li	a3,7
    4816:	0ff6f793          	andi	a5,a3,255
    481a:	c23e                	sw	a5,4(sp)
    481c:	00c587b3          	add	a5,a1,a2
    4820:	c43e                	sw	a5,8(sp)
    4822:	41f75793          	srai	a5,a4,0x1f
    4826:	84ae                	mv	s1,a1
    4828:	c03e                	sw	a5,0(sp)
    482a:	47a2                	lw	a5,8(sp)
    482c:	409786b3          	sub	a3,a5,s1
    4830:	00947563          	bgeu	s0,s1,483a <__lltostr+0x64>
    4834:	0062e633          	or	a2,t0,t1
    4838:	e205                	bnez	a2,4858 <__lltostr+0x82>
    483a:	00168613          	addi	a2,a3,1
    483e:	85a6                	mv	a1,s1
    4840:	8522                	mv	a0,s0
    4842:	c036                	sw	a3,0(sp)
    4844:	999fd0ef          	jal	ra,21dc <memmove>
    4848:	4682                	lw	a3,0(sp)
    484a:	5082                	lw	ra,32(sp)
    484c:	4472                	lw	s0,28(sp)
    484e:	44e2                	lw	s1,24(sp)
    4850:	8536                	mv	a0,a3
    4852:	02410113          	addi	sp,sp,36
    4856:	8082                	ret
    4858:	4682                	lw	a3,0(sp)
    485a:	863a                	mv	a2,a4
    485c:	8516                	mv	a0,t0
    485e:	859a                	mv	a1,t1
    4860:	ca3a                	sw	a4,20(sp)
    4862:	c816                	sw	t0,16(sp)
    4864:	c61a                	sw	t1,12(sp)
    4866:	cf7fb0ef          	jal	ra,55c <__umoddi3>
    486a:	03050513          	addi	a0,a0,48
    486e:	0ff57513          	andi	a0,a0,255
    4872:	03900793          	li	a5,57
    4876:	14fd                	addi	s1,s1,-1
    4878:	4332                	lw	t1,12(sp)
    487a:	42c2                	lw	t0,16(sp)
    487c:	4752                	lw	a4,20(sp)
    487e:	00a7ef63          	bltu	a5,a0,489c <__lltostr+0xc6>
    4882:	4682                	lw	a3,0(sp)
    4884:	00a48023          	sb	a0,0(s1)
    4888:	863a                	mv	a2,a4
    488a:	8516                	mv	a0,t0
    488c:	859a                	mv	a1,t1
    488e:	c63a                	sw	a4,12(sp)
    4890:	965fb0ef          	jal	ra,1f4 <__udivdi3>
    4894:	82aa                	mv	t0,a0
    4896:	832e                	mv	t1,a1
    4898:	4732                	lw	a4,12(sp)
    489a:	bf41                	j	482a <__lltostr+0x54>
    489c:	4792                	lw	a5,4(sp)
    489e:	953e                	add	a0,a0,a5
    48a0:	b7cd                	j	4882 <__lltostr+0xac>

000048a2 <printf>:
    48a2:	fdc10113          	addi	sp,sp,-36
    48a6:	c82e                	sw	a1,16(sp)
    48a8:	080c                	addi	a1,sp,16
    48aa:	c606                	sw	ra,12(sp)
    48ac:	ca32                	sw	a2,20(sp)
    48ae:	cc36                	sw	a3,24(sp)
    48b0:	ce3a                	sw	a4,28(sp)
    48b2:	d03e                	sw	a5,32(sp)
    48b4:	c02e                	sw	a1,0(sp)
    48b6:	2099                	jal	48fc <vprintf>
    48b8:	40b2                	lw	ra,12(sp)
    48ba:	02410113          	addi	sp,sp,36
    48be:	8082                	ret

000048c0 <putc>:
    48c0:	d3cff06f          	j	3dfc <fputc>

000048c4 <__stdio_outs>:
    48c4:	1151                	addi	sp,sp,-12
    48c6:	c222                	sw	s0,4(sp)
    48c8:	c026                	sw	s1,0(sp)
    48ca:	842a                	mv	s0,a0
    48cc:	84ae                	mv	s1,a1
    48ce:	c406                	sw	ra,8(sp)
    48d0:	94a2                	add	s1,s1,s0
    48d2:	d64ff0ef          	jal	ra,3e36 <os_critical_enter>
    48d6:	00941a63          	bne	s0,s1,48ea <__stdio_outs+0x26>
    48da:	d60ff0ef          	jal	ra,3e3a <os_critical_exit>
    48de:	40a2                	lw	ra,8(sp)
    48e0:	4412                	lw	s0,4(sp)
    48e2:	4482                	lw	s1,0(sp)
    48e4:	4505                	li	a0,1
    48e6:	0131                	addi	sp,sp,12
    48e8:	8082                	ret
    48ea:	a641a703          	lw	a4,-1436(gp) # 200000c0 <_impure_ptr>
    48ee:	00044503          	lbu	a0,0(s0)
    48f2:	0405                	addi	s0,s0,1
    48f4:	470c                	lw	a1,8(a4)
    48f6:	d06ff0ef          	jal	ra,3dfc <fputc>
    48fa:	bff1                	j	48d6 <__stdio_outs+0x12>

000048fc <vprintf>:
    48fc:	1131                	addi	sp,sp,-20
    48fe:	000057b7          	lui	a5,0x5
    4902:	8c478793          	addi	a5,a5,-1852 # 48c4 <__stdio_outs>
    4906:	862e                	mv	a2,a1
    4908:	85aa                	mv	a1,a0
    490a:	850a                	mv	a0,sp
    490c:	c806                	sw	ra,16(sp)
    490e:	c002                	sw	zero,0(sp)
    4910:	c23e                	sw	a5,4(sp)
    4912:	2291                	jal	4a56 <__v_printf>
    4914:	40c2                	lw	ra,16(sp)
    4916:	0151                	addi	sp,sp,20
    4918:	8082                	ret

0000491a <__isnan>:
    491a:	fff80737          	lui	a4,0xfff80
    491e:	177d                	addi	a4,a4,-1
    4920:	8f6d                	and	a4,a4,a1
    4922:	e509                	bnez	a0,492c <__isnan+0x12>
    4924:	7ff007b7          	lui	a5,0x7ff00
    4928:	00f70963          	beq	a4,a5,493a <__isnan+0x20>
    492c:	fff807b7          	lui	a5,0xfff80
    4930:	8fad                	xor	a5,a5,a1
    4932:	8fc9                	or	a5,a5,a0
    4934:	0017b513          	seqz	a0,a5
    4938:	8082                	ret
    493a:	4505                	li	a0,1
    493c:	8082                	ret

0000493e <__ltostr>:
    493e:	1151                	addi	sp,sp,-12
    4940:	15fd                	addi	a1,a1,-1
    4942:	c406                	sw	ra,8(sp)
    4944:	c222                	sw	s0,4(sp)
    4946:	95aa                	add	a1,a1,a0
    4948:	00058023          	sb	zero,0(a1)
    494c:	fff68313          	addi	t1,a3,-1
    4950:	02300793          	li	a5,35
    4954:	0067f363          	bgeu	a5,t1,495a <__ltostr+0x1c>
    4958:	46a9                	li	a3,10
    495a:	4781                	li	a5,0
    495c:	e619                	bnez	a2,496a <__ltostr+0x2c>
    495e:	03000793          	li	a5,48
    4962:	fef58fa3          	sb	a5,-1(a1)
    4966:	15fd                	addi	a1,a1,-1
    4968:	4785                	li	a5,1
    496a:	02700313          	li	t1,39
    496e:	c311                	beqz	a4,4972 <__ltostr+0x34>
    4970:	431d                	li	t1,7
    4972:	0ff37713          	andi	a4,t1,255
    4976:	03900293          	li	t0,57
    497a:	00f58333          	add	t1,a1,a5
    497e:	40b30433          	sub	s0,t1,a1
    4982:	00b57363          	bgeu	a0,a1,4988 <__ltostr+0x4a>
    4986:	ea11                	bnez	a2,499a <__ltostr+0x5c>
    4988:	00140613          	addi	a2,s0,1
    498c:	851fd0ef          	jal	ra,21dc <memmove>
    4990:	8522                	mv	a0,s0
    4992:	40a2                	lw	ra,8(sp)
    4994:	4412                	lw	s0,4(sp)
    4996:	0131                	addi	sp,sp,12
    4998:	8082                	ret
    499a:	02d677b3          	remu	a5,a2,a3
    499e:	15fd                	addi	a1,a1,-1
    49a0:	03078793          	addi	a5,a5,48 # fff80030 <__heap_end+0xdff50030>
    49a4:	0ff7f793          	andi	a5,a5,255
    49a8:	00f2e763          	bltu	t0,a5,49b6 <__ltostr+0x78>
    49ac:	00f58023          	sb	a5,0(a1)
    49b0:	02d65633          	divu	a2,a2,a3
    49b4:	b7e9                	j	497e <__ltostr+0x40>
    49b6:	97ba                	add	a5,a5,a4
    49b8:	bfd5                	j	49ac <__ltostr+0x6e>

000049ba <putchar>:
    49ba:	a641a783          	lw	a5,-1436(gp) # 200000c0 <_impure_ptr>
    49be:	1151                	addi	sp,sp,-12
    49c0:	c406                	sw	ra,8(sp)
    49c2:	478c                	lw	a1,8(a5)
    49c4:	3df5                	jal	48c0 <putc>
    49c6:	40a2                	lw	ra,8(sp)
    49c8:	4501                	li	a0,0
    49ca:	0131                	addi	sp,sp,12
    49cc:	8082                	ret

000049ce <puts>:
    49ce:	1151                	addi	sp,sp,-12
    49d0:	c222                	sw	s0,4(sp)
    49d2:	c406                	sw	ra,8(sp)
    49d4:	842a                	mv	s0,a0
    49d6:	00044503          	lbu	a0,0(s0)
    49da:	55fd                	li	a1,-1
    49dc:	e909                	bnez	a0,49ee <puts+0x20>
    49de:	4529                	li	a0,10
    49e0:	c1cff0ef          	jal	ra,3dfc <fputc>
    49e4:	40a2                	lw	ra,8(sp)
    49e6:	4412                	lw	s0,4(sp)
    49e8:	4501                	li	a0,0
    49ea:	0131                	addi	sp,sp,12
    49ec:	8082                	ret
    49ee:	c0eff0ef          	jal	ra,3dfc <fputc>
    49f2:	0405                	addi	s0,s0,1
    49f4:	b7cd                	j	49d6 <puts+0x8>

000049f6 <write_pad>:
    49f6:	1131                	addi	sp,sp,-20
    49f8:	fd060613          	addi	a2,a2,-48
    49fc:	c426                	sw	s1,8(sp)
    49fe:	00163613          	seqz	a2,a2
    4a02:	6499                	lui	s1,0x6
    4a04:	0612                	slli	a2,a2,0x4
    4a06:	99848493          	addi	s1,s1,-1640 # 5998 <pad_line>
    4a0a:	c622                	sw	s0,12(sp)
    4a0c:	c806                	sw	ra,16(sp)
    4a0e:	87aa                	mv	a5,a0
    4a10:	872e                	mv	a4,a1
    4a12:	94b2                	add	s1,s1,a2
    4a14:	842e                	mv	s0,a1
    4a16:	463d                	li	a2,15
    4a18:	408706b3          	sub	a3,a4,s0
    4a1c:	02864263          	blt	a2,s0,4a40 <write_pad+0x4a>
    4a20:	00805a63          	blez	s0,4a34 <write_pad+0x3e>
    4a24:	43d8                	lw	a4,4(a5)
    4a26:	4390                	lw	a2,0(a5)
    4a28:	85a2                	mv	a1,s0
    4a2a:	8526                	mv	a0,s1
    4a2c:	c036                	sw	a3,0(sp)
    4a2e:	9702                	jalr	a4
    4a30:	4682                	lw	a3,0(sp)
    4a32:	96a2                	add	a3,a3,s0
    4a34:	40c2                	lw	ra,16(sp)
    4a36:	4432                	lw	s0,12(sp)
    4a38:	44a2                	lw	s1,8(sp)
    4a3a:	8536                	mv	a0,a3
    4a3c:	0151                	addi	sp,sp,20
    4a3e:	8082                	ret
    4a40:	43d4                	lw	a3,4(a5)
    4a42:	4390                	lw	a2,0(a5)
    4a44:	45c1                	li	a1,16
    4a46:	8526                	mv	a0,s1
    4a48:	c23a                	sw	a4,4(sp)
    4a4a:	c03e                	sw	a5,0(sp)
    4a4c:	9682                	jalr	a3
    4a4e:	1441                	addi	s0,s0,-16
    4a50:	4712                	lw	a4,4(sp)
    4a52:	4782                	lw	a5,0(sp)
    4a54:	b7c9                	j	4a16 <write_pad+0x20>

00004a56 <__v_printf>:
    4a56:	200027b7          	lui	a5,0x20002
    4a5a:	f8c7a783          	lw	a5,-116(a5) # 20001f8c <errno>
    4a5e:	f2810113          	addi	sp,sp,-216
    4a62:	c9a2                	sw	s0,208(sp)
    4a64:	c7a6                	sw	s1,204(sp)
    4a66:	cb86                	sw	ra,212(sp)
    4a68:	84aa                	mv	s1,a0
    4a6a:	c82e                	sw	a1,16(sp)
    4a6c:	8432                	mv	s0,a2
    4a6e:	d83e                	sw	a5,48(sp)
    4a70:	c202                	sw	zero,4(sp)
    4a72:	47c2                	lw	a5,16(sp)
    4a74:	0007c783          	lbu	a5,0(a5)
    4a78:	68078163          	beqz	a5,50fa <__v_printf+0x6a4>
    4a7c:	4701                	li	a4,0
    4a7e:	02500613          	li	a2,37
    4a82:	a011                	j	4a86 <__v_printf+0x30>
    4a84:	0705                	addi	a4,a4,1
    4a86:	47c2                	lw	a5,16(sp)
    4a88:	97ba                	add	a5,a5,a4
    4a8a:	0007c683          	lbu	a3,0(a5)
    4a8e:	74068963          	beqz	a3,51e0 <__v_printf+0x78a>
    4a92:	fec699e3          	bne	a3,a2,4a84 <__v_printf+0x2e>
    4a96:	e319                	bnez	a4,4a9c <__v_printf+0x46>
    4a98:	47c2                	lw	a5,16(sp)
    4a9a:	a01d                	j	4ac0 <__v_printf+0x6a>
    4a9c:	40d4                	lw	a3,4(s1)
    4a9e:	4090                	lw	a2,0(s1)
    4aa0:	4542                	lw	a0,16(sp)
    4aa2:	85ba                	mv	a1,a4
    4aa4:	c43e                	sw	a5,8(sp)
    4aa6:	c03a                	sw	a4,0(sp)
    4aa8:	9682                	jalr	a3
    4aaa:	4792                	lw	a5,4(sp)
    4aac:	4702                	lw	a4,0(sp)
    4aae:	97ba                	add	a5,a5,a4
    4ab0:	c23e                	sw	a5,4(sp)
    4ab2:	47a2                	lw	a5,8(sp)
    4ab4:	02500713          	li	a4,37
    4ab8:	0007c683          	lbu	a3,0(a5)
    4abc:	72e69563          	bne	a3,a4,51e6 <__v_printf+0x790>
    4ac0:	00178513          	addi	a0,a5,1
    4ac4:	02000793          	li	a5,32
    4ac8:	c002                	sw	zero,0(sp)
    4aca:	c602                	sw	zero,12(sp)
    4acc:	4701                	li	a4,0
    4ace:	ca02                	sw	zero,20(sp)
    4ad0:	ce02                	sw	zero,28(sp)
    4ad2:	d602                	sw	zero,44(sp)
    4ad4:	d002                	sw	zero,32(sp)
    4ad6:	c402                	sw	zero,8(sp)
    4ad8:	cc3e                	sw	a5,24(sp)
    4ada:	00054303          	lbu	t1,0(a0)
    4ade:	00150793          	addi	a5,a0,1
    4ae2:	c83e                	sw	a5,16(sp)
    4ae4:	046103a3          	sb	t1,71(sp)
    4ae8:	06300793          	li	a5,99
    4aec:	1cf30963          	beq	t1,a5,4cbe <__v_printf+0x268>
    4af0:	0c67e863          	bltu	a5,t1,4bc0 <__v_printf+0x16a>
    4af4:	02d00793          	li	a5,45
    4af8:	02f30363          	beq	t1,a5,4b1e <__v_printf+0xc8>
    4afc:	0667e263          	bltu	a5,t1,4b60 <__v_printf+0x10a>
    4b00:	02300793          	li	a5,35
    4b04:	02f30163          	beq	t1,a5,4b26 <__v_printf+0xd0>
    4b08:	0267e663          	bltu	a5,t1,4b34 <__v_printf+0xde>
    4b0c:	5e030563          	beqz	t1,50f6 <__v_printf+0x6a0>
    4b10:	02000793          	li	a5,32
    4b14:	f4f31fe3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4b18:	4785                	li	a5,1
    4b1a:	d63e                	sw	a5,44(sp)
    4b1c:	a019                	j	4b22 <__v_printf+0xcc>
    4b1e:	4785                	li	a5,1
    4b20:	d03e                	sw	a5,32(sp)
    4b22:	4542                	lw	a0,16(sp)
    4b24:	bf5d                	j	4ada <__v_printf+0x84>
    4b26:	0ff00793          	li	a5,255
    4b2a:	c43e                	sw	a5,8(sp)
    4b2c:	bfdd                	j	4b22 <__v_printf+0xcc>
    4b2e:	4785                	li	a5,1
    4b30:	ce3e                	sw	a5,28(sp)
    4b32:	bfc5                	j	4b22 <__v_printf+0xcc>
    4b34:	02a00793          	li	a5,42
    4b38:	16f30163          	beq	t1,a5,4c9a <__v_printf+0x244>
    4b3c:	02b00793          	li	a5,43
    4b40:	fef307e3          	beq	t1,a5,4b2e <__v_printf+0xd8>
    4b44:	02500793          	li	a5,37
    4b48:	f2f315e3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4b4c:	40dc                	lw	a5,4(s1)
    4b4e:	4090                	lw	a2,0(s1)
    4b50:	4585                	li	a1,1
    4b52:	04710513          	addi	a0,sp,71
    4b56:	9782                	jalr	a5
    4b58:	4792                	lw	a5,4(sp)
    4b5a:	0785                	addi	a5,a5,1
    4b5c:	c23e                	sw	a5,4(sp)
    4b5e:	bf11                	j	4a72 <__v_printf+0x1c>
    4b60:	03900793          	li	a5,57
    4b64:	0267ee63          	bltu	a5,t1,4ba0 <__v_printf+0x14a>
    4b68:	03000793          	li	a5,48
    4b6c:	0ef37f63          	bgeu	t1,a5,4c6a <__v_printf+0x214>
    4b70:	02e00793          	li	a5,46
    4b74:	eef31fe3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4b78:	00154683          	lbu	a3,1(a0)
    4b7c:	02a00793          	li	a5,42
    4b80:	12f69163          	bne	a3,a5,4ca2 <__v_printf+0x24c>
    4b84:	4014                	lw	a3,0(s0)
    4b86:	00440793          	addi	a5,s0,4
    4b8a:	c036                	sw	a3,0(sp)
    4b8c:	0006d363          	bgez	a3,4b92 <__v_printf+0x13c>
    4b90:	c002                	sw	zero,0(sp)
    4b92:	00250693          	addi	a3,a0,2
    4b96:	c836                	sw	a3,16(sp)
    4b98:	843e                	mv	s0,a5
    4b9a:	4785                	li	a5,1
    4b9c:	ca3e                	sw	a5,20(sp)
    4b9e:	b751                	j	4b22 <__v_printf+0xcc>
    4ba0:	05800793          	li	a5,88
    4ba4:	2af30363          	beq	t1,a5,4e4a <__v_printf+0x3f4>
    4ba8:	06200793          	li	a5,98
    4bac:	36f30463          	beq	t1,a5,4f14 <__v_printf+0x4be>
    4bb0:	04c00793          	li	a5,76
    4bb4:	eaf31fe3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4bb8:	0705                	addi	a4,a4,1
    4bba:	0762                	slli	a4,a4,0x18
    4bbc:	8761                	srai	a4,a4,0x18
    4bbe:	a091                	j	4c02 <__v_printf+0x1ac>
    4bc0:	06d00793          	li	a5,109
    4bc4:	10f30263          	beq	t1,a5,4cc8 <__v_printf+0x272>
    4bc8:	0267ef63          	bltu	a5,t1,4c06 <__v_printf+0x1b0>
    4bcc:	06700793          	li	a5,103
    4bd0:	0067ef63          	bltu	a5,t1,4bee <__v_printf+0x198>
    4bd4:	06600793          	li	a5,102
    4bd8:	3ef37363          	bgeu	t1,a5,4fbe <__v_printf+0x568>
    4bdc:	06400793          	li	a5,100
    4be0:	e8f319e3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4be4:	4529                	li	a0,10
    4be6:	4781                	li	a5,0
    4be8:	4285                	li	t0,1
    4bea:	4301                	li	t1,0
    4bec:	ac51                	j	4e80 <__v_printf+0x42a>
    4bee:	06900793          	li	a5,105
    4bf2:	fef309e3          	beq	t1,a5,4be4 <__v_printf+0x18e>
    4bf6:	06f36663          	bltu	t1,a5,4c62 <__v_printf+0x20c>
    4bfa:	06c00793          	li	a5,108
    4bfe:	e6f31ae3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4c02:	0705                	addi	a4,a4,1
    4c04:	a085                	j	4c64 <__v_printf+0x20e>
    4c06:	07300793          	li	a5,115
    4c0a:	0ef30163          	beq	t1,a5,4cec <__v_printf+0x296>
    4c0e:	0267ec63          	bltu	a5,t1,4c46 <__v_printf+0x1f0>
    4c12:	07000793          	li	a5,112
    4c16:	22f30363          	beq	t1,a5,4e3c <__v_printf+0x3e6>
    4c1a:	07100793          	li	a5,113
    4c1e:	f8f30de3          	beq	t1,a5,4bb8 <__v_printf+0x162>
    4c22:	06f00793          	li	a5,111
    4c26:	e4f316e3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4c2a:	47a2                	lw	a5,8(sp)
    4c2c:	2e078863          	beqz	a5,4f1c <__v_printf+0x4c6>
    4c30:	03000793          	li	a5,48
    4c34:	04f106a3          	sb	a5,77(sp)
    4c38:	4785                	li	a5,1
    4c3a:	c43e                	sw	a5,8(sp)
    4c3c:	4521                	li	a0,8
    4c3e:	4781                	li	a5,0
    4c40:	4281                	li	t0,0
    4c42:	4305                	li	t1,1
    4c44:	ac35                	j	4e80 <__v_printf+0x42a>
    4c46:	07800793          	li	a5,120
    4c4a:	2cf30363          	beq	t1,a5,4f10 <__v_printf+0x4ba>
    4c4e:	07a00793          	li	a5,122
    4c52:	ecf308e3          	beq	t1,a5,4b22 <__v_printf+0xcc>
    4c56:	07500793          	li	a5,117
    4c5a:	e0f31ce3          	bne	t1,a5,4a72 <__v_printf+0x1c>
    4c5e:	4529                	li	a0,10
    4c60:	ac5d                	j	4f16 <__v_printf+0x4c0>
    4c62:	177d                	addi	a4,a4,-1
    4c64:	0762                	slli	a4,a4,0x18
    4c66:	8761                	srai	a4,a4,0x18
    4c68:	bd6d                	j	4b22 <__v_printf+0xcc>
    4c6a:	47d2                	lw	a5,20(sp)
    4c6c:	c83a                	sw	a4,16(sp)
    4c6e:	48079463          	bnez	a5,50f6 <__v_printf+0x6a0>
    4c72:	4629                	li	a2,10
    4c74:	00ac                	addi	a1,sp,72
    4c76:	cebfd0ef          	jal	ra,2960 <strtoul>
    4c7a:	04714683          	lbu	a3,71(sp)
    4c7e:	c62a                	sw	a0,12(sp)
    4c80:	03000793          	li	a5,48
    4c84:	4742                	lw	a4,16(sp)
    4c86:	00f69763          	bne	a3,a5,4c94 <__v_printf+0x23e>
    4c8a:	5782                	lw	a5,32(sp)
    4c8c:	e781                	bnez	a5,4c94 <__v_printf+0x23e>
    4c8e:	03000793          	li	a5,48
    4c92:	cc3e                	sw	a5,24(sp)
    4c94:	47a6                	lw	a5,72(sp)
    4c96:	c83e                	sw	a5,16(sp)
    4c98:	b569                	j	4b22 <__v_printf+0xcc>
    4c9a:	401c                	lw	a5,0(s0)
    4c9c:	0411                	addi	s0,s0,4
    4c9e:	c63e                	sw	a5,12(sp)
    4ca0:	b549                	j	4b22 <__v_printf+0xcc>
    4ca2:	4542                	lw	a0,16(sp)
    4ca4:	4629                	li	a2,10
    4ca6:	00ac                	addi	a1,sp,72
    4ca8:	ca3a                	sw	a4,20(sp)
    4caa:	b47fd0ef          	jal	ra,27f0 <strtol>
    4cae:	c02a                	sw	a0,0(sp)
    4cb0:	4752                	lw	a4,20(sp)
    4cb2:	00055363          	bgez	a0,4cb8 <__v_printf+0x262>
    4cb6:	c002                	sw	zero,0(sp)
    4cb8:	47a6                	lw	a5,72(sp)
    4cba:	c83e                	sw	a5,16(sp)
    4cbc:	bdf9                	j	4b9a <__v_printf+0x144>
    4cbe:	401c                	lw	a5,0(s0)
    4cc0:	0411                	addi	s0,s0,4
    4cc2:	04f103a3          	sb	a5,71(sp)
    4cc6:	b559                	j	4b4c <__v_printf+0xf6>
    4cc8:	5542                	lw	a0,48(sp)
    4cca:	993fd0ef          	jal	ra,265c <strerror>
    4cce:	c4aa                	sw	a0,72(sp)
    4cd0:	c42a                	sw	a0,8(sp)
    4cd2:	9a7fd0ef          	jal	ra,2678 <strlen>
    4cd6:	4722                	lw	a4,8(sp)
    4cd8:	40d4                	lw	a3,4(s1)
    4cda:	4090                	lw	a2,0(s1)
    4cdc:	85aa                	mv	a1,a0
    4cde:	c02a                	sw	a0,0(sp)
    4ce0:	853a                	mv	a0,a4
    4ce2:	9682                	jalr	a3
    4ce4:	4712                	lw	a4,4(sp)
    4ce6:	4782                	lw	a5,0(sp)
    4ce8:	97ba                	add	a5,a5,a4
    4cea:	bd8d                	j	4b5c <__v_printf+0x106>
    4cec:	4018                	lw	a4,0(s0)
    4cee:	00440793          	addi	a5,s0,4
    4cf2:	c721                	beqz	a4,4d3a <__v_printf+0x2e4>
    4cf4:	c4ba                	sw	a4,72(sp)
    4cf6:	4526                	lw	a0,72(sp)
    4cf8:	cc3e                	sw	a5,24(sp)
    4cfa:	97ffd0ef          	jal	ra,2678 <strlen>
    4cfe:	4752                	lw	a4,20(sp)
    4d00:	832a                	mv	t1,a0
    4d02:	47e2                	lw	a5,24(sp)
    4d04:	c321                	beqz	a4,4d44 <__v_printf+0x2ee>
    4d06:	4702                	lw	a4,0(sp)
    4d08:	00a77363          	bgeu	a4,a0,4d0e <__v_printf+0x2b8>
    4d0c:	833a                	mv	t1,a4
    4d0e:	843e                	mv	s0,a5
    4d10:	c002                	sw	zero,0(sp)
    4d12:	ca02                	sw	zero,20(sp)
    4d14:	4281                	li	t0,0
    4d16:	02000793          	li	a5,32
    4d1a:	cc3e                	sw	a5,24(sp)
    4d1c:	47b2                	lw	a5,12(sp)
    4d1e:	4702                	lw	a4,0(sp)
    4d20:	46a6                	lw	a3,72(sp)
    4d22:	8fd9                	or	a5,a5,a4
    4d24:	e785                	bnez	a5,4d4c <__v_printf+0x2f6>
    4d26:	40dc                	lw	a5,4(s1)
    4d28:	4090                	lw	a2,0(s1)
    4d2a:	859a                	mv	a1,t1
    4d2c:	8536                	mv	a0,a3
    4d2e:	c01a                	sw	t1,0(sp)
    4d30:	9782                	jalr	a5
    4d32:	4792                	lw	a5,4(sp)
    4d34:	4302                	lw	t1,0(sp)
    4d36:	979a                	add	a5,a5,t1
    4d38:	b515                	j	4b5c <__v_printf+0x106>
    4d3a:	00006737          	lui	a4,0x6
    4d3e:	99070713          	addi	a4,a4,-1648 # 5990 <sg_usi_config+0x1c8>
    4d42:	bf4d                	j	4cf4 <__v_printf+0x29e>
    4d44:	843e                	mv	s0,a5
    4d46:	4281                	li	t0,0
    4d48:	c002                	sw	zero,0(sp)
    4d4a:	b7f1                	j	4d16 <__v_printf+0x2c0>
    4d4c:	44029163          	bnez	t0,518e <__v_printf+0x738>
    4d50:	47a2                	lw	a5,8(sp)
    4d52:	3a078b63          	beqz	a5,5108 <__v_printf+0x6b2>
    4d56:	47a2                	lw	a5,8(sp)
    4d58:	00f68733          	add	a4,a3,a5
    4d5c:	c4ba                	sw	a4,72(sp)
    4d5e:	4732                	lw	a4,12(sp)
    4d60:	40f30333          	sub	t1,t1,a5
    4d64:	8f1d                	sub	a4,a4,a5
    4d66:	c63a                	sw	a4,12(sp)
    4d68:	5702                	lw	a4,32(sp)
    4d6a:	3a070363          	beqz	a4,5110 <__v_printf+0x6ba>
    4d6e:	40d8                	lw	a4,4(s1)
    4d70:	4090                	lw	a2,0(s1)
    4d72:	85be                	mv	a1,a5
    4d74:	8536                	mv	a0,a3
    4d76:	ca1a                	sw	t1,20(sp)
    4d78:	c43e                	sw	a5,8(sp)
    4d7a:	9702                	jalr	a4
    4d7c:	4712                	lw	a4,4(sp)
    4d7e:	47a2                	lw	a5,8(sp)
    4d80:	4352                	lw	t1,20(sp)
    4d82:	97ba                	add	a5,a5,a4
    4d84:	c23e                	sw	a5,4(sp)
    4d86:	4782                	lw	a5,0(sp)
    4d88:	03000613          	li	a2,48
    4d8c:	8526                	mv	a0,s1
    4d8e:	406785b3          	sub	a1,a5,t1
    4d92:	ca1a                	sw	t1,20(sp)
    4d94:	c63ff0ef          	jal	ra,49f6 <write_pad>
    4d98:	4792                	lw	a5,4(sp)
    4d9a:	4352                	lw	t1,20(sp)
    4d9c:	40d8                	lw	a4,4(s1)
    4d9e:	97aa                	add	a5,a5,a0
    4da0:	4090                	lw	a2,0(s1)
    4da2:	4526                	lw	a0,72(sp)
    4da4:	859a                	mv	a1,t1
    4da6:	c43e                	sw	a5,8(sp)
    4da8:	c21a                	sw	t1,4(sp)
    4daa:	9702                	jalr	a4
    4dac:	4312                	lw	t1,4(sp)
    4dae:	47a2                	lw	a5,8(sp)
    4db0:	4582                	lw	a1,0(sp)
    4db2:	979a                	add	a5,a5,t1
    4db4:	0065f363          	bgeu	a1,t1,4dba <__v_printf+0x364>
    4db8:	859a                	mv	a1,t1
    4dba:	c03e                	sw	a5,0(sp)
    4dbc:	47b2                	lw	a5,12(sp)
    4dbe:	02000613          	li	a2,32
    4dc2:	8526                	mv	a0,s1
    4dc4:	40b785b3          	sub	a1,a5,a1
    4dc8:	c2fff0ef          	jal	ra,49f6 <write_pad>
    4dcc:	4782                	lw	a5,0(sp)
    4dce:	97aa                	add	a5,a5,a0
    4dd0:	b371                	j	4b5c <__v_printf+0x106>
    4dd2:	c78d                	beqz	a5,4dfc <__v_printf+0x3a6>
    4dd4:	4662                	lw	a2,24(sp)
    4dd6:	03000713          	li	a4,48
    4dda:	02e61163          	bne	a2,a4,4dfc <__v_printf+0x3a6>
    4dde:	40d8                	lw	a4,4(s1)
    4de0:	4090                	lw	a2,0(s1)
    4de2:	85be                	mv	a1,a5
    4de4:	8536                	mv	a0,a3
    4de6:	ca1a                	sw	t1,20(sp)
    4de8:	c43e                	sw	a5,8(sp)
    4dea:	c036                	sw	a3,0(sp)
    4dec:	9702                	jalr	a4
    4dee:	4712                	lw	a4,4(sp)
    4df0:	47a2                	lw	a5,8(sp)
    4df2:	4352                	lw	t1,20(sp)
    4df4:	4682                	lw	a3,0(sp)
    4df6:	97ba                	add	a5,a5,a4
    4df8:	c23e                	sw	a5,4(sp)
    4dfa:	4781                	li	a5,0
    4dfc:	c43e                	sw	a5,8(sp)
    4dfe:	47b2                	lw	a5,12(sp)
    4e00:	4662                	lw	a2,24(sp)
    4e02:	8526                	mv	a0,s1
    4e04:	406785b3          	sub	a1,a5,t1
    4e08:	c01a                	sw	t1,0(sp)
    4e0a:	ca36                	sw	a3,20(sp)
    4e0c:	bebff0ef          	jal	ra,49f6 <write_pad>
    4e10:	4792                	lw	a5,4(sp)
    4e12:	4302                	lw	t1,0(sp)
    4e14:	00a78733          	add	a4,a5,a0
    4e18:	47a2                	lw	a5,8(sp)
    4e1a:	34078e63          	beqz	a5,5176 <__v_printf+0x720>
    4e1e:	46d2                	lw	a3,20(sp)
    4e20:	0044a383          	lw	t2,4(s1)
    4e24:	4090                	lw	a2,0(s1)
    4e26:	85be                	mv	a1,a5
    4e28:	8536                	mv	a0,a3
    4e2a:	c41a                	sw	t1,8(sp)
    4e2c:	c23a                	sw	a4,4(sp)
    4e2e:	c03e                	sw	a5,0(sp)
    4e30:	9382                	jalr	t2
    4e32:	4782                	lw	a5,0(sp)
    4e34:	4712                	lw	a4,4(sp)
    4e36:	4322                	lw	t1,8(sp)
    4e38:	973e                	add	a4,a4,a5
    4e3a:	ae35                	j	5176 <__v_printf+0x720>
    4e3c:	07800793          	li	a5,120
    4e40:	04f103a3          	sb	a5,71(sp)
    4e44:	4789                	li	a5,2
    4e46:	4705                	li	a4,1
    4e48:	c43e                	sw	a5,8(sp)
    4e4a:	04714783          	lbu	a5,71(sp)
    4e4e:	fa878793          	addi	a5,a5,-88
    4e52:	0017b793          	seqz	a5,a5
    4e56:	46a2                	lw	a3,8(sp)
    4e58:	4301                	li	t1,0
    4e5a:	ce81                	beqz	a3,4e72 <__v_printf+0x41c>
    4e5c:	03000693          	li	a3,48
    4e60:	04d106a3          	sb	a3,77(sp)
    4e64:	04714683          	lbu	a3,71(sp)
    4e68:	4309                	li	t1,2
    4e6a:	04d10723          	sb	a3,78(sp)
    4e6e:	4689                	li	a3,2
    4e70:	c436                	sw	a3,8(sp)
    4e72:	46b2                	lw	a3,12(sp)
    4e74:	4602                	lw	a2,0(sp)
    4e76:	00c6f363          	bgeu	a3,a2,4e7c <__v_printf+0x426>
    4e7a:	c632                	sw	a2,12(sp)
    4e7c:	4541                	li	a0,16
    4e7e:	4281                	li	t0,0
    4e80:	04d10693          	addi	a3,sp,77
    4e84:	c4b6                	sw	a3,72(sp)
    4e86:	0ae05a63          	blez	a4,4f3a <__v_printf+0x4e4>
    4e8a:	4685                	li	a3,1
    4e8c:	08d70c63          	beq	a4,a3,4f24 <__v_printf+0x4ce>
    4e90:	00840393          	addi	t2,s0,8
    4e94:	4010                	lw	a2,0(s0)
    4e96:	4054                	lw	a3,4(s0)
    4e98:	4581                	li	a1,0
    4e9a:	08028c63          	beqz	t0,4f32 <__v_printf+0x4dc>
    4e9e:	0006da63          	bgez	a3,4eb2 <__v_printf+0x45c>
    4ea2:	40c00633          	neg	a2,a2
    4ea6:	00c03733          	snez	a4,a2
    4eaa:	40d006b3          	neg	a3,a3
    4eae:	8e99                	sub	a3,a3,a4
    4eb0:	4289                	li	t0,2
    4eb2:	872a                	mv	a4,a0
    4eb4:	04d10513          	addi	a0,sp,77
    4eb8:	951a                	add	a0,a0,t1
    4eba:	07b00593          	li	a1,123
    4ebe:	da1e                	sw	t2,52(sp)
    4ec0:	d416                	sw	t0,40(sp)
    4ec2:	d21a                	sw	t1,36(sp)
    4ec4:	913ff0ef          	jal	ra,47d6 <__lltostr>
    4ec8:	53d2                	lw	t2,52(sp)
    4eca:	5312                	lw	t1,36(sp)
    4ecc:	52a2                	lw	t0,40(sp)
    4ece:	841e                	mv	s0,t2
    4ed0:	4752                	lw	a4,20(sp)
    4ed2:	47a6                	lw	a5,72(sp)
    4ed4:	cb5d                	beqz	a4,4f8a <__v_printf+0x534>
    4ed6:	4705                	li	a4,1
    4ed8:	0ae51963          	bne	a0,a4,4f8a <__v_printf+0x534>
    4edc:	00678733          	add	a4,a5,t1
    4ee0:	00074683          	lbu	a3,0(a4)
    4ee4:	03000713          	li	a4,48
    4ee8:	0ae69163          	bne	a3,a4,4f8a <__v_printf+0x534>
    4eec:	4702                	lw	a4,0(sp)
    4eee:	c345                	beqz	a4,4f8e <__v_printf+0x538>
    4ef0:	4722                	lw	a4,8(sp)
    4ef2:	c319                	beqz	a4,4ef8 <__v_printf+0x4a2>
    4ef4:	c402                	sw	zero,8(sp)
    4ef6:	4301                	li	t1,0
    4ef8:	4709                	li	a4,2
    4efa:	08e29d63          	bne	t0,a4,4f94 <__v_printf+0x53e>
    4efe:	fff78713          	addi	a4,a5,-1
    4f02:	c4ba                	sw	a4,72(sp)
    4f04:	02d00713          	li	a4,45
    4f08:	fee78fa3          	sb	a4,-1(a5)
    4f0c:	0305                	addi	t1,t1,1
    4f0e:	b539                	j	4d1c <__v_printf+0x2c6>
    4f10:	4781                	li	a5,0
    4f12:	b791                	j	4e56 <__v_printf+0x400>
    4f14:	4509                	li	a0,2
    4f16:	4781                	li	a5,0
    4f18:	4281                	li	t0,0
    4f1a:	b9c1                	j	4bea <__v_printf+0x194>
    4f1c:	4781                	li	a5,0
    4f1e:	4281                	li	t0,0
    4f20:	4521                	li	a0,8
    4f22:	b1e1                	j	4bea <__v_printf+0x194>
    4f24:	00440393          	addi	t2,s0,4
    4f28:	400c                	lw	a1,0(s0)
    4f2a:	00029d63          	bnez	t0,4f44 <__v_printf+0x4ee>
    4f2e:	4601                	li	a2,0
    4f30:	4681                	li	a3,0
    4f32:	4405                	li	s0,1
    4f34:	f6e44fe3          	blt	s0,a4,4eb2 <__v_printf+0x45c>
    4f38:	a01d                	j	4f5e <__v_printf+0x508>
    4f3a:	00440393          	addi	t2,s0,4
    4f3e:	400c                	lw	a1,0(s0)
    4f40:	00028863          	beqz	t0,4f50 <__v_printf+0x4fa>
    4f44:	4285                	li	t0,1
    4f46:	0005d563          	bgez	a1,4f50 <__v_printf+0x4fa>
    4f4a:	40b005b3          	neg	a1,a1
    4f4e:	4289                	li	t0,2
    4f50:	fc075fe3          	bgez	a4,4f2e <__v_printf+0x4d8>
    4f54:	56fd                	li	a3,-1
    4f56:	02d70763          	beq	a4,a3,4f84 <__v_printf+0x52e>
    4f5a:	0ff5f593          	andi	a1,a1,255
    4f5e:	873e                	mv	a4,a5
    4f60:	04d10793          	addi	a5,sp,77
    4f64:	86aa                	mv	a3,a0
    4f66:	862e                	mv	a2,a1
    4f68:	00678533          	add	a0,a5,t1
    4f6c:	07b00593          	li	a1,123
    4f70:	da1e                	sw	t2,52(sp)
    4f72:	d416                	sw	t0,40(sp)
    4f74:	d21a                	sw	t1,36(sp)
    4f76:	9c9ff0ef          	jal	ra,493e <__ltostr>
    4f7a:	53d2                	lw	t2,52(sp)
    4f7c:	52a2                	lw	t0,40(sp)
    4f7e:	5312                	lw	t1,36(sp)
    4f80:	841e                	mv	s0,t2
    4f82:	b7b9                	j	4ed0 <__v_printf+0x47a>
    4f84:	05c2                	slli	a1,a1,0x10
    4f86:	81c1                	srli	a1,a1,0x10
    4f88:	bfd9                	j	4f5e <__v_printf+0x508>
    4f8a:	932a                	add	t1,t1,a0
    4f8c:	b7b5                	j	4ef8 <__v_printf+0x4a2>
    4f8e:	4301                	li	t1,0
    4f90:	c402                	sw	zero,8(sp)
    4f92:	b79d                	j	4ef8 <__v_printf+0x4a2>
    4f94:	d80284e3          	beqz	t0,4d1c <__v_printf+0x2c6>
    4f98:	4772                	lw	a4,28(sp)
    4f9a:	ef19                	bnez	a4,4fb8 <__v_printf+0x562>
    4f9c:	5732                	lw	a4,44(sp)
    4f9e:	4281                	li	t0,0
    4fa0:	d6070ee3          	beqz	a4,4d1c <__v_printf+0x2c6>
    4fa4:	02000713          	li	a4,32
    4fa8:	fff78693          	addi	a3,a5,-1
    4fac:	c4b6                	sw	a3,72(sp)
    4fae:	fee78fa3          	sb	a4,-1(a5)
    4fb2:	0305                	addi	t1,t1,1
    4fb4:	4285                	li	t0,1
    4fb6:	b39d                	j	4d1c <__v_printf+0x2c6>
    4fb8:	02b00713          	li	a4,43
    4fbc:	b7f5                	j	4fa8 <__v_printf+0x552>
    4fbe:	00840793          	addi	a5,s0,8
    4fc2:	da3e                	sw	a5,52(sp)
    4fc4:	401c                	lw	a5,0(s0)
    4fc6:	d23e                	sw	a5,36(sp)
    4fc8:	405c                	lw	a5,4(s0)
    4fca:	d43e                	sw	a5,40(sp)
    4fcc:	04d10793          	addi	a5,sp,77
    4fd0:	c4be                	sw	a5,72(sp)
    4fd2:	47b2                	lw	a5,12(sp)
    4fd4:	e399                	bnez	a5,4fda <__v_printf+0x584>
    4fd6:	4785                	li	a5,1
    4fd8:	c63e                	sw	a5,12(sp)
    4fda:	47d2                	lw	a5,20(sp)
    4fdc:	e399                	bnez	a5,4fe2 <__v_printf+0x58c>
    4fde:	4799                	li	a5,6
    4fe0:	c03e                	sw	a5,0(sp)
    4fe2:	42f2                	lw	t0,28(sp)
    4fe4:	00029e63          	bnez	t0,5000 <__v_printf+0x5aa>
    4fe8:	5712                	lw	a4,36(sp)
    4fea:	57a2                	lw	a5,40(sp)
    4fec:	4601                	li	a2,0
    4fee:	4681                	li	a3,0
    4ff0:	853a                	mv	a0,a4
    4ff2:	85be                	mv	a1,a5
    4ff4:	dc1a                	sw	t1,56(sp)
    4ff6:	d76fc0ef          	jal	ra,156c <__ledf2>
    4ffa:	5362                	lw	t1,56(sp)
    4ffc:	01f55293          	srli	t0,a0,0x1f
    5000:	5412                	lw	s0,36(sp)
    5002:	53a2                	lw	t2,40(sp)
    5004:	4782                	lw	a5,0(sp)
    5006:	4732                	lw	a4,12(sp)
    5008:	07f00693          	li	a3,127
    500c:	04d10613          	addi	a2,sp,77
    5010:	8522                	mv	a0,s0
    5012:	859e                	mv	a1,t2
    5014:	c096                	sw	t0,64(sp)
    5016:	dc1a                	sw	t1,56(sp)
    5018:	b7aff0ef          	jal	ra,4392 <__dtostr>
    501c:	47d2                	lw	a5,20(sp)
    501e:	de2a                	sw	a0,60(sp)
    5020:	5362                	lw	t1,56(sp)
    5022:	4286                	lw	t0,64(sp)
    5024:	cb95                	beqz	a5,5058 <__v_printf+0x602>
    5026:	4426                	lw	s0,72(sp)
    5028:	02e00593          	li	a1,46
    502c:	dc16                	sw	t0,56(sp)
    502e:	8522                	mv	a0,s0
    5030:	ca1a                	sw	t1,20(sp)
    5032:	aa0fd0ef          	jal	ra,22d2 <strchr>
    5036:	4352                	lw	t1,20(sp)
    5038:	52e2                	lw	t0,56(sp)
    503a:	57f2                	lw	a5,60(sp)
    503c:	cd49                	beqz	a0,50d6 <__v_printf+0x680>
    503e:	4782                	lw	a5,0(sp)
    5040:	e399                	bnez	a5,5046 <__v_printf+0x5f0>
    5042:	47a2                	lw	a5,8(sp)
    5044:	cb81                	beqz	a5,5054 <__v_printf+0x5fe>
    5046:	0505                	addi	a0,a0,1
    5048:	4782                	lw	a5,0(sp)
    504a:	c789                	beqz	a5,5054 <__v_printf+0x5fe>
    504c:	0505                	addi	a0,a0,1
    504e:	00054783          	lbu	a5,0(a0)
    5052:	efb5                	bnez	a5,50ce <__v_printf+0x678>
    5054:	00050023          	sb	zero,0(a0)
    5058:	06700793          	li	a5,103
    505c:	04f31a63          	bne	t1,a5,50b0 <__v_printf+0x65a>
    5060:	4526                	lw	a0,72(sp)
    5062:	02e00593          	li	a1,46
    5066:	c416                	sw	t0,8(sp)
    5068:	a6afd0ef          	jal	ra,22d2 <strchr>
    506c:	842a                	mv	s0,a0
    506e:	42a2                	lw	t0,8(sp)
    5070:	c121                	beqz	a0,50b0 <__v_printf+0x65a>
    5072:	06500593          	li	a1,101
    5076:	a5cfd0ef          	jal	ra,22d2 <strchr>
    507a:	42a2                	lw	t0,8(sp)
    507c:	85aa                	mv	a1,a0
    507e:	00044783          	lbu	a5,0(s0)
    5082:	e7b5                	bnez	a5,50ee <__v_printf+0x698>
    5084:	c191                	beqz	a1,5088 <__v_printf+0x632>
    5086:	842e                	mv	s0,a1
    5088:	03000693          	li	a3,48
    508c:	fff44703          	lbu	a4,-1(s0)
    5090:	fff40513          	addi	a0,s0,-1
    5094:	04d70f63          	beq	a4,a3,50f2 <__v_printf+0x69c>
    5098:	02e00693          	li	a3,46
    509c:	00d70363          	beq	a4,a3,50a2 <__v_printf+0x64c>
    50a0:	8522                	mv	a0,s0
    50a2:	00050023          	sb	zero,0(a0)
    50a6:	c589                	beqz	a1,50b0 <__v_printf+0x65a>
    50a8:	c416                	sw	t0,8(sp)
    50aa:	a42fd0ef          	jal	ra,22ec <strcpy>
    50ae:	42a2                	lw	t0,8(sp)
    50b0:	47f2                	lw	a5,28(sp)
    50b2:	10079263          	bnez	a5,51b6 <__v_printf+0x760>
    50b6:	57b2                	lw	a5,44(sp)
    50b8:	e3e5                	bnez	a5,5198 <__v_printf+0x742>
    50ba:	4526                	lw	a0,72(sp)
    50bc:	ce16                	sw	t0,28(sp)
    50be:	dbafd0ef          	jal	ra,2678 <strlen>
    50c2:	832a                	mv	t1,a0
    50c4:	5452                	lw	s0,52(sp)
    50c6:	ca02                	sw	zero,20(sp)
    50c8:	c402                	sw	zero,8(sp)
    50ca:	42f2                	lw	t0,28(sp)
    50cc:	b981                	j	4d1c <__v_printf+0x2c6>
    50ce:	4782                	lw	a5,0(sp)
    50d0:	17fd                	addi	a5,a5,-1
    50d2:	c03e                	sw	a5,0(sp)
    50d4:	bf95                	j	5048 <__v_printf+0x5f2>
    50d6:	4722                	lw	a4,8(sp)
    50d8:	d341                	beqz	a4,5058 <__v_printf+0x602>
    50da:	943e                	add	s0,s0,a5
    50dc:	02e00713          	li	a4,46
    50e0:	00e40023          	sb	a4,0(s0)
    50e4:	4526                	lw	a0,72(sp)
    50e6:	953e                	add	a0,a0,a5
    50e8:	000500a3          	sb	zero,1(a0)
    50ec:	b7b5                	j	5058 <__v_printf+0x602>
    50ee:	0405                	addi	s0,s0,1
    50f0:	b779                	j	507e <__v_printf+0x628>
    50f2:	842a                	mv	s0,a0
    50f4:	bf61                	j	508c <__v_printf+0x636>
    50f6:	57fd                	li	a5,-1
    50f8:	c23e                	sw	a5,4(sp)
    50fa:	40de                	lw	ra,212(sp)
    50fc:	444e                	lw	s0,208(sp)
    50fe:	4512                	lw	a0,4(sp)
    5100:	44be                	lw	s1,204(sp)
    5102:	0d810113          	addi	sp,sp,216
    5106:	8082                	ret
    5108:	5782                	lw	a5,32(sp)
    510a:	c6079ee3          	bnez	a5,4d86 <__v_printf+0x330>
    510e:	4781                	li	a5,0
    5110:	4752                	lw	a4,20(sp)
    5112:	cc0700e3          	beqz	a4,4dd2 <__v_printf+0x37c>
    5116:	4582                	lw	a1,0(sp)
    5118:	0065f363          	bgeu	a1,t1,511e <__v_printf+0x6c8>
    511c:	859a                	mv	a1,t1
    511e:	ca3e                	sw	a5,20(sp)
    5120:	47b2                	lw	a5,12(sp)
    5122:	02000613          	li	a2,32
    5126:	8526                	mv	a0,s1
    5128:	40b785b3          	sub	a1,a5,a1
    512c:	c41a                	sw	t1,8(sp)
    512e:	cc36                	sw	a3,24(sp)
    5130:	8c7ff0ef          	jal	ra,49f6 <write_pad>
    5134:	4792                	lw	a5,4(sp)
    5136:	4322                	lw	t1,8(sp)
    5138:	00f50733          	add	a4,a0,a5
    513c:	47d2                	lw	a5,20(sp)
    513e:	cf99                	beqz	a5,515c <__v_printf+0x706>
    5140:	46e2                	lw	a3,24(sp)
    5142:	0044a383          	lw	t2,4(s1)
    5146:	4090                	lw	a2,0(s1)
    5148:	85be                	mv	a1,a5
    514a:	8536                	mv	a0,a3
    514c:	c61a                	sw	t1,12(sp)
    514e:	c43a                	sw	a4,8(sp)
    5150:	c23e                	sw	a5,4(sp)
    5152:	9382                	jalr	t2
    5154:	4792                	lw	a5,4(sp)
    5156:	4722                	lw	a4,8(sp)
    5158:	4332                	lw	t1,12(sp)
    515a:	973e                	add	a4,a4,a5
    515c:	4782                	lw	a5,0(sp)
    515e:	03000613          	li	a2,48
    5162:	8526                	mv	a0,s1
    5164:	406785b3          	sub	a1,a5,t1
    5168:	c23a                	sw	a4,4(sp)
    516a:	c01a                	sw	t1,0(sp)
    516c:	88bff0ef          	jal	ra,49f6 <write_pad>
    5170:	4712                	lw	a4,4(sp)
    5172:	4302                	lw	t1,0(sp)
    5174:	972a                	add	a4,a4,a0
    5176:	40dc                	lw	a5,4(s1)
    5178:	4090                	lw	a2,0(s1)
    517a:	4526                	lw	a0,72(sp)
    517c:	859a                	mv	a1,t1
    517e:	c23a                	sw	a4,4(sp)
    5180:	c01a                	sw	t1,0(sp)
    5182:	9782                	jalr	a5
    5184:	4302                	lw	t1,0(sp)
    5186:	4712                	lw	a4,4(sp)
    5188:	006707b3          	add	a5,a4,t1
    518c:	bac1                	j	4b5c <__v_printf+0x106>
    518e:	47a2                	lw	a5,8(sp)
    5190:	bc0793e3          	bnez	a5,4d56 <__v_printf+0x300>
    5194:	4785                	li	a5,1
    5196:	b6c9                	j	4d58 <__v_printf+0x302>
    5198:	57a2                	lw	a5,40(sp)
    519a:	5712                	lw	a4,36(sp)
    519c:	4601                	li	a2,0
    519e:	85be                	mv	a1,a5
    51a0:	4681                	li	a3,0
    51a2:	853a                	mv	a0,a4
    51a4:	c416                	sw	t0,8(sp)
    51a6:	b12fc0ef          	jal	ra,14b8 <__gedf2>
    51aa:	02000793          	li	a5,32
    51ae:	42a2                	lw	t0,8(sp)
    51b0:	02055163          	bgez	a0,51d2 <__v_printf+0x77c>
    51b4:	b719                	j	50ba <__v_printf+0x664>
    51b6:	5712                	lw	a4,36(sp)
    51b8:	57a2                	lw	a5,40(sp)
    51ba:	4601                	li	a2,0
    51bc:	4681                	li	a3,0
    51be:	853a                	mv	a0,a4
    51c0:	85be                	mv	a1,a5
    51c2:	c416                	sw	t0,8(sp)
    51c4:	af4fc0ef          	jal	ra,14b8 <__gedf2>
    51c8:	42a2                	lw	t0,8(sp)
    51ca:	ee0548e3          	bltz	a0,50ba <__v_printf+0x664>
    51ce:	02b00793          	li	a5,43
    51d2:	4726                	lw	a4,72(sp)
    51d4:	fff70693          	addi	a3,a4,-1
    51d8:	c4b6                	sw	a3,72(sp)
    51da:	fef70fa3          	sb	a5,-1(a4)
    51de:	bdf1                	j	50ba <__v_printf+0x664>
    51e0:	8a071ee3          	bnez	a4,4a9c <__v_printf+0x46>
    51e4:	47c2                	lw	a5,16(sp)
    51e6:	c83e                	sw	a5,16(sp)
    51e8:	b069                	j	4a72 <__v_printf+0x1c>
    51ea:	0000                	unimp
    51ec:	0000                	unimp
	...
