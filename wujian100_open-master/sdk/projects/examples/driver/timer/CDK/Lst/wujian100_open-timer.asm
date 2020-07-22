
C:/Users/Administrator/Documents/GitHub/ZhixinTongde_WJ100/wujian100_open-master/sdk/projects/examples/driver/timer/CDK//Obj/wujian100_open-timer.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <Reset_Handler>:
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
.option push
.option norelax
    la      gp, __global_pointer$
       0:	20000197          	auipc	gp,0x20000
       4:	66418193          	addi	gp,gp,1636 # 20000664 <__global_pointer$>
.option pop
    la      a0, Default_Handler
       8:	00000517          	auipc	a0,0x0
       c:	1b850513          	addi	a0,a0,440 # 1c0 <Default_Handler>
    ori     a0, a0, 3
      10:	00356513          	ori	a0,a0,3
    csrw    mtvec, a0
      14:	30551073          	csrw	mtvec,a0

    la      a0, __Vectors
      18:	99c18513          	addi	a0,gp,-1636 # 20000000 <__Vectors>
    csrw    mtvt, a0
      1c:	30751073          	csrw	mtvt,a0

    la      sp, g_top_irqstack
      20:	20001117          	auipc	sp,0x20001
      24:	64410113          	addi	sp,sp,1604 # 20001664 <g_top_irqstack>

    /* Load data section */
    la      a0, __erodata
      28:	00007517          	auipc	a0,0x7
      2c:	85850513          	addi	a0,a0,-1960 # 6880 <__ctor_end__>
    la      a1, __data_start__
      30:	99c18593          	addi	a1,gp,-1636 # 20000000 <__Vectors>
    la      a2, __data_end__
      34:	00018613          	mv	a2,gp
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
      4c:	00018513          	mv	a0,gp
    la      a1, __bss_end__
      50:	20002597          	auipc	a1,0x20002
      54:	f5858593          	addi	a1,a1,-168 # 20001fa8 <__bss_end__>
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
      66:	3bf030ef          	jal	ra,3c24 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      6a:	341020ef          	jal	ra,2baa <board_init>
#endif

    jal     main
      6e:	228040ef          	jal	ra,4296 <main>

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
      b0:	cd828293          	addi	t0,t0,-808 # 20001d84 <g_irqvector>
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
     126:	74228293          	addi	t0,t0,1858 # 20001864 <g_trap_sp>
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
     180:	303030ef          	jal	ra,3c82 <trap_c>


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
     20a:	60268693          	addi	a3,a3,1538 # 5808 <__clz_tab>
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
     3c4:	fff38513          	addi	a0,t2,-1 # ffffff <__ctor_end__+0xff977f>
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
     432:	3da58593          	addi	a1,a1,986 # 5808 <__clz_tab>
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
     4fc:	fff38313          	addi	t1,t2,-1 # ffff <__ctor_end__+0x977f>
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
     572:	29a68693          	addi	a3,a3,666 # 5808 <__clz_tab>
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
     758:	0b428293          	addi	t0,t0,180 # 5808 <__clz_tab>
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
     834:	fff40593          	addi	a1,s0,-1 # ffff <__ctor_end__+0x977f>
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
     9b2:	fe058693          	addi	a3,a1,-32 # ffe0 <__ctor_end__+0x9760>
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
     a64:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f9760>
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
     ae0:	00470693          	addi	a3,a4,4 # 10004 <__ctor_end__+0x9784>
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
     bc6:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9760>
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
     c86:	fe058513          	addi	a0,a1,-32 # 7fffe0 <__ctor_end__+0x7f9760>
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
     f50:	00005597          	auipc	a1,0x5
     f54:	84058593          	addi	a1,a1,-1984 # 5790 <__srodata>
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
    10d4:	fff70593          	addi	a1,a4,-1 # 7fffff <__ctor_end__+0x7f977f>
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
    112a:	fff40793          	addi	a5,s0,-1 # ffff <__ctor_end__+0x977f>
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
    129e:	fff78593          	addi	a1,a5,-1 # 7fffff <__ctor_end__+0x7f977f>
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
    16c6:	10a58593          	addi	a1,a1,266 # 57cc <__srodata+0x3c>
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
    1800:	fff68293          	addi	t0,a3,-1 # ffff <__ctor_end__+0x977f>
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
    187c:	fff68613          	addi	a2,a3,-1 # ffff <__ctor_end__+0x977f>
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
    18c2:	fff70693          	addi	a3,a4,-1 # ffff <__ctor_end__+0x977f>
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
    1bea:	fe050693          	addi	a3,a0,-32 # ffe0 <__ctor_end__+0x9760>
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
    1ca0:	fe068613          	addi	a2,a3,-32 # 7fffe0 <__ctor_end__+0x7f9760>
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
    1eaa:	fe060513          	addi	a0,a2,-32 # 7fffe0 <__ctor_end__+0x7f9760>
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
    20da:	fff68793          	addi	a5,a3,-1 # fffff <__ctor_end__+0xf977f>
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
    21be:	64e50513          	addi	a0,a0,1614 # 5808 <__clz_tab>
    21c2:	97aa                	add	a5,a5,a0
    21c4:	0007c503          	lbu	a0,0(a5) # 10000 <__ctor_end__+0x9780>
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
    21fa:	00074303          	lbu	t1,0(a4) # 1000000 <__ctor_end__+0xff9780>
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
    230e:	5fe30313          	addi	t1,t1,1534 # 5908 <__clz_tab+0x100>
    2312:	00279613          	slli	a2,a5,0x2
    2316:	961a                	add	a2,a2,t1
    2318:	4218                	lw	a4,0(a2)
    231a:	971a                	add	a4,a4,t1
    231c:	8702                	jr	a4
    231e:	00004517          	auipc	a0,0x4
    2322:	e5250513          	addi	a0,a0,-430 # 6170 <pad_line+0x20>
    2326:	8082                	ret
    2328:	00004517          	auipc	a0,0x4
    232c:	e5450513          	addi	a0,a0,-428 # 617c <pad_line+0x2c>
    2330:	8082                	ret
    2332:	00004517          	auipc	a0,0x4
    2336:	e6650513          	addi	a0,a0,-410 # 6198 <pad_line+0x48>
    233a:	8082                	ret
    233c:	00004517          	auipc	a0,0x4
    2340:	e6c50513          	addi	a0,a0,-404 # 61a8 <pad_line+0x58>
    2344:	8082                	ret
    2346:	00004517          	auipc	a0,0x4
    234a:	e7a50513          	addi	a0,a0,-390 # 61c0 <pad_line+0x70>
    234e:	8082                	ret
    2350:	00004517          	auipc	a0,0x4
    2354:	e7c50513          	addi	a0,a0,-388 # 61cc <pad_line+0x7c>
    2358:	8082                	ret
    235a:	00004517          	auipc	a0,0x4
    235e:	e8e50513          	addi	a0,a0,-370 # 61e8 <pad_line+0x98>
    2362:	8082                	ret
    2364:	00004517          	auipc	a0,0x4
    2368:	e9850513          	addi	a0,a0,-360 # 61fc <pad_line+0xac>
    236c:	8082                	ret
    236e:	00004517          	auipc	a0,0x4
    2372:	ea250513          	addi	a0,a0,-350 # 6210 <pad_line+0xc0>
    2376:	8082                	ret
    2378:	00004517          	auipc	a0,0x4
    237c:	eb450513          	addi	a0,a0,-332 # 622c <pad_line+0xdc>
    2380:	8082                	ret
    2382:	00004517          	auipc	a0,0x4
    2386:	eba50513          	addi	a0,a0,-326 # 623c <pad_line+0xec>
    238a:	8082                	ret
    238c:	00004517          	auipc	a0,0x4
    2390:	ebc50513          	addi	a0,a0,-324 # 6248 <pad_line+0xf8>
    2394:	8082                	ret
    2396:	00004517          	auipc	a0,0x4
    239a:	ed250513          	addi	a0,a0,-302 # 6268 <pad_line+0x118>
    239e:	8082                	ret
    23a0:	00004517          	auipc	a0,0x4
    23a4:	edc50513          	addi	a0,a0,-292 # 627c <pad_line+0x12c>
    23a8:	8082                	ret
    23aa:	00004517          	auipc	a0,0x4
    23ae:	ee650513          	addi	a0,a0,-282 # 6290 <pad_line+0x140>
    23b2:	8082                	ret
    23b4:	00004517          	auipc	a0,0x4
    23b8:	ef050513          	addi	a0,a0,-272 # 62a4 <pad_line+0x154>
    23bc:	8082                	ret
    23be:	00004517          	auipc	a0,0x4
    23c2:	ef250513          	addi	a0,a0,-270 # 62b0 <pad_line+0x160>
    23c6:	8082                	ret
    23c8:	00004517          	auipc	a0,0x4
    23cc:	f0050513          	addi	a0,a0,-256 # 62c8 <pad_line+0x178>
    23d0:	8082                	ret
    23d2:	00004517          	auipc	a0,0x4
    23d6:	f0250513          	addi	a0,a0,-254 # 62d4 <pad_line+0x184>
    23da:	8082                	ret
    23dc:	00004517          	auipc	a0,0x4
    23e0:	f0c50513          	addi	a0,a0,-244 # 62e8 <pad_line+0x198>
    23e4:	8082                	ret
    23e6:	00004517          	auipc	a0,0x4
    23ea:	f1250513          	addi	a0,a0,-238 # 62f8 <pad_line+0x1a8>
    23ee:	8082                	ret
    23f0:	00004517          	auipc	a0,0x4
    23f4:	f1850513          	addi	a0,a0,-232 # 6308 <pad_line+0x1b8>
    23f8:	8082                	ret
    23fa:	00004517          	auipc	a0,0x4
    23fe:	f1e50513          	addi	a0,a0,-226 # 6318 <pad_line+0x1c8>
    2402:	8082                	ret
    2404:	00004517          	auipc	a0,0x4
    2408:	f3450513          	addi	a0,a0,-204 # 6338 <pad_line+0x1e8>
    240c:	8082                	ret
    240e:	00004517          	auipc	a0,0x4
    2412:	f3a50513          	addi	a0,a0,-198 # 6348 <pad_line+0x1f8>
    2416:	8082                	ret
    2418:	00004517          	auipc	a0,0x4
    241c:	f4450513          	addi	a0,a0,-188 # 635c <pad_line+0x20c>
    2420:	8082                	ret
    2422:	00004517          	auipc	a0,0x4
    2426:	f5e50513          	addi	a0,a0,-162 # 6380 <pad_line+0x230>
    242a:	8082                	ret
    242c:	00004517          	auipc	a0,0x4
    2430:	f7450513          	addi	a0,a0,-140 # 63a0 <pad_line+0x250>
    2434:	8082                	ret
    2436:	00004517          	auipc	a0,0x4
    243a:	f8a50513          	addi	a0,a0,-118 # 63c0 <pad_line+0x270>
    243e:	8082                	ret
    2440:	00004517          	auipc	a0,0x4
    2444:	fa050513          	addi	a0,a0,-96 # 63e0 <pad_line+0x290>
    2448:	8082                	ret
    244a:	00004517          	auipc	a0,0x4
    244e:	fae50513          	addi	a0,a0,-82 # 63f8 <pad_line+0x2a8>
    2452:	8082                	ret
    2454:	00004517          	auipc	a0,0x4
    2458:	fb450513          	addi	a0,a0,-76 # 6408 <pad_line+0x2b8>
    245c:	8082                	ret
    245e:	00004517          	auipc	a0,0x4
    2462:	fba50513          	addi	a0,a0,-70 # 6418 <pad_line+0x2c8>
    2466:	8082                	ret
    2468:	00004517          	auipc	a0,0x4
    246c:	fc450513          	addi	a0,a0,-60 # 642c <pad_line+0x2dc>
    2470:	8082                	ret
    2472:	00004517          	auipc	a0,0x4
    2476:	fd250513          	addi	a0,a0,-46 # 6444 <pad_line+0x2f4>
    247a:	8082                	ret
    247c:	00004517          	auipc	a0,0x4
    2480:	fd850513          	addi	a0,a0,-40 # 6454 <pad_line+0x304>
    2484:	8082                	ret
    2486:	00004517          	auipc	a0,0x4
    248a:	fde50513          	addi	a0,a0,-34 # 6464 <pad_line+0x314>
    248e:	8082                	ret
    2490:	00004517          	auipc	a0,0x4
    2494:	fec50513          	addi	a0,a0,-20 # 647c <pad_line+0x32c>
    2498:	8082                	ret
    249a:	00004517          	auipc	a0,0x4
    249e:	ff250513          	addi	a0,a0,-14 # 648c <pad_line+0x33c>
    24a2:	8082                	ret
    24a4:	00004517          	auipc	a0,0x4
    24a8:	ff450513          	addi	a0,a0,-12 # 6498 <pad_line+0x348>
    24ac:	8082                	ret
    24ae:	00004517          	auipc	a0,0x4
    24b2:	01a50513          	addi	a0,a0,26 # 64c8 <pad_line+0x378>
    24b6:	8082                	ret
    24b8:	00004517          	auipc	a0,0x4
    24bc:	02450513          	addi	a0,a0,36 # 64dc <pad_line+0x38c>
    24c0:	8082                	ret
    24c2:	00004517          	auipc	a0,0x4
    24c6:	03650513          	addi	a0,a0,54 # 64f8 <pad_line+0x3a8>
    24ca:	8082                	ret
    24cc:	00004517          	auipc	a0,0x4
    24d0:	04050513          	addi	a0,a0,64 # 650c <pad_line+0x3bc>
    24d4:	8082                	ret
    24d6:	00004517          	auipc	a0,0x4
    24da:	04e50513          	addi	a0,a0,78 # 6524 <pad_line+0x3d4>
    24de:	8082                	ret
    24e0:	00004517          	auipc	a0,0x4
    24e4:	05050513          	addi	a0,a0,80 # 6530 <pad_line+0x3e0>
    24e8:	8082                	ret
    24ea:	00004517          	auipc	a0,0x4
    24ee:	05e50513          	addi	a0,a0,94 # 6548 <pad_line+0x3f8>
    24f2:	8082                	ret
    24f4:	00004517          	auipc	a0,0x4
    24f8:	05c50513          	addi	a0,a0,92 # 6550 <pad_line+0x400>
    24fc:	8082                	ret
    24fe:	00004517          	auipc	a0,0x4
    2502:	06250513          	addi	a0,a0,98 # 6560 <pad_line+0x410>
    2506:	8082                	ret
    2508:	00004517          	auipc	a0,0x4
    250c:	07050513          	addi	a0,a0,112 # 6578 <pad_line+0x428>
    2510:	8082                	ret
    2512:	00004517          	auipc	a0,0x4
    2516:	07a50513          	addi	a0,a0,122 # 658c <pad_line+0x43c>
    251a:	8082                	ret
    251c:	00004517          	auipc	a0,0x4
    2520:	08850513          	addi	a0,a0,136 # 65a4 <pad_line+0x454>
    2524:	8082                	ret
    2526:	00004517          	auipc	a0,0x4
    252a:	08e50513          	addi	a0,a0,142 # 65b4 <pad_line+0x464>
    252e:	8082                	ret
    2530:	00004517          	auipc	a0,0x4
    2534:	09850513          	addi	a0,a0,152 # 65c8 <pad_line+0x478>
    2538:	8082                	ret
    253a:	00004517          	auipc	a0,0x4
    253e:	0a250513          	addi	a0,a0,162 # 65dc <pad_line+0x48c>
    2542:	8082                	ret
    2544:	00004517          	auipc	a0,0x4
    2548:	0a450513          	addi	a0,a0,164 # 65e8 <pad_line+0x498>
    254c:	8082                	ret
    254e:	00004517          	auipc	a0,0x4
    2552:	0b650513          	addi	a0,a0,182 # 6604 <pad_line+0x4b4>
    2556:	8082                	ret
    2558:	00004517          	auipc	a0,0x4
    255c:	0c050513          	addi	a0,a0,192 # 6618 <pad_line+0x4c8>
    2560:	8082                	ret
    2562:	00004517          	auipc	a0,0x4
    2566:	0d250513          	addi	a0,a0,210 # 6634 <pad_line+0x4e4>
    256a:	8082                	ret
    256c:	00004517          	auipc	a0,0x4
    2570:	0e050513          	addi	a0,a0,224 # 664c <pad_line+0x4fc>
    2574:	8082                	ret
    2576:	00004517          	auipc	a0,0x4
    257a:	0f250513          	addi	a0,a0,242 # 6668 <pad_line+0x518>
    257e:	8082                	ret
    2580:	00004517          	auipc	a0,0x4
    2584:	0f050513          	addi	a0,a0,240 # 6670 <pad_line+0x520>
    2588:	8082                	ret
    258a:	00004517          	auipc	a0,0x4
    258e:	11650513          	addi	a0,a0,278 # 66a0 <pad_line+0x550>
    2592:	8082                	ret
    2594:	00004517          	auipc	a0,0x4
    2598:	12c50513          	addi	a0,a0,300 # 66c0 <pad_line+0x570>
    259c:	8082                	ret
    259e:	00004517          	auipc	a0,0x4
    25a2:	14250513          	addi	a0,a0,322 # 66e0 <pad_line+0x590>
    25a6:	8082                	ret
    25a8:	00004517          	auipc	a0,0x4
    25ac:	15050513          	addi	a0,a0,336 # 66f8 <pad_line+0x5a8>
    25b0:	8082                	ret
    25b2:	00004517          	auipc	a0,0x4
    25b6:	15a50513          	addi	a0,a0,346 # 670c <pad_line+0x5bc>
    25ba:	8082                	ret
    25bc:	00004517          	auipc	a0,0x4
    25c0:	16c50513          	addi	a0,a0,364 # 6728 <pad_line+0x5d8>
    25c4:	8082                	ret
    25c6:	00004517          	auipc	a0,0x4
    25ca:	17a50513          	addi	a0,a0,378 # 6740 <pad_line+0x5f0>
    25ce:	8082                	ret
    25d0:	00004517          	auipc	a0,0x4
    25d4:	18850513          	addi	a0,a0,392 # 6758 <pad_line+0x608>
    25d8:	8082                	ret
    25da:	00004517          	auipc	a0,0x4
    25de:	1a250513          	addi	a0,a0,418 # 677c <pad_line+0x62c>
    25e2:	8082                	ret
    25e4:	00004517          	auipc	a0,0x4
    25e8:	1b050513          	addi	a0,a0,432 # 6794 <pad_line+0x644>
    25ec:	8082                	ret
    25ee:	00004517          	auipc	a0,0x4
    25f2:	1c250513          	addi	a0,a0,450 # 67b0 <pad_line+0x660>
    25f6:	8082                	ret
    25f8:	00004517          	auipc	a0,0x4
    25fc:	1cc50513          	addi	a0,a0,460 # 67c4 <pad_line+0x674>
    2600:	8082                	ret
    2602:	00004517          	auipc	a0,0x4
    2606:	1da50513          	addi	a0,a0,474 # 67dc <pad_line+0x68c>
    260a:	8082                	ret
    260c:	00004517          	auipc	a0,0x4
    2610:	1e450513          	addi	a0,a0,484 # 67f0 <pad_line+0x6a0>
    2614:	8082                	ret
    2616:	00004517          	auipc	a0,0x4
    261a:	1fe50513          	addi	a0,a0,510 # 6814 <pad_line+0x6c4>
    261e:	8082                	ret
    2620:	00004517          	auipc	a0,0x4
    2624:	21c50513          	addi	a0,a0,540 # 683c <pad_line+0x6ec>
    2628:	8082                	ret
    262a:	00004517          	auipc	a0,0x4
    262e:	22650513          	addi	a0,a0,550 # 6850 <pad_line+0x700>
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
    2648:	75050513          	addi	a0,a0,1872 # 5d94 <sg_usi_config+0x8c>
    264c:	40a2                	lw	ra,8(sp)
    264e:	0131                	addi	sp,sp,12
    2650:	8082                	ret
    2652:	00004517          	auipc	a0,0x4
    2656:	21650513          	addi	a0,a0,534 # 6868 <pad_line+0x718>
    265a:	8082                	ret

0000265c <strerror>:
    265c:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    2660:	85aa                	mv	a1,a0
    2662:	4388                	lw	a0,0(a5)
    2664:	4681                	li	a3,0
    2666:	4601                	li	a2,0
    2668:	b959                	j	22fe <_strerror_r>

0000266a <strerror_l>:
    266a:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
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
    27d0:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    27d4:	439c                	lw	a5,0(a5)
    27d6:	5bd8                	lw	a4,52(a5)
    27d8:	e319                	bnez	a4,27de <_strtol_r+0xe>
    27da:	e8c18713          	addi	a4,gp,-372 # 200004f0 <__global_locale>
    27de:	b575                	j	268a <_strtol_l.isra.0>

000027e0 <strtol_l>:
    27e0:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    27e4:	8736                	mv	a4,a3
    27e6:	86b2                	mv	a3,a2
    27e8:	862e                	mv	a2,a1
    27ea:	85aa                	mv	a1,a0
    27ec:	4388                	lw	a0,0(a5)
    27ee:	bd71                	j	268a <_strtol_l.isra.0>

000027f0 <strtol>:
    27f0:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    27f4:	439c                	lw	a5,0(a5)
    27f6:	86b2                	mv	a3,a2
    27f8:	5bd8                	lw	a4,52(a5)
    27fa:	e319                	bnez	a4,2800 <strtol+0x10>
    27fc:	e8c18713          	addi	a4,gp,-372 # 200004f0 <__global_locale>
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
    2940:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    2944:	439c                	lw	a5,0(a5)
    2946:	5bd8                	lw	a4,52(a5)
    2948:	e319                	bnez	a4,294e <_strtoul_r+0xe>
    294a:	e8c18713          	addi	a4,gp,-372 # 200004f0 <__global_locale>
    294e:	bd6d                	j	2808 <_strtoul_l.isra.0>

00002950 <strtoul_l>:
    2950:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    2954:	8736                	mv	a4,a3
    2956:	86b2                	mv	a3,a2
    2958:	862e                	mv	a2,a1
    295a:	85aa                	mv	a1,a0
    295c:	4388                	lw	a0,0(a5)
    295e:	b56d                	j	2808 <_strtoul_l.isra.0>

00002960 <strtoul>:
    2960:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    2964:	439c                	lw	a5,0(a5)
    2966:	86b2                	mv	a3,a2
    2968:	5bd8                	lw	a4,52(a5)
    296a:	e319                	bnez	a4,2970 <strtoul+0x10>
    296c:	e8c18713          	addi	a4,gp,-372 # 200004f0 <__global_locale>
    2970:	862e                	mv	a2,a1
    2972:	85aa                	mv	a1,a0
    2974:	853e                	mv	a0,a5
    2976:	bd49                	j	2808 <_strtoul_l.isra.0>

00002978 <_user_strerror>:
    2978:	4501                	li	a0,0
    297a:	8082                	ret

0000297c <_setlocale_r>:
    297c:	ee11                	bnez	a2,2998 <_setlocale_r+0x1c>
    297e:	00004517          	auipc	a0,0x4
    2982:	ef250513          	addi	a0,a0,-270 # 6870 <pad_line+0x720>
    2986:	8082                	ret
    2988:	00004517          	auipc	a0,0x4
    298c:	ee850513          	addi	a0,a0,-280 # 6870 <pad_line+0x720>
    2990:	40a2                	lw	ra,8(sp)
    2992:	4412                	lw	s0,4(sp)
    2994:	0131                	addi	sp,sp,12
    2996:	8082                	ret
    2998:	1151                	addi	sp,sp,-12
    299a:	00004597          	auipc	a1,0x4
    299e:	eda58593          	addi	a1,a1,-294 # 6874 <pad_line+0x724>
    29a2:	8532                	mv	a0,a2
    29a4:	c222                	sw	s0,4(sp)
    29a6:	c406                	sw	ra,8(sp)
    29a8:	8432                	mv	s0,a2
    29aa:	207d                	jal	2a58 <strcmp>
    29ac:	dd71                	beqz	a0,2988 <_setlocale_r+0xc>
    29ae:	00004597          	auipc	a1,0x4
    29b2:	ec258593          	addi	a1,a1,-318 # 6870 <pad_line+0x720>
    29b6:	8522                	mv	a0,s0
    29b8:	2045                	jal	2a58 <strcmp>
    29ba:	d579                	beqz	a0,2988 <_setlocale_r+0xc>
    29bc:	00003597          	auipc	a1,0x3
    29c0:	3d858593          	addi	a1,a1,984 # 5d94 <sg_usi_config+0x8c>
    29c4:	8522                	mv	a0,s0
    29c6:	2849                	jal	2a58 <strcmp>
    29c8:	d161                	beqz	a0,2988 <_setlocale_r+0xc>
    29ca:	4501                	li	a0,0
    29cc:	b7d1                	j	2990 <_setlocale_r+0x14>

000029ce <__locale_mb_cur_max>:
    29ce:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    29d2:	439c                	lw	a5,0(a5)
    29d4:	5bdc                	lw	a5,52(a5)
    29d6:	e399                	bnez	a5,29dc <__locale_mb_cur_max+0xe>
    29d8:	e8c18793          	addi	a5,gp,-372 # 200004f0 <__global_locale>
    29dc:	1287c503          	lbu	a0,296(a5)
    29e0:	8082                	ret

000029e2 <__locale_ctype_ptr_l>:
    29e2:	0ec52503          	lw	a0,236(a0)
    29e6:	8082                	ret

000029e8 <__locale_ctype_ptr>:
    29e8:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    29ec:	439c                	lw	a5,0(a5)
    29ee:	5bdc                	lw	a5,52(a5)
    29f0:	e399                	bnez	a5,29f6 <__locale_ctype_ptr+0xe>
    29f2:	e8c18793          	addi	a5,gp,-372 # 200004f0 <__global_locale>
    29f6:	0ec7a503          	lw	a0,236(a5)
    29fa:	8082                	ret

000029fc <setlocale>:
    29fc:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    2a00:	862e                	mv	a2,a1
    2a02:	85aa                	mv	a1,a0
    2a04:	4388                	lw	a0,0(a5)
    2a06:	bf9d                	j	297c <_setlocale_r>

00002a08 <_mbtowc_r>:
    2a08:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    2a0c:	439c                	lw	a5,0(a5)
    2a0e:	5bdc                	lw	a5,52(a5)
    2a10:	e399                	bnez	a5,2a16 <_mbtowc_r+0xe>
    2a12:	e8c18793          	addi	a5,gp,-372 # 200004f0 <__global_locale>
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
    2b76:	a5c18793          	addi	a5,gp,-1444 # 200000c0 <_impure_ptr>
    2b7a:	439c                	lw	a5,0(a5)
    2b7c:	5bdc                	lw	a5,52(a5)
    2b7e:	e399                	bnez	a5,2b84 <_wctomb_r+0xe>
    2b80:	e8c18793          	addi	a5,gp,-372 # 200004f0 <__global_locale>
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
    2bae:	170010ef          	jal	ra,3d1e <clock_timer_init>
    clock_timer_start();
    2bb2:	1f8010ef          	jal	ra,3daa <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2bb6:	4581                	li	a1,0
    2bb8:	4501                	li	a0,0
    2bba:	2cb000ef          	jal	ra,3684 <csi_usart_initialize>
    2bbe:	200027b7          	lui	a5,0x20002
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        return;
    }
}
    2bc2:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2bc4:	d4a7a623          	sw	a0,-692(a5) # 20001d4c <console_handle>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2bc8:	65f1                	lui	a1,0x1c
    2bca:	478d                	li	a5,3
    2bcc:	4701                	li	a4,0
    2bce:	4681                	li	a3,0
    2bd0:	4601                	li	a2,0
    2bd2:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x15980>
}
    2bd6:	0131                	addi	sp,sp,12
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2bd8:	2af0006f          	j	3686 <csi_usart_config>

00002bdc <drv_irq_enable>:
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__STATIC_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    CLIC->INTIE[IRQn] |= CLIC_INTIE_IE_Msk;
    2bdc:	e000e7b7          	lui	a5,0xe000e
    2be0:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    2be4:	953e                	add	a0,a0,a5
    2be6:	40054783          	lbu	a5,1024(a0)
    2bea:	0017e793          	ori	a5,a5,1
    2bee:	40f50023          	sb	a5,1024(a0)
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}
    2bf2:	8082                	ret

00002bf4 <drv_irq_register>:
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
    2bf4:	200027b7          	lui	a5,0x20002
    2bf8:	050a                	slli	a0,a0,0x2
    2bfa:	d8478793          	addi	a5,a5,-636 # 20001d84 <g_irqvector>
    2bfe:	953e                	add	a0,a0,a5
    2c00:	c10c                	sw	a1,0(a0)
}
    2c02:	8082                	ret

00002c04 <wj_usi_set_rxfifo_th>:

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    2c04:	457c                	lw	a5,76(a0)
    2c06:	7741                	lui	a4,0xffff0
    2c08:	177d                	addi	a4,a4,-1
    2c0a:	8ff9                	and	a5,a5,a4
    2c0c:	c57c                	sw	a5,76(a0)
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;
    2c0e:	457c                	lw	a5,76(a0)
    2c10:	cff7f793          	andi	a5,a5,-769
    2c14:	c57c                	sw	a5,76(a0)

    if (length >= USI_RX_MAX_FIFO) {
    2c16:	47bd                	li	a5,15
    2c18:	00b7f963          	bgeu	a5,a1,2c2a <wj_usi_set_rxfifo_th+0x26>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    2c1c:	457c                	lw	a5,76(a0)
    2c1e:	6741                	lui	a4,0x10
    2c20:	30070713          	addi	a4,a4,768 # 10300 <__ctor_end__+0x9a80>
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2c24:	8fd9                	or	a5,a5,a4
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2c26:	c57c                	sw	a5,76(a0)
    }
}
    2c28:	8082                	ret
    } else if (length >= USI_RX_MAX_FIFO - 4) {
    2c2a:	47ad                	li	a5,11
    2c2c:	00b7f763          	bgeu	a5,a1,2c3a <wj_usi_set_rxfifo_th+0x36>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    2c30:	6741                	lui	a4,0x10
    2c32:	457c                	lw	a5,76(a0)
    2c34:	20070713          	addi	a4,a4,512 # 10200 <__ctor_end__+0x9980>
    2c38:	b7f5                	j	2c24 <wj_usi_set_rxfifo_th+0x20>
    } else if (length >= 4) {
    2c3a:	478d                	li	a5,3
    2c3c:	00b7f763          	bgeu	a5,a1,2c4a <wj_usi_set_rxfifo_th+0x46>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2c40:	6741                	lui	a4,0x10
    2c42:	457c                	lw	a5,76(a0)
    2c44:	10070713          	addi	a4,a4,256 # 10100 <__ctor_end__+0x9880>
    2c48:	bff1                	j	2c24 <wj_usi_set_rxfifo_th+0x20>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2c4a:	457c                	lw	a5,76(a0)
    2c4c:	1007e793          	ori	a5,a5,256
    2c50:	bfd9                	j	2c26 <wj_usi_set_rxfifo_th+0x22>

00002c52 <wj_usi_irqhandler>:
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);
    2c52:	200027b7          	lui	a5,0x20002
    2c56:	00351713          	slli	a4,a0,0x3
    2c5a:	86c78793          	addi	a5,a5,-1940 # 2000186c <usi_instance>
    2c5e:	97ba                	add	a5,a5,a4
    2c60:	439c                	lw	a5,0(a5)

    switch (addr->USI_MODE_SEL & 0x3) {
    2c62:	4705                	li	a4,1
    2c64:	43dc                	lw	a5,4(a5)
    2c66:	8b8d                	andi	a5,a5,3
    2c68:	00e78863          	beq	a5,a4,2c78 <wj_usi_irqhandler+0x26>
    2c6c:	c789                	beqz	a5,2c76 <wj_usi_irqhandler+0x24>
    2c6e:	4709                	li	a4,2
    2c70:	00e78563          	beq	a5,a4,2c7a <wj_usi_irqhandler+0x28>
    2c74:	8082                	ret
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
    2c76:	a725                	j	339e <wj_usi_usart_irqhandler>
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
    2c78:	a099                	j	2cbe <wj_usi_i2c_irqhandler>
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
    2c7a:	a629                	j	2f84 <wj_usi_spi_irqhandler>

00002c7c <drv_usi_initialize>:
            return;
    }
}

int32_t drv_usi_initialize(int32_t idx)
{
    2c7c:	1131                	addi	sp,sp,-20
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);
    2c7e:	0050                	addi	a2,sp,4
    2c80:	858a                	mv	a1,sp
{
    2c82:	c622                	sw	s0,12(sp)
    2c84:	c806                	sw	ra,16(sp)
    2c86:	842a                	mv	s0,a0
    uint32_t base = 0u;
    2c88:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    2c8a:	c202                	sw	zero,4(sp)
    int32_t ret = target_usi_init(idx, &base, &irq);
    2c8c:	285000ef          	jal	ra,3710 <target_usi_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    2c90:	4789                	li	a5,2
    2c92:	02a7e163          	bltu	a5,a0,2cb4 <drv_usi_initialize+0x38>
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    2c96:	4782                	lw	a5,0(sp)
    2c98:	20002537          	lui	a0,0x20002
    2c9c:	040e                	slli	s0,s0,0x3
    2c9e:	86c50513          	addi	a0,a0,-1940 # 2000186c <usi_instance>
    2ca2:	9522                	add	a0,a0,s0
    2ca4:	c11c                	sw	a5,0(a0)
    usi_priv->irq  = irq;
    2ca6:	4792                	lw	a5,4(sp)
    2ca8:	c15c                	sw	a5,4(a0)

    return 0;
    2caa:	4501                	li	a0,0
}
    2cac:	40c2                	lw	ra,16(sp)
    2cae:	4432                	lw	s0,12(sp)
    2cb0:	0151                	addi	sp,sp,20
    2cb2:	8082                	ret
        return ERR_USI(DRV_ERROR_PARAMETER);
    2cb4:	81180537          	lui	a0,0x81180
    2cb8:	08450513          	addi	a0,a0,132 # 81180084 <__heap_end+0x61150084>
    2cbc:	bfc5                	j	2cac <drv_usi_initialize+0x30>

00002cbe <wj_usi_i2c_irqhandler>:

}
void wj_usi_i2c_irqhandler(int32_t idx)
{
    wj_usi_iic_priv_t *iic_priv = &iic_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2cbe:	03000793          	li	a5,48
    2cc2:	02f507b3          	mul	a5,a0,a5
{
    2cc6:	1111                	addi	sp,sp,-28
    2cc8:	c826                	sw	s1,16(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2cca:	200024b7          	lui	s1,0x20002
    2cce:	88448713          	addi	a4,s1,-1916 # 20001884 <iic_instance>
{
    2cd2:	ca22                	sw	s0,20(sp)
    2cd4:	cc06                	sw	ra,24(sp)
    2cd6:	862a                	mv	a2,a0
    2cd8:	88448493          	addi	s1,s1,-1916
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2cdc:	97ba                	add	a5,a5,a4
    2cde:	4380                	lw	s0,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;

    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2ce0:	6719                	lui	a4,0x6
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2ce2:	4874                	lw	a3,84(s0)
    2ce4:	00e69313          	slli	t1,a3,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2ce8:	8f75                	and	a4,a4,a3
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2cea:	00e35313          	srli	t1,t1,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2cee:	c70d                	beqz	a4,2d18 <wj_usi_i2c_irqhandler+0x5a>
        /* If arbitration fault, it indicates either a slave device not
        * responding as expected, or other master which is not supported
        * by this SW.
        */
        iic_priv->status    = IIC_STATE_DONE;
    2cf0:	4711                	li	a4,4
    2cf2:	d798                	sw	a4,40(a5)
        addr->USI_EN = 0;
    2cf4:	00042023          	sw	zero,0(s0)
        addr->USI_INTR_UNMASK = 0;
    2cf8:	04042e23          	sw	zero,92(s0)
        addr->USI_INTR_EN = 0;
        addr->USI_INTR_CLR = intr_state;

        if (iic_priv->cb_event) {
    2cfc:	0087a383          	lw	t2,8(a5)
        addr->USI_INTR_EN = 0;
    2d00:	04042823          	sw	zero,80(s0)
        addr->USI_INTR_CLR = intr_state;
    2d04:	06642023          	sw	t1,96(s0)
        if (iic_priv->cb_event) {
    2d08:	02038063          	beqz	t2,2d28 <wj_usi_i2c_irqhandler+0x6a>
            if (iic_priv->cb_event) {
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
            }
        }
    }
}
    2d0c:	4452                	lw	s0,20(sp)
    2d0e:	40e2                	lw	ra,24(sp)
    2d10:	44c2                	lw	s1,16(sp)
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d12:	459d                	li	a1,7
}
    2d14:	0171                	addi	sp,sp,28
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d16:	8382                	jr	t2
    switch (iic_priv->status) {
    2d18:	578c                	lw	a1,40(a5)
    2d1a:	872a                	mv	a4,a0
    2d1c:	4505                	li	a0,1
    2d1e:	02a58963          	beq	a1,a0,2d50 <wj_usi_i2c_irqhandler+0x92>
    2d22:	4509                	li	a0,2
    2d24:	10a58563          	beq	a1,a0,2e2e <wj_usi_i2c_irqhandler+0x170>
            if (iic_priv->cb_event) {
    2d28:	03000793          	li	a5,48
    2d2c:	02f607b3          	mul	a5,a2,a5
            addr->USI_INTR_CLR = intr_state;
    2d30:	06642023          	sw	t1,96(s0)
            addr->USI_INTR_UNMASK = 0;
    2d34:	04042e23          	sw	zero,92(s0)
            addr->USI_INTR_EN = 0;
    2d38:	04042823          	sw	zero,80(s0)
            addr->USI_EN = 0;
    2d3c:	00042023          	sw	zero,0(s0)
            if (iic_priv->cb_event) {
    2d40:	94be                	add	s1,s1,a5
    2d42:	0084a303          	lw	t1,8(s1)
    2d46:	0c030663          	beqz	t1,2e12 <wj_usi_i2c_irqhandler+0x154>
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2d4a:	4599                	li	a1,6
    2d4c:	8532                	mv	a0,a2
    2d4e:	a2d9                	j	2f14 <wj_usi_i2c_irqhandler+0x256>
    if (intr_stat & USI_INT_TX_EMPTY) {
    2d50:	0026f593          	andi	a1,a3,2
    uint8_t emptyfifo = 0;
    2d54:	4601                	li	a2,0
    if (intr_stat & USI_INT_TX_EMPTY) {
    2d56:	cd8d                	beqz	a1,2d90 <wj_usi_i2c_irqhandler+0xd2>
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2d58:	53d0                	lw	a2,36(a5)
    2d5a:	4b8c                	lw	a1,16(a5)
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2d5c:	445c                	lw	a5,12(s0)
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2d5e:	8d91                	sub	a1,a1,a2
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2d60:	83a1                	srli	a5,a5,0x8
    2d62:	4641                	li	a2,16
    2d64:	8bfd                	andi	a5,a5,31
    2d66:	40f607b3          	sub	a5,a2,a5
    2d6a:	0ff5f613          	andi	a2,a1,255
    2d6e:	00b7f963          	bgeu	a5,a1,2d80 <wj_usi_i2c_irqhandler+0xc2>
    2d72:	445c                	lw	a5,12(s0)
    2d74:	4641                	li	a2,16
    2d76:	83a1                	srli	a5,a5,0x8
    2d78:	8bfd                	andi	a5,a5,31
    2d7a:	8e1d                	sub	a2,a2,a5
    2d7c:	0ff67613          	andi	a2,a2,255
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2d80:	03000793          	li	a5,48
    2d84:	02f707b3          	mul	a5,a4,a5
        for (i = 0; i < emptyfifo; i++) {
    2d88:	4501                	li	a0,0
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2d8a:	97a6                	add	a5,a5,s1
        for (i = 0; i < emptyfifo; i++) {
    2d8c:	08c56863          	bltu	a0,a2,2e1c <wj_usi_i2c_irqhandler+0x15e>
    if (iic_priv->tx_cnt == iic_priv->tx_total_num) {
    2d90:	03000793          	li	a5,48
    2d94:	02f707b3          	mul	a5,a4,a5
    2d98:	97a6                	add	a5,a5,s1
    2d9a:	53cc                	lw	a1,36(a5)
    2d9c:	4b9c                	lw	a5,16(a5)
    2d9e:	00f59963          	bne	a1,a5,2db0 <wj_usi_i2c_irqhandler+0xf2>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2da2:	541c                	lw	a5,40(s0)
    2da4:	0027e793          	ori	a5,a5,2
    2da8:	d41c                	sw	a5,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    2daa:	483c                	lw	a5,80(s0)
    2dac:	9bf5                	andi	a5,a5,-3
    2dae:	c83c                	sw	a5,80(s0)
    if (intr_stat & USI_INT_I2C_STOP) {
    2db0:	01369793          	slli	a5,a3,0x13
    2db4:	0207d863          	bgez	a5,2de4 <wj_usi_i2c_irqhandler+0x126>
        iic_priv->status  = IIC_STATE_SEND_DONE;
    2db8:	03000793          	li	a5,48
    2dbc:	02f707b3          	mul	a5,a4,a5
    2dc0:	4595                	li	a1,5
    2dc2:	97a6                	add	a5,a5,s1
    2dc4:	d78c                	sw	a1,40(a5)
        if (iic_priv->cb_event) {
    2dc6:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2dc8:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2dcc:	cf81                	beqz	a5,2de4 <wj_usi_i2c_irqhandler+0x126>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2dce:	853a                	mv	a0,a4
    2dd0:	4581                	li	a1,0
    2dd2:	c632                	sw	a2,12(sp)
    2dd4:	c41a                	sw	t1,8(sp)
    2dd6:	c236                	sw	a3,4(sp)
    2dd8:	c03a                	sw	a4,0(sp)
    2dda:	9782                	jalr	a5
    2ddc:	4632                	lw	a2,12(sp)
    2dde:	4322                	lw	t1,8(sp)
    2de0:	4692                	lw	a3,4(sp)
    2de2:	4702                	lw	a4,0(sp)
    iic_priv->tx_cnt += emptyfifo;
    2de4:	03000793          	li	a5,48
    2de8:	02f707b3          	mul	a5,a4,a5
    if (intr_stat & USI_INT_TX_WERR) {
    2dec:	8ac1                	andi	a3,a3,16
    iic_priv->tx_cnt += emptyfifo;
    2dee:	94be                	add	s1,s1,a5
    2df0:	50dc                	lw	a5,36(s1)
    2df2:	963e                	add	a2,a2,a5
    2df4:	d0d0                	sw	a2,36(s1)
    if (intr_stat & USI_INT_TX_WERR) {
    2df6:	ce81                	beqz	a3,2e0e <wj_usi_i2c_irqhandler+0x150>
        iic_priv->status = IIC_STATE_ERROR;
    2df8:	479d                	li	a5,7
    2dfa:	d49c                	sw	a5,40(s1)
        if (iic_priv->cb_event) {
    2dfc:	449c                	lw	a5,8(s1)
        addr->USI_EN = 0;
    2dfe:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2e02:	c791                	beqz	a5,2e0e <wj_usi_i2c_irqhandler+0x150>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2e04:	459d                	li	a1,7
    2e06:	853a                	mv	a0,a4
    2e08:	c01a                	sw	t1,0(sp)
    2e0a:	9782                	jalr	a5
    2e0c:	4302                	lw	t1,0(sp)
            addr->USI_INTR_CLR = intr_state;
    2e0e:	06642023          	sw	t1,96(s0)
}
    2e12:	40e2                	lw	ra,24(sp)
    2e14:	4452                	lw	s0,20(sp)
    2e16:	44c2                	lw	s1,16(sp)
    2e18:	0171                	addi	sp,sp,28
    2e1a:	8082                	ret
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2e1c:	4f8c                	lw	a1,24(a5)
        for (i = 0; i < emptyfifo; i++) {
    2e1e:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = tx_data;
    2e20:	0005c283          	lbu	t0,0(a1)
            iic_priv->tx_buf++;
    2e24:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = tx_data;
    2e26:	00542423          	sw	t0,8(s0)
            iic_priv->tx_buf++;
    2e2a:	cf8c                	sw	a1,24(a5)
    2e2c:	b785                	j	2d8c <wj_usi_i2c_irqhandler+0xce>
    if (intr_stat & USI_INT_RX_THOLD) {
    2e2e:	0206f613          	andi	a2,a3,32
    2e32:	c635                	beqz	a2,2e9e <wj_usi_i2c_irqhandler+0x1e0>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    2e34:	02000613          	li	a2,32
    2e38:	d030                	sw	a2,96(s0)
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2e3a:	444c                	lw	a1,12(s0)
        for (i = 0; i < rx_num; i++) {
    2e3c:	4601                	li	a2,0
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2e3e:	81c1                	srli	a1,a1,0x10
    2e40:	89fd                	andi	a1,a1,31
        for (i = 0; i < rx_num; i++) {
    2e42:	0cb66e63          	bltu	a2,a1,2f1e <wj_usi_i2c_irqhandler+0x260>
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2e46:	03000793          	li	a5,48
    2e4a:	02f707b3          	mul	a5,a4,a5
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2e4e:	4450                	lw	a2,12(s0)
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2e50:	45c1                	li	a1,16
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2e52:	8221                	srli	a2,a2,0x8
    2e54:	8a7d                	andi	a2,a2,31
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2e56:	8d91                	sub	a1,a1,a2
    2e58:	97a6                	add	a5,a5,s1
    2e5a:	5388                	lw	a0,32(a5)
    2e5c:	4785                	li	a5,1
    2e5e:	00a5f663          	bgeu	a1,a0,2e6a <wj_usi_i2c_irqhandler+0x1ac>
    2e62:	47c1                	li	a5,16
    2e64:	8f91                	sub	a5,a5,a2
    2e66:	0ff7f793          	andi	a5,a5,255
        if (iic_priv->rx_clk == 0) {
    2e6a:	03000613          	li	a2,48
    2e6e:	02c70633          	mul	a2,a4,a2
    2e72:	9626                	add	a2,a2,s1
    2e74:	520c                	lw	a1,32(a2)
    2e76:	cde1                	beqz	a1,2f4e <wj_usi_i2c_irqhandler+0x290>
        for (i = 0; i < rxfifo; i++) {
    2e78:	4581                	li	a1,0
            addr->USI_TX_RX_FIFO = 0x100;
    2e7a:	10000313          	li	t1,256
        for (i = 0; i < rxfifo; i++) {
    2e7e:	0af59f63          	bne	a1,a5,2f3c <wj_usi_i2c_irqhandler+0x27e>
        wj_usi_set_rxfifo_th(addr, rxfifo);
    2e82:	85be                	mv	a1,a5
    2e84:	8522                	mv	a0,s0
    2e86:	c43a                	sw	a4,8(sp)
    2e88:	c236                	sw	a3,4(sp)
    2e8a:	c03e                	sw	a5,0(sp)
    2e8c:	3ba5                	jal	2c04 <wj_usi_set_rxfifo_th>
        if (rxfifo == 0) {
    2e8e:	4782                	lw	a5,0(sp)
    2e90:	4692                	lw	a3,4(sp)
    2e92:	4722                	lw	a4,8(sp)
    2e94:	e789                	bnez	a5,2e9e <wj_usi_i2c_irqhandler+0x1e0>
            addr->USI_INTR_EN |= USI_INT_I2C_STOP;
    2e96:	483c                	lw	a5,80(s0)
    2e98:	6605                	lui	a2,0x1
    2e9a:	8fd1                	or	a5,a5,a2
    2e9c:	c83c                	sw	a5,80(s0)
    if (iic_priv->rx_cnt == iic_priv->rx_total_num) {
    2e9e:	03000793          	li	a5,48
    2ea2:	02f707b3          	mul	a5,a4,a5
    2ea6:	97a6                	add	a5,a5,s1
    2ea8:	4fd0                	lw	a2,28(a5)
    2eaa:	47dc                	lw	a5,12(a5)
    2eac:	00f61a63          	bne	a2,a5,2ec0 <wj_usi_i2c_irqhandler+0x202>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2eb0:	541c                	lw	a5,40(s0)
    2eb2:	0027e793          	ori	a5,a5,2
    2eb6:	d41c                	sw	a5,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_RX_THOLD;
    2eb8:	483c                	lw	a5,80(s0)
    2eba:	fdf7f793          	andi	a5,a5,-33
    2ebe:	c83c                	sw	a5,80(s0)
    if ((intr_stat & USI_INT_RX_WERR) || (intr_stat & USI_INT_RX_RERR)) {
    2ec0:	3006f793          	andi	a5,a3,768
    2ec4:	c39d                	beqz	a5,2eea <wj_usi_i2c_irqhandler+0x22c>
        iic_priv->status = IIC_STATE_ERROR;
    2ec6:	03000793          	li	a5,48
    2eca:	02f707b3          	mul	a5,a4,a5
    2ece:	461d                	li	a2,7
    2ed0:	97a6                	add	a5,a5,s1
    2ed2:	d790                	sw	a2,40(a5)
        if (iic_priv->cb_event) {
    2ed4:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2ed6:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2eda:	cb81                	beqz	a5,2eea <wj_usi_i2c_irqhandler+0x22c>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2edc:	853a                	mv	a0,a4
    2ede:	459d                	li	a1,7
    2ee0:	c236                	sw	a3,4(sp)
    2ee2:	c03a                	sw	a4,0(sp)
    2ee4:	9782                	jalr	a5
    2ee6:	4692                	lw	a3,4(sp)
    2ee8:	4702                	lw	a4,0(sp)
    if (intr_stat & USI_INT_I2C_STOP) {
    2eea:	01369793          	slli	a5,a3,0x13
    2eee:	f207d2e3          	bgez	a5,2e12 <wj_usi_i2c_irqhandler+0x154>
        addr->USI_INTR_CLR = USI_INT_I2C_STOP;
    2ef2:	6785                	lui	a5,0x1
    2ef4:	d03c                	sw	a5,96(s0)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2ef6:	03000793          	li	a5,48
    2efa:	02f707b3          	mul	a5,a4,a5
    2efe:	94be                	add	s1,s1,a5
        if (iic_priv->cb_event) {
    2f00:	0084a303          	lw	t1,8(s1)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f04:	4799                	li	a5,6
    2f06:	d49c                	sw	a5,40(s1)
        addr->USI_EN = 0;
    2f08:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f0c:	f00303e3          	beqz	t1,2e12 <wj_usi_i2c_irqhandler+0x154>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2f10:	4581                	li	a1,0
    2f12:	853a                	mv	a0,a4
}
    2f14:	4452                	lw	s0,20(sp)
    2f16:	40e2                	lw	ra,24(sp)
    2f18:	44c2                	lw	s1,16(sp)
    2f1a:	0171                	addi	sp,sp,28
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2f1c:	8302                	jr	t1
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2f1e:	00842303          	lw	t1,8(s0)
    2f22:	4bc8                	lw	a0,20(a5)
        for (i = 0; i < rx_num; i++) {
    2f24:	0605                	addi	a2,a2,1
    2f26:	0ff67613          	andi	a2,a2,255
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2f2a:	00650023          	sb	t1,0(a0)
            iic_priv->rx_buf++;
    2f2e:	4bc8                	lw	a0,20(a5)
    2f30:	0505                	addi	a0,a0,1
    2f32:	cbc8                	sw	a0,20(a5)
            iic_priv->rx_cnt++;;
    2f34:	4fc8                	lw	a0,28(a5)
    2f36:	0505                	addi	a0,a0,1
    2f38:	cfc8                	sw	a0,28(a5)
    2f3a:	b721                	j	2e42 <wj_usi_i2c_irqhandler+0x184>
            addr->USI_TX_RX_FIFO = 0x100;
    2f3c:	00642423          	sw	t1,8(s0)
            iic_priv->rx_clk--;
    2f40:	5208                	lw	a0,32(a2)
        for (i = 0; i < rxfifo; i++) {
    2f42:	0585                	addi	a1,a1,1
    2f44:	0ff5f593          	andi	a1,a1,255
            iic_priv->rx_clk--;
    2f48:	157d                	addi	a0,a0,-1
    2f4a:	d208                	sw	a0,32(a2)
    2f4c:	bf0d                	j	2e7e <wj_usi_i2c_irqhandler+0x1c0>
            rxfifo = 0;
    2f4e:	4781                	li	a5,0
    2f50:	bf0d                	j	2e82 <wj_usi_i2c_irqhandler+0x1c4>

00002f52 <wj_spi_ss_control.isra.0>:
/**
  \brief control ss line depend on controlled Output mode.
*/
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
{
    if (spi_priv->ss_mode == SPI_SS_MASTER_HW_OUTPUT) {
    2f52:	4789                	li	a5,2
    2f54:	02f51663          	bne	a0,a5,2f80 <wj_spi_ss_control.isra.0+0x2e>
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
    2f58:	1151                	addi	sp,sp,-12
    2f5a:	c406                	sw	ra,8(sp)
        if (stat == SPI_SS_INACTIVE) {
    2f5c:	ed81                	bnez	a1,2f74 <wj_spi_ss_control.isra.0+0x22>
            csi_gpio_pin_write(pgpio_pin_handle, true);
    2f5e:	4585                	li	a1,1
        } else if (stat == SPI_SS_ACTIVE) {
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2f60:	200027b7          	lui	a5,0x20002
    2f64:	9147a503          	lw	a0,-1772(a5) # 20001914 <pgpio_pin_handle>
    2f68:	1c1000ef          	jal	ra,3928 <csi_gpio_pin_write>
        } else {
            return -1;
        }
    }

    return 0;
    2f6c:	4501                	li	a0,0
}
    2f6e:	40a2                	lw	ra,8(sp)
    2f70:	0131                	addi	sp,sp,12
    2f72:	8082                	ret
        } else if (stat == SPI_SS_ACTIVE) {
    2f74:	4785                	li	a5,1
            return -1;
    2f76:	557d                	li	a0,-1
        } else if (stat == SPI_SS_ACTIVE) {
    2f78:	fef59be3          	bne	a1,a5,2f6e <wj_spi_ss_control.isra.0+0x1c>
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2f7c:	4581                	li	a1,0
    2f7e:	b7cd                	j	2f60 <wj_spi_ss_control.isra.0+0xe>
    return 0;
    2f80:	4501                	li	a0,0
}
    2f82:	8082                	ret

00002f84 <wj_usi_spi_irqhandler>:
  \brief       handler the interrupt.
  \param[in]   spi      Pointer to \ref SPI_RESOURCES
*/
void wj_usi_spi_irqhandler(int32_t idx)
{
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    2f84:	04c00793          	li	a5,76
    2f88:	02f507b3          	mul	a5,a0,a5
{
    2f8c:	1101                	addi	sp,sp,-32
    2f8e:	ca26                	sw	s1,20(sp)
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    2f90:	200024b7          	lui	s1,0x20002
    2f94:	91848613          	addi	a2,s1,-1768 # 20001918 <spi_instance>
{
    2f98:	cc22                	sw	s0,24(sp)
    2f9a:	ce06                	sw	ra,28(sp)
    2f9c:	86aa                	mv	a3,a0
    2f9e:	91848493          	addi	s1,s1,-1768
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    2fa2:	963e                	add	a2,a2,a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    2fa4:	4200                	lw	s0,0(a2)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2fa6:	05442303          	lw	t1,84(s0)
    2faa:	00e31793          	slli	a5,t1,0xe
    2fae:	83b9                	srli	a5,a5,0xe
    2fb0:	c03e                	sw	a5,0(sp)

    /* deal with receive FIFO full interrupt */
    if (intr_state & USI_INT_SPI_STOP) {
    2fb2:	00e31793          	slli	a5,t1,0xe
    2fb6:	0807d363          	bgez	a5,303c <wj_usi_spi_irqhandler+0xb8>
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    2fba:	445c                	lw	a5,12(s0)
    uint32_t length = spi_priv->recv_num;
    2fbc:	4a48                	lw	a0,20(a2)
    uint8_t *pbuffer = spi_priv->recv_buf;
    2fbe:	4e4c                	lw	a1,28(a2)
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    2fc0:	83c1                	srli	a5,a5,0x10
    uint32_t rxdata_num = (rxnum > length) ? length : rxnum;
    2fc2:	8bfd                	andi	a5,a5,31
    2fc4:	00f57363          	bgeu	a0,a5,2fca <wj_usi_spi_irqhandler+0x46>
    2fc8:	87aa                	mv	a5,a0
    for (i = 0; i < rxdata_num; i++) {
    2fca:	00f582b3          	add	t0,a1,a5
    2fce:	10559663          	bne	a1,t0,30da <wj_usi_spi_irqhandler+0x156>
    length -= rxdata_num;
    2fd2:	8d1d                	sub	a0,a0,a5
    if (length <= 0) {
    2fd4:	10051963          	bnez	a0,30e6 <wj_usi_spi_irqhandler+0x162>
        addr->USI_INTR_EN &= ~USI_INT_SPI_STOP;
    2fd8:	483c                	lw	a5,80(s0)
    2fda:	7581                	lui	a1,0xfffe0
    2fdc:	15fd                	addi	a1,a1,-1
    2fde:	8fed                	and	a5,a5,a1
    2fe0:	c83c                	sw	a5,80(s0)
        spi_priv->status.busy = 0U;
    2fe2:	04c00793          	li	a5,76
    2fe6:	02f687b3          	mul	a5,a3,a5
    2fea:	c81a                	sw	t1,16(sp)
    2fec:	c636                	sw	a3,12(sp)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    2fee:	c232                	sw	a2,4(sp)
        spi_priv->status.busy = 0U;
    2ff0:	97a6                	add	a5,a5,s1
    2ff2:	0387c583          	lbu	a1,56(a5)
        spi_priv->recv_num = 0;
    2ff6:	c43e                	sw	a5,8(sp)
        spi_priv->status.busy = 0U;
    2ff8:	99f9                	andi	a1,a1,-2
    2ffa:	02b78c23          	sb	a1,56(a5)
        addr->USI_EN = 0x0;
    2ffe:	00042023          	sw	zero,0(s0)
        addr->USI_EN = 0xf;
    3002:	45bd                	li	a1,15
    3004:	c00c                	sw	a1,0(s0)
        addr->USI_EN = 0x0;
    3006:	00042023          	sw	zero,0(s0)
        spi_priv->recv_num = 0;
    300a:	0007aa23          	sw	zero,20(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    300e:	03464503          	lbu	a0,52(a2) # 1034 <__divdf3+0x184>
    3012:	4581                	li	a1,0
    3014:	3f3d                	jal	2f52 <wj_spi_ss_control.isra.0>
        if (spi_priv->cb_event) {
    3016:	47a2                	lw	a5,8(sp)
    3018:	4612                	lw	a2,4(sp)
    301a:	46b2                	lw	a3,12(sp)
    301c:	00c7a383          	lw	t2,12(a5)
    3020:	4342                	lw	t1,16(sp)
    3022:	00038a63          	beqz	t2,3036 <wj_usi_spi_irqhandler+0xb2>
            spi_priv->cb_event(spi_priv->idx, SPI_EVENT_RX_COMPLETE);
    3026:	43a8                	lw	a0,64(a5)
    3028:	4589                	li	a1,2
    302a:	c432                	sw	a2,8(sp)
    302c:	c21a                	sw	t1,4(sp)
    302e:	9382                	jalr	t2
            return;
    3030:	4312                	lw	t1,4(sp)
    3032:	4622                	lw	a2,8(sp)
    3034:	46b2                	lw	a3,12(sp)
        wj_spi_intr_rx_full(spi_priv);
        addr->USI_INTR_CLR = USI_INT_SPI_STOP;
    3036:	000207b7          	lui	a5,0x20
    303a:	d03c                	sw	a5,96(s0)
    }

    /* deal with transmit FIFO empty interrupt */
    if (intr_state & USI_INT_TX_EMPTY) {
    303c:	00237313          	andi	t1,t1,2
    3040:	08030663          	beqz	t1,30cc <wj_usi_spi_irqhandler+0x148>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3044:	04c00793          	li	a5,76
    3048:	02f687b3          	mul	a5,a3,a5
    304c:	97a6                	add	a5,a5,s1
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    304e:	5b8c                	lw	a1,48(a5)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3050:	0007a303          	lw	t1,0(a5) # 20000 <__ctor_end__+0x19780>
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    3054:	0e059e63          	bnez	a1,3150 <wj_usi_spi_irqhandler+0x1cc>
        while (spi_priv->transfer_num) {
    3058:	53cc                	lw	a1,36(a5)
    305a:	eddd                	bnez	a1,3118 <wj_usi_spi_irqhandler+0x194>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    305c:	5788                	lw	a0,40(a5)
    305e:	47c1                	li	a5,16
    3060:	00a7f363          	bgeu	a5,a0,3066 <wj_usi_spi_irqhandler+0xe2>
    3064:	4541                	li	a0,16
    3066:	04c00793          	li	a5,76
    306a:	02f687b3          	mul	a5,a3,a5
    306e:	97a6                	add	a5,a5,s1
    3070:	d3c8                	sw	a0,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    3072:	0aa59f63          	bne	a1,a0,3130 <wj_usi_spi_irqhandler+0x1ac>
    if (spi_priv->clk_num == 0) {
    3076:	04c00793          	li	a5,76
    307a:	02f687b3          	mul	a5,a3,a5
    307e:	97a6                	add	a5,a5,s1
    3080:	578c                	lw	a1,40(a5)
    3082:	10059463          	bnez	a1,318a <wj_usi_spi_irqhandler+0x206>
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    3086:	05032583          	lw	a1,80(t1)
    308a:	c636                	sw	a3,12(sp)
    308c:	c41a                	sw	t1,8(sp)
    308e:	99f5                	andi	a1,a1,-3
    3090:	04b32823          	sw	a1,80(t1)
        spi_priv->status.busy = 0U;
    3094:	0387c583          	lbu	a1,56(a5)
        spi_priv->send_num = 0;
    3098:	0007a823          	sw	zero,16(a5)
    309c:	c23e                	sw	a5,4(sp)
        spi_priv->status.busy = 0U;
    309e:	99f9                	andi	a1,a1,-2
    30a0:	02b78c23          	sb	a1,56(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    30a4:	03464503          	lbu	a0,52(a2)
    30a8:	4581                	li	a1,0
    30aa:	3565                	jal	2f52 <wj_spi_ss_control.isra.0>
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30ac:	4792                	lw	a5,4(sp)
        addr->USI_EN = 0x0;
    30ae:	4322                	lw	t1,8(sp)
        addr->USI_EN = 0xf;
    30b0:	463d                	li	a2,15
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30b2:	5b8c                	lw	a1,48(a5)
        addr->USI_EN = 0x0;
    30b4:	00032023          	sw	zero,0(t1)
        addr->USI_EN = 0xf;
    30b8:	00c32023          	sw	a2,0(t1)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30bc:	46b2                	lw	a3,12(sp)
    30be:	47d0                	lw	a2,12(a5)
    30c0:	e1f1                	bnez	a1,3184 <wj_usi_spi_irqhandler+0x200>
            if (spi_priv->cb_event) {
    30c2:	c661                	beqz	a2,318a <wj_usi_spi_irqhandler+0x206>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    30c4:	43a8                	lw	a0,64(a5)
    30c6:	9602                	jalr	a2
        wj_spi_intr_tx_empty(spi_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    30c8:	4789                	li	a5,2
    30ca:	d03c                	sw	a5,96(s0)
    }

    addr->USI_INTR_CLR = intr_state;
    30cc:	4782                	lw	a5,0(sp)
}
    30ce:	40f2                	lw	ra,28(sp)
    30d0:	44d2                	lw	s1,20(sp)
    addr->USI_INTR_CLR = intr_state;
    30d2:	d03c                	sw	a5,96(s0)
}
    30d4:	4462                	lw	s0,24(sp)
    30d6:	6105                	addi	sp,sp,32
    30d8:	8082                	ret
        *pbuffer = addr->USI_TX_RX_FIFO;
    30da:	00842383          	lw	t2,8(s0)
        pbuffer++;
    30de:	0585                	addi	a1,a1,1
        *pbuffer = addr->USI_TX_RX_FIFO;
    30e0:	fe758fa3          	sb	t2,-1(a1) # fffdffff <__heap_end+0xdffaffff>
        pbuffer++;
    30e4:	b5ed                	j	2fce <wj_usi_spi_irqhandler+0x4a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30e6:	04c00793          	li	a5,76
    30ea:	02f687b3          	mul	a5,a3,a5
    30ee:	97a6                	add	a5,a5,s1
    30f0:	0007a283          	lw	t0,0(a5)
            addr->USI_SPI_CTRL &= ~WJ_USI_SPI_CTRL_TMODE;
    30f4:	0442a383          	lw	t2,68(t0) # 80000044 <__heap_end+0x5ffd0044>
    30f8:	fcf3f393          	andi	t2,t2,-49
    30fc:	0472a223          	sw	t2,68(t0)
            addr->USI_SPI_CTRL |= WJ_USI_SPI_CTRL_TMODE_RX;
    3100:	0442a383          	lw	t2,68(t0)
    3104:	0203e393          	ori	t2,t2,32
    3108:	0472a223          	sw	t2,68(t0)
    spi_priv->mode = mode;
    310c:	4289                	li	t0,2
    310e:	0257a823          	sw	t0,48(a5)
        spi_priv->recv_buf = pbuffer;
    3112:	cfcc                	sw	a1,28(a5)
        spi_priv->recv_num = length;
    3114:	cbc8                	sw	a0,20(a5)
    3116:	b705                	j	3036 <wj_usi_spi_irqhandler+0xb2>
            *spi_priv->recv_buf = addr->USI_TX_RX_FIFO;
    3118:	00832503          	lw	a0,8(t1)
    311c:	4fcc                	lw	a1,28(a5)
    311e:	00a58023          	sb	a0,0(a1)
            spi_priv->recv_buf++;
    3122:	4fcc                	lw	a1,28(a5)
    3124:	0585                	addi	a1,a1,1
    3126:	cfcc                	sw	a1,28(a5)
            spi_priv->transfer_num--;
    3128:	53cc                	lw	a1,36(a5)
    312a:	15fd                	addi	a1,a1,-1
    312c:	d3cc                	sw	a1,36(a5)
    312e:	b72d                	j	3058 <wj_usi_spi_irqhandler+0xd4>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3130:	0187a283          	lw	t0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    3134:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3136:	0002c383          	lbu	t2,0(t0)
            spi_priv->send_buf++;
    313a:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    313c:	00732423          	sw	t2,8(t1)
            spi_priv->send_buf++;
    3140:	0057ac23          	sw	t0,24(a5)
            spi_priv->send_num--;
    3144:	0107a283          	lw	t0,16(a5)
    3148:	12fd                	addi	t0,t0,-1
    314a:	0057a823          	sw	t0,16(a5)
    314e:	b715                	j	3072 <wj_usi_spi_irqhandler+0xee>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    3150:	578c                	lw	a1,40(a5)
    3152:	47c1                	li	a5,16
    3154:	00b7f363          	bgeu	a5,a1,315a <wj_usi_spi_irqhandler+0x1d6>
    3158:	45c1                	li	a1,16
    315a:	04c00793          	li	a5,76
    315e:	02f687b3          	mul	a5,a3,a5
    3162:	4281                	li	t0,0
    3164:	97a6                	add	a5,a5,s1
    3166:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    3168:	f05587e3          	beq	a1,t0,3076 <wj_usi_spi_irqhandler+0xf2>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    316c:	4f88                	lw	a0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    316e:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3170:	00054383          	lbu	t2,0(a0)
            spi_priv->send_buf++;
    3174:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3176:	00732423          	sw	t2,8(t1)
            spi_priv->send_buf++;
    317a:	cf88                	sw	a0,24(a5)
            spi_priv->send_num--;
    317c:	4b88                	lw	a0,16(a5)
    317e:	157d                	addi	a0,a0,-1
    3180:	cb88                	sw	a0,16(a5)
    3182:	b7dd                	j	3168 <wj_usi_spi_irqhandler+0x1e4>
            if (spi_priv->cb_event) {
    3184:	c219                	beqz	a2,318a <wj_usi_spi_irqhandler+0x206>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    3186:	4585                	li	a1,1
    3188:	bf35                	j	30c4 <wj_usi_spi_irqhandler+0x140>
    spi_priv->clk_num -= spi_priv->transfer_num;
    318a:	04c00793          	li	a5,76
    318e:	02f686b3          	mul	a3,a3,a5
    3192:	94b6                	add	s1,s1,a3
    3194:	549c                	lw	a5,40(s1)
    3196:	50d4                	lw	a3,36(s1)
    3198:	8f95                	sub	a5,a5,a3
    319a:	d49c                	sw	a5,40(s1)
    319c:	b735                	j	30c8 <wj_usi_spi_irqhandler+0x144>

0000319e <ck_usart_intr_recv_data>:
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(wj_usi_usart_priv_t *usart_priv)
{
    if ((usart_priv->rx_total_num == 0) || (usart_priv->rx_buf == NULL)) {
    319e:	4558                	lw	a4,12(a0)
    31a0:	c319                	beqz	a4,31a6 <ck_usart_intr_recv_data+0x8>
    31a2:	495c                	lw	a5,20(a0)
    31a4:	e791                	bnez	a5,31b0 <ck_usart_intr_recv_data+0x12>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    31a6:	00852303          	lw	t1,8(a0)
    31aa:	45b9                	li	a1,14
        usart_priv->rx_buf = NULL;
        usart_priv->rx_busy = 0;
        usart_priv->rx_total_num = 0;

        if (usart_priv->cb_event) {
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    31ac:	5948                	lw	a0,52(a0)
    31ae:	8302                	jr	t1
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    31b0:	4110                	lw	a2,0(a0)
    uint32_t rxfifo_num = (addr->USI_FIFO_STA >> 16) & 0xf;
    31b2:	465c                	lw	a5,12(a2)
    31b4:	83c1                	srli	a5,a5,0x10
    31b6:	8bbd                	andi	a5,a5,15
    uint32_t rxdata_num = (rxfifo_num > usart_priv->rx_total_num) ? usart_priv->rx_total_num : rxfifo_num;
    31b8:	00f77363          	bgeu	a4,a5,31be <ck_usart_intr_recv_data+0x20>
    31bc:	87ba                	mv	a5,a4
    for (i = 0; i < rxdata_num; i++) {
    31be:	4701                	li	a4,0
    31c0:	02f71563          	bne	a4,a5,31ea <ck_usart_intr_recv_data+0x4c>
    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    31c4:	4d58                	lw	a4,28(a0)
    31c6:	455c                	lw	a5,12(a0)
    31c8:	02f76d63          	bltu	a4,a5,3202 <ck_usart_intr_recv_data+0x64>
        if (usart_priv->cb_event) {
    31cc:	00852303          	lw	t1,8(a0)
        usart_priv->rx_cnt = 0;
    31d0:	00052e23          	sw	zero,28(a0)
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    31d4:	d91c                	sw	a5,48(a0)
        usart_priv->rx_buf = NULL;
    31d6:	00052a23          	sw	zero,20(a0)
        usart_priv->rx_busy = 0;
    31da:	02052423          	sw	zero,40(a0)
        usart_priv->rx_total_num = 0;
    31de:	00052623          	sw	zero,12(a0)
        if (usart_priv->cb_event) {
    31e2:	02030063          	beqz	t1,3202 <ck_usart_intr_recv_data+0x64>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    31e6:	4585                	li	a1,1
    31e8:	b7d1                	j	31ac <ck_usart_intr_recv_data+0xe>
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    31ea:	460c                	lw	a1,8(a2)
    31ec:	4954                	lw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    31ee:	0705                	addi	a4,a4,1
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    31f0:	00b68023          	sb	a1,0(a3)
        usart_priv->rx_cnt++;
    31f4:	4d54                	lw	a3,28(a0)
    31f6:	0685                	addi	a3,a3,1
    31f8:	cd54                	sw	a3,28(a0)
        usart_priv->rx_buf++;
    31fa:	4954                	lw	a3,20(a0)
    31fc:	0685                	addi	a3,a3,1
    31fe:	c954                	sw	a3,20(a0)
    3200:	b7c1                	j	31c0 <ck_usart_intr_recv_data+0x22>
        }
    }
}
    3202:	8082                	ret

00003204 <drv_usi_usart_config_baudrate>:
{
    3204:	1141                	addi	sp,sp,-16
    3206:	c422                	sw	s0,8(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3208:	4100                	lw	s0,0(a0)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    320a:	5948                	lw	a0,52(a0)
{
    320c:	c606                	sw	ra,12(sp)
    addr->USI_EN = 0x0;
    320e:	00042023          	sw	zero,0(s0)
{
    3212:	c02e                	sw	a1,0(sp)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3214:	1ff000ef          	jal	ra,3c12 <drv_get_usi_freq>
    3218:	4729                	li	a4,10
    321a:	02e50533          	mul	a0,a0,a4
    321e:	4582                	lw	a1,0(sp)
    3220:	02b555b3          	divu	a1,a0,a1
    3224:	8191                	srli	a1,a1,0x4
    if ((divisor % 10) >= 5) {
    3226:	02e5d7b3          	divu	a5,a1,a4
    322a:	02e5f5b3          	remu	a1,a1,a4
    322e:	4711                	li	a4,4
    3230:	00b76363          	bltu	a4,a1,3236 <drv_usi_usart_config_baudrate+0x32>
        divisor = divisor / 10 - 1;
    3234:	17fd                	addi	a5,a5,-1
    addr->USI_CLK_DIV0 = divisor;
    3236:	c81c                	sw	a5,16(s0)
    addr->USI_EN = 0xf;
    3238:	47bd                	li	a5,15
    323a:	c01c                	sw	a5,0(s0)
}
    323c:	40b2                	lw	ra,12(sp)
    323e:	4422                	lw	s0,8(sp)
    3240:	4501                	li	a0,0
    3242:	0141                	addi	sp,sp,16
    3244:	8082                	ret

00003246 <drv_usi_usart_config_mode>:
    USART_NULL_PARAM_CHK(handle);
    3246:	cd11                	beqz	a0,3262 <drv_usi_usart_config_mode+0x1c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3248:	411c                	lw	a5,0(a0)
        addr->USI_EN = 0xf;
    324a:	473d                	li	a4,15
    addr->USI_EN = 0x0;
    324c:	0007a023          	sw	zero,0(a5)
        addr->USI_EN = 0xf;
    3250:	c398                	sw	a4,0(a5)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    3252:	e199                	bnez	a1,3258 <drv_usi_usart_config_mode+0x12>
        return 0;
    3254:	4501                	li	a0,0
    3256:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    3258:	81020537          	lui	a0,0x81020
    325c:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60ff0086>
    3260:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    3262:	81020537          	lui	a0,0x81020
    3266:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    326a:	8082                	ret

0000326c <drv_usi_usart_config_parity>:
    USART_NULL_PARAM_CHK(handle);
    326c:	c939                	beqz	a0,32c2 <drv_usi_usart_config_parity+0x56>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    326e:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    3270:	4705                	li	a4,1
    3272:	0007a023          	sw	zero,0(a5)
    switch (parity) {
    3276:	02e58b63          	beq	a1,a4,32ac <drv_usi_usart_config_parity+0x40>
    327a:	c989                	beqz	a1,328c <drv_usi_usart_config_parity+0x20>
    327c:	4709                	li	a4,2
    327e:	00e58e63          	beq	a1,a4,329a <drv_usi_usart_config_parity+0x2e>
            return ERR_USART(USART_ERROR_PARITY);
    3282:	81020537          	lui	a0,0x81020
    3286:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60ff0089>
    328a:	8082                	ret
            addr->USI_UART_CTRL &= ~CTRL_PARITY_ENABLE;
    328c:	4f98                	lw	a4,24(a5)
    328e:	9b3d                	andi	a4,a4,-17
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    3290:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3292:	473d                	li	a4,15
    3294:	c398                	sw	a4,0(a5)
    return 0;
    3296:	4501                	li	a0,0
    3298:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    329a:	4f98                	lw	a4,24(a5)
    329c:	8b3d                	andi	a4,a4,15
    329e:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    32a0:	4f98                	lw	a4,24(a5)
    32a2:	01076713          	ori	a4,a4,16
    32a6:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ODD;
    32a8:	4f98                	lw	a4,24(a5)
    32aa:	b7dd                	j	3290 <drv_usi_usart_config_parity+0x24>
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    32ac:	4f98                	lw	a4,24(a5)
    32ae:	8b3d                	andi	a4,a4,15
    32b0:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    32b2:	4f98                	lw	a4,24(a5)
    32b4:	01076713          	ori	a4,a4,16
    32b8:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    32ba:	4f98                	lw	a4,24(a5)
    32bc:	02076713          	ori	a4,a4,32
    32c0:	bfc1                	j	3290 <drv_usi_usart_config_parity+0x24>
    USART_NULL_PARAM_CHK(handle);
    32c2:	81020537          	lui	a0,0x81020
    32c6:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    32ca:	8082                	ret

000032cc <drv_usi_usart_config_stopbits>:
    USART_NULL_PARAM_CHK(handle);
    32cc:	c931                	beqz	a0,3320 <drv_usi_usart_config_stopbits+0x54>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32ce:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    32d0:	4705                	li	a4,1
    32d2:	0007a023          	sw	zero,0(a5)
    switch (stopbit) {
    32d6:	02e58d63          	beq	a1,a4,3310 <drv_usi_usart_config_stopbits+0x44>
    32da:	c989                	beqz	a1,32ec <drv_usi_usart_config_stopbits+0x20>
    32dc:	4709                	li	a4,2
    32de:	02e58163          	beq	a1,a4,3300 <drv_usi_usart_config_stopbits+0x34>
            return ERR_USART(USART_ERROR_STOP_BITS);
    32e2:	81020537          	lui	a0,0x81020
    32e6:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60ff008a>
    32ea:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    32ec:	4f98                	lw	a4,24(a5)
    32ee:	03377713          	andi	a4,a4,51
    32f2:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1;
    32f4:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    32f6:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    32f8:	473d                	li	a4,15
    32fa:	c398                	sw	a4,0(a5)
    return 0;
    32fc:	4501                	li	a0,0
    32fe:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3300:	4f98                	lw	a4,24(a5)
    3302:	03377713          	andi	a4,a4,51
    3306:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1_5;
    3308:	4f98                	lw	a4,24(a5)
    330a:	00476713          	ori	a4,a4,4
    330e:	b7e5                	j	32f6 <drv_usi_usart_config_stopbits+0x2a>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3310:	4f98                	lw	a4,24(a5)
    3312:	03377713          	andi	a4,a4,51
    3316:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3318:	4f98                	lw	a4,24(a5)
    331a:	00876713          	ori	a4,a4,8
    331e:	bfe1                	j	32f6 <drv_usi_usart_config_stopbits+0x2a>
    USART_NULL_PARAM_CHK(handle);
    3320:	81020537          	lui	a0,0x81020
    3324:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3328:	8082                	ret

0000332a <drv_usi_usart_config_databits>:
    USART_NULL_PARAM_CHK(handle);
    332a:	c52d                	beqz	a0,3394 <drv_usi_usart_config_databits+0x6a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    332c:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    332e:	4705                	li	a4,1
    3330:	0007a023          	sw	zero,0(a5)
    switch (databits) {
    3334:	02e58863          	beq	a1,a4,3364 <drv_usi_usart_config_databits+0x3a>
    3338:	cd81                	beqz	a1,3350 <drv_usi_usart_config_databits+0x26>
    333a:	4709                	li	a4,2
    333c:	02e58c63          	beq	a1,a4,3374 <drv_usi_usart_config_databits+0x4a>
    3340:	470d                	li	a4,3
    3342:	04e58163          	beq	a1,a4,3384 <drv_usi_usart_config_databits+0x5a>
            return ERR_USART(USART_ERROR_DATA_BITS);
    3346:	81020537          	lui	a0,0x81020
    334a:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60ff0088>
    334e:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    3350:	4f98                	lw	a4,24(a5)
    3352:	03c77713          	andi	a4,a4,60
    3356:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_5;
    3358:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    335a:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    335c:	473d                	li	a4,15
    335e:	c398                	sw	a4,0(a5)
    return 0;
    3360:	4501                	li	a0,0
    3362:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    3364:	4f98                	lw	a4,24(a5)
    3366:	03c77713          	andi	a4,a4,60
    336a:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_6;
    336c:	4f98                	lw	a4,24(a5)
    336e:	00176713          	ori	a4,a4,1
    3372:	b7e5                	j	335a <drv_usi_usart_config_databits+0x30>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    3374:	4f98                	lw	a4,24(a5)
    3376:	03c77713          	andi	a4,a4,60
    337a:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_7;
    337c:	4f98                	lw	a4,24(a5)
    337e:	00276713          	ori	a4,a4,2
    3382:	bfe1                	j	335a <drv_usi_usart_config_databits+0x30>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    3384:	4f98                	lw	a4,24(a5)
    3386:	03c77713          	andi	a4,a4,60
    338a:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    338c:	4f98                	lw	a4,24(a5)
    338e:	00376713          	ori	a4,a4,3
    3392:	b7e1                	j	335a <drv_usi_usart_config_databits+0x30>
    USART_NULL_PARAM_CHK(handle);
    3394:	81020537          	lui	a0,0x81020
    3398:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    339c:	8082                	ret

0000339e <wj_usi_usart_irqhandler>:
    }
}

void wj_usi_usart_irqhandler(int idx)
{
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    339e:	03800793          	li	a5,56
    33a2:	02f507b3          	mul	a5,a0,a5
    33a6:	200026b7          	lui	a3,0x20002
    33aa:	9fc68713          	addi	a4,a3,-1540 # 200019fc <usi_usart_instance>
{
    33ae:	1101                	addi	sp,sp,-32
    33b0:	ca26                	sw	s1,20(sp)
    33b2:	cc22                	sw	s0,24(sp)
    33b4:	ce06                	sw	ra,28(sp)
    33b6:	842a                	mv	s0,a0
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    33b8:	97ba                	add	a5,a5,a4
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33ba:	4384                	lw	s1,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    33bc:	48f8                	lw	a4,84(s1)
    33be:	c03a                	sw	a4,0(sp)
    33c0:	073a                	slli	a4,a4,0xe
    33c2:	8339                	srli	a4,a4,0xe
    33c4:	c43a                	sw	a4,8(sp)

    if (intr_state & USI_INT_TX_EMPTY) {
    33c6:	4702                	lw	a4,0(sp)
    33c8:	00277613          	andi	a2,a4,2
    33cc:	9fc68713          	addi	a4,a3,-1540
    33d0:	c23a                	sw	a4,4(sp)
    33d2:	ce1d                	beqz	a2,3410 <wj_usi_usart_irqhandler+0x72>
    if (usart_priv->tx_total_num == 0) {
    33d4:	4b94                	lw	a3,16(a5)
    33d6:	ca9d                	beqz	a3,340c <wj_usi_usart_irqhandler+0x6e>
    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    33d8:	5390                	lw	a2,32(a5)
    33da:	0ad66f63          	bltu	a2,a3,3498 <wj_usi_usart_irqhandler+0xfa>
        addr->USI_INTR_EN &= (~USI_INT_TX_EMPTY);
    33de:	48b0                	lw	a2,80(s1)
    33e0:	9a75                	andi	a2,a2,-3
    33e2:	c8b0                	sw	a2,80(s1)
        addr->USI_INTR_EN |= USI_INT_UART_STOP;
    33e4:	48b0                	lw	a2,80(s1)
    33e6:	40066613          	ori	a2,a2,1024
    33ea:	c8b0                	sw	a2,80(s1)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    33ec:	d7d4                	sw	a3,44(a5)
        if (usart_priv->cb_event) {
    33ee:	4794                	lw	a3,8(a5)
        usart_priv->tx_cnt = 0;
    33f0:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    33f4:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    33f8:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    33fc:	0007a823          	sw	zero,16(a5)
        if (usart_priv->cb_event) {
    3400:	c691                	beqz	a3,340c <wj_usi_usart_irqhandler+0x6e>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_SEND_COMPLETE);
    3402:	5bc8                	lw	a0,52(a5)
    3404:	4581                	li	a1,0
    3406:	c63e                	sw	a5,12(sp)
    3408:	9682                	jalr	a3
    340a:	47b2                	lw	a5,12(sp)
        ck_usart_intr_threshold_empty(usart_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    340c:	4689                	li	a3,2
    340e:	d0b4                	sw	a3,96(s1)
    }

    if (intr_state & USI_INT_RX_THOLD) {
    3410:	4702                	lw	a4,0(sp)
    3412:	02077693          	andi	a3,a4,32
    3416:	ca81                	beqz	a3,3426 <wj_usi_usart_irqhandler+0x88>
        ck_usart_intr_recv_data(usart_priv);
    3418:	853e                	mv	a0,a5
    341a:	c63e                	sw	a5,12(sp)
    341c:	3349                	jal	319e <ck_usart_intr_recv_data>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    341e:	47b2                	lw	a5,12(sp)
    3420:	02000693          	li	a3,32
    3424:	d0b4                	sw	a3,96(s1)
    }

    if (intr_state & USI_INT_UART_STOP) {
    3426:	4702                	lw	a4,0(sp)
    3428:	40077693          	andi	a3,a4,1024
    342c:	c685                	beqz	a3,3454 <wj_usi_usart_irqhandler+0xb6>
        if (USI_FIFO_STA_RX_NUM(addr) > 0) {
    342e:	44d4                	lw	a3,12(s1)
    3430:	82c1                	srli	a3,a3,0x10
    3432:	8afd                	andi	a3,a3,31
    3434:	ce89                	beqz	a3,344e <wj_usi_usart_irqhandler+0xb0>
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    3436:	03800693          	li	a3,56
    343a:	02d406b3          	mul	a3,s0,a3
    343e:	4712                	lw	a4,4(sp)
    3440:	96ba                	add	a3,a3,a4
    3442:	46d0                	lw	a2,12(a3)
    3444:	ce41                	beqz	a2,34dc <wj_usi_usart_irqhandler+0x13e>
    3446:	4ad4                	lw	a3,20(a3)
    3448:	cad1                	beqz	a3,34dc <wj_usi_usart_irqhandler+0x13e>
        ck_usart_intr_recv_data(usart_priv);
    344a:	853e                	mv	a0,a5
    344c:	3b89                	jal	319e <ck_usart_intr_recv_data>
            ck_usart_intr_char_timeout(usart_priv);     //receive small data
        }

        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    344e:	02000793          	li	a5,32
    3452:	d0bc                	sw	a5,96(s1)
    }

    if (intr_state & USI_INT_UART_PERR) {
    3454:	4782                	lw	a5,0(sp)
    3456:	01479713          	slli	a4,a5,0x14
    345a:	02075863          	bgez	a4,348a <wj_usi_usart_irqhandler+0xec>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    345e:	03800793          	li	a5,56
    3462:	02f40433          	mul	s0,s0,a5
    3466:	4792                	lw	a5,4(sp)
    3468:	943e                	add	s0,s0,a5
    346a:	401c                	lw	a5,0(s0)
    addr->USI_EN &= ~USI_RX_FIFO_EN;
    346c:	4394                	lw	a3,0(a5)
    346e:	9add                	andi	a3,a3,-9
    3470:	c394                	sw	a3,0(a5)
    addr->USI_EN |= USI_RX_FIFO_EN;
    3472:	4394                	lw	a3,0(a5)
    3474:	0086e693          	ori	a3,a3,8
    3478:	c394                	sw	a3,0(a5)
    if (usart_priv->cb_event) {
    347a:	441c                	lw	a5,8(s0)
    347c:	c781                	beqz	a5,3484 <wj_usi_usart_irqhandler+0xe6>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RX_PARITY_ERROR);
    347e:	5848                	lw	a0,52(s0)
    3480:	45a5                	li	a1,9
    3482:	9782                	jalr	a5
        ck_usart_intr_recv_line(usart_priv);
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3484:	02000793          	li	a5,32
    3488:	d0bc                	sw	a5,96(s1)
    }

    addr->USI_INTR_CLR = intr_state;
    348a:	47a2                	lw	a5,8(sp)
}
    348c:	40f2                	lw	ra,28(sp)
    348e:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    3490:	d0bc                	sw	a5,96(s1)
}
    3492:	44d2                	lw	s1,20(sp)
    3494:	6105                	addi	sp,sp,32
    3496:	8082                	ret
        uint32_t remain_txdata  = usart_priv->tx_total_num - usart_priv->tx_cnt;
    3498:	538c                	lw	a1,32(a5)
    349a:	40b685b3          	sub	a1,a3,a1
        uint32_t txdata_num = (remain_txdata > (USI_TX_MAX_FIFO - 1)) ? (USI_TX_MAX_FIFO - 1) : remain_txdata;
    349e:	46bd                	li	a3,15
    34a0:	00b6f363          	bgeu	a3,a1,34a6 <wj_usi_usart_irqhandler+0x108>
    34a4:	45bd                	li	a1,15
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    34a6:	03800693          	li	a3,56
    34aa:	02d406b3          	mul	a3,s0,a3
    34ae:	4712                	lw	a4,4(sp)
        volatile uint32_t i = 0u;
    34b0:	c802                	sw	zero,16(sp)
        for (i = 0; i < txdata_num; i++) {
    34b2:	c802                	sw	zero,16(sp)
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    34b4:	96ba                	add	a3,a3,a4
        for (i = 0; i < txdata_num; i++) {
    34b6:	4642                	lw	a2,16(sp)
    34b8:	00b66563          	bltu	a2,a1,34c2 <wj_usi_usart_irqhandler+0x124>
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    34bc:	4689                	li	a3,2
    34be:	d0b4                	sw	a3,96(s1)
    34c0:	b7b1                	j	340c <wj_usi_usart_irqhandler+0x6e>
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    34c2:	4e90                	lw	a2,24(a3)
    34c4:	00064503          	lbu	a0,0(a2)
            usart_priv->tx_buf++;
    34c8:	0605                	addi	a2,a2,1
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    34ca:	c488                	sw	a0,8(s1)
            usart_priv->tx_cnt++;
    34cc:	5288                	lw	a0,32(a3)
            usart_priv->tx_buf++;
    34ce:	ce90                	sw	a2,24(a3)
            usart_priv->tx_cnt++;
    34d0:	0505                	addi	a0,a0,1
    34d2:	d288                	sw	a0,32(a3)
        for (i = 0; i < txdata_num; i++) {
    34d4:	4642                	lw	a2,16(sp)
    34d6:	0605                	addi	a2,a2,1
    34d8:	c832                	sw	a2,16(sp)
    34da:	bff1                	j	34b6 <wj_usi_usart_irqhandler+0x118>
    if (usart_priv->cb_event) {
    34dc:	03800793          	li	a5,56
    34e0:	02f407b3          	mul	a5,s0,a5
    34e4:	4712                	lw	a4,4(sp)
    34e6:	97ba                	add	a5,a5,a4
    34e8:	4794                	lw	a3,8(a5)
    34ea:	c689                	beqz	a3,34f4 <wj_usi_usart_irqhandler+0x156>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    34ec:	5bc8                	lw	a0,52(a5)
    34ee:	45b9                	li	a1,14
    34f0:	9682                	jalr	a3
    34f2:	bfb1                	j	344e <wj_usi_usart_irqhandler+0xb0>
        wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34f4:	439c                	lw	a5,0(a5)
        addr->USI_EN &= ~USI_RX_FIFO_EN;
    34f6:	4394                	lw	a3,0(a5)
    34f8:	9add                	andi	a3,a3,-9
    34fa:	c394                	sw	a3,0(a5)
        addr->USI_EN |= USI_RX_FIFO_EN;
    34fc:	4394                	lw	a3,0(a5)
    34fe:	0086e693          	ori	a3,a3,8
    3502:	c394                	sw	a3,0(a5)
    3504:	b7a9                	j	344e <wj_usi_usart_irqhandler+0xb0>

00003506 <drv_usi_usart_putchar>:
  \return      error code
*/
int32_t drv_usi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3506:	4118                	lw	a4,0(a0)
    //addr->USI_EN = 0xb;
    //addr->USI_EN = 0xf;
    addr->USI_TX_RX_FIFO = ch;
    3508:	c70c                	sw	a1,8(a4)

    while (!(addr->USI_FIFO_STA & 0x1));
    350a:	475c                	lw	a5,12(a4)
    350c:	8b85                	andi	a5,a5,1
    350e:	dff5                	beqz	a5,350a <drv_usi_usart_putchar+0x4>

    return 0;
}
    3510:	4501                	li	a0,0
    3512:	8082                	ret

00003514 <drv_usi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event event call back function \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t drv_usi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    3514:	1111                	addi	sp,sp,-28
    3516:	c02e                	sw	a1,0(sp)
    //initialize instace
    uint32_t base;
    uint32_t irq;
    void *handler;

    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    3518:	0074                	addi	a3,sp,12
    351a:	0030                	addi	a2,sp,8
    351c:	004c                	addi	a1,sp,4
{
    351e:	c826                	sw	s1,16(sp)
    3520:	cc06                	sw	ra,24(sp)
    3522:	ca22                	sw	s0,20(sp)
    3524:	84aa                	mv	s1,a0
    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    3526:	2c39                	jal	3744 <target_usi_usart_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    3528:	4789                	li	a5,2
    352a:	00a7f963          	bgeu	a5,a0,353c <drv_usi_usart_initialize+0x28>
        return NULL;
    352e:	4401                	li	s0,0
    addr->USI_MODE_SEL = USI_MODE_UART;
    drv_irq_register(usart_priv->irq, handler);
    drv_irq_enable(usart_priv->irq);

    return usart_priv;
}
    3530:	8522                	mv	a0,s0
    3532:	40e2                	lw	ra,24(sp)
    3534:	4452                	lw	s0,20(sp)
    3536:	44c2                	lw	s1,16(sp)
    3538:	0171                	addi	sp,sp,28
    353a:	8082                	ret
    ret = drv_usi_initialize(idx);
    353c:	8526                	mv	a0,s1
    353e:	f3eff0ef          	jal	ra,2c7c <drv_usi_initialize>
    if (ret < 0) {
    3542:	fe0546e3          	bltz	a0,352e <drv_usi_usart_initialize+0x1a>
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3546:	03800413          	li	s0,56
    354a:	028487b3          	mul	a5,s1,s0
    usart_priv->irq = irq;
    354e:	4722                	lw	a4,8(sp)
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3550:	20002437          	lui	s0,0x20002
    3554:	9fc40413          	addi	s0,s0,-1540 # 200019fc <usi_usart_instance>
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    3558:	45c1                	li	a1,16
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    355a:	943e                	add	s0,s0,a5
    usart_priv->irq = irq;
    355c:	c058                	sw	a4,4(s0)
    usart_priv->base = base;
    355e:	4792                	lw	a5,4(sp)
    usart_priv->cb_event = cb_event;
    3560:	4702                	lw	a4,0(sp)
    usart_priv->idx = idx;
    3562:	d844                	sw	s1,52(s0)
    usart_priv->base = base;
    3564:	c01c                	sw	a5,0(s0)
    usart_priv->cb_event = cb_event;
    3566:	c418                	sw	a4,8(s0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    3568:	6705                	lui	a4,0x1
    356a:	f9870713          	addi	a4,a4,-104 # f98 <__divdf3+0xe8>
    addr->USI_EN = 0x0;
    356e:	0007a023          	sw	zero,0(a5)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    3572:	cff8                	sw	a4,92(a5)
    addr->USI_INTR_EN = WJ_UART_INT_ENABLE_DEFAUL;
    3574:	cbb8                	sw	a4,80(a5)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    3576:	853e                	mv	a0,a5
    3578:	c03e                	sw	a5,0(sp)
    357a:	e8aff0ef          	jal	ra,2c04 <wj_usi_set_rxfifo_th>
    addr->USI_MODE_SEL = USI_MODE_UART;
    357e:	4782                	lw	a5,0(sp)
    drv_irq_register(usart_priv->irq, handler);
    3580:	4048                	lw	a0,4(s0)
    3582:	45b2                	lw	a1,12(sp)
    addr->USI_MODE_SEL = USI_MODE_UART;
    3584:	0007a223          	sw	zero,4(a5)
    drv_irq_register(usart_priv->irq, handler);
    3588:	e6cff0ef          	jal	ra,2bf4 <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    358c:	4048                	lw	a0,4(s0)
    358e:	e4eff0ef          	jal	ra,2bdc <drv_irq_enable>
    return usart_priv;
    3592:	bf79                	j	3530 <drv_usi_usart_initialize+0x1c>

00003594 <drv_usi_usart_config>:
                             uint32_t baud,
                             usart_mode_e mode,
                             usart_parity_e parity,
                             usart_stop_bits_e stopbits,
                             usart_data_bits_e bits)
{
    3594:	1111                	addi	sp,sp,-28
    3596:	c826                	sw	s1,16(sp)
    int32_t ret;
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3598:	4104                	lw	s1,0(a0)
{
    359a:	ca22                	sw	s0,20(sp)
    359c:	cc06                	sw	ra,24(sp)

    addr->USI_EN = 0x0;
    359e:	0004a023          	sw	zero,0(s1)
{
    35a2:	842a                	mv	s0,a0
    35a4:	c632                	sw	a2,12(sp)
    35a6:	c436                	sw	a3,8(sp)
    35a8:	c03a                	sw	a4,0(sp)
    35aa:	c23e                	sw	a5,4(sp)
    /* control the data_bit of the usart*/
    ret = drv_usi_usart_config_baudrate(handle, baud);
    35ac:	39a1                	jal	3204 <drv_usi_usart_config_baudrate>

    if (ret < 0) {
    35ae:	02054b63          	bltz	a0,35e4 <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control the parity of the usart*/
    ret = drv_usi_usart_config_parity(handle, parity);
    35b2:	46a2                	lw	a3,8(sp)
    35b4:	8522                	mv	a0,s0
    35b6:	85b6                	mv	a1,a3
    35b8:	3955                	jal	326c <drv_usi_usart_config_parity>

    if (ret < 0) {
    35ba:	02054563          	bltz	a0,35e4 <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control mode of the usart*/
    ret = drv_usi_usart_config_mode(handle, mode);
    35be:	4632                	lw	a2,12(sp)
    35c0:	8522                	mv	a0,s0
    35c2:	85b2                	mv	a1,a2
    35c4:	3149                	jal	3246 <drv_usi_usart_config_mode>

    if (ret < 0) {
    35c6:	00054f63          	bltz	a0,35e4 <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = drv_usi_usart_config_stopbits(handle, stopbits);
    35ca:	4582                	lw	a1,0(sp)
    35cc:	8522                	mv	a0,s0
    35ce:	39fd                	jal	32cc <drv_usi_usart_config_stopbits>

    if (ret < 0) {
    35d0:	00054a63          	bltz	a0,35e4 <drv_usi_usart_config+0x50>
        return ret;
    }

    ret = drv_usi_usart_config_databits(handle, bits);
    35d4:	4592                	lw	a1,4(sp)
    35d6:	8522                	mv	a0,s0
    35d8:	3b89                	jal	332a <drv_usi_usart_config_databits>

    if (ret < 0) {
    35da:	00054563          	bltz	a0,35e4 <drv_usi_usart_config+0x50>
        return ret;
    }

    addr->USI_EN = 0xf;
    35de:	47bd                	li	a5,15
    35e0:	c09c                	sw	a5,0(s1)
    return 0;
    35e2:	4501                	li	a0,0
}
    35e4:	40e2                	lw	ra,24(sp)
    35e6:	4452                	lw	s0,20(sp)
    35e8:	44c2                	lw	s1,16(sp)
    35ea:	0171                	addi	sp,sp,28
    35ec:	8082                	ret

000035ee <drv_usi_usart_send>:
  \param[in]   num   Number of data items to send
  \return      error code
*/
int32_t drv_usi_usart_send(usart_handle_t handle, const void *data, uint32_t num)
{
    USART_NULL_PARAM_CHK(handle);
    35ee:	cd05                	beqz	a0,3626 <drv_usi_usart_send+0x38>
    USART_NULL_PARAM_CHK(data);
    35f0:	c99d                	beqz	a1,3626 <drv_usi_usart_send+0x38>

    if (num == 0) {
    35f2:	ca15                	beqz	a2,3626 <drv_usi_usart_send+0x38>
        return ERR_USART(DRV_ERROR_PARAMETER);
    }

    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    35f4:	411c                	lw	a5,0(a0)

    usart_priv->tx_buf = (uint8_t *)data;
    usart_priv->tx_total_num = num;
    usart_priv->tx_cnt = 0;
    35f6:	02052023          	sw	zero,32(a0)
    usart_priv->tx_busy = 1;
    35fa:	4705                	li	a4,1
    35fc:	d158                	sw	a4,36(a0)
    usart_priv->last_tx_num = 0;

    /* enable the interrupt*/
    addr->USI_INTR_UNMASK   |= USI_INT_TX_EMPTY;
    35fe:	4ff8                	lw	a4,92(a5)
    usart_priv->tx_buf = (uint8_t *)data;
    3600:	cd0c                	sw	a1,24(a0)
    usart_priv->tx_total_num = num;
    3602:	c910                	sw	a2,16(a0)
    usart_priv->last_tx_num = 0;
    3604:	02052623          	sw	zero,44(a0)
    addr->USI_INTR_UNMASK   |= USI_INT_TX_EMPTY;
    3608:	00276713          	ori	a4,a4,2
    360c:	cff8                	sw	a4,92(a5)
    addr->USI_INTR_EN       |= USI_INT_TX_EMPTY;
    360e:	4bb8                	lw	a4,80(a5)
    addr->USI_INTR_EN       &= ~USI_INT_UART_STOP;

    addr->USI_EN = 0xf;
    return 0;
    3610:	4501                	li	a0,0
    addr->USI_INTR_EN       |= USI_INT_TX_EMPTY;
    3612:	00276713          	ori	a4,a4,2
    3616:	cbb8                	sw	a4,80(a5)
    addr->USI_INTR_EN       &= ~USI_INT_UART_STOP;
    3618:	4bb8                	lw	a4,80(a5)
    361a:	bff77713          	andi	a4,a4,-1025
    361e:	cbb8                	sw	a4,80(a5)
    addr->USI_EN = 0xf;
    3620:	473d                	li	a4,15
    3622:	c398                	sw	a4,0(a5)
    return 0;
    3624:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    3626:	81020537          	lui	a0,0x81020
    362a:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    362e:	8082                	ret

00003630 <drv_usi_usart_receive>:
  \param[in]   num   Number of data items to receive
  \return      error code
*/
int32_t drv_usi_usart_receive(usart_handle_t handle, void *data, uint32_t num)
{
    USART_NULL_PARAM_CHK(handle);
    3630:	cd01                	beqz	a0,3648 <drv_usi_usart_receive+0x18>
    USART_NULL_PARAM_CHK(data);
    3632:	c999                	beqz	a1,3648 <drv_usi_usart_receive+0x18>

    wj_usi_usart_priv_t *usart_priv = handle;

    usart_priv->rx_buf = (uint8_t *)data;   // Save receive buffer usart
    usart_priv->rx_total_num = num;         // Save number of data to be received
    usart_priv->rx_cnt = 0;
    3634:	00052e23          	sw	zero,28(a0)
    usart_priv->rx_busy = 1;
    3638:	4785                	li	a5,1
    usart_priv->rx_buf = (uint8_t *)data;   // Save receive buffer usart
    363a:	c94c                	sw	a1,20(a0)
    usart_priv->rx_total_num = num;         // Save number of data to be received
    363c:	c550                	sw	a2,12(a0)
    usart_priv->rx_busy = 1;
    363e:	d51c                	sw	a5,40(a0)
    usart_priv->last_rx_num = 0;
    3640:	02052823          	sw	zero,48(a0)
    return 0;
    3644:	4501                	li	a0,0
    3646:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    3648:	81020537          	lui	a0,0x81020
    364c:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3650:	8082                	ret

00003652 <drv_usi_usart_abort_receive>:
  \param[in]   handle  usart handle to operate.
  \return      error code
*/
int32_t drv_usi_usart_abort_receive(usart_handle_t handle)
{
    USART_NULL_PARAM_CHK(handle);
    3652:	c509                	beqz	a0,365c <drv_usi_usart_abort_receive+0xa>
    wj_usi_usart_priv_t *usart_priv = handle;

    usart_priv->rx_cnt = usart_priv->rx_total_num;
    3654:	455c                	lw	a5,12(a0)
    3656:	cd5c                	sw	a5,28(a0)
    return 0;
    3658:	4501                	li	a0,0
    365a:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    365c:	81020537          	lui	a0,0x81020
    3660:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3664:	8082                	ret

00003666 <drv_usi_usart_get_status>:
  \brief       Get USART status.
  \param[in]   handle  usart handle to operate.
  \return      USART status \ref usart_status_t
*/
usart_status_t drv_usi_usart_get_status(usart_handle_t handle)
{
    3666:	1171                	addi	sp,sp,-4
    if (handle == NULL) {
    3668:	c919                	beqz	a0,367e <drv_usi_usart_get_status+0x18>
    }

    usart_status_t usart_status = {0};
    wj_usi_usart_priv_t *usart_priv = handle;

    usart_status.tx_busy = usart_priv->tx_busy;
    366a:	515c                	lw	a5,36(a0)
    usart_status.rx_busy = usart_priv->rx_busy;
    366c:	5518                	lw	a4,40(a0)
    usart_status.tx_enable  = 1;
    usart_status.rx_enable  = 1;

    return usart_status;
    366e:	0017f513          	andi	a0,a5,1
    3672:	00177793          	andi	a5,a4,1
    3676:	0786                	slli	a5,a5,0x1
    3678:	8d5d                	or	a0,a0,a5
    367a:	18056513          	ori	a0,a0,384
}
    367e:	0111                	addi	sp,sp,4
    3680:	8082                	ret

00003682 <csi_usart_putchar>:
  \param[in]   ch  the input character
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    return drv_usi_usart_putchar(handle, ch);
    3682:	b551                	j	3506 <drv_usi_usart_putchar>

00003684 <csi_usart_initialize>:
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    return drv_usi_usart_initialize(idx, cb_event);
    3684:	bd41                	j	3514 <drv_usi_usart_initialize>

00003686 <csi_usart_config>:
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    return drv_usi_usart_config(handle, baud, mode, parity, stopbits, bits);
    3686:	b739                	j	3594 <drv_usi_usart_config>

00003688 <csi_usart_send>:
  \param[in]   num   Number of data items to send
  \return      error code
*/
int32_t csi_usart_send(usart_handle_t handle, const void *data, uint32_t num)
{
    return drv_usi_usart_send(handle, data, num);
    3688:	b79d                	j	35ee <drv_usi_usart_send>

0000368a <csi_usart_receive>:
  \param[in]   num   Number of data items to receive
  \return      error code
*/
int32_t csi_usart_receive(usart_handle_t handle, void *data, uint32_t num)
{
    return drv_usi_usart_receive(handle, data, num);
    368a:	b75d                	j	3630 <drv_usi_usart_receive>

0000368c <csi_usart_abort_receive>:
  \param[in]   handle  usart handle to operate.
  \return      error code
*/
int32_t csi_usart_abort_receive(usart_handle_t handle)
{
    return drv_usi_usart_abort_receive(handle);
    368c:	b7d9                	j	3652 <drv_usi_usart_abort_receive>

0000368e <csi_usart_get_status>:
  \param[in]   handle  usart handle to operate.
  \return      USART status \ref usart_status_t
*/
usart_status_t csi_usart_get_status(usart_handle_t handle)
{
    return drv_usi_usart_get_status(handle);
    368e:	bfe1                	j	3666 <drv_usi_usart_get_status>

00003690 <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
    3690:	47bd                	li	a5,15
    3692:	04a7c163          	blt	a5,a0,36d4 <target_get_timer+0x44>
        return -1;
    }

    if (base != NULL) {
    3696:	c991                	beqz	a1,36aa <target_get_timer+0x1a>
        *base = sg_timer_config[idx].base;
    3698:	47b1                	li	a5,12
    369a:	02f50733          	mul	a4,a0,a5
    369e:	6799                	lui	a5,0x6
    36a0:	c4878793          	addi	a5,a5,-952 # 5c48 <sg_timer_config>
    36a4:	97ba                	add	a5,a5,a4
    36a6:	439c                	lw	a5,0(a5)
    36a8:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    36aa:	ca11                	beqz	a2,36be <target_get_timer+0x2e>
        *irq = sg_timer_config[idx].irq;
    36ac:	47b1                	li	a5,12
    36ae:	02f50733          	mul	a4,a0,a5
    36b2:	6799                	lui	a5,0x6
    36b4:	c4878793          	addi	a5,a5,-952 # 5c48 <sg_timer_config>
    36b8:	97ba                	add	a5,a5,a4
    36ba:	43dc                	lw	a5,4(a5)
    36bc:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    36be:	ce81                	beqz	a3,36d6 <target_get_timer+0x46>
        *handler = sg_timer_config[idx].handler;
    36c0:	47b1                	li	a5,12
    36c2:	02f50733          	mul	a4,a0,a5
    36c6:	6799                	lui	a5,0x6
    36c8:	c4878793          	addi	a5,a5,-952 # 5c48 <sg_timer_config>
    36cc:	97ba                	add	a5,a5,a4
    36ce:	479c                	lw	a5,8(a5)
    36d0:	c29c                	sw	a5,0(a3)
    36d2:	8082                	ret
        return -1;
    36d4:	557d                	li	a0,-1
    }

    return idx;
}
    36d6:	8082                	ret

000036d8 <target_gpio_port_init>:
} gpio_pin_map_t;

int32_t target_gpio_port_init(port_name_e port, uint32_t *base, uint32_t *irq, void **handler, uint32_t *pin_num)
{
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
        return -1;
    36d8:	57fd                	li	a5,-1
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
    36da:	c195                	beqz	a1,36fe <target_gpio_port_init+0x26>
    36dc:	c20d                	beqz	a2,36fe <target_gpio_port_init+0x26>
    36de:	c285                	beqz	a3,36fe <target_gpio_port_init+0x26>
    36e0:	cf19                	beqz	a4,36fe <target_gpio_port_init+0x26>
    }

    if (sg_gpio_config[0].port == port) {
    36e2:	ed11                	bnez	a0,36fe <target_gpio_port_init+0x26>
        if (base != NULL) {
            *base = sg_gpio_config[0].base;
    36e4:	600187b7          	lui	a5,0x60018
    36e8:	c19c                	sw	a5,0(a1)
        }

        if (irq != NULL) {
            *irq = sg_gpio_config[0].irq;
    36ea:	47c1                	li	a5,16
    36ec:	c21c                	sw	a5,0(a2)
        }

        if (pin_num != NULL) {
            *pin_num = sg_gpio_config[0].pin_num;
    36ee:	47fd                	li	a5,31
    36f0:	c31c                	sw	a5,0(a4)
        }

        if (handler != NULL) {
            *handler = (void *)GPIO0_IRQHandler;
    36f2:	000047b7          	lui	a5,0x4
    36f6:	bac78793          	addi	a5,a5,-1108 # 3bac <GPIO0_IRQHandler>
    36fa:	c29c                	sw	a5,0(a3)
        }

        return 0;
    36fc:	4781                	li	a5,0
    }

    return -1;
}
    36fe:	853e                	mv	a0,a5
    3700:	8082                	ret

00003702 <target_gpio_pin_init>:

int32_t target_gpio_pin_init(int32_t gpio_pin, uint32_t *port_idx)
{
    *port_idx = 0;
    3702:	0005a023          	sw	zero,0(a1)

    if (gpio_pin >= PA0 && gpio_pin <= PA31) {
    3706:	47fd                	li	a5,31
    3708:	00a7f363          	bgeu	a5,a0,370e <target_gpio_pin_init+0xc>
        return gpio_pin;
    }

    return -1;
    370c:	557d                	li	a0,-1
}
    370e:	8082                	ret

00003710 <target_usi_init>:
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
    3710:	4789                	li	a5,2
    3712:	02a7c763          	blt	a5,a0,3740 <target_usi_init+0x30>
        return -1;
    }

    if (base != NULL) {
    3716:	c991                	beqz	a1,372a <target_usi_init+0x1a>
        *base = sg_usi_config[idx].base;
    3718:	47b1                	li	a5,12
    371a:	02f50733          	mul	a4,a0,a5
    371e:	6799                	lui	a5,0x6
    3720:	d0878793          	addi	a5,a5,-760 # 5d08 <sg_usi_config>
    3724:	97ba                	add	a5,a5,a4
    3726:	439c                	lw	a5,0(a5)
    3728:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    372a:	ce01                	beqz	a2,3742 <target_usi_init+0x32>
        *irq = sg_usi_config[idx].irq;
    372c:	47b1                	li	a5,12
    372e:	02f50733          	mul	a4,a0,a5
    3732:	6799                	lui	a5,0x6
    3734:	d0878793          	addi	a5,a5,-760 # 5d08 <sg_usi_config>
    3738:	97ba                	add	a5,a5,a4
    373a:	43dc                	lw	a5,4(a5)
    373c:	c21c                	sw	a5,0(a2)
    373e:	8082                	ret
        return -1;
    3740:	557d                	li	a0,-1
    }

    return idx;
}
    3742:	8082                	ret

00003744 <target_usi_usart_init>:

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
    3744:	4789                	li	a5,2
    3746:	04a7c163          	blt	a5,a0,3788 <target_usi_usart_init+0x44>
        return -1;
    }

    if (base != NULL) {
    374a:	c991                	beqz	a1,375e <target_usi_usart_init+0x1a>
        *base = sg_usi_config[idx].base;
    374c:	47b1                	li	a5,12
    374e:	02f50733          	mul	a4,a0,a5
    3752:	6799                	lui	a5,0x6
    3754:	d0878793          	addi	a5,a5,-760 # 5d08 <sg_usi_config>
    3758:	97ba                	add	a5,a5,a4
    375a:	439c                	lw	a5,0(a5)
    375c:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    375e:	ca11                	beqz	a2,3772 <target_usi_usart_init+0x2e>
        *irq = sg_usi_config[idx].irq;
    3760:	47b1                	li	a5,12
    3762:	02f50733          	mul	a4,a0,a5
    3766:	6799                	lui	a5,0x6
    3768:	d0878793          	addi	a5,a5,-760 # 5d08 <sg_usi_config>
    376c:	97ba                	add	a5,a5,a4
    376e:	43dc                	lw	a5,4(a5)
    3770:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    3772:	ce81                	beqz	a3,378a <target_usi_usart_init+0x46>
        *handler = sg_usi_config[idx].handler;
    3774:	47b1                	li	a5,12
    3776:	02f50733          	mul	a4,a0,a5
    377a:	6799                	lui	a5,0x6
    377c:	d0878793          	addi	a5,a5,-760 # 5d08 <sg_usi_config>
    3780:	97ba                	add	a5,a5,a4
    3782:	479c                	lw	a5,8(a5)
    3784:	c29c                	sw	a5,0(a3)
    3786:	8082                	ret
        return -1;
    3788:	557d                	li	a0,-1
    }

    return idx;
}
    378a:	8082                	ret

0000378c <gpio_set_direction>:
    void *port,
    gpio_direction_e direction
)
{
    wj_oip_gpio_priv_t *gpio_priv = port;
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    378c:	4118                	lw	a4,0(a0)

    if (direction == GPIO_DIRECTION_INPUT) {
    378e:	e989                	bnez	a1,37a0 <gpio_set_direction+0x14>
        gpio_reg->SWPORT_DDR &= (~gpio_priv->mask);
    3790:	495c                	lw	a5,20(a0)
    3792:	4354                	lw	a3,4(a4)
    3794:	fff7c793          	not	a5,a5
    3798:	8ff5                	and	a5,a5,a3
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    379a:	c35c                	sw	a5,4(a4)
    } else {
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    }

    return 0;
    379c:	4501                	li	a0,0
    379e:	8082                	ret
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
    37a0:	4785                	li	a5,1
    37a2:	00f59663          	bne	a1,a5,37ae <gpio_set_direction+0x22>
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    37a6:	435c                	lw	a5,4(a4)
    37a8:	4954                	lw	a3,20(a0)
    37aa:	8fd5                	or	a5,a5,a3
    37ac:	b7fd                	j	379a <gpio_set_direction+0xe>
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    37ae:	81010537          	lui	a0,0x81010
    37b2:	08750513          	addi	a0,a0,135 # 81010087 <__heap_end+0x60fe0087>
}
    37b6:	8082                	ret

000037b8 <wj_oip_gpio_irqhandler>:
    gpio_control_reg->INTEN = val;
}

void wj_oip_gpio_irqhandler(int idx)
{
    if (idx >= CONFIG_GPIO_NUM) {
    37b8:	06a04e63          	bgtz	a0,3834 <wj_oip_gpio_irqhandler+0x7c>
        return;
    }

    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37bc:	46f1                	li	a3,28
    37be:	02d50533          	mul	a0,a0,a3
    37c2:	20002737          	lui	a4,0x20002
    37c6:	aa470793          	addi	a5,a4,-1372 # 20001aa4 <gpio_handle>
{
    37ca:	1141                	addi	sp,sp,-16
    37cc:	c422                	sw	s0,8(sp)
    37ce:	20002437          	lui	s0,0x20002
    37d2:	c226                	sw	s1,4(sp)
    37d4:	c606                	sw	ra,12(sp)
    37d6:	ac040413          	addi	s0,s0,-1344 # 20001ac0 <gpio_pin_handle>

    uint32_t value = gpio_control_reg->INTSTATUS;
    37da:	4481                	li	s1,0
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37dc:	953e                	add	a0,a0,a5
    37de:	411c                	lw	a5,0(a0)
    uint32_t value = gpio_control_reg->INTSTATUS;
    37e0:	aa470713          	addi	a4,a4,-1372
    37e4:	43b0                	lw	a2,64(a5)
    uint8_t i;

    /* find the interrput pin */
    for (i = 0; i < 32; i++) {
        if (value & (1U << i)) {
    37e6:	4685                	li	a3,1
    37e8:	009696b3          	sll	a3,a3,s1
    37ec:	00c6f7b3          	and	a5,a3,a2
    37f0:	c79d                	beqz	a5,381e <wj_oip_gpio_irqhandler+0x66>
                for (j = 0; j < idx; j++) {
                    pin_idx += gpio_handle[j].pin_num;
                }
            }

            if (pin_idx >= CONFIG_GPIO_PIN_NUM) {
    37f2:	47fd                	li	a5,31
    37f4:	02f48b63          	beq	s1,a5,382a <wj_oip_gpio_irqhandler+0x72>
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    37f8:	00044783          	lbu	a5,0(s0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    37fc:	45f1                	li	a1,28
    37fe:	02b787b3          	mul	a5,a5,a1
    3802:	97ba                	add	a5,a5,a4
    3804:	439c                	lw	a5,0(a5)
    gpio_control_reg->PORTA_EOI = idx;
    3806:	c7f4                	sw	a3,76(a5)
            wj_oip_gpio_pin_priv_t *gpio_pin_priv = (wj_oip_gpio_pin_priv_t *)&gpio_pin_handle[pin_idx];

            gpio_irq_clear(gpio_pin_priv, (1 << i));  //clear the gpio interrupt

            /* execute the callback function */
            if ((gpio_event_cb_t)(gpio_pin_priv->cb)) {
    3808:	405c                	lw	a5,4(s0)
    380a:	cb91                	beqz	a5,381e <wj_oip_gpio_irqhandler+0x66>
                ((gpio_event_cb_t)(gpio_pin_priv->cb))(gpio_pin_priv->offset);
    380c:	00244503          	lbu	a0,2(s0)
    3810:	c032                	sw	a2,0(sp)
    3812:	9782                	jalr	a5
    3814:	4602                	lw	a2,0(sp)
    3816:	200027b7          	lui	a5,0x20002
    381a:	aa478713          	addi	a4,a5,-1372 # 20001aa4 <gpio_handle>
    381e:	0485                	addi	s1,s1,1
    for (i = 0; i < 32; i++) {
    3820:	02000793          	li	a5,32
    3824:	0421                	addi	s0,s0,8
    3826:	fcf490e3          	bne	s1,a5,37e6 <wj_oip_gpio_irqhandler+0x2e>
            }
        }
    }
}
    382a:	40b2                	lw	ra,12(sp)
    382c:	4422                	lw	s0,8(sp)
    382e:	4492                	lw	s1,4(sp)
    3830:	0141                	addi	sp,sp,16
    3832:	8082                	ret
    3834:	8082                	ret

00003836 <csi_gpio_port_initialize>:
                3.get gpio_port_handle
  \param[in]   port      port_name.
  \return      gpio_port_handle
*/
gpio_port_handle_t csi_gpio_port_initialize(int32_t port)
{
    3836:	1111                	addi	sp,sp,-28
    /* obtain the gpio port information */
    uint32_t base = 0u;
    uint32_t pin_num;
    uint32_t irq;
    void *handler;
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    3838:	0058                	addi	a4,sp,4
    383a:	0074                	addi	a3,sp,12
    383c:	0030                	addi	a2,sp,8
    383e:	858a                	mv	a1,sp
{
    3840:	cc06                	sw	ra,24(sp)
    3842:	ca22                	sw	s0,20(sp)
    3844:	c826                	sw	s1,16(sp)
    uint32_t base = 0u;
    3846:	c002                	sw	zero,0(sp)
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    3848:	3d41                	jal	36d8 <target_gpio_port_init>

    if (idx < 0 || idx >= CONFIG_GPIO_NUM) {
    384a:	e905                	bnez	a0,387a <csi_gpio_port_initialize+0x44>
        return NULL;
    }

    gpio_priv = &gpio_handle[idx];

    gpio_priv->base = base;
    384c:	4782                	lw	a5,0(sp)
    384e:	20002437          	lui	s0,0x20002
    3852:	aa440493          	addi	s1,s0,-1372 # 20001aa4 <gpio_handle>
    gpio_priv->irq  = irq;
    3856:	4522                	lw	a0,8(sp)
    gpio_priv->base = base;
    3858:	c09c                	sw	a5,0(s1)

#ifdef CONFIG_LPM
    csi_gpio_power_control(gpio_priv, DRV_POWER_FULL);
#endif

    drv_irq_register(gpio_priv->irq, handler);
    385a:	45b2                	lw	a1,12(sp)
    gpio_priv->pin_num  = pin_num;
    385c:	4792                	lw	a5,4(sp)
    gpio_priv->irq  = irq;
    385e:	c0c8                	sw	a0,4(s1)
    gpio_priv->pin_num  = pin_num;
    3860:	c49c                	sw	a5,8(s1)
    drv_irq_register(gpio_priv->irq, handler);
    3862:	b92ff0ef          	jal	ra,2bf4 <drv_irq_register>
    drv_irq_enable(gpio_priv->irq);
    3866:	40c8                	lw	a0,4(s1)
    3868:	b74ff0ef          	jal	ra,2bdc <drv_irq_enable>

    return (gpio_port_handle_t)gpio_priv;
    386c:	aa440513          	addi	a0,s0,-1372
}
    3870:	40e2                	lw	ra,24(sp)
    3872:	4452                	lw	s0,20(sp)
    3874:	44c2                	lw	s1,16(sp)
    3876:	0171                	addi	sp,sp,28
    3878:	8082                	ret
        return NULL;
    387a:	4501                	li	a0,0
    387c:	bfd5                	j	3870 <csi_gpio_port_initialize+0x3a>

0000387e <csi_gpio_pin_initialize>:
  \return      gpio_pin_handle
*/
gpio_pin_handle_t csi_gpio_pin_initialize(int32_t gpio_pin, gpio_event_cb_t cb_event)
{

    if (gpio_pin < 0 || gpio_pin >= CONFIG_GPIO_PIN_NUM) {
    387e:	47f9                	li	a5,30
    3880:	00a7f563          	bgeu	a5,a0,388a <csi_gpio_pin_initialize+0xc>
        return NULL;
    3884:	4781                	li	a5,0
    gpio_pin_priv->idx = pin_idx;
    gpio_pin_priv->cb = cb_event;
    gpio_pin_priv->offset = gpio_pin;

    return (gpio_pin_handle_t)gpio_pin_priv;
}
    3886:	853e                	mv	a0,a5
    3888:	8082                	ret
{
    388a:	1141                	addi	sp,sp,-16
    388c:	c422                	sw	s0,8(sp)
    388e:	842a                	mv	s0,a0
        csi_gpio_port_initialize(i);
    3890:	4501                	li	a0,0
{
    3892:	c606                	sw	ra,12(sp)
    3894:	c226                	sw	s1,4(sp)
    3896:	84ae                	mv	s1,a1
        csi_gpio_port_initialize(i);
    3898:	3f79                	jal	3836 <csi_gpio_port_initialize>
    int32_t pin_idx = target_gpio_pin_init(gpio_pin, &port_idx);
    389a:	858a                	mv	a1,sp
    389c:	8522                	mv	a0,s0
    389e:	3595                	jal	3702 <target_gpio_pin_init>
        return NULL;
    38a0:	4781                	li	a5,0
    if (pin_idx < 0) {
    38a2:	02054863          	bltz	a0,38d2 <csi_gpio_pin_initialize+0x54>
    for (i = 0; i < port_idx; i++) {
    38a6:	4682                	lw	a3,0(sp)
    38a8:	87aa                	mv	a5,a0
    38aa:	c691                	beqz	a3,38b6 <csi_gpio_pin_initialize+0x38>
        idx += (gpio_handle[i].pin_num);
    38ac:	200027b7          	lui	a5,0x20002
    38b0:	aac7a783          	lw	a5,-1364(a5) # 20001aac <gpio_handle+0x8>
    38b4:	97aa                	add	a5,a5,a0
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = &(gpio_pin_handle[idx]);
    38b6:	00379713          	slli	a4,a5,0x3
    38ba:	200027b7          	lui	a5,0x20002
    38be:	ac078793          	addi	a5,a5,-1344 # 20001ac0 <gpio_pin_handle>
    38c2:	97ba                	add	a5,a5,a4
    gpio_pin_priv->portidx = port_idx;
    38c4:	00d78023          	sb	a3,0(a5)
    gpio_pin_priv->idx = pin_idx;
    38c8:	00a780a3          	sb	a0,1(a5)
    gpio_pin_priv->cb = cb_event;
    38cc:	c3c4                	sw	s1,4(a5)
    gpio_pin_priv->offset = gpio_pin;
    38ce:	00878123          	sb	s0,2(a5)
}
    38d2:	40b2                	lw	ra,12(sp)
    38d4:	4422                	lw	s0,8(sp)
    38d6:	4492                	lw	s1,4(sp)
    38d8:	853e                	mv	a0,a5
    38da:	0141                	addi	sp,sp,16
    38dc:	8082                	ret

000038de <csi_gpio_pin_config_mode>:
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                                 gpio_mode_e mode)
{
    38de:	862e                	mv	a2,a1
    GPIO_NULL_PARAM_CHK(handle);
    38e0:	c511                	beqz	a0,38ec <csi_gpio_pin_config_mode+0xe>
    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    uint8_t offset = gpio_pin_priv->idx;

    int32_t ret = drv_pin_config_mode(gpio_pin_priv->portidx, offset, mode);
    38e2:	00154583          	lbu	a1,1(a0)
    38e6:	00054503          	lbu	a0,0(a0)
    38ea:	a615                	j	3c0e <drv_pin_config_mode>

    return ret;
}
    38ec:	81010537          	lui	a0,0x81010
    38f0:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    38f4:	8082                	ret

000038f6 <csi_gpio_pin_config_direction>:
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                                      gpio_direction_e dir)
{
    GPIO_NULL_PARAM_CHK(handle);
    38f6:	c505                	beqz	a0,391e <csi_gpio_pin_config_direction+0x28>

    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *gpio_priv = &gpio_handle[gpio_pin_priv->portidx];
    38f8:	00054783          	lbu	a5,0(a0)

    gpio_priv->dir = dir;
    38fc:	4771                	li	a4,28
    38fe:	02e78733          	mul	a4,a5,a4
    3902:	200027b7          	lui	a5,0x20002
    3906:	aa478793          	addi	a5,a5,-1372 # 20001aa4 <gpio_handle>
    390a:	97ba                	add	a5,a5,a4
    390c:	cb8c                	sw	a1,16(a5)
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    390e:	00154683          	lbu	a3,1(a0)
    3912:	4705                	li	a4,1

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    3914:	853e                	mv	a0,a5
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    3916:	00d71733          	sll	a4,a4,a3
    391a:	cbd8                	sw	a4,20(a5)
    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    391c:	bd85                	j	378c <gpio_set_direction>
    if (ret) {
        return ret;
    }

    return 0;
}
    391e:	81010537          	lui	a0,0x81010
    3922:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    3926:	8082                	ret

00003928 <csi_gpio_pin_write>:
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    3928:	cd05                	beqz	a0,3960 <csi_gpio_pin_write+0x38>

    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    392a:	00054703          	lbu	a4,0(a0)

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    392e:	46f1                	li	a3,28
    uint32_t port_value = value << offset;
    3930:	00154603          	lbu	a2,1(a0)
    port_handle->value = port_value;
    3934:	02d706b3          	mul	a3,a4,a3
    3938:	20002737          	lui	a4,0x20002
    393c:	aa470713          	addi	a4,a4,-1372 # 20001aa4 <gpio_handle>
    uint32_t port_value = value << offset;
    3940:	00c595b3          	sll	a1,a1,a2
    gpio_write(port_handle, (1 << offset));
    3944:	4785                	li	a5,1
    3946:	00c797b3          	sll	a5,a5,a2
    value &= ~(mask);
    394a:	fff7c793          	not	a5,a5

    return 0;
    394e:	4501                	li	a0,0
    port_handle->value = port_value;
    3950:	9736                	add	a4,a4,a3
    3952:	cf0c                	sw	a1,24(a4)
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3954:	4318                	lw	a4,0(a4)
    uint32_t value = gpio_reg->SWPORT_DR;
    3956:	4314                	lw	a3,0(a4)
    value &= ~(mask);
    3958:	8ff5                	and	a5,a5,a3
    value |= gpio_priv->value;
    395a:	8ddd                	or	a1,a1,a5
    gpio_reg->SWPORT_DR = value;
    395c:	c30c                	sw	a1,0(a4)
    return 0;
    395e:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3960:	81010537          	lui	a0,0x81010
    3964:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>

}
    3968:	8082                	ret

0000396a <wj_oip_timer_irqhandler>:
}

void wj_oip_timer_irqhandler(int idx)
{
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->timeout_flag = 1;
    396a:	47e1                	li	a5,24
    396c:	02f50733          	mul	a4,a0,a5
    3970:	200027b7          	lui	a5,0x20002
    3974:	bb878793          	addi	a5,a5,-1096 # 20001bb8 <timer_instance>
    3978:	97ba                	add	a5,a5,a4
    397a:	4705                	li	a4,1
    397c:	cbd8                	sw	a4,20(a5)

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    397e:	43d8                	lw	a4,4(a5)

    addr->TxEOI;

    if (timer_priv->cb_event) {
    3980:	00c7a303          	lw	t1,12(a5)
    addr->TxEOI;
    3984:	4758                	lw	a4,12(a4)
    if (timer_priv->cb_event) {
    3986:	00030463          	beqz	t1,398e <wj_oip_timer_irqhandler+0x24>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    398a:	4581                	li	a1,0
    398c:	8302                	jr	t1
    }

}
    398e:	8082                	ret

00003990 <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    3990:	1111                	addi	sp,sp,-28
    3992:	cc06                	sw	ra,24(sp)
    3994:	ca22                	sw	s0,20(sp)
    3996:	c826                	sw	s1,16(sp)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    3998:	47bd                	li	a5,15
    399a:	00a7f963          	bgeu	a5,a0,39ac <csi_timer_initialize+0x1c>
        return NULL;
    399e:	4401                	li	s0,0
        drv_irq_register(timer_priv->irq, handler);
        drv_irq_enable(timer_priv->irq);
    }

    return (timer_handle_t)timer_priv;
}
    39a0:	8522                	mv	a0,s0
    39a2:	40e2                	lw	ra,24(sp)
    39a4:	4452                	lw	s0,20(sp)
    39a6:	44c2                	lw	s1,16(sp)
    39a8:	0171                	addi	sp,sp,28
    39aa:	8082                	ret
    39ac:	84ae                	mv	s1,a1
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    39ae:	0074                	addi	a3,sp,12
    39b0:	0030                	addi	a2,sp,8
    39b2:	004c                	addi	a1,sp,4
    39b4:	c02a                	sw	a0,0(sp)
    uint32_t base = 0u;
    39b6:	c202                	sw	zero,4(sp)
    uint32_t irq = 0u;
    39b8:	c402                	sw	zero,8(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    39ba:	39d9                	jal	3690 <target_get_timer>
    if (real_idx != idx) {
    39bc:	4702                	lw	a4,0(sp)
    39be:	fea710e3          	bne	a4,a0,399e <csi_timer_initialize+0xe>
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    39c2:	4461                	li	s0,24
    39c4:	028707b3          	mul	a5,a4,s0
    39c8:	20002437          	lui	s0,0x20002
    39cc:	bb840413          	addi	s0,s0,-1096 # 20001bb8 <timer_instance>
    timer_priv->irq  = irq;
    39d0:	46a2                	lw	a3,8(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    39d2:	4501                	li	a0,0
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    39d4:	943e                	add	s0,s0,a5
    timer_priv->base = base;
    39d6:	4792                	lw	a5,4(sp)
    timer_priv->irq  = irq;
    39d8:	c414                	sw	a3,8(s0)
    timer_priv->idx = idx;
    39da:	00e40023          	sb	a4,0(s0)
    timer_priv->base = base;
    39de:	c05c                	sw	a5,4(s0)
    39e0:	c03e                	sw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    39e2:	2c35                	jal	3c1e <drv_get_timer_freq>
    39e4:	577d                	li	a4,-1
    39e6:	02a75533          	divu	a0,a4,a0
    39ea:	000f4737          	lui	a4,0xf4
    39ee:	24070713          	addi	a4,a4,576 # f4240 <__ctor_end__+0xed9c0>
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    39f2:	4782                	lw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    39f4:	02e50533          	mul	a0,a0,a4
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    39f8:	4798                	lw	a4,8(a5)
    39fa:	01e77693          	andi	a3,a4,30
    39fe:	0087c703          	lbu	a4,8(a5)
    3a02:	9b01                	andi	a4,a4,-32
    3a04:	8f55                	or	a4,a4,a3
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3a06:	c808                	sw	a0,16(s0)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3a08:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_INTMASK;
    3a0c:	4798                	lw	a4,8(a5)
    3a0e:	8b7d                	andi	a4,a4,31
    3a10:	00476693          	ori	a3,a4,4
    3a14:	0087c703          	lbu	a4,8(a5)
    3a18:	9b01                	andi	a4,a4,-32
    3a1a:	8f55                	or	a4,a4,a3
    3a1c:	00e78423          	sb	a4,8(a5)
    timer_priv->cb_event = cb_event;
    3a20:	c444                	sw	s1,12(s0)
    if (cb_event != NULL) {
    3a22:	dcbd                	beqz	s1,39a0 <csi_timer_initialize+0x10>
        drv_irq_register(timer_priv->irq, handler);
    3a24:	4408                	lw	a0,8(s0)
    3a26:	45b2                	lw	a1,12(sp)
    3a28:	9ccff0ef          	jal	ra,2bf4 <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    3a2c:	4408                	lw	a0,8(s0)
    3a2e:	9aeff0ef          	jal	ra,2bdc <drv_irq_enable>
    3a32:	b7bd                	j	39a0 <csi_timer_initialize+0x10>

00003a34 <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    3a34:	c511                	beqz	a0,3a40 <csi_timer_config+0xc>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3a36:	415c                	lw	a5,4(a0)

    switch (mode) {
    3a38:	c989                	beqz	a1,3a4a <csi_timer_config+0x16>
    3a3a:	4705                	li	a4,1
    3a3c:	02e58c63          	beq	a1,a4,3a74 <csi_timer_config+0x40>
    TIMER_NULL_PARAM_CHK(handle);
    3a40:	81070537          	lui	a0,0x81070
    3a44:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
    }

    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);

    return 0;
}
    3a48:	8082                	ret
            addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_MODE;
    3a4a:	4798                	lw	a4,8(a5)
    3a4c:	01d77693          	andi	a3,a4,29
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3a50:	0087c703          	lbu	a4,8(a5)
    return 0;
    3a54:	4501                	li	a0,0
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3a56:	9b01                	andi	a4,a4,-32
    3a58:	8f55                	or	a4,a4,a3
    3a5a:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);
    3a5e:	4798                	lw	a4,8(a5)
    3a60:	8b7d                	andi	a4,a4,31
    3a62:	01076693          	ori	a3,a4,16
    3a66:	0087c703          	lbu	a4,8(a5)
    3a6a:	9b01                	andi	a4,a4,-32
    3a6c:	8f55                	or	a4,a4,a3
    3a6e:	00e78423          	sb	a4,8(a5)
    return 0;
    3a72:	8082                	ret
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3a74:	4798                	lw	a4,8(a5)
    3a76:	8b7d                	andi	a4,a4,31
    3a78:	00276693          	ori	a3,a4,2
    3a7c:	bfd1                	j	3a50 <csi_timer_config+0x1c>

00003a7e <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    3a7e:	c501                	beqz	a0,3a86 <csi_timer_set_timeout+0x8>

    wj_oip_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    3a80:	c90c                	sw	a1,16(a0)
    return 0;
    3a82:	4501                	li	a0,0
    3a84:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3a86:	81070537          	lui	a0,0x81070
    3a8a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3a8e:	8082                	ret

00003a90 <csi_timer_start>:
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    3a90:	c545                	beqz	a0,3b38 <csi_timer_start+0xa8>
{
    3a92:	1141                	addi	sp,sp,-16
    3a94:	c606                	sw	ra,12(sp)
    3a96:	c422                	sw	s0,8(sp)
    3a98:	c226                	sw	s1,4(sp)
    3a9a:	842a                	mv	s0,a0

    wj_oip_timer_priv_t *timer_priv = handle;

    timer_priv->timeout_flag = 0;
    3a9c:	00052a23          	sw	zero,20(a0)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    3aa0:	00054503          	lbu	a0,0(a0)
    3aa4:	000f44b7          	lui	s1,0xf4
    3aa8:	24048493          	addi	s1,s1,576 # f4240 <__ctor_end__+0xed9c0>
    3aac:	2a8d                	jal	3c1e <drv_get_timer_freq>
    3aae:	029544b3          	div	s1,a0,s1
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    3ab2:	00044503          	lbu	a0,0(s0)
    3ab6:	22a5                	jal	3c1e <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    3ab8:	481c                	lw	a5,16(s0)
        load = (uint32_t)(timer_priv->timeout * min_us);
    3aba:	02f48533          	mul	a0,s1,a5
    if (min_us) {
    3abe:	e08d                	bnez	s1,3ae0 <csi_timer_start+0x50>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    3ac0:	00044503          	lbu	a0,0(s0)
    3ac4:	c03e                	sw	a5,0(sp)
    3ac6:	2aa1                	jal	3c1e <drv_get_timer_freq>
    3ac8:	4782                	lw	a5,0(sp)
    3aca:	000f4637          	lui	a2,0xf4
    3ace:	24060613          	addi	a2,a2,576 # f4240 <__ctor_end__+0xed9c0>
    3ad2:	4681                	li	a3,0
    3ad4:	02f525b3          	mulhsu	a1,a0,a5
    3ad8:	02a78533          	mul	a0,a5,a0
    3adc:	f18fc0ef          	jal	ra,1f4 <__udivdi3>
    }

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);

    if (timer_priv->timeout == 0) {
    3ae0:	4818                	lw	a4,16(s0)
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3ae2:	405c                	lw	a5,4(s0)
    if (timer_priv->timeout == 0) {
    3ae4:	e729                	bnez	a4,3b2e <csi_timer_start+0x9e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    3ae6:	577d                	li	a4,-1
    3ae8:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3aea:	4798                	lw	a4,8(a5)
    }

#endif

    return 0;
}
    3aec:	40b2                	lw	ra,12(sp)
    3aee:	4422                	lw	s0,8(sp)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3af0:	01e77693          	andi	a3,a4,30
    3af4:	0087c703          	lbu	a4,8(a5)
}
    3af8:	4492                	lw	s1,4(sp)
    return 0;
    3afa:	4501                	li	a0,0
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3afc:	9b01                	andi	a4,a4,-32
    3afe:	8f55                	or	a4,a4,a3
    3b00:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3b04:	4798                	lw	a4,8(a5)
    3b06:	8b7d                	andi	a4,a4,31
    3b08:	00176693          	ori	a3,a4,1
    3b0c:	0087c703          	lbu	a4,8(a5)
    3b10:	9b01                	andi	a4,a4,-32
    3b12:	8f55                	or	a4,a4,a3
    3b14:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3b18:	4798                	lw	a4,8(a5)
    3b1a:	01b77693          	andi	a3,a4,27
    3b1e:	0087c703          	lbu	a4,8(a5)
    3b22:	9b01                	andi	a4,a4,-32
    3b24:	8f55                	or	a4,a4,a3
    3b26:	00e78423          	sb	a4,8(a5)
}
    3b2a:	0141                	addi	sp,sp,16
    3b2c:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    3b2e:	4798                	lw	a4,8(a5)
    3b30:	8b75                	andi	a4,a4,29
    3b32:	db55                	beqz	a4,3ae6 <csi_timer_start+0x56>
            addr->TxLoadCount = load;                           /* load time(us) */
    3b34:	c388                	sw	a0,0(a5)
    3b36:	bf55                	j	3aea <csi_timer_start+0x5a>
    TIMER_NULL_PARAM_CHK(handle);
    3b38:	81070537          	lui	a0,0x81070
    3b3c:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b40:	8082                	ret

00003b42 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b42:	c519                	beqz	a0,3b50 <csi_timer_get_current_value+0xe>
    TIMER_NULL_PARAM_CHK(value);
    3b44:	c591                	beqz	a1,3b50 <csi_timer_get_current_value+0xe>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3b46:	415c                	lw	a5,4(a0)

    *value = addr->TxCurrentValue;
    return 0;
    3b48:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    3b4a:	43dc                	lw	a5,4(a5)
    3b4c:	c19c                	sw	a5,0(a1)
    return 0;
    3b4e:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3b50:	81070537          	lui	a0,0x81070
    3b54:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b58:	8082                	ret

00003b5a <TIM0_IRQHandler>:
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(0);
    3b5a:	4501                	li	a0,0
    3b5c:	b539                	j	396a <wj_oip_timer_irqhandler>

00003b5e <TIM1_IRQHandler>:
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(1);
    3b5e:	4505                	li	a0,1
    3b60:	b529                	j	396a <wj_oip_timer_irqhandler>

00003b62 <TIM2_IRQHandler>:
    CSI_INTRPT_EXIT();
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(2);
    3b62:	4509                	li	a0,2
    3b64:	b519                	j	396a <wj_oip_timer_irqhandler>

00003b66 <TIM3_IRQHandler>:
}

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(3);
    3b66:	450d                	li	a0,3
    3b68:	b509                	j	396a <wj_oip_timer_irqhandler>

00003b6a <TIM4_IRQHandler>:
}

ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(4);
    3b6a:	4511                	li	a0,4
    3b6c:	bbfd                	j	396a <wj_oip_timer_irqhandler>

00003b6e <TIM5_IRQHandler>:
}

ATTRIBUTE_ISR void TIM5_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(5);
    3b6e:	4515                	li	a0,5
    3b70:	bbed                	j	396a <wj_oip_timer_irqhandler>

00003b72 <TIM6_IRQHandler>:
}

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(6);
    3b72:	4519                	li	a0,6
    3b74:	bbdd                	j	396a <wj_oip_timer_irqhandler>

00003b76 <TIM7_IRQHandler>:
}

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(7);
    3b76:	451d                	li	a0,7
    3b78:	bbcd                	j	396a <wj_oip_timer_irqhandler>

00003b7a <TIM8_IRQHandler>:
}

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(8);
    3b7a:	4521                	li	a0,8
    3b7c:	b3fd                	j	396a <wj_oip_timer_irqhandler>

00003b7e <TIM9_IRQHandler>:
}

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(9);
    3b7e:	4525                	li	a0,9
    3b80:	b3ed                	j	396a <wj_oip_timer_irqhandler>

00003b82 <TIM10_IRQHandler>:
}

ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(10);
    3b82:	4529                	li	a0,10
    3b84:	b3dd                	j	396a <wj_oip_timer_irqhandler>

00003b86 <TIM11_IRQHandler>:
}

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(11);
    3b86:	452d                	li	a0,11
    3b88:	b3cd                	j	396a <wj_oip_timer_irqhandler>

00003b8a <TIM12_IRQHandler>:
}

ATTRIBUTE_ISR void TIM12_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(12);
    3b8a:	4531                	li	a0,12
    3b8c:	bbf9                	j	396a <wj_oip_timer_irqhandler>

00003b8e <TIM13_IRQHandler>:
}

ATTRIBUTE_ISR void TIM13_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(13);
    3b8e:	4535                	li	a0,13
    3b90:	bbe9                	j	396a <wj_oip_timer_irqhandler>

00003b92 <TIM14_IRQHandler>:
}

ATTRIBUTE_ISR void TIM14_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(14);
    3b92:	4539                	li	a0,14
    3b94:	bbd9                	j	396a <wj_oip_timer_irqhandler>

00003b96 <TIM15_IRQHandler>:
}

ATTRIBUTE_ISR void TIM15_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(15);
    3b96:	453d                	li	a0,15
    3b98:	bbc9                	j	396a <wj_oip_timer_irqhandler>

00003b9a <USI0_IRQHandler>:
}

ATTRIBUTE_ISR void USI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(0);
    3b9a:	4501                	li	a0,0
    3b9c:	8b6ff06f          	j	2c52 <wj_usi_irqhandler>

00003ba0 <USI1_IRQHandler>:
}

ATTRIBUTE_ISR void USI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(1);
    3ba0:	4505                	li	a0,1
    3ba2:	8b0ff06f          	j	2c52 <wj_usi_irqhandler>

00003ba6 <USI2_IRQHandler>:
}

ATTRIBUTE_ISR void USI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(2);
    3ba6:	4509                	li	a0,2
    3ba8:	8aaff06f          	j	2c52 <wj_usi_irqhandler>

00003bac <GPIO0_IRQHandler>:
}

ATTRIBUTE_ISR void GPIO0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_gpio_irqhandler(0);
    3bac:	4501                	li	a0,0
    3bae:	b129                	j	37b8 <wj_oip_gpio_irqhandler>

00003bb0 <mdelay>:
    }
}

void mdelay(uint32_t ms)
{
    if (ms == 0) {
    3bb0:	cd29                	beqz	a0,3c0a <mdelay+0x5a>
{
    3bb2:	1141                	addi	sp,sp,-16
    3bb4:	c422                	sw	s0,8(sp)
    3bb6:	c606                	sw	ra,12(sp)
    3bb8:	c226                	sw	s1,4(sp)
    3bba:	fff50413          	addi	s0,a0,-1
        return;
    }

    while (ms--) {
    3bbe:	57fd                	li	a5,-1
    3bc0:	00f41763          	bne	s0,a5,3bce <mdelay+0x1e>
        _mdelay();
    }
}
    3bc4:	40b2                	lw	ra,12(sp)
    3bc6:	4422                	lw	s0,8(sp)
    3bc8:	4492                	lw	s1,4(sp)
    3bca:	0141                	addi	sp,sp,16
    3bcc:	8082                	ret
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_load(void)
{
    return CORET->LOAD;
    3bce:	e000e7b7          	lui	a5,0xe000e
    3bd2:	4bc4                	lw	s1,20(a5)
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_value(void)
{
    return CORET->VAL;
    3bd4:	4f98                	lw	a4,24(a5)
    3bd6:	c03a                	sw	a4,0(sp)
    uint32_t cnt = (drv_get_sys_freq() / 1000000);
    3bd8:	2081                	jal	3c18 <drv_get_sys_freq>
    3bda:	000f47b7          	lui	a5,0xf4
    3bde:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xed9c0>
    3be2:	02f54533          	div	a0,a0,a5
            if (load - cur + start > cnt) {
    3be6:	4702                	lw	a4,0(sp)
    3be8:	e000e6b7          	lui	a3,0xe000e
    3bec:	94ba                	add	s1,s1,a4
    3bee:	4e9c                	lw	a5,24(a3)
        if (start > cur) {
    3bf0:	00e7f863          	bgeu	a5,a4,3c00 <mdelay+0x50>
            if (start - cur >= cnt) {
    3bf4:	40f707b3          	sub	a5,a4,a5
    3bf8:	fea7ebe3          	bltu	a5,a0,3bee <mdelay+0x3e>
    3bfc:	147d                	addi	s0,s0,-1
    3bfe:	b7c1                	j	3bbe <mdelay+0xe>
            if (load - cur + start > cnt) {
    3c00:	40f487b3          	sub	a5,s1,a5
    3c04:	fef575e3          	bgeu	a0,a5,3bee <mdelay+0x3e>
    3c08:	bfd5                	j	3bfc <mdelay+0x4c>
    3c0a:	8082                	ret

00003c0c <udelay>:
    3c0c:	b755                	j	3bb0 <mdelay>

00003c0e <drv_pin_config_mode>:
}

int32_t drv_pin_config_mode(port_name_e port, uint8_t offset, gpio_mode_e pin_mode)
{
    return 0;
}
    3c0e:	4501                	li	a0,0
    3c10:	8082                	ret

00003c12 <drv_get_usi_freq>:
    3c12:	ff81a503          	lw	a0,-8(gp) # 2000065c <g_system_clock>
    3c16:	8082                	ret

00003c18 <drv_get_sys_freq>:
}

int32_t drv_get_sys_freq(void)
{
    return g_system_clock;
}
    3c18:	ff81a503          	lw	a0,-8(gp) # 2000065c <g_system_clock>
    3c1c:	8082                	ret

00003c1e <drv_get_timer_freq>:
    3c1e:	ff81a503          	lw	a0,-8(gp) # 2000065c <g_system_clock>
    3c22:	8082                	ret

00003c24 <SystemInit>:
  */
void SystemInit(void)
{
    int i;

    CLIC->CLICCFG = 0x4UL;
    3c24:	e000e7b7          	lui	a5,0xe000e
{
    3c28:	1151                	addi	sp,sp,-12
    CLIC->CLICCFG = 0x4UL;
    3c2a:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    3c2e:	6705                	lui	a4,0x1
{
    3c30:	c222                	sw	s0,4(sp)
    CLIC->CLICCFG = 0x4UL;
    3c32:	973e                	add	a4,a4,a5
    3c34:	4691                	li	a3,4
{
    3c36:	c406                	sw	ra,8(sp)
    CLIC->CLICCFG = 0x4UL;
    3c38:	b0d70023          	sb	a3,-1280(a4) # b00 <__adddf3+0x24a>

    for (i = 0; i < 12; i++) {
        CLIC->INTIP[i] = 0;
    3c3c:	e000e437          	lui	s0,0xe000e
    for (i = 0; i < 12; i++) {
    3c40:	4701                	li	a4,0
    3c42:	46b1                	li	a3,12
        CLIC->INTIP[i] = 0;
    3c44:	00e78633          	add	a2,a5,a4
    3c48:	00060023          	sb	zero,0(a2)
    for (i = 0; i < 12; i++) {
    3c4c:	0705                	addi	a4,a4,1
    3c4e:	fed71be3          	bne	a4,a3,3c44 <SystemInit+0x20>
    }

    drv_irq_enable(Machine_Software_IRQn);
    3c52:	450d                	li	a0,3
    3c54:	f89fe0ef          	jal	ra,2bdc <drv_irq_enable>
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
    3c58:	30046073          	csrsi	mstatus,8
    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    3c5c:	3f75                	jal	3c18 <drv_get_sys_freq>
    3c5e:	06400793          	li	a5,100
    3c62:	02f54533          	div	a0,a0,a5
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    3c66:	010007b7          	lui	a5,0x1000
    3c6a:	157d                	addi	a0,a0,-1
    3c6c:	00f57763          	bgeu	a0,a5,3c7a <SystemInit+0x56>
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
    3c70:	c848                	sw	a0,20(s0)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    3c72:	00042c23          	sw	zero,24(s0) # e000e018 <__heap_end+0xbffde018>
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
    3c76:	479d                	li	a5,7
    3c78:	c81c                	sw	a5,16(s0)
#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
#else
    _system_init_for_kernel();
#endif
}
    3c7a:	4412                	lw	s0,4(sp)
    3c7c:	40a2                	lw	ra,8(sp)
    3c7e:	0131                	addi	sp,sp,12
    mm_heap_initialize();
    3c80:	ac5d                	j	3f36 <mm_heap_initialize>

00003c82 <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3c82:	1131                	addi	sp,sp,-20
    3c84:	c622                	sw	s0,12(sp)
    3c86:	c806                	sw	ra,16(sp)
    3c88:	c426                	sw	s1,8(sp)
    3c8a:	842a                	mv	s0,a0
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MCAUSE(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3c8c:	342025f3          	csrr	a1,mcause
    int i;
    uint32_t vec = 0;

    vec = __get_MCAUSE() & 0x3FF;

    printf("CPU Exception: NO.%d", vec);
    3c90:	00006537          	lui	a0,0x6
    3c94:	3ff5f593          	andi	a1,a1,1023
    3c98:	d2c50513          	addi	a0,a0,-724 # 5d2c <sg_usi_config+0x24>
    3c9c:	142010ef          	jal	ra,4dde <printf>
    printf("\n");
    3ca0:	4529                	li	a0,10
    3ca2:	254010ef          	jal	ra,4ef6 <putchar>

    for (i = 0; i < 15; i++) {
    3ca6:	84a2                	mv	s1,s0
    3ca8:	4781                	li	a5,0
        printf("x%d: %08x\t", i + 1, regs[i]);
    3caa:	4090                	lw	a2,0(s1)
    3cac:	00178713          	addi	a4,a5,1 # 1000001 <__ctor_end__+0xff9781>
    3cb0:	c23e                	sw	a5,4(sp)
    3cb2:	000067b7          	lui	a5,0x6
    3cb6:	d4478513          	addi	a0,a5,-700 # 5d44 <sg_usi_config+0x3c>
    3cba:	85ba                	mv	a1,a4
    3cbc:	c03a                	sw	a4,0(sp)
    3cbe:	120010ef          	jal	ra,4dde <printf>

        if ((i % 4) == 3) {
    3cc2:	4792                	lw	a5,4(sp)
    3cc4:	468d                	li	a3,3
    3cc6:	8b8d                	andi	a5,a5,3
    3cc8:	00d79563          	bne	a5,a3,3cd2 <trap_c+0x50>
            printf("\n");
    3ccc:	4529                	li	a0,10
    3cce:	228010ef          	jal	ra,4ef6 <putchar>
    3cd2:	4782                	lw	a5,0(sp)
    for (i = 0; i < 15; i++) {
    3cd4:	46bd                	li	a3,15
    3cd6:	0491                	addi	s1,s1,4
    3cd8:	fcd799e3          	bne	a5,a3,3caa <trap_c+0x28>
        }
    }

    printf("\n");
    3cdc:	4529                	li	a0,10
    3cde:	218010ef          	jal	ra,4ef6 <putchar>
    printf("mepc   : %08x\n", regs[15]);
    3ce2:	5c4c                	lw	a1,60(s0)
    3ce4:	00006537          	lui	a0,0x6
    3ce8:	d5050513          	addi	a0,a0,-688 # 5d50 <sg_usi_config+0x48>
    3cec:	0f2010ef          	jal	ra,4dde <printf>
    printf("mstatus: %08x\n", regs[16]);
    3cf0:	402c                	lw	a1,64(s0)
    3cf2:	00006537          	lui	a0,0x6
    3cf6:	d6050513          	addi	a0,a0,-672 # 5d60 <sg_usi_config+0x58>
    3cfa:	0e4010ef          	jal	ra,4dde <printf>

    if (trap_c_callback) {
    3cfe:	200027b7          	lui	a5,0x20002
    3d02:	e447a783          	lw	a5,-444(a5) # 20001e44 <trap_c_callback>
    3d06:	c391                	beqz	a5,3d0a <trap_c+0x88>
        trap_c_callback();
    3d08:	9782                	jalr	a5
    }

    while (1);
    3d0a:	a001                	j	3d0a <trap_c+0x88>

00003d0c <timer_cb_fun>:
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    if (TIMER_EVENT_TIMEOUT == event) {
    3d0c:	e981                	bnez	a1,3d1c <timer_cb_fun+0x10>
        Timer_LoopCount++;
    3d0e:	200027b7          	lui	a5,0x20002
    3d12:	d4078793          	addi	a5,a5,-704 # 20001d40 <Timer_LoopCount>
    3d16:	4398                	lw	a4,0(a5)
    3d18:	0705                	addi	a4,a4,1
    3d1a:	c398                	sw	a4,0(a5)
    }
}
    3d1c:	8082                	ret

00003d1e <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3d1e:	1131                	addi	sp,sp,-20
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3d20:	000045b7          	lui	a1,0x4
{
    3d24:	c622                	sw	s0,12(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3d26:	d0c58593          	addi	a1,a1,-756 # 3d0c <timer_cb_fun>
    3d2a:	4501                	li	a0,0
    3d2c:	20002437          	lui	s0,0x20002
{
    3d30:	c806                	sw	ra,16(sp)
    3d32:	c426                	sw	s1,8(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3d34:	d4840413          	addi	s0,s0,-696 # 20001d48 <timer_handle>
    3d38:	39a1                	jal	3990 <csi_timer_initialize>
    3d3a:	c008                	sw	a0,0(s0)

    if (timer_handle == NULL) {
    3d3c:	e901                	bnez	a0,3d4c <clock_timer_init+0x2e>
        return -1;
    3d3e:	54fd                	li	s1,-1
    if (cv2 > cv1) {
        timer_count_rise = 1;
    }

    return 0;
}
    3d40:	40c2                	lw	ra,16(sp)
    3d42:	4432                	lw	s0,12(sp)
    3d44:	8526                	mv	a0,s1
    3d46:	44a2                	lw	s1,8(sp)
    3d48:	0151                	addi	sp,sp,20
    3d4a:	8082                	ret
    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3d4c:	4501                	li	a0,0
    3d4e:	3dc1                	jal	3c1e <drv_get_timer_freq>
    3d50:	200027b7          	lui	a5,0x20002
    3d54:	d2a7ac23          	sw	a0,-712(a5) # 20001d38 <APB_FREQ>
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3d58:	000f47b7          	lui	a5,0xf4
    3d5c:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xed9c0>
    3d60:	02f55533          	divu	a0,a0,a5
    3d64:	009894b7          	lui	s1,0x989
    3d68:	68048493          	addi	s1,s1,1664 # 989680 <__ctor_end__+0x982e00>
    3d6c:	200027b7          	lui	a5,0x20002
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3d70:	4585                	li	a1,1
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3d72:	02950533          	mul	a0,a0,s1
    3d76:	d2a7ae23          	sw	a0,-708(a5) # 20001d3c <TIMER_LOADCOUNT>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3d7a:	4008                	lw	a0,0(s0)
    3d7c:	3965                	jal	3a34 <csi_timer_config>
    if (ret != 0) {
    3d7e:	f161                	bnez	a0,3d3e <clock_timer_init+0x20>
    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3d80:	4008                	lw	a0,0(s0)
    3d82:	85a6                	mv	a1,s1
    3d84:	39ed                	jal	3a7e <csi_timer_set_timeout>
    3d86:	84aa                	mv	s1,a0
    if (ret != 0) {
    3d88:	f95d                	bnez	a0,3d3e <clock_timer_init+0x20>
    csi_timer_get_current_value(timer_handle, &cv1);
    3d8a:	4008                	lw	a0,0(s0)
    3d8c:	858a                	mv	a1,sp
    3d8e:	3b55                	jal	3b42 <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3d90:	4008                	lw	a0,0(s0)
    3d92:	004c                	addi	a1,sp,4
    3d94:	337d                	jal	3b42 <csi_timer_get_current_value>
    if (cv2 > cv1) {
    3d96:	4712                	lw	a4,4(sp)
    3d98:	4782                	lw	a5,0(sp)
    3d9a:	fae7f3e3          	bgeu	a5,a4,3d40 <clock_timer_init+0x22>
        timer_count_rise = 1;
    3d9e:	200027b7          	lui	a5,0x20002
    3da2:	4705                	li	a4,1
    3da4:	d4e78223          	sb	a4,-700(a5) # 20001d44 <timer_count_rise>
    3da8:	bf61                	j	3d40 <clock_timer_init+0x22>

00003daa <clock_timer_start>:
}

int clock_timer_start(void)
{
    int ret = -1;
    Timer_LoopCount = 0;
    3daa:	200027b7          	lui	a5,0x20002
    3dae:	d407a023          	sw	zero,-704(a5) # 20001d40 <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3db2:	200027b7          	lui	a5,0x20002
    3db6:	d487a503          	lw	a0,-696(a5) # 20001d48 <timer_handle>
{
    3dba:	1151                	addi	sp,sp,-12
    3dbc:	c406                	sw	ra,8(sp)
    ret = csi_timer_start(timer_handle);
    3dbe:	39c9                	jal	3a90 <csi_timer_start>
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
}
    3dc0:	40a2                	lw	ra,8(sp)
    if (ret != 0) {
    3dc2:	00a03533          	snez	a0,a0
}
    3dc6:	40a00533          	neg	a0,a0
    3dca:	0131                	addi	sp,sp,12
    3dcc:	8082                	ret

00003dce <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3dce:	1151                	addi	sp,sp,-12
    3dd0:	c222                	sw	s0,4(sp)
    3dd2:	c026                	sw	s1,0(sp)
    3dd4:	641d                	lui	s0,0x7
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3dd6:	649d                	lui	s1,0x7
{
    3dd8:	c406                	sw	ra,8(sp)
    3dda:	88040413          	addi	s0,s0,-1920 # 6880 <__ctor_end__>
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3dde:	88048493          	addi	s1,s1,-1920 # 6880 <__ctor_end__>
    3de2:	1471                	addi	s0,s0,-4
    3de4:	00947763          	bgeu	s0,s1,3df2 <_init+0x24>
        (*p) ();
    }
}
    3de8:	40a2                	lw	ra,8(sp)
    3dea:	4412                	lw	s0,4(sp)
    3dec:	4482                	lw	s1,0(sp)
    3dee:	0131                	addi	sp,sp,12
    3df0:	8082                	ret
        (*p) ();
    3df2:	401c                	lw	a5,0(s0)
    3df4:	9782                	jalr	a5
    3df6:	b7f5                	j	3de2 <_init+0x14>

00003df8 <_fini>:

CPP_WEAK void _fini(void)
{
    3df8:	1151                	addi	sp,sp,-12
    3dfa:	c222                	sw	s0,4(sp)
    3dfc:	c026                	sw	s1,0(sp)
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3dfe:	641d                	lui	s0,0x7
    3e00:	649d                	lui	s1,0x7
{
    3e02:	c406                	sw	ra,8(sp)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3e04:	88040413          	addi	s0,s0,-1920 # 6880 <__ctor_end__>
    3e08:	87c48493          	addi	s1,s1,-1924 # 687c <pad_line+0x72c>
    3e0c:	0084f763          	bgeu	s1,s0,3e1a <_fini+0x22>
        (*p) ();
    }
}
    3e10:	40a2                	lw	ra,8(sp)
    3e12:	4412                	lw	s0,4(sp)
    3e14:	4482                	lw	s1,0(sp)
    3e16:	0131                	addi	sp,sp,12
    3e18:	8082                	ret
        (*p) ();
    3e1a:	401c                	lw	a5,0(s0)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3e1c:	0411                	addi	s0,s0,4
        (*p) ();
    3e1e:	9782                	jalr	a5
    3e20:	b7f5                	j	3e0c <_fini+0x14>

00003e22 <fputc>:
{
    return 0;
}

int fputc(int ch, FILE *stream)
{
    3e22:	1151                	addi	sp,sp,-12
    (void)stream;

    if (console_handle == NULL) {
    3e24:	200027b7          	lui	a5,0x20002
{
    3e28:	c026                	sw	s1,0(sp)
    3e2a:	84aa                	mv	s1,a0
    if (console_handle == NULL) {
    3e2c:	d4c7a503          	lw	a0,-692(a5) # 20001d4c <console_handle>
{
    3e30:	c406                	sw	ra,8(sp)
    3e32:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    3e34:	c505                	beqz	a0,3e5c <fputc+0x3a>
    3e36:	d4c78413          	addi	s0,a5,-692
        return -1;
    }

    if (ch == '\n') {
    3e3a:	47a9                	li	a5,10
    3e3c:	00f49563          	bne	s1,a5,3e46 <fputc+0x24>
        csi_usart_putchar(console_handle, '\r');
    3e40:	45b5                	li	a1,13
    3e42:	841ff0ef          	jal	ra,3682 <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, ch);
    3e46:	4008                	lw	a0,0(s0)
    3e48:	0ff4f593          	andi	a1,s1,255
    3e4c:	837ff0ef          	jal	ra,3682 <csi_usart_putchar>

    return 0;
    3e50:	4501                	li	a0,0
}
    3e52:	40a2                	lw	ra,8(sp)
    3e54:	4412                	lw	s0,4(sp)
    3e56:	4482                	lw	s1,0(sp)
    3e58:	0131                	addi	sp,sp,12
    3e5a:	8082                	ret
        return -1;
    3e5c:	557d                	li	a0,-1
    3e5e:	bfd5                	j	3e52 <fputc+0x30>

00003e60 <os_critical_enter>:
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
}
    3e60:	4501                	li	a0,0
    3e62:	8082                	ret

00003e64 <os_critical_exit>:
    3e64:	4501                	li	a0,0
    3e66:	8082                	ret

00003e68 <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    3e68:	1141                	addi	sp,sp,-16
    3e6a:	c422                	sw	s0,8(sp)
    3e6c:	842a                	mv	s0,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    3e6e:	4188                	lw	a0,0(a1)
    3e70:	c02e                	sw	a1,0(sp)
{
    3e72:	c606                	sw	ra,12(sp)
  int ndx = mm_size2ndx(node->size);
    3e74:	20d5                	jal	3f58 <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    3e76:	0505                	addi	a0,a0,1
    3e78:	0512                	slli	a0,a0,0x4
    3e7a:	00850713          	addi	a4,a0,8
    3e7e:	9722                	add	a4,a4,s0
    3e80:	942a                	add	s0,s0,a0
    3e82:	481c                	lw	a5,16(s0)
    3e84:	4582                	lw	a1,0(sp)
    3e86:	c791                	beqz	a5,3e92 <mm_addfreechunk+0x2a>
       next && next->size && next->size < node->size;
    3e88:	4394                	lw	a3,0(a5)
    3e8a:	c681                	beqz	a3,3e92 <mm_addfreechunk+0x2a>
    3e8c:	4190                	lw	a2,0(a1)
    3e8e:	00c6eb63          	bltu	a3,a2,3ea4 <mm_addfreechunk+0x3c>
       prev = next, next = next->flink);

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    3e92:	c70c                	sw	a1,8(a4)
  node->blink = prev;
    3e94:	c5d8                	sw	a4,12(a1)
  node->flink = next;
    3e96:	c59c                	sw	a5,8(a1)

  if (next)
    3e98:	c391                	beqz	a5,3e9c <mm_addfreechunk+0x34>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    3e9a:	c7cc                	sw	a1,12(a5)
    }
}
    3e9c:	40b2                	lw	ra,12(sp)
    3e9e:	4422                	lw	s0,8(sp)
    3ea0:	0141                	addi	sp,sp,16
    3ea2:	8082                	ret
       prev = next, next = next->flink);
    3ea4:	873e                	mv	a4,a5
    3ea6:	479c                	lw	a5,8(a5)
    3ea8:	bff9                	j	3e86 <mm_addfreechunk+0x1e>

00003eaa <mm_addregion>:

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3eaa:	00f58713          	addi	a4,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3eae:	962e                	add	a2,a2,a1

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    3eb0:	454c                	lw	a1,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3eb2:	9b41                	andi	a4,a4,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3eb4:	9a41                	andi	a2,a2,-16
  heapsize = heapend - heapbase;
    3eb6:	40e607b3          	sub	a5,a2,a4
  heap->mm_heapsize += heapsize;
    3eba:	95be                	add	a1,a1,a5
    3ebc:	c54c                	sw	a1,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    3ebe:	c918                	sw	a4,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3ec0:	4321                	li	t1,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3ec2:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3ec6:	17c1                	addi	a5,a5,-16
    3ec8:	c71c                	sw	a5,8(a4)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3eca:	00672023          	sw	t1,0(a4)
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3ece:	00572223          	sw	t0,4(a4)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    3ed2:	00870593          	addi	a1,a4,8
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    3ed6:	0065a223          	sw	t1,4(a1)

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    3eda:	ff860713          	addi	a4,a2,-8
    3ede:	c958                	sw	a4,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3ee0:	0057e7b3          	or	a5,a5,t0
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    3ee4:	fe662c23          	sw	t1,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3ee8:	fef62e23          	sw	a5,-4(a2)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    3eec:	bfb5                	j	3e68 <mm_addfreechunk>

00003eee <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    3eee:	1141                	addi	sp,sp,-16
    3ef0:	c422                	sw	s0,8(sp)
    3ef2:	c226                	sw	s1,4(sp)
    3ef4:	c606                	sw	ra,12(sp)
    3ef6:	842a                	mv	s0,a0
    3ef8:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    3efa:	00052623          	sw	zero,12(a0)
{
    3efe:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    3f00:	13000613          	li	a2,304
    3f04:	4581                	li	a1,0
    3f06:	0561                	addi	a0,a0,24
    3f08:	b20fe0ef          	jal	ra,2228 <memset>
  for (i = 1; i < MM_NNODES; i++)
    3f0c:	4702                	lw	a4,0(sp)
    3f0e:	02840793          	addi	a5,s0,40
    3f12:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3f16:	ff078613          	addi	a2,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    3f1a:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3f1e:	c7d0                	sw	a2,12(a5)
    3f20:	07c1                	addi	a5,a5,16
  for (i = 1; i < MM_NNODES; i++)
    3f22:	fed79ae3          	bne	a5,a3,3f16 <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    3f26:	8522                	mv	a0,s0
}
    3f28:	4422                	lw	s0,8(sp)
    3f2a:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    3f2c:	85a6                	mv	a1,s1
}
    3f2e:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    3f30:	863a                	mv	a2,a4
}
    3f32:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    3f34:	bf9d                	j	3eaa <mm_addregion>

00003f36 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    3f36:	200025b7          	lui	a1,0x20002
    3f3a:	200307b7          	lui	a5,0x20030
    3f3e:	fa858613          	addi	a2,a1,-88 # 20001fa8 <__bss_end__>
    3f42:	00078793          	mv	a5,a5
    3f46:	20002537          	lui	a0,0x20002
    3f4a:	40c78633          	sub	a2,a5,a2
    3f4e:	fa858593          	addi	a1,a1,-88
    3f52:	e4850513          	addi	a0,a0,-440 # 20001e48 <g_mmheap>
    3f56:	bf61                	j	3eee <mm_initialize>

00003f58 <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    3f58:	004007b7          	lui	a5,0x400
    3f5c:	00f57c63          	bgeu	a0,a5,3f74 <mm_size2ndx+0x1c>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    3f60:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    3f64:	4705                	li	a4,1
  int ndx = 0;
    3f66:	4501                	li	a0,0
  while (size > 1)
    3f68:	00f76363          	bltu	a4,a5,3f6e <mm_size2ndx+0x16>
    3f6c:	8082                	ret
    {
      ndx++;
    3f6e:	0505                	addi	a0,a0,1
      size >>= 1;
    3f70:	8385                	srli	a5,a5,0x1
    3f72:	bfdd                	j	3f68 <mm_size2ndx+0x10>
       return MM_NNODES-1;
    3f74:	4549                	li	a0,18
    }

  return ndx;
}
    3f76:	8082                	ret

00003f78 <timer_event_cb_fun>:

uint16_t timer_counter=0; 
static void timer_event_cb_fun(int32_t idx, timer_event_e event)
{
	
	timer_counter++;
    3f78:	200027b7          	lui	a5,0x20002
    3f7c:	d7078793          	addi	a5,a5,-656 # 20001d70 <timer_counter>
    3f80:	0007d703          	lhu	a4,0(a5)
    3f84:	0705                	addi	a4,a4,1
    3f86:	00e79023          	sh	a4,0(a5)
				csi_gpio_pin_write(pin2,0);//low
			}
	}

	*/		
}
    3f8a:	8082                	ret

00003f8c <usart_receive_sync>:
{
    3f8c:	1151                	addi	sp,sp,-12
    3f8e:	c222                	sw	s0,4(sp)
    int time_out = 0x7ffff;
    3f90:	00080437          	lui	s0,0x80
{
    3f94:	c026                	sw	s1,0(sp)
    3f96:	c406                	sw	ra,8(sp)
    3f98:	84aa                	mv	s1,a0
    int time_out = 0x7ffff;
    3f9a:	147d                	addi	s0,s0,-1
    csi_usart_receive(usart, data, num);
    3f9c:	eeeff0ef          	jal	ra,368a <csi_usart_receive>
        status = csi_usart_get_status(usart);
    3fa0:	8526                	mv	a0,s1
    3fa2:	eecff0ef          	jal	ra,368e <csi_usart_get_status>
        if (!status.rx_busy) {
    3fa6:	8909                	andi	a0,a0,2
        time_out--;
    3fa8:	147d                	addi	s0,s0,-1
        if (!status.rx_busy) {
    3faa:	c901                	beqz	a0,3fba <usart_receive_sync+0x2e>
    while (time_out) {
    3fac:	f875                	bnez	s0,3fa0 <usart_receive_sync+0x14>
        return -1;
    3fae:	557d                	li	a0,-1
}
    3fb0:	40a2                	lw	ra,8(sp)
    3fb2:	4412                	lw	s0,4(sp)
    3fb4:	4482                	lw	s1,0(sp)
    3fb6:	0131                	addi	sp,sp,12
    3fb8:	8082                	ret
    if (0 == time_out) {
    3fba:	00143513          	seqz	a0,s0
    3fbe:	40a00533          	neg	a0,a0
    3fc2:	b7fd                	j	3fb0 <usart_receive_sync+0x24>

00003fc4 <usart_send_sync>:
{
    3fc4:	1151                	addi	sp,sp,-12
    3fc6:	c222                	sw	s0,4(sp)
    int time_out = 0x7ffff;
    3fc8:	00080437          	lui	s0,0x80
{
    3fcc:	c026                	sw	s1,0(sp)
    3fce:	c406                	sw	ra,8(sp)
    3fd0:	84aa                	mv	s1,a0
    int time_out = 0x7ffff;
    3fd2:	147d                	addi	s0,s0,-1
    csi_usart_send(usart, data, num);
    3fd4:	eb4ff0ef          	jal	ra,3688 <csi_usart_send>
        status = csi_usart_get_status(usart);
    3fd8:	8526                	mv	a0,s1
    3fda:	eb4ff0ef          	jal	ra,368e <csi_usart_get_status>
        if (!status.tx_busy) {
    3fde:	8905                	andi	a0,a0,1
        time_out--;
    3fe0:	147d                	addi	s0,s0,-1
        if (!status.tx_busy) {
    3fe2:	c901                	beqz	a0,3ff2 <usart_send_sync+0x2e>
    while (time_out) {
    3fe4:	f875                	bnez	s0,3fd8 <usart_send_sync+0x14>
        return -1;
    3fe6:	557d                	li	a0,-1
}
    3fe8:	40a2                	lw	ra,8(sp)
    3fea:	4412                	lw	s0,4(sp)
    3fec:	4482                	lw	s1,0(sp)
    3fee:	0131                	addi	sp,sp,12
    3ff0:	8082                	ret
    if (0 == time_out) {
    3ff2:	00143513          	seqz	a0,s0
    3ff6:	40a00533          	neg	a0,a0
    3ffa:	b7fd                	j	3fe8 <usart_send_sync+0x24>

00003ffc <GPIO_Init>:
    }

    return 0;
}
void GPIO_Init()
{
    3ffc:	1151                	addi	sp,sp,-12
    pin1=csi_gpio_pin_initialize(PA1,NULL); //gpio_PWM motor top
    3ffe:	4581                	li	a1,0
    4000:	4505                	li	a0,1
{
    4002:	c406                	sw	ra,8(sp)
    4004:	c222                	sw	s0,4(sp)
    pin1=csi_gpio_pin_initialize(PA1,NULL); //gpio_PWM motor top
    4006:	879ff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    400a:	20002437          	lui	s0,0x20002
    400e:	d5840413          	addi	s0,s0,-680 # 20001d58 <pin1>
    csi_gpio_pin_config_mode(pin1, GPIO_MODE_OPEN_DRAIN);
    4012:	458d                	li	a1,3
    pin1=csi_gpio_pin_initialize(PA1,NULL); //gpio_PWM motor top
    4014:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin1, GPIO_MODE_OPEN_DRAIN);
    4016:	8c9ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin1, GPIO_DIRECTION_OUTPUT);	
    401a:	4008                	lw	a0,0(s0)
    401c:	4585                	li	a1,1
    401e:	8d9ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(pin1,0);//low
    4022:	4008                	lw	a0,0(s0)
    4024:	4581                	li	a1,0
	pin2=csi_gpio_pin_initialize(PA4,NULL); //gpio_PWM motor bottom
    4026:	20002437          	lui	s0,0x20002
	csi_gpio_pin_write(pin1,0);//low
    402a:	8ffff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	pin2=csi_gpio_pin_initialize(PA4,NULL); //gpio_PWM motor bottom
    402e:	4581                	li	a1,0
    4030:	4511                	li	a0,4
    4032:	84dff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    4036:	d6440413          	addi	s0,s0,-668 # 20001d64 <pin2>
    csi_gpio_pin_config_mode(pin2, GPIO_MODE_OPEN_DRAIN);
    403a:	458d                	li	a1,3
	pin2=csi_gpio_pin_initialize(PA4,NULL); //gpio_PWM motor bottom
    403c:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin2, GPIO_MODE_OPEN_DRAIN);
    403e:	8a1ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin2, GPIO_DIRECTION_OUTPUT);	
    4042:	4008                	lw	a0,0(s0)
    4044:	4585                	li	a1,1
    4046:	8b1ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(pin2,0);//low
    404a:	4008                	lw	a0,0(s0)
    404c:	4581                	li	a1,0
	 
    pin1_d1=csi_gpio_pin_initialize(PA3,NULL); //dir+
    404e:	20002437          	lui	s0,0x20002
	csi_gpio_pin_write(pin2,0);//low
    4052:	8d7ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
    pin1_d1=csi_gpio_pin_initialize(PA3,NULL); //dir+
    4056:	4581                	li	a1,0
    4058:	450d                	li	a0,3
    405a:	825ff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    405e:	d5c40413          	addi	s0,s0,-676 # 20001d5c <pin1_d1>
    csi_gpio_pin_config_mode(pin1_d1, GPIO_MODE_OPEN_DRAIN);
    4062:	458d                	li	a1,3
    pin1_d1=csi_gpio_pin_initialize(PA3,NULL); //dir+
    4064:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin1_d1, GPIO_MODE_OPEN_DRAIN);
    4066:	879ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin1_d1, GPIO_DIRECTION_OUTPUT);	
    406a:	4008                	lw	a0,0(s0)
    406c:	4585                	li	a1,1
    406e:	889ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin1_d1,1);//HIGH
    4072:	4008                	lw	a0,0(s0)
    4074:	4585                	li	a1,1
    pin1_d2=csi_gpio_pin_initialize(PA5,NULL); //dir-
    4076:	20002437          	lui	s0,0x20002
    csi_gpio_pin_write(pin1_d1,1);//HIGH
    407a:	8afff0ef          	jal	ra,3928 <csi_gpio_pin_write>
    pin1_d2=csi_gpio_pin_initialize(PA5,NULL); //dir-
    407e:	4581                	li	a1,0
    4080:	4515                	li	a0,5
    4082:	ffcff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    4086:	d6040413          	addi	s0,s0,-672 # 20001d60 <pin1_d2>
    csi_gpio_pin_config_mode(pin1_d2, GPIO_MODE_OPEN_DRAIN);
    408a:	458d                	li	a1,3
    pin1_d2=csi_gpio_pin_initialize(PA5,NULL); //dir-
    408c:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin1_d2, GPIO_MODE_OPEN_DRAIN);
    408e:	851ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin1_d2, GPIO_DIRECTION_OUTPUT);	
    4092:	4008                	lw	a0,0(s0)
    4094:	4585                	li	a1,1
    4096:	861ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin1_d2,0);//low
    409a:	4008                	lw	a0,0(s0)
    409c:	4581                	li	a1,0
	
    pin2_d1=csi_gpio_pin_initialize(PA2,NULL); //dir+
    409e:	20002437          	lui	s0,0x20002
    csi_gpio_pin_write(pin1_d2,0);//low
    40a2:	887ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
    pin2_d1=csi_gpio_pin_initialize(PA2,NULL); //dir+
    40a6:	4581                	li	a1,0
    40a8:	4509                	li	a0,2
    40aa:	fd4ff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    40ae:	d6840413          	addi	s0,s0,-664 # 20001d68 <pin2_d1>
    csi_gpio_pin_config_mode(pin2_d1, GPIO_MODE_OPEN_DRAIN);
    40b2:	458d                	li	a1,3
    pin2_d1=csi_gpio_pin_initialize(PA2,NULL); //dir+
    40b4:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin2_d1, GPIO_MODE_OPEN_DRAIN);
    40b6:	829ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin2_d1, GPIO_DIRECTION_OUTPUT);	
    40ba:	4008                	lw	a0,0(s0)
    40bc:	4585                	li	a1,1
    40be:	839ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin2_d1,1);//HIGH	
    40c2:	4008                	lw	a0,0(s0)
    40c4:	4585                	li	a1,1
    pin2_d2=csi_gpio_pin_initialize(PA0,NULL); //dir-
    40c6:	20002437          	lui	s0,0x20002
    csi_gpio_pin_write(pin2_d1,1);//HIGH	
    40ca:	85fff0ef          	jal	ra,3928 <csi_gpio_pin_write>
    pin2_d2=csi_gpio_pin_initialize(PA0,NULL); //dir-
    40ce:	4581                	li	a1,0
    40d0:	4501                	li	a0,0
    40d2:	facff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    40d6:	d6c40413          	addi	s0,s0,-660 # 20001d6c <pin2_d2>
    csi_gpio_pin_config_mode(pin2_d2, GPIO_MODE_OPEN_DRAIN);
    40da:	458d                	li	a1,3
    pin2_d2=csi_gpio_pin_initialize(PA0,NULL); //dir-
    40dc:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin2_d2, GPIO_MODE_OPEN_DRAIN);
    40de:	801ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin2_d2, GPIO_DIRECTION_OUTPUT);	
    40e2:	4008                	lw	a0,0(s0)
    40e4:	4585                	li	a1,1
    40e6:	811ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(pin2_d2,0);//low	
    40ea:	4008                	lw	a0,0(s0)
	
}
    40ec:	4412                	lw	s0,4(sp)
    40ee:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(pin2_d2,0);//low	
    40f0:	4581                	li	a1,0
}
    40f2:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(pin2_d2,0);//low	
    40f4:	835ff06f          	j	3928 <csi_gpio_pin_write>

000040f8 <usart_init>:



int usart_init(void)
{
    40f8:	1151                	addi	sp,sp,-12
    int32_t ret;

    /* init the USART*/
    p_csi_usart = csi_usart_initialize(0, NULL);
    40fa:	4581                	li	a1,0
    40fc:	4501                	li	a0,0
{
    40fe:	c406                	sw	ra,8(sp)
    4100:	c222                	sw	s0,4(sp)
    p_csi_usart = csi_usart_initialize(0, NULL);
    4102:	d82ff0ef          	jal	ra,3684 <csi_usart_initialize>
    4106:	200027b7          	lui	a5,0x20002

    /* config the USART */
    ret = csi_usart_config(p_csi_usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    410a:	65f1                	lui	a1,0x1c
    410c:	4701                	li	a4,0
    410e:	4681                	li	a3,0
    4110:	4601                	li	a2,0
    4112:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x15980>
    p_csi_usart = csi_usart_initialize(0, NULL);
    4116:	f8a7aa23          	sw	a0,-108(a5) # 20001f94 <p_csi_usart>
    ret = csi_usart_config(p_csi_usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    411a:	478d                	li	a5,3
    411c:	d6aff0ef          	jal	ra,3686 <csi_usart_config>
    printf("************\n");
    4120:	00006437          	lui	s0,0x6
    4124:	dbc40513          	addi	a0,s0,-580 # 5dbc <sg_usi_config+0xb4>
    4128:	5e3000ef          	jal	ra,4f0a <puts>
	printf("Welcome to motor controlling system\n");
    412c:	00006537          	lui	a0,0x6
    4130:	dcc50513          	addi	a0,a0,-564 # 5dcc <sg_usi_config+0xc4>
    4134:	5d7000ef          	jal	ra,4f0a <puts>
	printf("************\n");
    4138:	dbc40513          	addi	a0,s0,-580
    413c:	5cf000ef          	jal	ra,4f0a <puts>
	printf("Menu\n");
    4140:	00006537          	lui	a0,0x6
    4144:	df050513          	addi	a0,a0,-528 # 5df0 <sg_usi_config+0xe8>
    4148:	5c3000ef          	jal	ra,4f0a <puts>
	printf("enter 'xxxxxx' to turn angle  \n");
    414c:	00006537          	lui	a0,0x6
    4150:	df850513          	addi	a0,a0,-520 # 5df8 <sg_usi_config+0xf0>
    4154:	5b7000ef          	jal	ra,4f0a <puts>
	printf("first bit is direction: '+' is clockwise \n");
    4158:	00006537          	lui	a0,0x6
    415c:	e1850513          	addi	a0,a0,-488 # 5e18 <sg_usi_config+0x110>
    4160:	5ab000ef          	jal	ra,4f0a <puts>
	printf("last bit is motor loc: '1' is bottom \n");
    4164:	00006537          	lui	a0,0x6
    4168:	e4450513          	addi	a0,a0,-444 # 5e44 <sg_usi_config+0x13c>
    416c:	59f000ef          	jal	ra,4f0a <puts>
	printf("middle four bits is angle: 00000~9999 \n");
    4170:	00006537          	lui	a0,0x6
    4174:	e6c50513          	addi	a0,a0,-404 # 5e6c <sg_usi_config+0x164>
    4178:	593000ef          	jal	ra,4f0a <puts>
    printf("eg: +10001 represents bottom motor turns 1000 uint angles in clockwise \n");
    417c:	00006537          	lui	a0,0x6
    4180:	e9450513          	addi	a0,a0,-364 # 5e94 <sg_usi_config+0x18c>
    4184:	587000ef          	jal	ra,4f0a <puts>
			
	
    return 0;
}
    4188:	40a2                	lw	ra,8(sp)
    418a:	4412                	lw	s0,4(sp)
    418c:	4501                	li	a0,0
    418e:	0131                	addi	sp,sp,12
    4190:	8082                	ret

00004192 <change_angle>:

//正值顺时针，负值逆时针，顺逆时针方向自定义
//loc是电机标号，num=0~9999 num和角度对应关系(近似线性)由于未闭环需要实测
int32_t move_speed=1000;
void change_angle(int32_t num,uint8_t loc)
{
    4192:	1141                	addi	sp,sp,-16
    4194:	ffc18713          	addi	a4,gp,-4 # 20000660 <move_speed>
    4198:	c422                	sw	s0,8(sp)
    419a:	c606                	sw	ra,12(sp)
    419c:	c226                	sw	s1,4(sp)
	int count_pulse=0;	
	if(loc==motor1)
    419e:	4785                	li	a5,1
    41a0:	c03a                	sw	a4,0(sp)
{
    41a2:	842a                	mv	s0,a0
	if(loc==motor1)
    41a4:	06f59f63          	bne	a1,a5,4222 <change_angle+0x90>
	{
		//确定方向
		if(num<0)//逆时针
    41a8:	200027b7          	lui	a5,0x20002
    41ac:	200024b7          	lui	s1,0x20002
    41b0:	d5c7a503          	lw	a0,-676(a5) # 20001d5c <pin1_d1>
    41b4:	d6048493          	addi	s1,s1,-672 # 20001d60 <pin1_d2>
    41b8:	04045d63          	bgez	s0,4212 <change_angle+0x80>
		{
			csi_gpio_pin_write(pin1_d1,1);
    41bc:	f6cff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			csi_gpio_pin_write(pin1_d2,0);	
    41c0:	4088                	lw	a0,0(s1)
    41c2:	4581                	li	a1,0
			num=-num;
    41c4:	40800433          	neg	s0,s0
			csi_gpio_pin_write(pin1_d2,0);	
    41c8:	f60ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
{
    41cc:	4481                	li	s1,0
			csi_gpio_pin_write(pin1_d2,1);				
		}
		//产生固定数脉冲
		while(count_pulse<=num)
		{  
			 csi_gpio_pin_write(pin1,1);//high
    41ce:	20002737          	lui	a4,0x20002
    41d2:	d5870793          	addi	a5,a4,-680 # 20001d58 <pin1>
    41d6:	4388                	lw	a0,0(a5)
    41d8:	4585                	li	a1,1
			 udelay(move_speed);
			 csi_gpio_pin_write(pin1,0);//low
			 udelay(move_speed);
			 count_pulse++;
    41da:	0485                	addi	s1,s1,1
			 csi_gpio_pin_write(pin1,1);//high
    41dc:	f4cff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			 udelay(move_speed);
    41e0:	4782                	lw	a5,0(sp)
    41e2:	4388                	lw	a0,0(a5)
    41e4:	a29ff0ef          	jal	ra,3c0c <udelay>
			 csi_gpio_pin_write(pin1,0);//low
    41e8:	200027b7          	lui	a5,0x20002
    41ec:	d5878793          	addi	a5,a5,-680 # 20001d58 <pin1>
    41f0:	4388                	lw	a0,0(a5)
    41f2:	4581                	li	a1,0
    41f4:	f34ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			 udelay(move_speed);
    41f8:	4782                	lw	a5,0(sp)
    41fa:	4388                	lw	a0,0(a5)
    41fc:	a11ff0ef          	jal	ra,3c0c <udelay>
		while(count_pulse<=num)
    4200:	20002737          	lui	a4,0x20002
    4204:	fc9457e3          	bge	s0,s1,41d2 <change_angle+0x40>
			 udelay(move_speed);
			 count_pulse++;
		}	
	}
	
}
    4208:	40b2                	lw	ra,12(sp)
    420a:	4422                	lw	s0,8(sp)
    420c:	4492                	lw	s1,4(sp)
    420e:	0141                	addi	sp,sp,16
    4210:	8082                	ret
			csi_gpio_pin_write(pin1_d1,0);
    4212:	4581                	li	a1,0
    4214:	f14ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			csi_gpio_pin_write(pin1_d2,1);				
    4218:	4088                	lw	a0,0(s1)
    421a:	4585                	li	a1,1
    421c:	f0cff0ef          	jal	ra,3928 <csi_gpio_pin_write>
    4220:	b775                	j	41cc <change_angle+0x3a>
		if(num<0)//逆时针
    4222:	200027b7          	lui	a5,0x20002
    4226:	200024b7          	lui	s1,0x20002
    422a:	d687a503          	lw	a0,-664(a5) # 20001d68 <pin2_d1>
    422e:	d6c48493          	addi	s1,s1,-660 # 20001d6c <pin2_d2>
    4232:	04045a63          	bgez	s0,4286 <change_angle+0xf4>
			csi_gpio_pin_write(pin2_d1,1);
    4236:	4585                	li	a1,1
    4238:	ef0ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			csi_gpio_pin_write(pin2_d2,0);	
    423c:	4088                	lw	a0,0(s1)
    423e:	4581                	li	a1,0
			num=-num;
    4240:	40800433          	neg	s0,s0
			csi_gpio_pin_write(pin2_d2,0);	
    4244:	ee4ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
{
    4248:	4481                	li	s1,0
			 csi_gpio_pin_write(pin2,1);//high
    424a:	20002737          	lui	a4,0x20002
    424e:	d6470793          	addi	a5,a4,-668 # 20001d64 <pin2>
    4252:	4388                	lw	a0,0(a5)
    4254:	4585                	li	a1,1
			 count_pulse++;
    4256:	0485                	addi	s1,s1,1
			 csi_gpio_pin_write(pin2,1);//high
    4258:	ed0ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			 udelay(move_speed);//100 us
    425c:	4782                	lw	a5,0(sp)
    425e:	4388                	lw	a0,0(a5)
    4260:	9adff0ef          	jal	ra,3c0c <udelay>
			 csi_gpio_pin_write(pin2,0);//low
    4264:	200027b7          	lui	a5,0x20002
    4268:	d6478793          	addi	a5,a5,-668 # 20001d64 <pin2>
    426c:	4388                	lw	a0,0(a5)
    426e:	4581                	li	a1,0
    4270:	eb8ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			 udelay(move_speed);
    4274:	4782                	lw	a5,0(sp)
    4276:	4388                	lw	a0,0(a5)
    4278:	995ff0ef          	jal	ra,3c0c <udelay>
		while(count_pulse<=num)
    427c:	20002737          	lui	a4,0x20002
    4280:	fc9457e3          	bge	s0,s1,424e <change_angle+0xbc>
    4284:	b751                	j	4208 <change_angle+0x76>
			csi_gpio_pin_write(pin2_d1,0);
    4286:	4581                	li	a1,0
    4288:	ea0ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
			csi_gpio_pin_write(pin2_d2,1);			
    428c:	4088                	lw	a0,0(s1)
    428e:	4585                	li	a1,1
    4290:	e98ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
    4294:	bf55                	j	4248 <change_angle+0xb6>

00004296 <main>:
uint8_t aim_loc;//目标电机
uint8_t flag=0;//控制位
int16_t top_loc=0;
int16_t bottom_loc=0;
int main(void)
{
    4296:	1141                	addi	sp,sp,-16
    4298:	c606                	sw	ra,12(sp)
    429a:	c422                	sw	s0,8(sp)
    429c:	c226                	sw	s1,4(sp)

	GPIO_Init();
    429e:	3bb9                	jal	3ffc <GPIO_Init>
    timer_handle = csi_timer_initialize(timer_num, timer_event_cb_fun);
    42a0:	000045b7          	lui	a1,0x4
    42a4:	f7858593          	addi	a1,a1,-136 # 3f78 <timer_event_cb_fun>
    42a8:	4505                	li	a0,1
    42aa:	ee6ff0ef          	jal	ra,3990 <csi_timer_initialize>
    if (timer_handle == NULL) {
    42ae:	1a051063          	bnez	a0,444e <main+0x1b8>
        printf("csi_timer_initialize error\n");
    42b2:	00006537          	lui	a0,0x6
    42b6:	d7050513          	addi	a0,a0,-656 # 5d70 <sg_usi_config+0x68>
    42ba:	451000ef          	jal	ra,4f0a <puts>
  	timer_init(1,500000);
	usart_init();
    42be:	3d2d                	jal	40f8 <usart_init>
	//IIC_init();
	//MPU6050_Init();
	OLED_Init();
    42c0:	2e25                	jal	45f8 <OLED_Init>
	OLED_P6x8Str(45,0,(uint8_t *)"Welcome!");
    42c2:	00006637          	lui	a2,0x6
    42c6:	d8c60613          	addi	a2,a2,-628 # 5d8c <sg_usi_config+0x84>
    42ca:	4581                	li	a1,0
    42cc:	02d00513          	li	a0,45
    42d0:	217d                	jal	477e <OLED_P6x8Str>
	OLED_P6x8Str(20,1,(uint8_t *)"top_loc=");
    42d2:	00006637          	lui	a2,0x6
    42d6:	d9860613          	addi	a2,a2,-616 # 5d98 <sg_usi_config+0x90>
    42da:	4585                	li	a1,1
    42dc:	4551                	li	a0,20
    42de:	2145                	jal	477e <OLED_P6x8Str>
	OLED_P6x8Str(20,2,(uint8_t *)"bot_loc=");	
    42e0:	00006637          	lui	a2,0x6
    42e4:	da460613          	addi	a2,a2,-604 # 5da4 <sg_usi_config+0x9c>
    42e8:	4589                	li	a1,2
    42ea:	4551                	li	a0,20
    42ec:	2949                	jal	477e <OLED_P6x8Str>
	OLED_P6x8Str(20,2,(uint8_t *)"tim_cnt=");	
    42ee:	00006637          	lui	a2,0x6
    42f2:	db060613          	addi	a2,a2,-592 # 5db0 <sg_usi_config+0xa8>
    42f6:	4589                	li	a1,2
    42f8:	4551                	li	a0,20
    42fa:	2151                	jal	477e <OLED_P6x8Str>
				usart_send_sync(p_csi_usart,data_rev,sizeof(data_rev));
				printf("\n");
				csi_usart_abort_receive(p_csi_usart);

				//计算目标旋转角度和目标电机
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
    42fc:	20002437          	lui	s0,0x20002
			OLED_Print_Num1(70,1,top_loc);
    4300:	20002337          	lui	t1,0x20002
    4304:	d7231603          	lh	a2,-654(t1) # 20001d72 <top_loc>
    4308:	4585                	li	a1,1
    430a:	04600513          	li	a0,70
    430e:	2325                	jal	4836 <OLED_Print_Num1>
			OLED_Print_Num1(70,2,bottom_loc);
    4310:	200024b7          	lui	s1,0x20002
    4314:	d5449603          	lh	a2,-684(s1) # 20001d54 <bottom_loc>
    4318:	4589                	li	a1,2
    431a:	04600513          	li	a0,70
    431e:	2b21                	jal	4836 <OLED_Print_Num1>
			OLED_Print_Num1(70,3,timer_counter);
    4320:	200027b7          	lui	a5,0x20002
    4324:	d7079603          	lh	a2,-656(a5) # 20001d70 <timer_counter>
    4328:	458d                	li	a1,3
    432a:	04600513          	li	a0,70
    432e:	2321                	jal	4836 <OLED_Print_Num1>
			usart_receive_sync(p_csi_usart,&data_rev,6);
    4330:	200027b7          	lui	a5,0x20002
    4334:	f947a503          	lw	a0,-108(a5) # 20001f94 <p_csi_usart>
    4338:	200026b7          	lui	a3,0x20002
    433c:	4619                	li	a2,6
    433e:	f9868593          	addi	a1,a3,-104 # 20001f98 <data_rev>
    4342:	31a9                	jal	3f8c <usart_receive_sync>
			if(data_rev[0]!='\0')
    4344:	200026b7          	lui	a3,0x20002
    4348:	f986c603          	lbu	a2,-104(a3) # 20001f98 <data_rev>
    434c:	d5448793          	addi	a5,s1,-684
    4350:	c03e                	sw	a5,0(sp)
    4352:	20002737          	lui	a4,0x20002
    4356:	d5670493          	addi	s1,a4,-682 # 20001d56 <flag>
    435a:	200027b7          	lui	a5,0x20002
    435e:	20002337          	lui	t1,0x20002
    4362:	12060063          	beqz	a2,4482 <main+0x1ec>
				usart_send_sync(p_csi_usart,data_rev,sizeof(data_rev));
    4366:	f947a503          	lw	a0,-108(a5) # 20001f94 <p_csi_usart>
    436a:	f9868593          	addi	a1,a3,-104
    436e:	4629                	li	a2,10
    4370:	3991                	jal	3fc4 <usart_send_sync>
				printf("\n");
    4372:	4529                	li	a0,10
    4374:	383000ef          	jal	ra,4ef6 <putchar>
				csi_usart_abort_receive(p_csi_usart);
    4378:	200027b7          	lui	a5,0x20002
    437c:	f947a503          	lw	a0,-108(a5) # 20001f94 <p_csi_usart>
    4380:	b0cff0ef          	jal	ra,368c <csi_usart_abort_receive>
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
    4384:	200026b7          	lui	a3,0x20002
    4388:	f9868593          	addi	a1,a3,-104 # 20001f98 <data_rev>
    438c:	0015c783          	lbu	a5,1(a1)
    4390:	3e800613          	li	a2,1000
    4394:	06400513          	li	a0,100
    4398:	fd078793          	addi	a5,a5,-48
    439c:	02c787b3          	mul	a5,a5,a2
    43a0:	0025c603          	lbu	a2,2(a1)
    43a4:	fd060613          	addi	a2,a2,-48
    43a8:	02a60633          	mul	a2,a2,a0
    43ac:	4529                	li	a0,10
    43ae:	97b2                	add	a5,a5,a2
    43b0:	0035c603          	lbu	a2,3(a1)
    43b4:	fd060613          	addi	a2,a2,-48
    43b8:	02a60633          	mul	a2,a2,a0
				
				if(data_rev[0]=='-') aim_degree=-aim_degree;
    43bc:	02d00513          	li	a0,45
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
    43c0:	97b2                	add	a5,a5,a2
    43c2:	0045c603          	lbu	a2,4(a1)
				if(data_rev[0]=='-') aim_degree=-aim_degree;
    43c6:	f986c583          	lbu	a1,-104(a3)
    43ca:	f9868693          	addi	a3,a3,-104
				aim_degree=(data_rev[1]-0x30)*1000+(data_rev[2]-0x30)*100+(data_rev[3]-0x30)*10+(data_rev[4]-0x30)*1;
    43ce:	fd060613          	addi	a2,a2,-48
    43d2:	97b2                	add	a5,a5,a2
    43d4:	d5040613          	addi	a2,s0,-688 # 20001d50 <aim_degree>
    43d8:	c21c                	sw	a5,0(a2)
				if(data_rev[0]=='-') aim_degree=-aim_degree;
    43da:	08a59d63          	bne	a1,a0,4474 <main+0x1de>
    43de:	40f007b3          	neg	a5,a5
    43e2:	c21c                	sw	a5,0(a2)
				else if(data_rev[0]=='+') aim_degree=aim_degree;
				else  aim_degree=0;
				aim_loc=data_rev[5]-0x30;
    43e4:	0056c783          	lbu	a5,5(a3)
    43e8:	20002637          	lui	a2,0x20002
    43ec:	fd078793          	addi	a5,a5,-48
    43f0:	f8f60823          	sb	a5,-112(a2) # 20001f90 <aim_loc>
				flag=1;
    43f4:	4785                	li	a5,1
    43f6:	00f48023          	sb	a5,0(s1)
				//data_rev清零
				int i=0;
				while(i<10) {data_rev[i]='\0';i++;}					 
    43fa:	4629                	li	a2,10
				int i=0;
    43fc:	4781                	li	a5,0
				while(i<10) {data_rev[i]='\0';i++;}					 
    43fe:	00f685b3          	add	a1,a3,a5
    4402:	00058023          	sb	zero,0(a1)
    4406:	0785                	addi	a5,a5,1
    4408:	fec79be3          	bne	a5,a2,43fe <main+0x168>
			 }	 
		if(flag)
		{   
			//旋转和复位
			change_angle(aim_degree,aim_loc);
    440c:	200027b7          	lui	a5,0x20002
    4410:	f907c583          	lbu	a1,-112(a5) # 20001f90 <aim_loc>
    4414:	d5042503          	lw	a0,-688(s0)
    4418:	3bad                	jal	4192 <change_angle>
			if(aim_loc==1)  //top_motor
    441a:	200027b7          	lui	a5,0x20002
    441e:	f907c583          	lbu	a1,-112(a5) # 20001f90 <aim_loc>
    4422:	d5040693          	addi	a3,s0,-688
    4426:	4605                	li	a2,1
    4428:	429c                	lw	a5,0(a3)
    442a:	06c59163          	bne	a1,a2,448c <main+0x1f6>
			    top_loc+=aim_degree;
    442e:	20002737          	lui	a4,0x20002
    4432:	d7270613          	addi	a2,a4,-654 # 20001d72 <top_loc>
    4436:	00065603          	lhu	a2,0(a2)
    443a:	d7270713          	addi	a4,a4,-654
    443e:	97b2                	add	a5,a5,a2
			else
				bottom_loc+=aim_degree;
    4440:	00f71023          	sh	a5,0(a4)
			flag=0;
    4444:	00048023          	sb	zero,0(s1)
			aim_degree=0;
    4448:	0006a023          	sw	zero,0(a3)
    444c:	bd55                	j	4300 <main+0x6a>
    ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    444e:	4585                	li	a1,1
    4450:	842a                	mv	s0,a0
    4452:	de2ff0ef          	jal	ra,3a34 <csi_timer_config>
    if (ret < 0) {
    4456:	e60544e3          	bltz	a0,42be <main+0x28>
    ret = csi_timer_set_timeout(timer_handle, timer_T);
    445a:	0007a5b7          	lui	a1,0x7a
    445e:	12058593          	addi	a1,a1,288 # 7a120 <__ctor_end__+0x738a0>
    4462:	8522                	mv	a0,s0
    4464:	e1aff0ef          	jal	ra,3a7e <csi_timer_set_timeout>
    if (ret < 0) {
    4468:	e4054be3          	bltz	a0,42be <main+0x28>
    ret = csi_timer_start(timer_handle);
    446c:	8522                	mv	a0,s0
    446e:	e22ff0ef          	jal	ra,3a90 <csi_timer_start>
    if (ret < 0) {
    4472:	b5b1                	j	42be <main+0x28>
				else if(data_rev[0]=='+') aim_degree=aim_degree;
    4474:	02b00793          	li	a5,43
    4478:	f6f586e3          	beq	a1,a5,43e4 <main+0x14e>
				else  aim_degree=0;
    447c:	00062023          	sw	zero,0(a2)
    4480:	b795                	j	43e4 <main+0x14e>
		if(flag)
    4482:	0004c783          	lbu	a5,0(s1)
    4486:	e6078fe3          	beqz	a5,4304 <main+0x6e>
    448a:	b749                	j	440c <main+0x176>
				bottom_loc+=aim_degree;
    448c:	4702                	lw	a4,0(sp)
    448e:	00075603          	lhu	a2,0(a4)
    4492:	97b2                	add	a5,a5,a2
    4494:	b775                	j	4440 <main+0x1aa>

00004496 <OLED_WrDat>:



//内部使用用户无需调用
void OLED_WrDat(uint8_t data)
{
    4496:	1141                	addi	sp,sp,-16
	uint8_t i=8;
	
	OLED_DC(1);
    4498:	200027b7          	lui	a5,0x20002
{
    449c:	c226                	sw	s1,4(sp)
    449e:	84aa                	mv	s1,a0
	OLED_DC(1);
    44a0:	d747a503          	lw	a0,-652(a5) # 20001d74 <OLED_DC_PIN>
    44a4:	4585                	li	a1,1
{
    44a6:	c606                	sw	ra,12(sp)
    44a8:	c422                	sw	s0,8(sp)
	OLED_DC(1);
    44aa:	c7eff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	OLED_SCL(0);
    44ae:	200027b7          	lui	a5,0x20002
    44b2:	d7c7a503          	lw	a0,-644(a5) # 20001d7c <OLED_SCL_PIN>
    44b6:	4581                	li	a1,0
	while(i--)
    44b8:	4425                	li	s0,9
	OLED_SCL(0);
    44ba:	c6eff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	while(i--)
    44be:	200027b7          	lui	a5,0x20002
    44c2:	d7c78793          	addi	a5,a5,-644 # 20001d7c <OLED_SCL_PIN>
    44c6:	c03e                	sw	a5,0(sp)
    44c8:	147d                	addi	s0,s0,-1
    44ca:	0ff47413          	andi	s0,s0,255
    44ce:	e411                	bnez	s0,44da <OLED_WrDat+0x44>
	  	OLED_SCL(1);
		
	  	OLED_SCL(0);
	  	data<<=1;
	}
}
    44d0:	40b2                	lw	ra,12(sp)
    44d2:	4422                	lw	s0,8(sp)
    44d4:	4492                	lw	s1,4(sp)
    44d6:	0141                	addi	sp,sp,16
    44d8:	8082                	ret
	  	if(data&0x80){OLED_SDA(1);}
    44da:	200027b7          	lui	a5,0x20002
    44de:	d807a503          	lw	a0,-640(a5) # 20001d80 <OLED_SDA_PIN>
    44e2:	01849793          	slli	a5,s1,0x18
    44e6:	87e1                	srai	a5,a5,0x18
    44e8:	4585                	li	a1,1
    44ea:	0007c363          	bltz	a5,44f0 <OLED_WrDat+0x5a>
	  	else{OLED_SDA(0);}
    44ee:	4581                	li	a1,0
    44f0:	c38ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	  	OLED_SCL(1);
    44f4:	4782                	lw	a5,0(sp)
    44f6:	4585                	li	a1,1
	  	data<<=1;
    44f8:	0486                	slli	s1,s1,0x1
	  	OLED_SCL(1);
    44fa:	4388                	lw	a0,0(a5)
	  	data<<=1;
    44fc:	0ff4f493          	andi	s1,s1,255
	  	OLED_SCL(1);
    4500:	c28ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	  	OLED_SCL(0);
    4504:	4782                	lw	a5,0(sp)
    4506:	4581                	li	a1,0
    4508:	4388                	lw	a0,0(a5)
    450a:	c1eff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	  	data<<=1;
    450e:	bf6d                	j	44c8 <OLED_WrDat+0x32>

00004510 <OLED_WrCmd>:
	}
}

//内部使用用户无需调用
void OLED_WrCmd(uint8_t cmd)
{
    4510:	1141                	addi	sp,sp,-16
	uint8_t i=8;
	
	OLED_DC(0);
    4512:	200027b7          	lui	a5,0x20002
{
    4516:	c226                	sw	s1,4(sp)
    4518:	84aa                	mv	s1,a0
	OLED_DC(0);
    451a:	d747a503          	lw	a0,-652(a5) # 20001d74 <OLED_DC_PIN>
    451e:	4581                	li	a1,0
{
    4520:	c606                	sw	ra,12(sp)
    4522:	c422                	sw	s0,8(sp)
	OLED_DC(0);
    4524:	c04ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	OLED_SCL(0);;
    4528:	200027b7          	lui	a5,0x20002
    452c:	d7c7a503          	lw	a0,-644(a5) # 20001d7c <OLED_SCL_PIN>
    4530:	4581                	li	a1,0
	
	while(i--)
    4532:	4425                	li	s0,9
	OLED_SCL(0);;
    4534:	bf4ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	while(i--)
    4538:	200027b7          	lui	a5,0x20002
    453c:	d7c78793          	addi	a5,a5,-644 # 20001d7c <OLED_SCL_PIN>
    4540:	c03e                	sw	a5,0(sp)
    4542:	147d                	addi	s0,s0,-1
    4544:	0ff47413          	andi	s0,s0,255
    4548:	e411                	bnez	s0,4554 <OLED_WrCmd+0x44>
		
		OLED_SCL(0);
		cmd<<=1;
	}
  
}
    454a:	40b2                	lw	ra,12(sp)
    454c:	4422                	lw	s0,8(sp)
    454e:	4492                	lw	s1,4(sp)
    4550:	0141                	addi	sp,sp,16
    4552:	8082                	ret
		if(cmd&0x80){OLED_SDA(1);}
    4554:	200027b7          	lui	a5,0x20002
    4558:	d807a503          	lw	a0,-640(a5) # 20001d80 <OLED_SDA_PIN>
    455c:	01849793          	slli	a5,s1,0x18
    4560:	87e1                	srai	a5,a5,0x18
    4562:	4585                	li	a1,1
    4564:	0007c363          	bltz	a5,456a <OLED_WrCmd+0x5a>
		else{OLED_SDA(0);}
    4568:	4581                	li	a1,0
    456a:	bbeff0ef          	jal	ra,3928 <csi_gpio_pin_write>
		OLED_SCL(1);
    456e:	4782                	lw	a5,0(sp)
    4570:	4585                	li	a1,1
		cmd<<=1;
    4572:	0486                	slli	s1,s1,0x1
		OLED_SCL(1);
    4574:	4388                	lw	a0,0(a5)
		cmd<<=1;
    4576:	0ff4f493          	andi	s1,s1,255
		OLED_SCL(1);
    457a:	baeff0ef          	jal	ra,3928 <csi_gpio_pin_write>
		OLED_SCL(0);
    457e:	4782                	lw	a5,0(sp)
    4580:	4581                	li	a1,0
    4582:	4388                	lw	a0,0(a5)
    4584:	ba4ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
		cmd<<=1;
    4588:	bf6d                	j	4542 <OLED_WrCmd+0x32>

0000458a <OLED_Set_Pos>:
//  @return     void
//  @since      v1.0
//  Sample usage:			
//-------------------------------------------------------------------------------------------------------------------
void OLED_Set_Pos(uint8_t x, uint8_t y)
{
    458a:	1151                	addi	sp,sp,-12
  OLED_WrCmd(0xb0+y);
    458c:	fb058593          	addi	a1,a1,-80
{
    4590:	c222                	sw	s0,4(sp)
    4592:	842a                	mv	s0,a0
  OLED_WrCmd(0xb0+y);
    4594:	0ff5f513          	andi	a0,a1,255
{
    4598:	c406                	sw	ra,8(sp)
  OLED_WrCmd(0xb0+y);
    459a:	3f9d                	jal	4510 <OLED_WrCmd>
  OLED_WrCmd(((x&0xf0)>>4)|0x10);
    459c:	00445513          	srli	a0,s0,0x4
    45a0:	01056513          	ori	a0,a0,16
    45a4:	37b5                	jal	4510 <OLED_WrCmd>
  OLED_WrCmd((x&0x0f)|0x01);
    45a6:	00e47513          	andi	a0,s0,14
}
    45aa:	4412                	lw	s0,4(sp)
    45ac:	40a2                	lw	ra,8(sp)
  OLED_WrCmd((x&0x0f)|0x01);
    45ae:	00156513          	ori	a0,a0,1
}
    45b2:	0131                	addi	sp,sp,12
  OLED_WrCmd((x&0x0f)|0x01);
    45b4:	bfb1                	j	4510 <OLED_WrCmd>

000045b6 <OLED_Fill>:
//  @return     void
//  @since      v1.0
//  Sample usage:			
//-------------------------------------------------------------------------------------------------------------------
void OLED_Fill(uint8_t bmp_data)
{
    45b6:	1141                	addi	sp,sp,-16
    45b8:	c422                	sw	s0,8(sp)
    45ba:	c226                	sw	s1,4(sp)
    45bc:	c606                	sw	ra,12(sp)
    45be:	84aa                	mv	s1,a0
    45c0:	0b000413          	li	s0,176
	uint8_t y,x;
	
	for(y=0;y<8;y++)
	{
		OLED_WrCmd(0xb0+y);
    45c4:	8522                	mv	a0,s0
    45c6:	37a9                	jal	4510 <OLED_WrCmd>
		OLED_WrCmd(0x01);
    45c8:	4505                	li	a0,1
    45ca:	3799                	jal	4510 <OLED_WrCmd>
		OLED_WrCmd(0x10);
    45cc:	4541                	li	a0,16
    45ce:	3789                	jal	4510 <OLED_WrCmd>
    45d0:	08000793          	li	a5,128
		for(x=0;x<X_WIDTH;x++)	OLED_WrDat(bmp_data); 
    45d4:	8526                	mv	a0,s1
    45d6:	c03e                	sw	a5,0(sp)
    45d8:	3d7d                	jal	4496 <OLED_WrDat>
    45da:	4782                	lw	a5,0(sp)
    45dc:	17fd                	addi	a5,a5,-1
    45de:	fbfd                	bnez	a5,45d4 <OLED_Fill+0x1e>
    45e0:	0405                	addi	s0,s0,1
    45e2:	0ff47413          	andi	s0,s0,255
	for(y=0;y<8;y++)
    45e6:	0b800793          	li	a5,184
    45ea:	fcf41de3          	bne	s0,a5,45c4 <OLED_Fill+0xe>
	}
}
    45ee:	40b2                	lw	ra,12(sp)
    45f0:	4422                	lw	s0,8(sp)
    45f2:	4492                	lw	s1,4(sp)
    45f4:	0141                	addi	sp,sp,16
    45f6:	8082                	ret

000045f8 <OLED_Init>:
//  @return     void
//  @since      v1.0
//  Sample usage:			
//-------------------------------------------------------------------------------------------------------------------
void OLED_Init(void)
{
    45f8:	1151                	addi	sp,sp,-12
	
	OLED_SCL_PIN=csi_gpio_pin_initialize(PA17,NULL); 
    45fa:	4581                	li	a1,0
    45fc:	4545                	li	a0,17
{
    45fe:	c406                	sw	ra,8(sp)
    4600:	c222                	sw	s0,4(sp)
    4602:	c026                	sw	s1,0(sp)
	OLED_SCL_PIN=csi_gpio_pin_initialize(PA17,NULL); 
    4604:	a7aff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    4608:	200024b7          	lui	s1,0x20002
    460c:	d7c48493          	addi	s1,s1,-644 # 20001d7c <OLED_SCL_PIN>
    csi_gpio_pin_config_mode(OLED_SCL_PIN, GPIO_MODE_OPEN_DRAIN);
    4610:	458d                	li	a1,3
	OLED_SCL_PIN=csi_gpio_pin_initialize(PA17,NULL); 
    4612:	c088                	sw	a0,0(s1)
    csi_gpio_pin_config_mode(OLED_SCL_PIN, GPIO_MODE_OPEN_DRAIN);
    4614:	acaff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_SCL_PIN, GPIO_DIRECTION_OUTPUT);	
    4618:	4088                	lw	a0,0(s1)
    461a:	4585                	li	a1,1
	csi_gpio_pin_write(OLED_SCL_PIN,1);

	OLED_SDA_PIN=csi_gpio_pin_initialize(PA12,NULL); 
    461c:	20002437          	lui	s0,0x20002
    csi_gpio_pin_config_direction(OLED_SCL_PIN, GPIO_DIRECTION_OUTPUT);	
    4620:	ad6ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(OLED_SCL_PIN,1);
    4624:	4088                	lw	a0,0(s1)
    4626:	4585                	li	a1,1
	OLED_SDA_PIN=csi_gpio_pin_initialize(PA12,NULL); 
    4628:	d8040413          	addi	s0,s0,-640 # 20001d80 <OLED_SDA_PIN>
	csi_gpio_pin_write(OLED_SCL_PIN,1);
    462c:	afcff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	OLED_SDA_PIN=csi_gpio_pin_initialize(PA12,NULL); 
    4630:	4581                	li	a1,0
    4632:	4531                	li	a0,12
    4634:	a4aff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    csi_gpio_pin_config_mode(OLED_SDA_PIN, GPIO_MODE_OPEN_DRAIN);
    4638:	458d                	li	a1,3
	OLED_SDA_PIN=csi_gpio_pin_initialize(PA12,NULL); 
    463a:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(OLED_SDA_PIN, GPIO_MODE_OPEN_DRAIN);
    463c:	aa2ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_SDA_PIN, GPIO_DIRECTION_OUTPUT);	
    4640:	4008                	lw	a0,0(s0)
    4642:	4585                	li	a1,1
    4644:	ab2ff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(OLED_SDA_PIN,0);
    4648:	4008                	lw	a0,0(s0)
    464a:	4581                	li	a1,0
	
	OLED_RST_PIN=csi_gpio_pin_initialize(PA11,NULL); 
    464c:	20002437          	lui	s0,0x20002
	csi_gpio_pin_write(OLED_SDA_PIN,0);
    4650:	ad8ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	OLED_RST_PIN=csi_gpio_pin_initialize(PA11,NULL); 
    4654:	4581                	li	a1,0
    4656:	452d                	li	a0,11
    4658:	a26ff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    465c:	d7840413          	addi	s0,s0,-648 # 20001d78 <OLED_RST_PIN>
    csi_gpio_pin_config_mode(OLED_RST_PIN, GPIO_MODE_OPEN_DRAIN);
    4660:	458d                	li	a1,3
	OLED_RST_PIN=csi_gpio_pin_initialize(PA11,NULL); 
    4662:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(OLED_RST_PIN, GPIO_MODE_OPEN_DRAIN);
    4664:	a7aff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_RST_PIN, GPIO_DIRECTION_OUTPUT);	
    4668:	4008                	lw	a0,0(s0)
    466a:	4585                	li	a1,1
    466c:	a8aff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(OLED_RST_PIN,1);
    4670:	4008                	lw	a0,0(s0)
    4672:	4585                	li	a1,1
    4674:	ab4ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	
	OLED_DC_PIN=csi_gpio_pin_initialize(PA9,NULL); 
    4678:	4581                	li	a1,0
    467a:	4525                	li	a0,9
    467c:	a02ff0ef          	jal	ra,387e <csi_gpio_pin_initialize>
    4680:	200027b7          	lui	a5,0x20002
    4684:	d7478793          	addi	a5,a5,-652 # 20001d74 <OLED_DC_PIN>
    csi_gpio_pin_config_mode(OLED_DC_PIN, GPIO_MODE_OPEN_DRAIN);
    4688:	458d                	li	a1,3
	OLED_DC_PIN=csi_gpio_pin_initialize(PA9,NULL); 
    468a:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(OLED_DC_PIN, GPIO_MODE_OPEN_DRAIN);
    468c:	a52ff0ef          	jal	ra,38de <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_DC_PIN, GPIO_DIRECTION_OUTPUT);	
    4690:	200027b7          	lui	a5,0x20002
    4694:	d7478713          	addi	a4,a5,-652 # 20001d74 <OLED_DC_PIN>
    4698:	4308                	lw	a0,0(a4)
    469a:	4585                	li	a1,1
    469c:	a5aff0ef          	jal	ra,38f6 <csi_gpio_pin_config_direction>
	csi_gpio_pin_write(OLED_DC_PIN,1);
    46a0:	200027b7          	lui	a5,0x20002
    46a4:	d7478793          	addi	a5,a5,-652 # 20001d74 <OLED_DC_PIN>
    46a8:	4388                	lw	a0,0(a5)
    46aa:	4585                	li	a1,1
    46ac:	a7cff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	

	OLED_SCL(1);
    46b0:	4088                	lw	a0,0(s1)
    46b2:	4585                	li	a1,1
    46b4:	a74ff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	//OLED_CS(0); //使能信号端，拉低时正常使用
	OLED_RST(0);
    46b8:	4008                	lw	a0,0(s0)
    46ba:	4581                	li	a1,0
    46bc:	a6cff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	mdelay(50);
    46c0:	03200513          	li	a0,50
    46c4:	cecff0ef          	jal	ra,3bb0 <mdelay>
	OLED_RST(1);
    46c8:	4008                	lw	a0,0(s0)
    46ca:	4585                	li	a1,1
    46cc:	a5cff0ef          	jal	ra,3928 <csi_gpio_pin_write>
	
	OLED_WrCmd(0xae);//--turn off oled panel
    46d0:	0ae00513          	li	a0,174
    46d4:	3d35                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x00);//---set low column address
    46d6:	4501                	li	a0,0
    46d8:	3d25                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x10);//---set high column address
    46da:	4541                	li	a0,16
    46dc:	3d15                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x40);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
    46de:	04000513          	li	a0,64
    46e2:	353d                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x81);//--set contrast control register
    46e4:	08100513          	li	a0,129
    46e8:	3525                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xcf); // Set SEG Output Current Brightness
    46ea:	0cf00513          	li	a0,207
    46ee:	350d                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xa1);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
    46f0:	0a100513          	li	a0,161
    46f4:	3d31                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xc8);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
    46f6:	0c800513          	li	a0,200
    46fa:	3d19                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xa6);//--set normal display
    46fc:	0a600513          	li	a0,166
    4700:	3d01                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xa8);//--set multiplex ratio(1 to 64)
    4702:	0a800513          	li	a0,168
    4706:	3529                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x3f);//--1/64 duty
    4708:	03f00513          	li	a0,63
    470c:	3511                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xd3);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
    470e:	0d300513          	li	a0,211
    4712:	3bfd                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x00);//-not offset
    4714:	4501                	li	a0,0
    4716:	3bed                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xd5);//--set display clock divide ratio/oscillator frequency
    4718:	0d500513          	li	a0,213
    471c:	3bd5                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x80);//--set divide ratio, Set Clock as 100 Frames/Sec
    471e:	08000513          	li	a0,128
    4722:	33fd                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xd9);//--set pre-charge period
    4724:	0d900513          	li	a0,217
    4728:	33e5                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xf1);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
    472a:	0f100513          	li	a0,241
    472e:	33cd                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xda);//--set com pins hardware configuration
    4730:	0da00513          	li	a0,218
    4734:	3bf1                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x12);
    4736:	4549                	li	a0,18
    4738:	3be1                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xdb);//--set vcomh
    473a:	0db00513          	li	a0,219
    473e:	3bc9                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x40);//Set VCOM Deselect Level
    4740:	04000513          	li	a0,64
    4744:	33f1                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x20);//-Set Page Addressing Mode (0x00/0x01/0x02)
    4746:	02000513          	li	a0,32
    474a:	33d9                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x02);//
    474c:	4509                	li	a0,2
    474e:	33c9                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x8d);//--set Charge Pump enable/disable
    4750:	08d00513          	li	a0,141
    4754:	3b75                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0x14);//--set(0x10) disable
    4756:	4551                	li	a0,20
    4758:	3b65                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xa4);// Disable Entire Display On (0xa4/0xa5)
    475a:	0a400513          	li	a0,164
    475e:	3b4d                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xa6);// Disable Inverse Display On (0xa6/a7)
    4760:	0a600513          	li	a0,166
    4764:	3375                	jal	4510 <OLED_WrCmd>
	OLED_WrCmd(0xaf);//--turn on oled panel
    4766:	0af00513          	li	a0,175
    476a:	335d                	jal	4510 <OLED_WrCmd>
	OLED_Fill(0X00);  //
    476c:	4501                	li	a0,0
    476e:	35a1                	jal	45b6 <OLED_Fill>
	OLED_Set_Pos(0,0);
}
    4770:	4412                	lw	s0,4(sp)
    4772:	40a2                	lw	ra,8(sp)
    4774:	4482                	lw	s1,0(sp)
	OLED_Set_Pos(0,0);
    4776:	4581                	li	a1,0
    4778:	4501                	li	a0,0
}
    477a:	0131                	addi	sp,sp,12
	OLED_Set_Pos(0,0);
    477c:	b539                	j	458a <OLED_Set_Pos>

0000477e <OLED_P6x8Str>:
//  @return     void
//  @since      v1.0
//  Sample usage:			
//-------------------------------------------------------------------------------------------------------------------
void OLED_P6x8Str(uint8_t x,uint8_t y,uint8_t ch[])
{
    477e:	1111                	addi	sp,sp,-28
    4780:	ca22                	sw	s0,20(sp)
    4782:	c826                	sw	s1,16(sp)
    4784:	cc06                	sw	ra,24(sp)
    4786:	84aa                	mv	s1,a0
    4788:	86ae                	mv	a3,a1
    478a:	c032                	sw	a2,0(sp)
	uint8_t c=0,i=0,j=0;
    478c:	4401                	li	s0,0
	while (ch[j]!='\0')
    478e:	4782                	lw	a5,0(sp)
    4790:	97a2                	add	a5,a5,s0
    4792:	0007c783          	lbu	a5,0(a5)
    4796:	e791                	bnez	a5,47a2 <OLED_P6x8Str+0x24>
	  	OLED_Set_Pos(x,y);
	  	for(i=0;i<6;i++)	OLED_WrDat(F6x8[c][i]);
	  	x+=6;
	  	j++;
	}
}
    4798:	40e2                	lw	ra,24(sp)
    479a:	4452                	lw	s0,20(sp)
    479c:	44c2                	lw	s1,16(sp)
    479e:	0171                	addi	sp,sp,28
    47a0:	8082                	ret
	  	c =ch[j]-32;
    47a2:	1781                	addi	a5,a5,-32
	  	if(x>126){x=0;y++;}
    47a4:	07e00593          	li	a1,126
	  	c =ch[j]-32;
    47a8:	0ff7f793          	andi	a5,a5,255
	  	if(x>126){x=0;y++;}
    47ac:	0095f663          	bgeu	a1,s1,47b8 <OLED_P6x8Str+0x3a>
    47b0:	0685                	addi	a3,a3,1
    47b2:	0ff6f693          	andi	a3,a3,255
    47b6:	4481                	li	s1,0
	  	OLED_Set_Pos(x,y);
    47b8:	85b6                	mv	a1,a3
    47ba:	8526                	mv	a0,s1
    47bc:	c43e                	sw	a5,8(sp)
    47be:	c236                	sw	a3,4(sp)
    47c0:	33e9                	jal	458a <OLED_Set_Pos>
	  	for(i=0;i<6;i++)	OLED_WrDat(F6x8[c][i]);
    47c2:	47a2                	lw	a5,8(sp)
    47c4:	4692                	lw	a3,4(sp)
    47c6:	4599                	li	a1,6
    47c8:	6719                	lui	a4,0x6
    47ca:	02b787b3          	mul	a5,a5,a1
    47ce:	edc70313          	addi	t1,a4,-292 # 5edc <F6x8>
	  	OLED_Set_Pos(x,y);
    47d2:	4581                	li	a1,0
	  	for(i=0;i<6;i++)	OLED_WrDat(F6x8[c][i]);
    47d4:	00f58533          	add	a0,a1,a5
    47d8:	951a                	add	a0,a0,t1
    47da:	00054503          	lbu	a0,0(a0)
    47de:	c636                	sw	a3,12(sp)
    47e0:	c43e                	sw	a5,8(sp)
    47e2:	c22e                	sw	a1,4(sp)
    47e4:	cb3ff0ef          	jal	ra,4496 <OLED_WrDat>
    47e8:	4592                	lw	a1,4(sp)
    47ea:	6799                	lui	a5,0x6
    47ec:	4519                	li	a0,6
    47ee:	0585                	addi	a1,a1,1
    47f0:	edc78313          	addi	t1,a5,-292 # 5edc <F6x8>
    47f4:	46b2                	lw	a3,12(sp)
    47f6:	47a2                	lw	a5,8(sp)
    47f8:	fca59ee3          	bne	a1,a0,47d4 <OLED_P6x8Str+0x56>
	  	x+=6;
    47fc:	00648713          	addi	a4,s1,6
	  	j++;
    4800:	00140613          	addi	a2,s0,1
	  	x+=6;
    4804:	0ff77493          	andi	s1,a4,255
	  	j++;
    4808:	0ff67413          	andi	s0,a2,255
    480c:	b749                	j	478e <OLED_P6x8Str+0x10>

0000480e <OLED_HEXACSII>:
void OLED_HEXACSII(uint16_t hex,uint8_t* Print)
{
	uint8_t hexcheck ;
	uint8_t TEMP ;
	TEMP = 6 ;
	Print[TEMP ]='\0';
    480e:	00058323          	sb	zero,6(a1)
	while(TEMP)
    4812:	00558793          	addi	a5,a1,5
	{
	  	TEMP -- ;
	  	hexcheck  =  hex%10 ;
    4816:	46a9                	li	a3,10
    4818:	02d57733          	remu	a4,a0,a3
	  	hex   /=10 ;
	  	Print[TEMP ]  = hexcheck + 0x30 ;
    481c:	03070713          	addi	a4,a4,48
    4820:	00e78023          	sb	a4,0(a5)
	  	hex   /=10 ;
    4824:	02d55533          	divu	a0,a0,a3
	  	Print[TEMP ]  = hexcheck + 0x30 ;
    4828:	fff78713          	addi	a4,a5,-1
	while(TEMP)
    482c:	00f59363          	bne	a1,a5,4832 <OLED_HEXACSII+0x24>
	}
  
}
    4830:	8082                	ret
    4832:	87ba                	mv	a5,a4
    4834:	b7d5                	j	4818 <OLED_HEXACSII+0xa>

00004836 <OLED_Print_Num1>:
{
    4836:	1111                	addi	sp,sp,-28
    4838:	ca22                	sw	s0,20(sp)
    483a:	c826                	sw	s1,16(sp)
    483c:	cc06                	sw	ra,24(sp)
    483e:	c02e                	sw	a1,0(sp)
    4840:	842a                	mv	s0,a0
    4842:	84b2                	mv	s1,a2
	if(num<0)   {num = -num;OLED_P6x8Str(x, y, (uint8_t *)"-");}
    4844:	02065e63          	bgez	a2,4880 <OLED_Print_Num1+0x4a>
    4848:	40c007b3          	neg	a5,a2
    484c:	01079493          	slli	s1,a5,0x10
    4850:	00006637          	lui	a2,0x6
    4854:	84c1                	srai	s1,s1,0x10
    4856:	10460613          	addi	a2,a2,260 # 6104 <F6x8+0x228>
	else         OLED_P6x8Str(x, y, (uint8_t *)" ");
    485a:	3715                	jal	477e <OLED_P6x8Str>
	OLED_HEXACSII(num,ch);
    485c:	01049513          	slli	a0,s1,0x10
    4860:	002c                	addi	a1,sp,8
    4862:	8141                	srli	a0,a0,0x10
	x+=6;
    4864:	0419                	addi	s0,s0,6
	OLED_HEXACSII(num,ch);
    4866:	3765                	jal	480e <OLED_HEXACSII>
	x+=6;
    4868:	0ff47413          	andi	s0,s0,255
	ch1 =&ch[1];
    486c:	00910793          	addi	a5,sp,9
	while(*ch1 != '\0')
    4870:	0007c703          	lbu	a4,0(a5)
    4874:	eb19                	bnez	a4,488a <OLED_Print_Num1+0x54>
}
    4876:	40e2                	lw	ra,24(sp)
    4878:	4452                	lw	s0,20(sp)
    487a:	44c2                	lw	s1,16(sp)
    487c:	0171                	addi	sp,sp,28
    487e:	8082                	ret
	else         OLED_P6x8Str(x, y, (uint8_t *)" ");
    4880:	00006637          	lui	a2,0x6
    4884:	e4060613          	addi	a2,a2,-448 # 5e40 <sg_usi_config+0x138>
    4888:	bfc9                	j	485a <OLED_Print_Num1+0x24>
		OLED_P6x8Str(x, y, ch1);	//显示数字
    488a:	4582                	lw	a1,0(sp)
    488c:	863e                	mv	a2,a5
    488e:	8522                	mv	a0,s0
    4890:	c23e                	sw	a5,4(sp)
    4892:	35f5                	jal	477e <OLED_P6x8Str>
		ch1++;
    4894:	4792                	lw	a5,4(sp)
		x += 6;
    4896:	0419                	addi	s0,s0,6
    4898:	0ff47413          	andi	s0,s0,255
		ch1++;
    489c:	0785                	addi	a5,a5,1
    489e:	bfc9                	j	4870 <OLED_Print_Num1+0x3a>

000048a0 <copystring>:
    48a0:	4781                	li	a5,0
    48a2:	470d                	li	a4,3
    48a4:	00b7c463          	blt	a5,a1,48ac <copystring+0xc>
    48a8:	853e                	mv	a0,a5
    48aa:	8082                	ret
    48ac:	00f606b3          	add	a3,a2,a5
    48b0:	0006c303          	lbu	t1,0(a3)
    48b4:	00f506b3          	add	a3,a0,a5
    48b8:	0785                	addi	a5,a5,1
    48ba:	00668023          	sb	t1,0(a3)
    48be:	fee793e3          	bne	a5,a4,48a4 <copystring+0x4>
    48c2:	feb7d3e3          	bge	a5,a1,48a8 <copystring+0x8>
    48c6:	000501a3          	sb	zero,3(a0)
    48ca:	4791                	li	a5,4
    48cc:	bff1                	j	48a8 <copystring+0x8>

000048ce <__dtostr>:
    48ce:	fa810113          	addi	sp,sp,-88
    48d2:	c8a2                	sw	s0,80(sp)
    48d4:	ca86                	sw	ra,84(sp)
    48d6:	c6a6                	sw	s1,76(sp)
    48d8:	d02a                	sw	a0,32(sp)
    48da:	c42e                	sw	a1,8(sp)
    48dc:	c032                	sw	a2,0(sp)
    48de:	8436                	mv	s0,a3
    48e0:	d43a                	sw	a4,40(sp)
    48e2:	c23e                	sw	a5,4(sp)
    48e4:	2139                	jal	4cf2 <__isinf>
    48e6:	cd09                	beqz	a0,4900 <__dtostr+0x32>
    48e8:	00006637          	lui	a2,0x6
    48ec:	14060613          	addi	a2,a2,320 # 6140 <F6x8+0x264>
    48f0:	85a2                	mv	a1,s0
    48f2:	4446                	lw	s0,80(sp)
    48f4:	4502                	lw	a0,0(sp)
    48f6:	40d6                	lw	ra,84(sp)
    48f8:	44b6                	lw	s1,76(sp)
    48fa:	05810113          	addi	sp,sp,88
    48fe:	b74d                	j	48a0 <copystring>
    4900:	5702                	lw	a4,32(sp)
    4902:	47a2                	lw	a5,8(sp)
    4904:	853a                	mv	a0,a4
    4906:	85be                	mv	a1,a5
    4908:	23b9                	jal	4e56 <__isnan>
    490a:	d22a                	sw	a0,36(sp)
    490c:	c511                	beqz	a0,4918 <__dtostr+0x4a>
    490e:	00006637          	lui	a2,0x6
    4912:	14460613          	addi	a2,a2,324 # 6144 <F6x8+0x268>
    4916:	bfe9                	j	48f0 <__dtostr+0x22>
    4918:	5702                	lw	a4,32(sp)
    491a:	47a2                	lw	a5,8(sp)
    491c:	4601                	li	a2,0
    491e:	4681                	li	a3,0
    4920:	853a                	mv	a0,a4
    4922:	85be                	mv	a1,a5
    4924:	b1bfc0ef          	jal	ra,143e <__eqdf2>
    4928:	e925                	bnez	a0,4998 <__dtostr+0xca>
    492a:	4792                	lw	a5,4(sp)
    492c:	3a078e63          	beqz	a5,4ce8 <__dtostr+0x41a>
    4930:	0789                	addi	a5,a5,2
    4932:	02f46163          	bltu	s0,a5,4954 <__dtostr+0x86>
    4936:	cb85                	beqz	a5,4966 <__dtostr+0x98>
    4938:	4722                	lw	a4,8(sp)
    493a:	04075c63          	bgez	a4,4992 <__dtostr+0xc4>
    493e:	4682                	lw	a3,0(sp)
    4940:	02d00713          	li	a4,45
    4944:	00e68023          	sb	a4,0(a3)
    4948:	00178713          	addi	a4,a5,1
    494c:	4785                	li	a5,1
    494e:	03000693          	li	a3,48
    4952:	a801                	j	4962 <__dtostr+0x94>
    4954:	47a1                	li	a5,8
    4956:	b7cd                	j	4938 <__dtostr+0x6a>
    4958:	4602                	lw	a2,0(sp)
    495a:	963e                	add	a2,a2,a5
    495c:	00d60023          	sb	a3,0(a2)
    4960:	0785                	addi	a5,a5,1
    4962:	fee7ebe3          	bltu	a5,a4,4958 <__dtostr+0x8a>
    4966:	4702                	lw	a4,0(sp)
    4968:	03000693          	li	a3,48
    496c:	00074603          	lbu	a2,0(a4)
    4970:	4705                	li	a4,1
    4972:	00d60363          	beq	a2,a3,4978 <__dtostr+0xaa>
    4976:	4709                	li	a4,2
    4978:	4682                	lw	a3,0(sp)
    497a:	9736                	add	a4,a4,a3
    497c:	02e00693          	li	a3,46
    4980:	00d70023          	sb	a3,0(a4)
    4984:	4702                	lw	a4,0(sp)
    4986:	00f704b3          	add	s1,a4,a5
    498a:	00048023          	sb	zero,0(s1)
    498e:	d23e                	sw	a5,36(sp)
    4990:	ac69                	j	4c2a <__dtostr+0x35c>
    4992:	873e                	mv	a4,a5
    4994:	4781                	li	a5,0
    4996:	bf65                	j	494e <__dtostr+0x80>
    4998:	5702                	lw	a4,32(sp)
    499a:	47a2                	lw	a5,8(sp)
    499c:	4601                	li	a2,0
    499e:	4681                	li	a3,0
    49a0:	853a                	mv	a0,a4
    49a2:	85be                	mv	a1,a5
    49a4:	bc9fc0ef          	jal	ra,156c <__ledf2>
    49a8:	18055963          	bgez	a0,4b3a <__dtostr+0x26c>
    49ac:	47a2                	lw	a5,8(sp)
    49ae:	4702                	lw	a4,0(sp)
    49b0:	800002b7          	lui	t0,0x80000
    49b4:	00f2c2b3          	xor	t0,t0,a5
    49b8:	02d00793          	li	a5,45
    49bc:	00f70023          	sb	a5,0(a4)
    49c0:	147d                	addi	s0,s0,-1
    49c2:	00170493          	addi	s1,a4,1
    49c6:	000067b7          	lui	a5,0x6
    49ca:	1087a503          	lw	a0,264(a5) # 6108 <F6x8+0x22c>
    49ce:	10c7a583          	lw	a1,268(a5)
    49d2:	000067b7          	lui	a5,0x6
    49d6:	1187a703          	lw	a4,280(a5) # 6118 <F6x8+0x23c>
    49da:	11c7a783          	lw	a5,284(a5)
    49de:	4381                	li	t2,0
    49e0:	4692                	lw	a3,4(sp)
    49e2:	14d39f63          	bne	t2,a3,4b40 <__dtostr+0x272>
    49e6:	5702                	lw	a4,32(sp)
    49e8:	862a                	mv	a2,a0
    49ea:	86ae                	mv	a3,a1
    49ec:	853a                	mv	a0,a4
    49ee:	8596                	mv	a1,t0
    49f0:	ec7fb0ef          	jal	ra,8b6 <__adddf3>
    49f4:	000067b7          	lui	a5,0x6
    49f8:	1207a603          	lw	a2,288(a5) # 6120 <F6x8+0x244>
    49fc:	1247a683          	lw	a3,292(a5)
    4a00:	c82a                	sw	a0,16(sp)
    4a02:	ca2e                	sw	a1,20(sp)
    4a04:	b69fc0ef          	jal	ra,156c <__ledf2>
    4a08:	00055863          	bgez	a0,4a18 <__dtostr+0x14a>
    4a0c:	03000793          	li	a5,48
    4a10:	00f48023          	sb	a5,0(s1)
    4a14:	147d                	addi	s0,s0,-1
    4a16:	0485                	addi	s1,s1,1
    4a18:	47a2                	lw	a5,8(sp)
    4a1a:	0147d513          	srli	a0,a5,0x14
    4a1e:	7ff57513          	andi	a0,a0,2047
    4a22:	c0150513          	addi	a0,a0,-1023
    4a26:	f10fd0ef          	jal	ra,2136 <__floatsidf>
    4a2a:	000067b7          	lui	a5,0x6
    4a2e:	1287a603          	lw	a2,296(a5) # 6128 <F6x8+0x24c>
    4a32:	12c7a683          	lw	a3,300(a5)
    4a36:	bebfc0ef          	jal	ra,1620 <__muldf3>
    4a3a:	e98fd0ef          	jal	ra,20d2 <__fixdfsi>
    4a3e:	00150793          	addi	a5,a0,1
    4a42:	cc3e                	sw	a5,24(sp)
    4a44:	22f05d63          	blez	a5,4c7e <__dtostr+0x3b0>
    4a48:	000066b7          	lui	a3,0x6
    4a4c:	1306a603          	lw	a2,304(a3) # 6130 <F6x8+0x254>
    4a50:	82be                	mv	t0,a5
    4a52:	1346a683          	lw	a3,308(a3)
    4a56:	000067b7          	lui	a5,0x6
    4a5a:	1107a703          	lw	a4,272(a5) # 6110 <F6x8+0x234>
    4a5e:	1147a783          	lw	a5,276(a5)
    4a62:	43a9                	li	t2,10
    4a64:	d632                	sw	a2,44(sp)
    4a66:	d836                	sw	a3,48(sp)
    4a68:	0e53ea63          	bltu	t2,t0,4b5c <__dtostr+0x28e>
    4a6c:	000066b7          	lui	a3,0x6
    4a70:	1106a603          	lw	a2,272(a3) # 6110 <F6x8+0x234>
    4a74:	1146a683          	lw	a3,276(a3)
    4a78:	4385                	li	t2,1
    4a7a:	d632                	sw	a2,44(sp)
    4a7c:	d836                	sw	a3,48(sp)
    4a7e:	0e729c63          	bne	t0,t2,4b76 <__dtostr+0x2a8>
    4a82:	4685                	li	a3,1
    4a84:	d636                	sw	a3,44(sp)
    4a86:	000066b7          	lui	a3,0x6
    4a8a:	1386a603          	lw	a2,312(a3) # 6138 <F6x8+0x25c>
    4a8e:	13c6a683          	lw	a3,316(a3)
    4a92:	da32                	sw	a2,52(sp)
    4a94:	dc36                	sw	a3,56(sp)
    4a96:	000066b7          	lui	a3,0x6
    4a9a:	1106a603          	lw	a2,272(a3) # 6110 <F6x8+0x234>
    4a9e:	1146a683          	lw	a3,276(a3)
    4aa2:	de32                	sw	a2,60(sp)
    4aa4:	c0b6                	sw	a3,64(sp)
    4aa6:	5652                	lw	a2,52(sp)
    4aa8:	56e2                	lw	a3,56(sp)
    4aaa:	853a                	mv	a0,a4
    4aac:	85be                	mv	a1,a5
    4aae:	c2ba                	sw	a4,68(sp)
    4ab0:	c4be                	sw	a5,72(sp)
    4ab2:	a07fc0ef          	jal	ra,14b8 <__gedf2>
    4ab6:	4716                	lw	a4,68(sp)
    4ab8:	47a6                	lw	a5,72(sp)
    4aba:	0ca04b63          	bgtz	a0,4b90 <__dtostr+0x2c2>
    4abe:	4682                	lw	a3,0(sp)
    4ac0:	00d49a63          	bne	s1,a3,4ad4 <__dtostr+0x206>
    4ac4:	16040363          	beqz	s0,4c2a <__dtostr+0x35c>
    4ac8:	03000693          	li	a3,48
    4acc:	00d48023          	sb	a3,0(s1)
    4ad0:	147d                	addi	s0,s0,-1
    4ad2:	0485                	addi	s1,s1,1
    4ad4:	4692                	lw	a3,4(sp)
    4ad6:	ea81                	bnez	a3,4ae6 <__dtostr+0x218>
    4ad8:	4682                	lw	a3,0(sp)
    4ada:	5622                	lw	a2,40(sp)
    4adc:	40d486b3          	sub	a3,s1,a3
    4ae0:	0685                	addi	a3,a3,1
    4ae2:	04c6f663          	bgeu	a3,a2,4b2e <__dtostr+0x260>
    4ae6:	14040263          	beqz	s0,4c2a <__dtostr+0x35c>
    4aea:	02e00693          	li	a3,46
    4aee:	00d48023          	sb	a3,0(s1)
    4af2:	4692                	lw	a3,4(sp)
    4af4:	147d                	addi	s0,s0,-1
    4af6:	00148293          	addi	t0,s1,1
    4afa:	ea81                	bnez	a3,4b0a <__dtostr+0x23c>
    4afc:	56a2                	lw	a3,40(sp)
    4afe:	4602                	lw	a2,0(sp)
    4b00:	0685                	addi	a3,a3,1
    4b02:	40c28633          	sub	a2,t0,a2
    4b06:	8e91                	sub	a3,a3,a2
    4b08:	c236                	sw	a3,4(sp)
    4b0a:	4692                	lw	a3,4(sp)
    4b0c:	10d46f63          	bltu	s0,a3,4c2a <__dtostr+0x35c>
    4b10:	8426                	mv	s0,s1
    4b12:	94b6                	add	s1,s1,a3
    4b14:	000066b7          	lui	a3,0x6
    4b18:	1106a603          	lw	a2,272(a3) # 6110 <F6x8+0x234>
    4b1c:	1146a683          	lw	a3,276(a3)
    4b20:	c432                	sw	a2,8(sp)
    4b22:	c636                	sw	a3,12(sp)
    4b24:	16941463          	bne	s0,s1,4c8c <__dtostr+0x3be>
    4b28:	4792                	lw	a5,4(sp)
    4b2a:	00f284b3          	add	s1,t0,a5
    4b2e:	4782                	lw	a5,0(sp)
    4b30:	00048023          	sb	zero,0(s1)
    4b34:	40f487b3          	sub	a5,s1,a5
    4b38:	bd99                	j	498e <__dtostr+0xc0>
    4b3a:	4482                	lw	s1,0(sp)
    4b3c:	42a2                	lw	t0,8(sp)
    4b3e:	b561                	j	49c6 <__dtostr+0xf8>
    4b40:	863a                	mv	a2,a4
    4b42:	86be                	mv	a3,a5
    4b44:	d616                	sw	t0,44(sp)
    4b46:	cc1e                	sw	t2,24(sp)
    4b48:	c83a                	sw	a4,16(sp)
    4b4a:	ca3e                	sw	a5,20(sp)
    4b4c:	ad5fc0ef          	jal	ra,1620 <__muldf3>
    4b50:	43e2                	lw	t2,24(sp)
    4b52:	52b2                	lw	t0,44(sp)
    4b54:	4742                	lw	a4,16(sp)
    4b56:	0385                	addi	t2,t2,1
    4b58:	47d2                	lw	a5,20(sp)
    4b5a:	b559                	j	49e0 <__dtostr+0x112>
    4b5c:	5632                	lw	a2,44(sp)
    4b5e:	56c2                	lw	a3,48(sp)
    4b60:	853a                	mv	a0,a4
    4b62:	85be                	mv	a1,a5
    4b64:	da16                	sw	t0,52(sp)
    4b66:	abbfc0ef          	jal	ra,1620 <__muldf3>
    4b6a:	52d2                	lw	t0,52(sp)
    4b6c:	872a                	mv	a4,a0
    4b6e:	87ae                	mv	a5,a1
    4b70:	12d9                	addi	t0,t0,-10
    4b72:	43a9                	li	t2,10
    4b74:	bdd5                	j	4a68 <__dtostr+0x19a>
    4b76:	5632                	lw	a2,44(sp)
    4b78:	56c2                	lw	a3,48(sp)
    4b7a:	853a                	mv	a0,a4
    4b7c:	85be                	mv	a1,a5
    4b7e:	da16                	sw	t0,52(sp)
    4b80:	aa1fc0ef          	jal	ra,1620 <__muldf3>
    4b84:	52d2                	lw	t0,52(sp)
    4b86:	872a                	mv	a4,a0
    4b88:	87ae                	mv	a5,a1
    4b8a:	12fd                	addi	t0,t0,-1
    4b8c:	4385                	li	t2,1
    4b8e:	bdc5                	j	4a7e <__dtostr+0x1b0>
    4b90:	4542                	lw	a0,16(sp)
    4b92:	45d2                	lw	a1,20(sp)
    4b94:	863a                	mv	a2,a4
    4b96:	86be                	mv	a3,a5
    4b98:	c2ba                	sw	a4,68(sp)
    4b9a:	c4be                	sw	a5,72(sp)
    4b9c:	b14fc0ef          	jal	ra,eb0 <__divdf3>
    4ba0:	d32fd0ef          	jal	ra,20d2 <__fixdfsi>
    4ba4:	5632                	lw	a2,44(sp)
    4ba6:	0ff57693          	andi	a3,a0,255
    4baa:	4716                	lw	a4,68(sp)
    4bac:	47a6                	lw	a5,72(sp)
    4bae:	c211                	beqz	a2,4bb2 <__dtostr+0x2e4>
    4bb0:	ced5                	beqz	a3,4c6c <__dtostr+0x39e>
    4bb2:	03068693          	addi	a3,a3,48
    4bb6:	00d48023          	sb	a3,0(s1)
    4bba:	0485                	addi	s1,s1,1
    4bbc:	ec35                	bnez	s0,4c38 <__dtostr+0x36a>
    4bbe:	863a                	mv	a2,a4
    4bc0:	86be                	mv	a3,a5
    4bc2:	5702                	lw	a4,32(sp)
    4bc4:	47a2                	lw	a5,8(sp)
    4bc6:	853a                	mv	a0,a4
    4bc8:	85be                	mv	a1,a5
    4bca:	ae6fc0ef          	jal	ra,eb0 <__divdf3>
    4bce:	4792                	lw	a5,4(sp)
    4bd0:	5722                	lw	a4,40(sp)
    4bd2:	4602                	lw	a2,0(sp)
    4bd4:	4681                	li	a3,0
    4bd6:	39e5                	jal	48ce <__dtostr>
    4bd8:	c929                	beqz	a0,4c2a <__dtostr+0x35c>
    4bda:	00a48333          	add	t1,s1,a0
    4bde:	06500793          	li	a5,101
    4be2:	00f30023          	sb	a5,0(t1) # 20002000 <__bss_end__+0x58>
    4be6:	00130493          	addi	s1,t1,1
    4bea:	fff54513          	not	a0,a0
    4bee:	4711                	li	a4,4
    4bf0:	4685                	li	a3,1
    4bf2:	3e800793          	li	a5,1000
    4bf6:	4629                	li	a2,10
    4bf8:	45e2                	lw	a1,24(sp)
    4bfa:	00f5d363          	bge	a1,a5,4c00 <__dtostr+0x332>
    4bfe:	e285                	bnez	a3,4c1e <__dtostr+0x350>
    4c00:	c909                	beqz	a0,4c12 <__dtostr+0x344>
    4c02:	46e2                	lw	a3,24(sp)
    4c04:	0485                	addi	s1,s1,1
    4c06:	02f6c6b3          	div	a3,a3,a5
    4c0a:	03068693          	addi	a3,a3,48
    4c0e:	fed48fa3          	sb	a3,-1(s1)
    4c12:	46e2                	lw	a3,24(sp)
    4c14:	157d                	addi	a0,a0,-1
    4c16:	02f6e6b3          	rem	a3,a3,a5
    4c1a:	cc36                	sw	a3,24(sp)
    4c1c:	4681                	li	a3,0
    4c1e:	177d                	addi	a4,a4,-1
    4c20:	02c7c7b3          	div	a5,a5,a2
    4c24:	fb71                	bnez	a4,4bf8 <__dtostr+0x32a>
    4c26:	f00514e3          	bnez	a0,4b2e <__dtostr+0x260>
    4c2a:	40d6                	lw	ra,84(sp)
    4c2c:	4446                	lw	s0,80(sp)
    4c2e:	5512                	lw	a0,36(sp)
    4c30:	44b6                	lw	s1,76(sp)
    4c32:	05810113          	addi	sp,sp,88
    4c36:	8082                	ret
    4c38:	0ff57513          	andi	a0,a0,255
    4c3c:	d63a                	sw	a4,44(sp)
    4c3e:	d83e                	sw	a5,48(sp)
    4c40:	cf6fd0ef          	jal	ra,2136 <__floatsidf>
    4c44:	5732                	lw	a4,44(sp)
    4c46:	57c2                	lw	a5,48(sp)
    4c48:	147d                	addi	s0,s0,-1
    4c4a:	863a                	mv	a2,a4
    4c4c:	86be                	mv	a3,a5
    4c4e:	c2ba                	sw	a4,68(sp)
    4c50:	c4be                	sw	a5,72(sp)
    4c52:	9cffc0ef          	jal	ra,1620 <__muldf3>
    4c56:	862a                	mv	a2,a0
    4c58:	86ae                	mv	a3,a1
    4c5a:	4542                	lw	a0,16(sp)
    4c5c:	45d2                	lw	a1,20(sp)
    4c5e:	e67fc0ef          	jal	ra,1ac4 <__subdf3>
    4c62:	4716                	lw	a4,68(sp)
    4c64:	47a6                	lw	a5,72(sp)
    4c66:	c82a                	sw	a0,16(sp)
    4c68:	ca2e                	sw	a1,20(sp)
    4c6a:	d602                	sw	zero,44(sp)
    4c6c:	5672                	lw	a2,60(sp)
    4c6e:	4686                	lw	a3,64(sp)
    4c70:	853a                	mv	a0,a4
    4c72:	85be                	mv	a1,a5
    4c74:	a3cfc0ef          	jal	ra,eb0 <__divdf3>
    4c78:	872a                	mv	a4,a0
    4c7a:	87ae                	mv	a5,a1
    4c7c:	b52d                	j	4aa6 <__dtostr+0x1d8>
    4c7e:	000067b7          	lui	a5,0x6
    4c82:	1187a703          	lw	a4,280(a5) # 6118 <F6x8+0x23c>
    4c86:	11c7a783          	lw	a5,284(a5)
    4c8a:	bd15                	j	4abe <__dtostr+0x1f0>
    4c8c:	4542                	lw	a0,16(sp)
    4c8e:	45d2                	lw	a1,20(sp)
    4c90:	863a                	mv	a2,a4
    4c92:	86be                	mv	a3,a5
    4c94:	d016                	sw	t0,32(sp)
    4c96:	cc3a                	sw	a4,24(sp)
    4c98:	ce3e                	sw	a5,28(sp)
    4c9a:	a16fc0ef          	jal	ra,eb0 <__divdf3>
    4c9e:	c34fd0ef          	jal	ra,20d2 <__fixdfsi>
    4ca2:	03050693          	addi	a3,a0,48
    4ca6:	00d400a3          	sb	a3,1(s0)
    4caa:	0ff57513          	andi	a0,a0,255
    4cae:	c88fd0ef          	jal	ra,2136 <__floatsidf>
    4cb2:	4762                	lw	a4,24(sp)
    4cb4:	47f2                	lw	a5,28(sp)
    4cb6:	0405                	addi	s0,s0,1
    4cb8:	863a                	mv	a2,a4
    4cba:	86be                	mv	a3,a5
    4cbc:	965fc0ef          	jal	ra,1620 <__muldf3>
    4cc0:	862a                	mv	a2,a0
    4cc2:	86ae                	mv	a3,a1
    4cc4:	4542                	lw	a0,16(sp)
    4cc6:	45d2                	lw	a1,20(sp)
    4cc8:	dfdfc0ef          	jal	ra,1ac4 <__subdf3>
    4ccc:	4762                	lw	a4,24(sp)
    4cce:	47f2                	lw	a5,28(sp)
    4cd0:	4622                	lw	a2,8(sp)
    4cd2:	46b2                	lw	a3,12(sp)
    4cd4:	c82a                	sw	a0,16(sp)
    4cd6:	ca2e                	sw	a1,20(sp)
    4cd8:	853a                	mv	a0,a4
    4cda:	85be                	mv	a1,a5
    4cdc:	9d4fc0ef          	jal	ra,eb0 <__divdf3>
    4ce0:	872a                	mv	a4,a0
    4ce2:	87ae                	mv	a5,a1
    4ce4:	5282                	lw	t0,32(sp)
    4ce6:	bd3d                	j	4b24 <__dtostr+0x256>
    4ce8:	47a1                	li	a5,8
    4cea:	c40407e3          	beqz	s0,4938 <__dtostr+0x6a>
    4cee:	4785                	li	a5,1
    4cf0:	b1a1                	j	4938 <__dtostr+0x6a>

00004cf2 <__isinf>:
    4cf2:	e509                	bnez	a0,4cfc <__isinf+0xa>
    4cf4:	7ff007b7          	lui	a5,0x7ff00
    4cf8:	00f58b63          	beq	a1,a5,4d0e <__isinf+0x1c>
    4cfc:	fff007b7          	lui	a5,0xfff00
    4d00:	8fad                	xor	a5,a5,a1
    4d02:	8d5d                	or	a0,a0,a5
    4d04:	00153513          	seqz	a0,a0
    4d08:	40a00533          	neg	a0,a0
    4d0c:	8082                	ret
    4d0e:	4505                	li	a0,1
    4d10:	8082                	ret

00004d12 <__lltostr>:
    4d12:	fdc10113          	addi	sp,sp,-36
    4d16:	15fd                	addi	a1,a1,-1
    4d18:	ce22                	sw	s0,28(sp)
    4d1a:	d006                	sw	ra,32(sp)
    4d1c:	cc26                	sw	s1,24(sp)
    4d1e:	95aa                	add	a1,a1,a0
    4d20:	00058023          	sb	zero,0(a1)
    4d24:	842a                	mv	s0,a0
    4d26:	82b2                	mv	t0,a2
    4d28:	8336                	mv	t1,a3
    4d2a:	c709                	beqz	a4,4d34 <__lltostr+0x22>
    4d2c:	02400693          	li	a3,36
    4d30:	00e6d363          	bge	a3,a4,4d36 <__lltostr+0x24>
    4d34:	4729                	li	a4,10
    4d36:	0062e6b3          	or	a3,t0,t1
    4d3a:	4601                	li	a2,0
    4d3c:	e699                	bnez	a3,4d4a <__lltostr+0x38>
    4d3e:	03000693          	li	a3,48
    4d42:	fed58fa3          	sb	a3,-1(a1)
    4d46:	4605                	li	a2,1
    4d48:	15fd                	addi	a1,a1,-1
    4d4a:	02700693          	li	a3,39
    4d4e:	c391                	beqz	a5,4d52 <__lltostr+0x40>
    4d50:	469d                	li	a3,7
    4d52:	0ff6f793          	andi	a5,a3,255
    4d56:	c23e                	sw	a5,4(sp)
    4d58:	00c587b3          	add	a5,a1,a2
    4d5c:	c43e                	sw	a5,8(sp)
    4d5e:	41f75793          	srai	a5,a4,0x1f
    4d62:	84ae                	mv	s1,a1
    4d64:	c03e                	sw	a5,0(sp)
    4d66:	47a2                	lw	a5,8(sp)
    4d68:	409786b3          	sub	a3,a5,s1
    4d6c:	00947563          	bgeu	s0,s1,4d76 <__lltostr+0x64>
    4d70:	0062e633          	or	a2,t0,t1
    4d74:	e205                	bnez	a2,4d94 <__lltostr+0x82>
    4d76:	00168613          	addi	a2,a3,1
    4d7a:	85a6                	mv	a1,s1
    4d7c:	8522                	mv	a0,s0
    4d7e:	c036                	sw	a3,0(sp)
    4d80:	c5cfd0ef          	jal	ra,21dc <memmove>
    4d84:	4682                	lw	a3,0(sp)
    4d86:	5082                	lw	ra,32(sp)
    4d88:	4472                	lw	s0,28(sp)
    4d8a:	44e2                	lw	s1,24(sp)
    4d8c:	8536                	mv	a0,a3
    4d8e:	02410113          	addi	sp,sp,36
    4d92:	8082                	ret
    4d94:	4682                	lw	a3,0(sp)
    4d96:	863a                	mv	a2,a4
    4d98:	8516                	mv	a0,t0
    4d9a:	859a                	mv	a1,t1
    4d9c:	ca3a                	sw	a4,20(sp)
    4d9e:	c816                	sw	t0,16(sp)
    4da0:	c61a                	sw	t1,12(sp)
    4da2:	fbafb0ef          	jal	ra,55c <__umoddi3>
    4da6:	03050513          	addi	a0,a0,48
    4daa:	0ff57513          	andi	a0,a0,255
    4dae:	03900793          	li	a5,57
    4db2:	14fd                	addi	s1,s1,-1
    4db4:	4332                	lw	t1,12(sp)
    4db6:	42c2                	lw	t0,16(sp)
    4db8:	4752                	lw	a4,20(sp)
    4dba:	00a7ef63          	bltu	a5,a0,4dd8 <__lltostr+0xc6>
    4dbe:	4682                	lw	a3,0(sp)
    4dc0:	00a48023          	sb	a0,0(s1)
    4dc4:	863a                	mv	a2,a4
    4dc6:	8516                	mv	a0,t0
    4dc8:	859a                	mv	a1,t1
    4dca:	c63a                	sw	a4,12(sp)
    4dcc:	c28fb0ef          	jal	ra,1f4 <__udivdi3>
    4dd0:	82aa                	mv	t0,a0
    4dd2:	832e                	mv	t1,a1
    4dd4:	4732                	lw	a4,12(sp)
    4dd6:	bf41                	j	4d66 <__lltostr+0x54>
    4dd8:	4792                	lw	a5,4(sp)
    4dda:	953e                	add	a0,a0,a5
    4ddc:	b7cd                	j	4dbe <__lltostr+0xac>

00004dde <printf>:
    4dde:	fdc10113          	addi	sp,sp,-36
    4de2:	c82e                	sw	a1,16(sp)
    4de4:	080c                	addi	a1,sp,16
    4de6:	c606                	sw	ra,12(sp)
    4de8:	ca32                	sw	a2,20(sp)
    4dea:	cc36                	sw	a3,24(sp)
    4dec:	ce3a                	sw	a4,28(sp)
    4dee:	d03e                	sw	a5,32(sp)
    4df0:	c02e                	sw	a1,0(sp)
    4df2:	2099                	jal	4e38 <vprintf>
    4df4:	40b2                	lw	ra,12(sp)
    4df6:	02410113          	addi	sp,sp,36
    4dfa:	8082                	ret

00004dfc <putc>:
    4dfc:	826ff06f          	j	3e22 <fputc>

00004e00 <__stdio_outs>:
    4e00:	1151                	addi	sp,sp,-12
    4e02:	c222                	sw	s0,4(sp)
    4e04:	c026                	sw	s1,0(sp)
    4e06:	842a                	mv	s0,a0
    4e08:	84ae                	mv	s1,a1
    4e0a:	c406                	sw	ra,8(sp)
    4e0c:	94a2                	add	s1,s1,s0
    4e0e:	852ff0ef          	jal	ra,3e60 <os_critical_enter>
    4e12:	00941a63          	bne	s0,s1,4e26 <__stdio_outs+0x26>
    4e16:	84eff0ef          	jal	ra,3e64 <os_critical_exit>
    4e1a:	40a2                	lw	ra,8(sp)
    4e1c:	4412                	lw	s0,4(sp)
    4e1e:	4482                	lw	s1,0(sp)
    4e20:	4505                	li	a0,1
    4e22:	0131                	addi	sp,sp,12
    4e24:	8082                	ret
    4e26:	a5c1a703          	lw	a4,-1444(gp) # 200000c0 <_impure_ptr>
    4e2a:	00044503          	lbu	a0,0(s0)
    4e2e:	0405                	addi	s0,s0,1
    4e30:	470c                	lw	a1,8(a4)
    4e32:	ff1fe0ef          	jal	ra,3e22 <fputc>
    4e36:	bff1                	j	4e12 <__stdio_outs+0x12>

00004e38 <vprintf>:
    4e38:	1131                	addi	sp,sp,-20
    4e3a:	000057b7          	lui	a5,0x5
    4e3e:	e0078793          	addi	a5,a5,-512 # 4e00 <__stdio_outs>
    4e42:	862e                	mv	a2,a1
    4e44:	85aa                	mv	a1,a0
    4e46:	850a                	mv	a0,sp
    4e48:	c806                	sw	ra,16(sp)
    4e4a:	c002                	sw	zero,0(sp)
    4e4c:	c23e                	sw	a5,4(sp)
    4e4e:	2291                	jal	4f92 <__v_printf>
    4e50:	40c2                	lw	ra,16(sp)
    4e52:	0151                	addi	sp,sp,20
    4e54:	8082                	ret

00004e56 <__isnan>:
    4e56:	fff80737          	lui	a4,0xfff80
    4e5a:	177d                	addi	a4,a4,-1
    4e5c:	8f6d                	and	a4,a4,a1
    4e5e:	e509                	bnez	a0,4e68 <__isnan+0x12>
    4e60:	7ff007b7          	lui	a5,0x7ff00
    4e64:	00f70963          	beq	a4,a5,4e76 <__isnan+0x20>
    4e68:	fff807b7          	lui	a5,0xfff80
    4e6c:	8fad                	xor	a5,a5,a1
    4e6e:	8fc9                	or	a5,a5,a0
    4e70:	0017b513          	seqz	a0,a5
    4e74:	8082                	ret
    4e76:	4505                	li	a0,1
    4e78:	8082                	ret

00004e7a <__ltostr>:
    4e7a:	1151                	addi	sp,sp,-12
    4e7c:	15fd                	addi	a1,a1,-1
    4e7e:	c406                	sw	ra,8(sp)
    4e80:	c222                	sw	s0,4(sp)
    4e82:	95aa                	add	a1,a1,a0
    4e84:	00058023          	sb	zero,0(a1)
    4e88:	fff68313          	addi	t1,a3,-1
    4e8c:	02300793          	li	a5,35
    4e90:	0067f363          	bgeu	a5,t1,4e96 <__ltostr+0x1c>
    4e94:	46a9                	li	a3,10
    4e96:	4781                	li	a5,0
    4e98:	e619                	bnez	a2,4ea6 <__ltostr+0x2c>
    4e9a:	03000793          	li	a5,48
    4e9e:	fef58fa3          	sb	a5,-1(a1)
    4ea2:	15fd                	addi	a1,a1,-1
    4ea4:	4785                	li	a5,1
    4ea6:	02700313          	li	t1,39
    4eaa:	c311                	beqz	a4,4eae <__ltostr+0x34>
    4eac:	431d                	li	t1,7
    4eae:	0ff37713          	andi	a4,t1,255
    4eb2:	03900293          	li	t0,57
    4eb6:	00f58333          	add	t1,a1,a5
    4eba:	40b30433          	sub	s0,t1,a1
    4ebe:	00b57363          	bgeu	a0,a1,4ec4 <__ltostr+0x4a>
    4ec2:	ea11                	bnez	a2,4ed6 <__ltostr+0x5c>
    4ec4:	00140613          	addi	a2,s0,1
    4ec8:	b14fd0ef          	jal	ra,21dc <memmove>
    4ecc:	8522                	mv	a0,s0
    4ece:	40a2                	lw	ra,8(sp)
    4ed0:	4412                	lw	s0,4(sp)
    4ed2:	0131                	addi	sp,sp,12
    4ed4:	8082                	ret
    4ed6:	02d677b3          	remu	a5,a2,a3
    4eda:	15fd                	addi	a1,a1,-1
    4edc:	03078793          	addi	a5,a5,48 # fff80030 <__heap_end+0xdff50030>
    4ee0:	0ff7f793          	andi	a5,a5,255
    4ee4:	00f2e763          	bltu	t0,a5,4ef2 <__ltostr+0x78>
    4ee8:	00f58023          	sb	a5,0(a1)
    4eec:	02d65633          	divu	a2,a2,a3
    4ef0:	b7e9                	j	4eba <__ltostr+0x40>
    4ef2:	97ba                	add	a5,a5,a4
    4ef4:	bfd5                	j	4ee8 <__ltostr+0x6e>

00004ef6 <putchar>:
    4ef6:	a5c1a783          	lw	a5,-1444(gp) # 200000c0 <_impure_ptr>
    4efa:	1151                	addi	sp,sp,-12
    4efc:	c406                	sw	ra,8(sp)
    4efe:	478c                	lw	a1,8(a5)
    4f00:	3df5                	jal	4dfc <putc>
    4f02:	40a2                	lw	ra,8(sp)
    4f04:	4501                	li	a0,0
    4f06:	0131                	addi	sp,sp,12
    4f08:	8082                	ret

00004f0a <puts>:
    4f0a:	1151                	addi	sp,sp,-12
    4f0c:	c222                	sw	s0,4(sp)
    4f0e:	c406                	sw	ra,8(sp)
    4f10:	842a                	mv	s0,a0
    4f12:	00044503          	lbu	a0,0(s0)
    4f16:	55fd                	li	a1,-1
    4f18:	e909                	bnez	a0,4f2a <puts+0x20>
    4f1a:	4529                	li	a0,10
    4f1c:	f07fe0ef          	jal	ra,3e22 <fputc>
    4f20:	40a2                	lw	ra,8(sp)
    4f22:	4412                	lw	s0,4(sp)
    4f24:	4501                	li	a0,0
    4f26:	0131                	addi	sp,sp,12
    4f28:	8082                	ret
    4f2a:	ef9fe0ef          	jal	ra,3e22 <fputc>
    4f2e:	0405                	addi	s0,s0,1
    4f30:	b7cd                	j	4f12 <puts+0x8>

00004f32 <write_pad>:
    4f32:	1131                	addi	sp,sp,-20
    4f34:	fd060613          	addi	a2,a2,-48
    4f38:	c426                	sw	s1,8(sp)
    4f3a:	00163613          	seqz	a2,a2
    4f3e:	6499                	lui	s1,0x6
    4f40:	0612                	slli	a2,a2,0x4
    4f42:	15048493          	addi	s1,s1,336 # 6150 <pad_line>
    4f46:	c622                	sw	s0,12(sp)
    4f48:	c806                	sw	ra,16(sp)
    4f4a:	87aa                	mv	a5,a0
    4f4c:	872e                	mv	a4,a1
    4f4e:	94b2                	add	s1,s1,a2
    4f50:	842e                	mv	s0,a1
    4f52:	463d                	li	a2,15
    4f54:	408706b3          	sub	a3,a4,s0
    4f58:	02864263          	blt	a2,s0,4f7c <write_pad+0x4a>
    4f5c:	00805a63          	blez	s0,4f70 <write_pad+0x3e>
    4f60:	43d8                	lw	a4,4(a5)
    4f62:	4390                	lw	a2,0(a5)
    4f64:	85a2                	mv	a1,s0
    4f66:	8526                	mv	a0,s1
    4f68:	c036                	sw	a3,0(sp)
    4f6a:	9702                	jalr	a4
    4f6c:	4682                	lw	a3,0(sp)
    4f6e:	96a2                	add	a3,a3,s0
    4f70:	40c2                	lw	ra,16(sp)
    4f72:	4432                	lw	s0,12(sp)
    4f74:	44a2                	lw	s1,8(sp)
    4f76:	8536                	mv	a0,a3
    4f78:	0151                	addi	sp,sp,20
    4f7a:	8082                	ret
    4f7c:	43d4                	lw	a3,4(a5)
    4f7e:	4390                	lw	a2,0(a5)
    4f80:	45c1                	li	a1,16
    4f82:	8526                	mv	a0,s1
    4f84:	c23a                	sw	a4,4(sp)
    4f86:	c03e                	sw	a5,0(sp)
    4f88:	9682                	jalr	a3
    4f8a:	1441                	addi	s0,s0,-16
    4f8c:	4712                	lw	a4,4(sp)
    4f8e:	4782                	lw	a5,0(sp)
    4f90:	b7c9                	j	4f52 <write_pad+0x20>

00004f92 <__v_printf>:
    4f92:	200027b7          	lui	a5,0x20002
    4f96:	fa47a783          	lw	a5,-92(a5) # 20001fa4 <errno>
    4f9a:	f2810113          	addi	sp,sp,-216
    4f9e:	c9a2                	sw	s0,208(sp)
    4fa0:	c7a6                	sw	s1,204(sp)
    4fa2:	cb86                	sw	ra,212(sp)
    4fa4:	84aa                	mv	s1,a0
    4fa6:	c82e                	sw	a1,16(sp)
    4fa8:	8432                	mv	s0,a2
    4faa:	d83e                	sw	a5,48(sp)
    4fac:	c202                	sw	zero,4(sp)
    4fae:	47c2                	lw	a5,16(sp)
    4fb0:	0007c783          	lbu	a5,0(a5)
    4fb4:	68078163          	beqz	a5,5636 <__v_printf+0x6a4>
    4fb8:	4701                	li	a4,0
    4fba:	02500613          	li	a2,37
    4fbe:	a011                	j	4fc2 <__v_printf+0x30>
    4fc0:	0705                	addi	a4,a4,1
    4fc2:	47c2                	lw	a5,16(sp)
    4fc4:	97ba                	add	a5,a5,a4
    4fc6:	0007c683          	lbu	a3,0(a5)
    4fca:	74068963          	beqz	a3,571c <__v_printf+0x78a>
    4fce:	fec699e3          	bne	a3,a2,4fc0 <__v_printf+0x2e>
    4fd2:	e319                	bnez	a4,4fd8 <__v_printf+0x46>
    4fd4:	47c2                	lw	a5,16(sp)
    4fd6:	a01d                	j	4ffc <__v_printf+0x6a>
    4fd8:	40d4                	lw	a3,4(s1)
    4fda:	4090                	lw	a2,0(s1)
    4fdc:	4542                	lw	a0,16(sp)
    4fde:	85ba                	mv	a1,a4
    4fe0:	c43e                	sw	a5,8(sp)
    4fe2:	c03a                	sw	a4,0(sp)
    4fe4:	9682                	jalr	a3
    4fe6:	4792                	lw	a5,4(sp)
    4fe8:	4702                	lw	a4,0(sp)
    4fea:	97ba                	add	a5,a5,a4
    4fec:	c23e                	sw	a5,4(sp)
    4fee:	47a2                	lw	a5,8(sp)
    4ff0:	02500713          	li	a4,37
    4ff4:	0007c683          	lbu	a3,0(a5)
    4ff8:	72e69563          	bne	a3,a4,5722 <__v_printf+0x790>
    4ffc:	00178513          	addi	a0,a5,1
    5000:	02000793          	li	a5,32
    5004:	c002                	sw	zero,0(sp)
    5006:	c602                	sw	zero,12(sp)
    5008:	4701                	li	a4,0
    500a:	ca02                	sw	zero,20(sp)
    500c:	ce02                	sw	zero,28(sp)
    500e:	d602                	sw	zero,44(sp)
    5010:	d002                	sw	zero,32(sp)
    5012:	c402                	sw	zero,8(sp)
    5014:	cc3e                	sw	a5,24(sp)
    5016:	00054303          	lbu	t1,0(a0)
    501a:	00150793          	addi	a5,a0,1
    501e:	c83e                	sw	a5,16(sp)
    5020:	046103a3          	sb	t1,71(sp)
    5024:	06300793          	li	a5,99
    5028:	1cf30963          	beq	t1,a5,51fa <__v_printf+0x268>
    502c:	0c67e863          	bltu	a5,t1,50fc <__v_printf+0x16a>
    5030:	02d00793          	li	a5,45
    5034:	02f30363          	beq	t1,a5,505a <__v_printf+0xc8>
    5038:	0667e263          	bltu	a5,t1,509c <__v_printf+0x10a>
    503c:	02300793          	li	a5,35
    5040:	02f30163          	beq	t1,a5,5062 <__v_printf+0xd0>
    5044:	0267e663          	bltu	a5,t1,5070 <__v_printf+0xde>
    5048:	5e030563          	beqz	t1,5632 <__v_printf+0x6a0>
    504c:	02000793          	li	a5,32
    5050:	f4f31fe3          	bne	t1,a5,4fae <__v_printf+0x1c>
    5054:	4785                	li	a5,1
    5056:	d63e                	sw	a5,44(sp)
    5058:	a019                	j	505e <__v_printf+0xcc>
    505a:	4785                	li	a5,1
    505c:	d03e                	sw	a5,32(sp)
    505e:	4542                	lw	a0,16(sp)
    5060:	bf5d                	j	5016 <__v_printf+0x84>
    5062:	0ff00793          	li	a5,255
    5066:	c43e                	sw	a5,8(sp)
    5068:	bfdd                	j	505e <__v_printf+0xcc>
    506a:	4785                	li	a5,1
    506c:	ce3e                	sw	a5,28(sp)
    506e:	bfc5                	j	505e <__v_printf+0xcc>
    5070:	02a00793          	li	a5,42
    5074:	16f30163          	beq	t1,a5,51d6 <__v_printf+0x244>
    5078:	02b00793          	li	a5,43
    507c:	fef307e3          	beq	t1,a5,506a <__v_printf+0xd8>
    5080:	02500793          	li	a5,37
    5084:	f2f315e3          	bne	t1,a5,4fae <__v_printf+0x1c>
    5088:	40dc                	lw	a5,4(s1)
    508a:	4090                	lw	a2,0(s1)
    508c:	4585                	li	a1,1
    508e:	04710513          	addi	a0,sp,71
    5092:	9782                	jalr	a5
    5094:	4792                	lw	a5,4(sp)
    5096:	0785                	addi	a5,a5,1
    5098:	c23e                	sw	a5,4(sp)
    509a:	bf11                	j	4fae <__v_printf+0x1c>
    509c:	03900793          	li	a5,57
    50a0:	0267ee63          	bltu	a5,t1,50dc <__v_printf+0x14a>
    50a4:	03000793          	li	a5,48
    50a8:	0ef37f63          	bgeu	t1,a5,51a6 <__v_printf+0x214>
    50ac:	02e00793          	li	a5,46
    50b0:	eef31fe3          	bne	t1,a5,4fae <__v_printf+0x1c>
    50b4:	00154683          	lbu	a3,1(a0)
    50b8:	02a00793          	li	a5,42
    50bc:	12f69163          	bne	a3,a5,51de <__v_printf+0x24c>
    50c0:	4014                	lw	a3,0(s0)
    50c2:	00440793          	addi	a5,s0,4
    50c6:	c036                	sw	a3,0(sp)
    50c8:	0006d363          	bgez	a3,50ce <__v_printf+0x13c>
    50cc:	c002                	sw	zero,0(sp)
    50ce:	00250693          	addi	a3,a0,2
    50d2:	c836                	sw	a3,16(sp)
    50d4:	843e                	mv	s0,a5
    50d6:	4785                	li	a5,1
    50d8:	ca3e                	sw	a5,20(sp)
    50da:	b751                	j	505e <__v_printf+0xcc>
    50dc:	05800793          	li	a5,88
    50e0:	2af30363          	beq	t1,a5,5386 <__v_printf+0x3f4>
    50e4:	06200793          	li	a5,98
    50e8:	36f30463          	beq	t1,a5,5450 <__v_printf+0x4be>
    50ec:	04c00793          	li	a5,76
    50f0:	eaf31fe3          	bne	t1,a5,4fae <__v_printf+0x1c>
    50f4:	0705                	addi	a4,a4,1
    50f6:	0762                	slli	a4,a4,0x18
    50f8:	8761                	srai	a4,a4,0x18
    50fa:	a091                	j	513e <__v_printf+0x1ac>
    50fc:	06d00793          	li	a5,109
    5100:	10f30263          	beq	t1,a5,5204 <__v_printf+0x272>
    5104:	0267ef63          	bltu	a5,t1,5142 <__v_printf+0x1b0>
    5108:	06700793          	li	a5,103
    510c:	0067ef63          	bltu	a5,t1,512a <__v_printf+0x198>
    5110:	06600793          	li	a5,102
    5114:	3ef37363          	bgeu	t1,a5,54fa <__v_printf+0x568>
    5118:	06400793          	li	a5,100
    511c:	e8f319e3          	bne	t1,a5,4fae <__v_printf+0x1c>
    5120:	4529                	li	a0,10
    5122:	4781                	li	a5,0
    5124:	4285                	li	t0,1
    5126:	4301                	li	t1,0
    5128:	ac51                	j	53bc <__v_printf+0x42a>
    512a:	06900793          	li	a5,105
    512e:	fef309e3          	beq	t1,a5,5120 <__v_printf+0x18e>
    5132:	06f36663          	bltu	t1,a5,519e <__v_printf+0x20c>
    5136:	06c00793          	li	a5,108
    513a:	e6f31ae3          	bne	t1,a5,4fae <__v_printf+0x1c>
    513e:	0705                	addi	a4,a4,1
    5140:	a085                	j	51a0 <__v_printf+0x20e>
    5142:	07300793          	li	a5,115
    5146:	0ef30163          	beq	t1,a5,5228 <__v_printf+0x296>
    514a:	0267ec63          	bltu	a5,t1,5182 <__v_printf+0x1f0>
    514e:	07000793          	li	a5,112
    5152:	22f30363          	beq	t1,a5,5378 <__v_printf+0x3e6>
    5156:	07100793          	li	a5,113
    515a:	f8f30de3          	beq	t1,a5,50f4 <__v_printf+0x162>
    515e:	06f00793          	li	a5,111
    5162:	e4f316e3          	bne	t1,a5,4fae <__v_printf+0x1c>
    5166:	47a2                	lw	a5,8(sp)
    5168:	2e078863          	beqz	a5,5458 <__v_printf+0x4c6>
    516c:	03000793          	li	a5,48
    5170:	04f106a3          	sb	a5,77(sp)
    5174:	4785                	li	a5,1
    5176:	c43e                	sw	a5,8(sp)
    5178:	4521                	li	a0,8
    517a:	4781                	li	a5,0
    517c:	4281                	li	t0,0
    517e:	4305                	li	t1,1
    5180:	ac35                	j	53bc <__v_printf+0x42a>
    5182:	07800793          	li	a5,120
    5186:	2cf30363          	beq	t1,a5,544c <__v_printf+0x4ba>
    518a:	07a00793          	li	a5,122
    518e:	ecf308e3          	beq	t1,a5,505e <__v_printf+0xcc>
    5192:	07500793          	li	a5,117
    5196:	e0f31ce3          	bne	t1,a5,4fae <__v_printf+0x1c>
    519a:	4529                	li	a0,10
    519c:	ac5d                	j	5452 <__v_printf+0x4c0>
    519e:	177d                	addi	a4,a4,-1
    51a0:	0762                	slli	a4,a4,0x18
    51a2:	8761                	srai	a4,a4,0x18
    51a4:	bd6d                	j	505e <__v_printf+0xcc>
    51a6:	47d2                	lw	a5,20(sp)
    51a8:	c83a                	sw	a4,16(sp)
    51aa:	48079463          	bnez	a5,5632 <__v_printf+0x6a0>
    51ae:	4629                	li	a2,10
    51b0:	00ac                	addi	a1,sp,72
    51b2:	faefd0ef          	jal	ra,2960 <strtoul>
    51b6:	04714683          	lbu	a3,71(sp)
    51ba:	c62a                	sw	a0,12(sp)
    51bc:	03000793          	li	a5,48
    51c0:	4742                	lw	a4,16(sp)
    51c2:	00f69763          	bne	a3,a5,51d0 <__v_printf+0x23e>
    51c6:	5782                	lw	a5,32(sp)
    51c8:	e781                	bnez	a5,51d0 <__v_printf+0x23e>
    51ca:	03000793          	li	a5,48
    51ce:	cc3e                	sw	a5,24(sp)
    51d0:	47a6                	lw	a5,72(sp)
    51d2:	c83e                	sw	a5,16(sp)
    51d4:	b569                	j	505e <__v_printf+0xcc>
    51d6:	401c                	lw	a5,0(s0)
    51d8:	0411                	addi	s0,s0,4
    51da:	c63e                	sw	a5,12(sp)
    51dc:	b549                	j	505e <__v_printf+0xcc>
    51de:	4542                	lw	a0,16(sp)
    51e0:	4629                	li	a2,10
    51e2:	00ac                	addi	a1,sp,72
    51e4:	ca3a                	sw	a4,20(sp)
    51e6:	e0afd0ef          	jal	ra,27f0 <strtol>
    51ea:	c02a                	sw	a0,0(sp)
    51ec:	4752                	lw	a4,20(sp)
    51ee:	00055363          	bgez	a0,51f4 <__v_printf+0x262>
    51f2:	c002                	sw	zero,0(sp)
    51f4:	47a6                	lw	a5,72(sp)
    51f6:	c83e                	sw	a5,16(sp)
    51f8:	bdf9                	j	50d6 <__v_printf+0x144>
    51fa:	401c                	lw	a5,0(s0)
    51fc:	0411                	addi	s0,s0,4
    51fe:	04f103a3          	sb	a5,71(sp)
    5202:	b559                	j	5088 <__v_printf+0xf6>
    5204:	5542                	lw	a0,48(sp)
    5206:	c56fd0ef          	jal	ra,265c <strerror>
    520a:	c4aa                	sw	a0,72(sp)
    520c:	c42a                	sw	a0,8(sp)
    520e:	c6afd0ef          	jal	ra,2678 <strlen>
    5212:	4722                	lw	a4,8(sp)
    5214:	40d4                	lw	a3,4(s1)
    5216:	4090                	lw	a2,0(s1)
    5218:	85aa                	mv	a1,a0
    521a:	c02a                	sw	a0,0(sp)
    521c:	853a                	mv	a0,a4
    521e:	9682                	jalr	a3
    5220:	4712                	lw	a4,4(sp)
    5222:	4782                	lw	a5,0(sp)
    5224:	97ba                	add	a5,a5,a4
    5226:	bd8d                	j	5098 <__v_printf+0x106>
    5228:	4018                	lw	a4,0(s0)
    522a:	00440793          	addi	a5,s0,4
    522e:	c721                	beqz	a4,5276 <__v_printf+0x2e4>
    5230:	c4ba                	sw	a4,72(sp)
    5232:	4526                	lw	a0,72(sp)
    5234:	cc3e                	sw	a5,24(sp)
    5236:	c42fd0ef          	jal	ra,2678 <strlen>
    523a:	4752                	lw	a4,20(sp)
    523c:	832a                	mv	t1,a0
    523e:	47e2                	lw	a5,24(sp)
    5240:	c321                	beqz	a4,5280 <__v_printf+0x2ee>
    5242:	4702                	lw	a4,0(sp)
    5244:	00a77363          	bgeu	a4,a0,524a <__v_printf+0x2b8>
    5248:	833a                	mv	t1,a4
    524a:	843e                	mv	s0,a5
    524c:	c002                	sw	zero,0(sp)
    524e:	ca02                	sw	zero,20(sp)
    5250:	4281                	li	t0,0
    5252:	02000793          	li	a5,32
    5256:	cc3e                	sw	a5,24(sp)
    5258:	47b2                	lw	a5,12(sp)
    525a:	4702                	lw	a4,0(sp)
    525c:	46a6                	lw	a3,72(sp)
    525e:	8fd9                	or	a5,a5,a4
    5260:	e785                	bnez	a5,5288 <__v_printf+0x2f6>
    5262:	40dc                	lw	a5,4(s1)
    5264:	4090                	lw	a2,0(s1)
    5266:	859a                	mv	a1,t1
    5268:	8536                	mv	a0,a3
    526a:	c01a                	sw	t1,0(sp)
    526c:	9782                	jalr	a5
    526e:	4792                	lw	a5,4(sp)
    5270:	4302                	lw	t1,0(sp)
    5272:	979a                	add	a5,a5,t1
    5274:	b515                	j	5098 <__v_printf+0x106>
    5276:	00006737          	lui	a4,0x6
    527a:	14870713          	addi	a4,a4,328 # 6148 <F6x8+0x26c>
    527e:	bf4d                	j	5230 <__v_printf+0x29e>
    5280:	843e                	mv	s0,a5
    5282:	4281                	li	t0,0
    5284:	c002                	sw	zero,0(sp)
    5286:	b7f1                	j	5252 <__v_printf+0x2c0>
    5288:	44029163          	bnez	t0,56ca <__v_printf+0x738>
    528c:	47a2                	lw	a5,8(sp)
    528e:	3a078b63          	beqz	a5,5644 <__v_printf+0x6b2>
    5292:	47a2                	lw	a5,8(sp)
    5294:	00f68733          	add	a4,a3,a5
    5298:	c4ba                	sw	a4,72(sp)
    529a:	4732                	lw	a4,12(sp)
    529c:	40f30333          	sub	t1,t1,a5
    52a0:	8f1d                	sub	a4,a4,a5
    52a2:	c63a                	sw	a4,12(sp)
    52a4:	5702                	lw	a4,32(sp)
    52a6:	3a070363          	beqz	a4,564c <__v_printf+0x6ba>
    52aa:	40d8                	lw	a4,4(s1)
    52ac:	4090                	lw	a2,0(s1)
    52ae:	85be                	mv	a1,a5
    52b0:	8536                	mv	a0,a3
    52b2:	ca1a                	sw	t1,20(sp)
    52b4:	c43e                	sw	a5,8(sp)
    52b6:	9702                	jalr	a4
    52b8:	4712                	lw	a4,4(sp)
    52ba:	47a2                	lw	a5,8(sp)
    52bc:	4352                	lw	t1,20(sp)
    52be:	97ba                	add	a5,a5,a4
    52c0:	c23e                	sw	a5,4(sp)
    52c2:	4782                	lw	a5,0(sp)
    52c4:	03000613          	li	a2,48
    52c8:	8526                	mv	a0,s1
    52ca:	406785b3          	sub	a1,a5,t1
    52ce:	ca1a                	sw	t1,20(sp)
    52d0:	c63ff0ef          	jal	ra,4f32 <write_pad>
    52d4:	4792                	lw	a5,4(sp)
    52d6:	4352                	lw	t1,20(sp)
    52d8:	40d8                	lw	a4,4(s1)
    52da:	97aa                	add	a5,a5,a0
    52dc:	4090                	lw	a2,0(s1)
    52de:	4526                	lw	a0,72(sp)
    52e0:	859a                	mv	a1,t1
    52e2:	c43e                	sw	a5,8(sp)
    52e4:	c21a                	sw	t1,4(sp)
    52e6:	9702                	jalr	a4
    52e8:	4312                	lw	t1,4(sp)
    52ea:	47a2                	lw	a5,8(sp)
    52ec:	4582                	lw	a1,0(sp)
    52ee:	979a                	add	a5,a5,t1
    52f0:	0065f363          	bgeu	a1,t1,52f6 <__v_printf+0x364>
    52f4:	859a                	mv	a1,t1
    52f6:	c03e                	sw	a5,0(sp)
    52f8:	47b2                	lw	a5,12(sp)
    52fa:	02000613          	li	a2,32
    52fe:	8526                	mv	a0,s1
    5300:	40b785b3          	sub	a1,a5,a1
    5304:	c2fff0ef          	jal	ra,4f32 <write_pad>
    5308:	4782                	lw	a5,0(sp)
    530a:	97aa                	add	a5,a5,a0
    530c:	b371                	j	5098 <__v_printf+0x106>
    530e:	c78d                	beqz	a5,5338 <__v_printf+0x3a6>
    5310:	4662                	lw	a2,24(sp)
    5312:	03000713          	li	a4,48
    5316:	02e61163          	bne	a2,a4,5338 <__v_printf+0x3a6>
    531a:	40d8                	lw	a4,4(s1)
    531c:	4090                	lw	a2,0(s1)
    531e:	85be                	mv	a1,a5
    5320:	8536                	mv	a0,a3
    5322:	ca1a                	sw	t1,20(sp)
    5324:	c43e                	sw	a5,8(sp)
    5326:	c036                	sw	a3,0(sp)
    5328:	9702                	jalr	a4
    532a:	4712                	lw	a4,4(sp)
    532c:	47a2                	lw	a5,8(sp)
    532e:	4352                	lw	t1,20(sp)
    5330:	4682                	lw	a3,0(sp)
    5332:	97ba                	add	a5,a5,a4
    5334:	c23e                	sw	a5,4(sp)
    5336:	4781                	li	a5,0
    5338:	c43e                	sw	a5,8(sp)
    533a:	47b2                	lw	a5,12(sp)
    533c:	4662                	lw	a2,24(sp)
    533e:	8526                	mv	a0,s1
    5340:	406785b3          	sub	a1,a5,t1
    5344:	c01a                	sw	t1,0(sp)
    5346:	ca36                	sw	a3,20(sp)
    5348:	bebff0ef          	jal	ra,4f32 <write_pad>
    534c:	4792                	lw	a5,4(sp)
    534e:	4302                	lw	t1,0(sp)
    5350:	00a78733          	add	a4,a5,a0
    5354:	47a2                	lw	a5,8(sp)
    5356:	34078e63          	beqz	a5,56b2 <__v_printf+0x720>
    535a:	46d2                	lw	a3,20(sp)
    535c:	0044a383          	lw	t2,4(s1)
    5360:	4090                	lw	a2,0(s1)
    5362:	85be                	mv	a1,a5
    5364:	8536                	mv	a0,a3
    5366:	c41a                	sw	t1,8(sp)
    5368:	c23a                	sw	a4,4(sp)
    536a:	c03e                	sw	a5,0(sp)
    536c:	9382                	jalr	t2
    536e:	4782                	lw	a5,0(sp)
    5370:	4712                	lw	a4,4(sp)
    5372:	4322                	lw	t1,8(sp)
    5374:	973e                	add	a4,a4,a5
    5376:	ae35                	j	56b2 <__v_printf+0x720>
    5378:	07800793          	li	a5,120
    537c:	04f103a3          	sb	a5,71(sp)
    5380:	4789                	li	a5,2
    5382:	4705                	li	a4,1
    5384:	c43e                	sw	a5,8(sp)
    5386:	04714783          	lbu	a5,71(sp)
    538a:	fa878793          	addi	a5,a5,-88
    538e:	0017b793          	seqz	a5,a5
    5392:	46a2                	lw	a3,8(sp)
    5394:	4301                	li	t1,0
    5396:	ce81                	beqz	a3,53ae <__v_printf+0x41c>
    5398:	03000693          	li	a3,48
    539c:	04d106a3          	sb	a3,77(sp)
    53a0:	04714683          	lbu	a3,71(sp)
    53a4:	4309                	li	t1,2
    53a6:	04d10723          	sb	a3,78(sp)
    53aa:	4689                	li	a3,2
    53ac:	c436                	sw	a3,8(sp)
    53ae:	46b2                	lw	a3,12(sp)
    53b0:	4602                	lw	a2,0(sp)
    53b2:	00c6f363          	bgeu	a3,a2,53b8 <__v_printf+0x426>
    53b6:	c632                	sw	a2,12(sp)
    53b8:	4541                	li	a0,16
    53ba:	4281                	li	t0,0
    53bc:	04d10693          	addi	a3,sp,77
    53c0:	c4b6                	sw	a3,72(sp)
    53c2:	0ae05a63          	blez	a4,5476 <__v_printf+0x4e4>
    53c6:	4685                	li	a3,1
    53c8:	08d70c63          	beq	a4,a3,5460 <__v_printf+0x4ce>
    53cc:	00840393          	addi	t2,s0,8
    53d0:	4010                	lw	a2,0(s0)
    53d2:	4054                	lw	a3,4(s0)
    53d4:	4581                	li	a1,0
    53d6:	08028c63          	beqz	t0,546e <__v_printf+0x4dc>
    53da:	0006da63          	bgez	a3,53ee <__v_printf+0x45c>
    53de:	40c00633          	neg	a2,a2
    53e2:	00c03733          	snez	a4,a2
    53e6:	40d006b3          	neg	a3,a3
    53ea:	8e99                	sub	a3,a3,a4
    53ec:	4289                	li	t0,2
    53ee:	872a                	mv	a4,a0
    53f0:	04d10513          	addi	a0,sp,77
    53f4:	951a                	add	a0,a0,t1
    53f6:	07b00593          	li	a1,123
    53fa:	da1e                	sw	t2,52(sp)
    53fc:	d416                	sw	t0,40(sp)
    53fe:	d21a                	sw	t1,36(sp)
    5400:	913ff0ef          	jal	ra,4d12 <__lltostr>
    5404:	53d2                	lw	t2,52(sp)
    5406:	5312                	lw	t1,36(sp)
    5408:	52a2                	lw	t0,40(sp)
    540a:	841e                	mv	s0,t2
    540c:	4752                	lw	a4,20(sp)
    540e:	47a6                	lw	a5,72(sp)
    5410:	cb5d                	beqz	a4,54c6 <__v_printf+0x534>
    5412:	4705                	li	a4,1
    5414:	0ae51963          	bne	a0,a4,54c6 <__v_printf+0x534>
    5418:	00678733          	add	a4,a5,t1
    541c:	00074683          	lbu	a3,0(a4)
    5420:	03000713          	li	a4,48
    5424:	0ae69163          	bne	a3,a4,54c6 <__v_printf+0x534>
    5428:	4702                	lw	a4,0(sp)
    542a:	c345                	beqz	a4,54ca <__v_printf+0x538>
    542c:	4722                	lw	a4,8(sp)
    542e:	c319                	beqz	a4,5434 <__v_printf+0x4a2>
    5430:	c402                	sw	zero,8(sp)
    5432:	4301                	li	t1,0
    5434:	4709                	li	a4,2
    5436:	08e29d63          	bne	t0,a4,54d0 <__v_printf+0x53e>
    543a:	fff78713          	addi	a4,a5,-1
    543e:	c4ba                	sw	a4,72(sp)
    5440:	02d00713          	li	a4,45
    5444:	fee78fa3          	sb	a4,-1(a5)
    5448:	0305                	addi	t1,t1,1
    544a:	b539                	j	5258 <__v_printf+0x2c6>
    544c:	4781                	li	a5,0
    544e:	b791                	j	5392 <__v_printf+0x400>
    5450:	4509                	li	a0,2
    5452:	4781                	li	a5,0
    5454:	4281                	li	t0,0
    5456:	b9c1                	j	5126 <__v_printf+0x194>
    5458:	4781                	li	a5,0
    545a:	4281                	li	t0,0
    545c:	4521                	li	a0,8
    545e:	b1e1                	j	5126 <__v_printf+0x194>
    5460:	00440393          	addi	t2,s0,4
    5464:	400c                	lw	a1,0(s0)
    5466:	00029d63          	bnez	t0,5480 <__v_printf+0x4ee>
    546a:	4601                	li	a2,0
    546c:	4681                	li	a3,0
    546e:	4405                	li	s0,1
    5470:	f6e44fe3          	blt	s0,a4,53ee <__v_printf+0x45c>
    5474:	a01d                	j	549a <__v_printf+0x508>
    5476:	00440393          	addi	t2,s0,4
    547a:	400c                	lw	a1,0(s0)
    547c:	00028863          	beqz	t0,548c <__v_printf+0x4fa>
    5480:	4285                	li	t0,1
    5482:	0005d563          	bgez	a1,548c <__v_printf+0x4fa>
    5486:	40b005b3          	neg	a1,a1
    548a:	4289                	li	t0,2
    548c:	fc075fe3          	bgez	a4,546a <__v_printf+0x4d8>
    5490:	56fd                	li	a3,-1
    5492:	02d70763          	beq	a4,a3,54c0 <__v_printf+0x52e>
    5496:	0ff5f593          	andi	a1,a1,255
    549a:	873e                	mv	a4,a5
    549c:	04d10793          	addi	a5,sp,77
    54a0:	86aa                	mv	a3,a0
    54a2:	862e                	mv	a2,a1
    54a4:	00678533          	add	a0,a5,t1
    54a8:	07b00593          	li	a1,123
    54ac:	da1e                	sw	t2,52(sp)
    54ae:	d416                	sw	t0,40(sp)
    54b0:	d21a                	sw	t1,36(sp)
    54b2:	9c9ff0ef          	jal	ra,4e7a <__ltostr>
    54b6:	53d2                	lw	t2,52(sp)
    54b8:	52a2                	lw	t0,40(sp)
    54ba:	5312                	lw	t1,36(sp)
    54bc:	841e                	mv	s0,t2
    54be:	b7b9                	j	540c <__v_printf+0x47a>
    54c0:	05c2                	slli	a1,a1,0x10
    54c2:	81c1                	srli	a1,a1,0x10
    54c4:	bfd9                	j	549a <__v_printf+0x508>
    54c6:	932a                	add	t1,t1,a0
    54c8:	b7b5                	j	5434 <__v_printf+0x4a2>
    54ca:	4301                	li	t1,0
    54cc:	c402                	sw	zero,8(sp)
    54ce:	b79d                	j	5434 <__v_printf+0x4a2>
    54d0:	d80284e3          	beqz	t0,5258 <__v_printf+0x2c6>
    54d4:	4772                	lw	a4,28(sp)
    54d6:	ef19                	bnez	a4,54f4 <__v_printf+0x562>
    54d8:	5732                	lw	a4,44(sp)
    54da:	4281                	li	t0,0
    54dc:	d6070ee3          	beqz	a4,5258 <__v_printf+0x2c6>
    54e0:	02000713          	li	a4,32
    54e4:	fff78693          	addi	a3,a5,-1
    54e8:	c4b6                	sw	a3,72(sp)
    54ea:	fee78fa3          	sb	a4,-1(a5)
    54ee:	0305                	addi	t1,t1,1
    54f0:	4285                	li	t0,1
    54f2:	b39d                	j	5258 <__v_printf+0x2c6>
    54f4:	02b00713          	li	a4,43
    54f8:	b7f5                	j	54e4 <__v_printf+0x552>
    54fa:	00840793          	addi	a5,s0,8
    54fe:	da3e                	sw	a5,52(sp)
    5500:	401c                	lw	a5,0(s0)
    5502:	d23e                	sw	a5,36(sp)
    5504:	405c                	lw	a5,4(s0)
    5506:	d43e                	sw	a5,40(sp)
    5508:	04d10793          	addi	a5,sp,77
    550c:	c4be                	sw	a5,72(sp)
    550e:	47b2                	lw	a5,12(sp)
    5510:	e399                	bnez	a5,5516 <__v_printf+0x584>
    5512:	4785                	li	a5,1
    5514:	c63e                	sw	a5,12(sp)
    5516:	47d2                	lw	a5,20(sp)
    5518:	e399                	bnez	a5,551e <__v_printf+0x58c>
    551a:	4799                	li	a5,6
    551c:	c03e                	sw	a5,0(sp)
    551e:	42f2                	lw	t0,28(sp)
    5520:	00029e63          	bnez	t0,553c <__v_printf+0x5aa>
    5524:	5712                	lw	a4,36(sp)
    5526:	57a2                	lw	a5,40(sp)
    5528:	4601                	li	a2,0
    552a:	4681                	li	a3,0
    552c:	853a                	mv	a0,a4
    552e:	85be                	mv	a1,a5
    5530:	dc1a                	sw	t1,56(sp)
    5532:	83afc0ef          	jal	ra,156c <__ledf2>
    5536:	5362                	lw	t1,56(sp)
    5538:	01f55293          	srli	t0,a0,0x1f
    553c:	5412                	lw	s0,36(sp)
    553e:	53a2                	lw	t2,40(sp)
    5540:	4782                	lw	a5,0(sp)
    5542:	4732                	lw	a4,12(sp)
    5544:	07f00693          	li	a3,127
    5548:	04d10613          	addi	a2,sp,77
    554c:	8522                	mv	a0,s0
    554e:	859e                	mv	a1,t2
    5550:	c096                	sw	t0,64(sp)
    5552:	dc1a                	sw	t1,56(sp)
    5554:	b7aff0ef          	jal	ra,48ce <__dtostr>
    5558:	47d2                	lw	a5,20(sp)
    555a:	de2a                	sw	a0,60(sp)
    555c:	5362                	lw	t1,56(sp)
    555e:	4286                	lw	t0,64(sp)
    5560:	cb95                	beqz	a5,5594 <__v_printf+0x602>
    5562:	4426                	lw	s0,72(sp)
    5564:	02e00593          	li	a1,46
    5568:	dc16                	sw	t0,56(sp)
    556a:	8522                	mv	a0,s0
    556c:	ca1a                	sw	t1,20(sp)
    556e:	d65fc0ef          	jal	ra,22d2 <strchr>
    5572:	4352                	lw	t1,20(sp)
    5574:	52e2                	lw	t0,56(sp)
    5576:	57f2                	lw	a5,60(sp)
    5578:	cd49                	beqz	a0,5612 <__v_printf+0x680>
    557a:	4782                	lw	a5,0(sp)
    557c:	e399                	bnez	a5,5582 <__v_printf+0x5f0>
    557e:	47a2                	lw	a5,8(sp)
    5580:	cb81                	beqz	a5,5590 <__v_printf+0x5fe>
    5582:	0505                	addi	a0,a0,1
    5584:	4782                	lw	a5,0(sp)
    5586:	c789                	beqz	a5,5590 <__v_printf+0x5fe>
    5588:	0505                	addi	a0,a0,1
    558a:	00054783          	lbu	a5,0(a0)
    558e:	efb5                	bnez	a5,560a <__v_printf+0x678>
    5590:	00050023          	sb	zero,0(a0)
    5594:	06700793          	li	a5,103
    5598:	04f31a63          	bne	t1,a5,55ec <__v_printf+0x65a>
    559c:	4526                	lw	a0,72(sp)
    559e:	02e00593          	li	a1,46
    55a2:	c416                	sw	t0,8(sp)
    55a4:	d2ffc0ef          	jal	ra,22d2 <strchr>
    55a8:	842a                	mv	s0,a0
    55aa:	42a2                	lw	t0,8(sp)
    55ac:	c121                	beqz	a0,55ec <__v_printf+0x65a>
    55ae:	06500593          	li	a1,101
    55b2:	d21fc0ef          	jal	ra,22d2 <strchr>
    55b6:	42a2                	lw	t0,8(sp)
    55b8:	85aa                	mv	a1,a0
    55ba:	00044783          	lbu	a5,0(s0)
    55be:	e7b5                	bnez	a5,562a <__v_printf+0x698>
    55c0:	c191                	beqz	a1,55c4 <__v_printf+0x632>
    55c2:	842e                	mv	s0,a1
    55c4:	03000693          	li	a3,48
    55c8:	fff44703          	lbu	a4,-1(s0)
    55cc:	fff40513          	addi	a0,s0,-1
    55d0:	04d70f63          	beq	a4,a3,562e <__v_printf+0x69c>
    55d4:	02e00693          	li	a3,46
    55d8:	00d70363          	beq	a4,a3,55de <__v_printf+0x64c>
    55dc:	8522                	mv	a0,s0
    55de:	00050023          	sb	zero,0(a0)
    55e2:	c589                	beqz	a1,55ec <__v_printf+0x65a>
    55e4:	c416                	sw	t0,8(sp)
    55e6:	d07fc0ef          	jal	ra,22ec <strcpy>
    55ea:	42a2                	lw	t0,8(sp)
    55ec:	47f2                	lw	a5,28(sp)
    55ee:	10079263          	bnez	a5,56f2 <__v_printf+0x760>
    55f2:	57b2                	lw	a5,44(sp)
    55f4:	e3e5                	bnez	a5,56d4 <__v_printf+0x742>
    55f6:	4526                	lw	a0,72(sp)
    55f8:	ce16                	sw	t0,28(sp)
    55fa:	87efd0ef          	jal	ra,2678 <strlen>
    55fe:	832a                	mv	t1,a0
    5600:	5452                	lw	s0,52(sp)
    5602:	ca02                	sw	zero,20(sp)
    5604:	c402                	sw	zero,8(sp)
    5606:	42f2                	lw	t0,28(sp)
    5608:	b981                	j	5258 <__v_printf+0x2c6>
    560a:	4782                	lw	a5,0(sp)
    560c:	17fd                	addi	a5,a5,-1
    560e:	c03e                	sw	a5,0(sp)
    5610:	bf95                	j	5584 <__v_printf+0x5f2>
    5612:	4722                	lw	a4,8(sp)
    5614:	d341                	beqz	a4,5594 <__v_printf+0x602>
    5616:	943e                	add	s0,s0,a5
    5618:	02e00713          	li	a4,46
    561c:	00e40023          	sb	a4,0(s0)
    5620:	4526                	lw	a0,72(sp)
    5622:	953e                	add	a0,a0,a5
    5624:	000500a3          	sb	zero,1(a0)
    5628:	b7b5                	j	5594 <__v_printf+0x602>
    562a:	0405                	addi	s0,s0,1
    562c:	b779                	j	55ba <__v_printf+0x628>
    562e:	842a                	mv	s0,a0
    5630:	bf61                	j	55c8 <__v_printf+0x636>
    5632:	57fd                	li	a5,-1
    5634:	c23e                	sw	a5,4(sp)
    5636:	40de                	lw	ra,212(sp)
    5638:	444e                	lw	s0,208(sp)
    563a:	4512                	lw	a0,4(sp)
    563c:	44be                	lw	s1,204(sp)
    563e:	0d810113          	addi	sp,sp,216
    5642:	8082                	ret
    5644:	5782                	lw	a5,32(sp)
    5646:	c6079ee3          	bnez	a5,52c2 <__v_printf+0x330>
    564a:	4781                	li	a5,0
    564c:	4752                	lw	a4,20(sp)
    564e:	cc0700e3          	beqz	a4,530e <__v_printf+0x37c>
    5652:	4582                	lw	a1,0(sp)
    5654:	0065f363          	bgeu	a1,t1,565a <__v_printf+0x6c8>
    5658:	859a                	mv	a1,t1
    565a:	ca3e                	sw	a5,20(sp)
    565c:	47b2                	lw	a5,12(sp)
    565e:	02000613          	li	a2,32
    5662:	8526                	mv	a0,s1
    5664:	40b785b3          	sub	a1,a5,a1
    5668:	c41a                	sw	t1,8(sp)
    566a:	cc36                	sw	a3,24(sp)
    566c:	8c7ff0ef          	jal	ra,4f32 <write_pad>
    5670:	4792                	lw	a5,4(sp)
    5672:	4322                	lw	t1,8(sp)
    5674:	00f50733          	add	a4,a0,a5
    5678:	47d2                	lw	a5,20(sp)
    567a:	cf99                	beqz	a5,5698 <__v_printf+0x706>
    567c:	46e2                	lw	a3,24(sp)
    567e:	0044a383          	lw	t2,4(s1)
    5682:	4090                	lw	a2,0(s1)
    5684:	85be                	mv	a1,a5
    5686:	8536                	mv	a0,a3
    5688:	c61a                	sw	t1,12(sp)
    568a:	c43a                	sw	a4,8(sp)
    568c:	c23e                	sw	a5,4(sp)
    568e:	9382                	jalr	t2
    5690:	4792                	lw	a5,4(sp)
    5692:	4722                	lw	a4,8(sp)
    5694:	4332                	lw	t1,12(sp)
    5696:	973e                	add	a4,a4,a5
    5698:	4782                	lw	a5,0(sp)
    569a:	03000613          	li	a2,48
    569e:	8526                	mv	a0,s1
    56a0:	406785b3          	sub	a1,a5,t1
    56a4:	c23a                	sw	a4,4(sp)
    56a6:	c01a                	sw	t1,0(sp)
    56a8:	88bff0ef          	jal	ra,4f32 <write_pad>
    56ac:	4712                	lw	a4,4(sp)
    56ae:	4302                	lw	t1,0(sp)
    56b0:	972a                	add	a4,a4,a0
    56b2:	40dc                	lw	a5,4(s1)
    56b4:	4090                	lw	a2,0(s1)
    56b6:	4526                	lw	a0,72(sp)
    56b8:	859a                	mv	a1,t1
    56ba:	c23a                	sw	a4,4(sp)
    56bc:	c01a                	sw	t1,0(sp)
    56be:	9782                	jalr	a5
    56c0:	4302                	lw	t1,0(sp)
    56c2:	4712                	lw	a4,4(sp)
    56c4:	006707b3          	add	a5,a4,t1
    56c8:	bac1                	j	5098 <__v_printf+0x106>
    56ca:	47a2                	lw	a5,8(sp)
    56cc:	bc0793e3          	bnez	a5,5292 <__v_printf+0x300>
    56d0:	4785                	li	a5,1
    56d2:	b6c9                	j	5294 <__v_printf+0x302>
    56d4:	57a2                	lw	a5,40(sp)
    56d6:	5712                	lw	a4,36(sp)
    56d8:	4601                	li	a2,0
    56da:	85be                	mv	a1,a5
    56dc:	4681                	li	a3,0
    56de:	853a                	mv	a0,a4
    56e0:	c416                	sw	t0,8(sp)
    56e2:	dd7fb0ef          	jal	ra,14b8 <__gedf2>
    56e6:	02000793          	li	a5,32
    56ea:	42a2                	lw	t0,8(sp)
    56ec:	02055163          	bgez	a0,570e <__v_printf+0x77c>
    56f0:	b719                	j	55f6 <__v_printf+0x664>
    56f2:	5712                	lw	a4,36(sp)
    56f4:	57a2                	lw	a5,40(sp)
    56f6:	4601                	li	a2,0
    56f8:	4681                	li	a3,0
    56fa:	853a                	mv	a0,a4
    56fc:	85be                	mv	a1,a5
    56fe:	c416                	sw	t0,8(sp)
    5700:	db9fb0ef          	jal	ra,14b8 <__gedf2>
    5704:	42a2                	lw	t0,8(sp)
    5706:	ee0548e3          	bltz	a0,55f6 <__v_printf+0x664>
    570a:	02b00793          	li	a5,43
    570e:	4726                	lw	a4,72(sp)
    5710:	fff70693          	addi	a3,a4,-1
    5714:	c4b6                	sw	a3,72(sp)
    5716:	fef70fa3          	sb	a5,-1(a4)
    571a:	bdf1                	j	55f6 <__v_printf+0x664>
    571c:	8a071ee3          	bnez	a4,4fd8 <__v_printf+0x46>
    5720:	47c2                	lw	a5,16(sp)
    5722:	c83e                	sw	a5,16(sp)
    5724:	b069                	j	4fae <__v_printf+0x1c>
	...
