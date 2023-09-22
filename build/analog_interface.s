	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-a8
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	neon
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 2	@ Tag_ABI_FP_denormal
	.eabi_attribute	23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.eabi_attribute	68, 1	@ Tag_Virtualization_use
	.file	"/root/Bela/projects/SOFAlizer-for-Bela/build/analog_interface.bc"
	.globl	_ZN13PotentiometerC2Ev
	.p2align	2
	.type	_ZN13PotentiometerC2Ev,%function
_ZN13PotentiometerC2Ev:                 @ @_ZN13PotentiometerC2Ev
.Lfunc_begin0:
	.file	1 "/root/Bela/projects/SOFAlizer-for-Bela" "analog_interface.cpp"
	.loc	1 7 0                   @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:7:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: Potentiometer:this <- %R0
	.loc	1 8 19 prologue_end     @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:19
	mov	r1, #0
	str	r1, [r0, #4]
.Ltmp0:
	.loc	1 9 1                   @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:9:1
	bx	lr
.Ltmp1:
.Lfunc_end0:
	.size	_ZN13PotentiometerC2Ev, .Lfunc_end0-_ZN13PotentiometerC2Ev
	.cfi_endproc
	.file	2 "/root/Bela/projects/SOFAlizer-for-Bela" "analog_interface.h"
	.fnend

	.globl	_ZN13PotentiometerD2Ev
	.p2align	2
	.type	_ZN13PotentiometerD2Ev,%function
_ZN13PotentiometerD2Ev:                 @ @_ZN13PotentiometerD2Ev
.Lfunc_begin1:
	.loc	1 14 0                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:14:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: ~Potentiometer:this <- %R0
	.loc	1 16 1 prologue_end     @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:16:1
	bx	lr
.Ltmp2:
.Lfunc_end1:
	.size	_ZN13PotentiometerD2Ev, .Lfunc_end1-_ZN13PotentiometerD2Ev
	.cfi_endproc
	.fnend

	.globl	_ZN13Potentiometer19convertCurrentValueEf
	.p2align	2
	.type	_ZN13Potentiometer19convertCurrentValueEf,%function
_ZN13Potentiometer19convertCurrentValueEf: @ @_ZN13Potentiometer19convertCurrentValueEf
.Lfunc_begin2:
	.loc	1 21 0                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:21:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: convertCurrentValue:this <- %R0
	@DEBUG_VALUE: convertCurrentValue:currentRawValue <- %S0
	.loc	1 22 41 prologue_end    @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:41
	vldr	s2, [r0, #8]
                                        @ kill: %S0<def> %S0<kill> %D0<def>
.Ltmp3:
	.loc	1 22 61 is_stmt 0       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:61
	vldr	s6, [r0, #16]
	.loc	1 22 52                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:52
	vldr	s8, [r0, #20]
	.loc	1 22 39                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:39
	vsub.f32	d16, d0, d1
	.loc	1 22 73                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:73
	vldr	s4, [r0, #12]
	.loc	1 22 59                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:59
	vsub.f32	d17, d4, d3
	.loc	1 22 80                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:80
	vsub.f32	d0, d2, d1
	.loc	1 22 49                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:49
	vmul.f32	d1, d17, d16
	.loc	1 22 70                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:70
	vdiv.f32	s0, s2, s0
	.loc	1 22 91                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:91
	vadd.f32	d0, d0, d3
	.loc	1 22 18                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:18
	vstr	s0, [r0]
	.loc	1 23 1 is_stmt 1        @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:23:1
	bx	lr
.Ltmp4:
.Lfunc_end2:
	.size	_ZN13Potentiometer19convertCurrentValueEf, .Lfunc_end2-_ZN13Potentiometer19convertCurrentValueEf
	.cfi_endproc
	.fnend

	.globl	_ZN15AnalogInterfaceC2Ev
	.p2align	4
	.type	_ZN15AnalogInterfaceC2Ev,%function
_ZN15AnalogInterfaceC2Ev:               @ @_ZN15AnalogInterfaceC2Ev
.Lfunc_begin3:
	.loc	1 28 0                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:28:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: AnalogInterface:this <- %R0
	adr	r1, .LCPI3_0
.Ltmp5:
	@DEBUG_VALUE: setNewRange:maximum <- 3.600000e+02
	@DEBUG_VALUE: setNewRange:minimum <- 0.000000e+00
	@DEBUG_VALUE: setOldRange:maximum <- 1.000000e+00
	@DEBUG_VALUE: setOldRange:minimum <- 0.000000e+00
	.loc	1 8 5 prologue_end      @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:5
	add	r2, r0, #28
.Ltmp6:
	.loc	1 8 19 is_stmt 0        @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:19
	vld1.64	{d16, d17}, [r1:128]
	adr	r1, .LCPI3_1
.Ltmp7:
	@DEBUG_VALUE: setNewRange:maximum <- 9.000000e+01
	@DEBUG_VALUE: setNewRange:minimum <- -3.000000e+01
	@DEBUG_VALUE: setOldRange:maximum <- 1.000000e+00
	@DEBUG_VALUE: setOldRange:minimum <- 0.000000e+00
	.loc	1 8 19                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:19
	vld1.64	{d18, d19}, [r1:128]
	adr	r1, .LCPI3_2
.Ltmp8:
	@DEBUG_VALUE: setNewRange:maximum <- 9.000000e+01
	@DEBUG_VALUE: setNewRange:minimum <- -3.000000e+01
	.loc	2 19 65 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.h:19:65
	vld1.64	{d20, d21}, [r1:128]
	mov	r1, #0
.Ltmp9:
	.loc	1 8 19                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:19
	str	r1, [r0, #76]
.Ltmp10:
	.loc	1 8 5 is_stmt 0         @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:5
	add	r1, r0, #4
	.loc	1 8 19                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:19
	vst1.32	{d16, d17}, [r1]
.Ltmp11:
	.loc	2 20 83 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.h:20:83
	movw	r1, #0
	movt	r1, #17332
	str	r1, [r0, #20]
.Ltmp12:
	.loc	1 8 19                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:19
	vst1.32	{d18, d19}, [r2]
.Ltmp13:
	.loc	2 20 83                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.h:20:83
	movw	r2, #0
	movt	r2, #17076
	str	r2, [r0, #44]
.Ltmp14:
	.loc	1 8 5                   @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:5
	add	r2, r0, #52
.Ltmp15:
	@DEBUG_VALUE: setNewRange:maximum <- 3.600000e+02
	@DEBUG_VALUE: setNewRange:minimum <- 0.000000e+00
	@DEBUG_VALUE: setOldRange:maximum <- 1.000000e+00
	@DEBUG_VALUE: setOldRange:minimum <- 0.000000e+00
	.loc	1 8 19 is_stmt 0        @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:8:19
	vst1.32	{d16, d17}, [r2]
.Ltmp16:
	.loc	2 20 83 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.h:20:83
	str	r1, [r0, #68]
.Ltmp17:
	@DEBUG_VALUE: setOldRange:maximum <- 1.000000e+00
	@DEBUG_VALUE: setOldRange:minimum <- 0.000000e+00
	.loc	2 19 58                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.h:19:58
	add	r1, r0, #80
	.loc	2 19 65 is_stmt 0       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.h:19:65
	vst1.32	{d20, d21}, [r1]
.Ltmp18:
	.loc	1 43 24 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:43:24
	mov	r1, #1
	strb	r1, [r0, #97]
	.loc	1 44 24                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:44:24
	strb	r1, [r0, #99]
	.loc	1 45 27                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:45:27
	strb	r1, [r0, #101]
.Ltmp19:
	.loc	1 48 1                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:48:1
	bx	lr
.Ltmp20:
	.p2align	4
@ BB#1:
.LCPI3_0:
	.long	0                       @ float 0
	.long	0                       @ float 0
	.long	1065353216              @ float 1
	.long	0                       @ float 0
.LCPI3_1:
	.long	0                       @ float 0
	.long	0                       @ float 0
	.long	1065353216              @ float 1
	.long	3253731328              @ float -30
.LCPI3_2:
	.long	0                       @ float 0
	.long	1065353216              @ float 1
	.long	3253731328              @ float -30
	.long	1119092736              @ float 90
.Lfunc_end3:
	.size	_ZN15AnalogInterfaceC2Ev, .Lfunc_end3-_ZN15AnalogInterfaceC2Ev
	.cfi_endproc
	.file	3 "./include" "Bela.h"
	.file	4 "/usr/include" "stdint.h"
	.fnend

	.globl	_ZN15AnalogInterfaceD2Ev
	.p2align	2
	.type	_ZN15AnalogInterfaceD2Ev,%function
_ZN15AnalogInterfaceD2Ev:               @ @_ZN15AnalogInterfaceD2Ev
.Lfunc_begin4:
	.loc	1 53 0                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:53:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: ~AnalogInterface:this <- %R0
	.loc	1 55 1 prologue_end     @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:55:1
	bx	lr
.Ltmp21:
.Lfunc_end4:
	.size	_ZN15AnalogInterfaceD2Ev, .Lfunc_end4-_ZN15AnalogInterfaceD2Ev
	.cfi_endproc
	.fnend

	.globl	_ZN15AnalogInterface4readEP11BelaContexti
	.p2align	2
	.type	_ZN15AnalogInterface4readEP11BelaContexti,%function
_ZN15AnalogInterface4readEP11BelaContexti: @ @_ZN15AnalogInterface4readEP11BelaContexti
.Lfunc_begin5:
	.loc	1 60 0                  @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:60:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: read:this <- %R0
	@DEBUG_VALUE: read:context <- %R1
	@DEBUG_VALUE: read:frame <- %R2
	ldr	r3, [r1, #8]
	ldr	r1, [r1, #40]
.Ltmp22:
	.loc	3 1466 33 prologue_end  @ ./include/Bela.h:1466:33
	mul	r1, r1, r2
	.loc	3 1466 9 is_stmt 0      @ ./include/Bela.h:1466:9
	ldr	r2, [r3, r1, lsl #2]!
.Ltmp23:
	.loc	1 62 34 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:62:34
	str	r2, [r0, #4]
.Ltmp24:
	.loc	3 1466 9                @ ./include/Bela.h:1466:9
	ldr	r1, [r3, #4]
.Ltmp25:
	.loc	1 63 36                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:63:36
	str	r1, [r0, #28]
	.loc	1 68 55                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:68:55
	vmov	d16, r2, r2
.Ltmp26:
	@DEBUG_VALUE: convertCurrentValue:currentRawValue <- undef
	.loc	3 1466 9                @ ./include/Bela.h:1466:9
	ldr	r12, [r3, #8]
.Ltmp27:
	.loc	1 64 35                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:64:35
	str	r12, [r0, #52]
.Ltmp28:
	.loc	3 1466 9                @ ./include/Bela.h:1466:9
	ldr	r3, [r3, #12]
.Ltmp29:
	.loc	1 65 37                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:65:37
	str	r3, [r0, #76]
.Ltmp30:
	.loc	1 22 41                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:41
	vldr	s0, [r0, #8]
	.loc	1 22 61 is_stmt 0       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:61
	vldr	s4, [r0, #16]
	.loc	1 22 52                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:52
	vldr	s6, [r0, #20]
	.loc	1 22 39                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:39
	vsub.f32	d16, d16, d0
	.loc	1 22 73                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:73
	vldr	s2, [r0, #12]
	.loc	1 22 59                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:59
	vsub.f32	d17, d3, d2
	.loc	1 22 80                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:80
	vsub.f32	d0, d1, d0
	.loc	1 22 49                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:49
	vmul.f32	d1, d17, d16
.Ltmp31:
	.loc	1 69 59 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:69:59
	vmov	d16, r1, r1
.Ltmp32:
	@DEBUG_VALUE: convertCurrentValue:currentRawValue <- undef
	.loc	1 22 70                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:70
	vdiv.f32	s0, s2, s0
	.loc	1 22 91 is_stmt 0       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:91
	vadd.f32	d0, d0, d2
	.loc	1 22 18                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:18
	vstr	s0, [r0]
.Ltmp33:
	.loc	1 22 41                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:41
	vldr	s0, [r0, #32]
	.loc	1 22 61                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:61
	vldr	s4, [r0, #40]
	.loc	1 22 52                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:52
	vldr	s6, [r0, #44]
	.loc	1 22 39                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:39
	vsub.f32	d16, d16, d0
	.loc	1 22 73                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:73
	vldr	s2, [r0, #36]
	.loc	1 22 59                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:59
	vsub.f32	d17, d3, d2
	.loc	1 22 80                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:80
	vsub.f32	d0, d1, d0
	.loc	1 22 49                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:49
	vmul.f32	d1, d17, d16
.Ltmp34:
	.loc	1 70 57 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:70:57
	vmov	d16, r12, r12
.Ltmp35:
	@DEBUG_VALUE: convertCurrentValue:currentRawValue <- undef
	.loc	1 22 70                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:70
	vdiv.f32	s0, s2, s0
	.loc	1 22 91 is_stmt 0       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:91
	vadd.f32	d0, d0, d2
	.loc	1 22 18                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:18
	vstr	s0, [r0, #24]
.Ltmp36:
	.loc	1 22 41                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:41
	vldr	s0, [r0, #56]
	.loc	1 22 61                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:61
	vldr	s4, [r0, #64]
	.loc	1 22 52                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:52
	vldr	s6, [r0, #68]
	.loc	1 22 39                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:39
	vsub.f32	d16, d16, d0
	.loc	1 22 73                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:73
	vldr	s2, [r0, #60]
	.loc	1 22 59                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:59
	vsub.f32	d17, d3, d2
	.loc	1 22 80                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:80
	vsub.f32	d0, d1, d0
	.loc	1 22 49                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:49
	vmul.f32	d1, d17, d16
.Ltmp37:
	.loc	1 71 61 is_stmt 1       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:71:61
	vmov	d16, r3, r3
.Ltmp38:
	@DEBUG_VALUE: convertCurrentValue:currentRawValue <- undef
	.loc	1 22 70                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:70
	vdiv.f32	s0, s2, s0
	.loc	1 22 91 is_stmt 0       @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:91
	vadd.f32	d0, d0, d2
	.loc	1 22 18                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:18
	vstr	s0, [r0, #48]
.Ltmp39:
	.loc	1 22 41                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:41
	vldr	s0, [r0, #80]
	.loc	1 22 61                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:61
	vldr	s4, [r0, #88]
	.loc	1 22 52                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:52
	vldr	s6, [r0, #92]
	.loc	1 22 39                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:39
	vsub.f32	d16, d16, d0
	.loc	1 22 73                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:73
	vldr	s2, [r0, #84]
	.loc	1 22 59                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:59
	vsub.f32	d17, d3, d2
	.loc	1 22 80                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:80
	vsub.f32	d0, d1, d0
	.loc	1 22 49                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:49
	vmul.f32	d1, d17, d16
	.loc	1 22 70                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:70
	vdiv.f32	s0, s2, s0
	.loc	1 22 91                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:91
	vadd.f32	d0, d0, d2
	.loc	1 22 18                 @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:22:18
	vstr	s0, [r0, #72]
.Ltmp40:
	.loc	1 72 1 is_stmt 1        @ /root/Bela/projects/SOFAlizer-for-Bela/analog_interface.cpp:72:1
	bx	lr
.Ltmp41:
.Lfunc_end5:
	.size	_ZN15AnalogInterface4readEP11BelaContexti, .Lfunc_end5-_ZN15AnalogInterface4readEP11BelaContexti
	.cfi_endproc
	.fnend

	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)" @ string offset=0
.Linfo_string1:
	.asciz	"/root/Bela/projects/SOFAlizer-for-Bela/build/analog_interface.cpp" @ string offset=45
.Linfo_string2:
	.asciz	"/root/Bela"            @ string offset=111
.Linfo_string3:
	.asciz	"currentValue"          @ string offset=122
.Linfo_string4:
	.asciz	"float"                 @ string offset=135
.Linfo_string5:
	.asciz	"smoothedValue"         @ string offset=141
.Linfo_string6:
	.asciz	"oldMin"                @ string offset=155
.Linfo_string7:
	.asciz	"oldMax"                @ string offset=162
.Linfo_string8:
	.asciz	"newMin"                @ string offset=169
.Linfo_string9:
	.asciz	"newMax"                @ string offset=176
.Linfo_string10:
	.asciz	"Potentiometer"         @ string offset=183
.Linfo_string11:
	.asciz	"~Potentiometer"        @ string offset=197
.Linfo_string12:
	.asciz	"_ZN13Potentiometer19convertCurrentValueEf" @ string offset=212
.Linfo_string13:
	.asciz	"convertCurrentValue"   @ string offset=254
.Linfo_string14:
	.asciz	"_ZN13Potentiometer11setOldRangeEff" @ string offset=274
.Linfo_string15:
	.asciz	"setOldRange"           @ string offset=309
.Linfo_string16:
	.asciz	"_ZN13Potentiometer11setNewRangeEff" @ string offset=321
.Linfo_string17:
	.asciz	"setNewRange"           @ string offset=356
.Linfo_string18:
	.asciz	"_ZN13PotentiometerC2Ev" @ string offset=368
.Linfo_string19:
	.asciz	"this"                  @ string offset=391
.Linfo_string20:
	.asciz	"minimum"               @ string offset=396
.Linfo_string21:
	.asciz	"maximum"               @ string offset=404
.Linfo_string22:
	.asciz	"leftAzimuthPot"        @ string offset=412
.Linfo_string23:
	.asciz	"leftElevationPot"      @ string offset=427
.Linfo_string24:
	.asciz	"rightAzimuthPot"       @ string offset=444
.Linfo_string25:
	.asciz	"rightElevationPot"     @ string offset=460
.Linfo_string26:
	.asciz	"incButtonValueCurr"    @ string offset=478
.Linfo_string27:
	.asciz	"bool"                  @ string offset=497
.Linfo_string28:
	.asciz	"incButtonValuePrev"    @ string offset=502
.Linfo_string29:
	.asciz	"decButtonValueCurr"    @ string offset=521
.Linfo_string30:
	.asciz	"decButtonValuePrev"    @ string offset=540
.Linfo_string31:
	.asciz	"bypassButtonValueCurr" @ string offset=559
.Linfo_string32:
	.asciz	"bypassButtonValuePrev" @ string offset=581
.Linfo_string33:
	.asciz	"AnalogInterface"       @ string offset=603
.Linfo_string34:
	.asciz	"~AnalogInterface"      @ string offset=619
.Linfo_string35:
	.asciz	"_ZN15AnalogInterface4readEP11BelaContexti" @ string offset=636
.Linfo_string36:
	.asciz	"read"                  @ string offset=678
.Linfo_string37:
	.asciz	"audioIn"               @ string offset=683
.Linfo_string38:
	.asciz	"audioOut"              @ string offset=691
.Linfo_string39:
	.asciz	"analogIn"              @ string offset=700
.Linfo_string40:
	.asciz	"analogOut"             @ string offset=709
.Linfo_string41:
	.asciz	"digital"               @ string offset=719
.Linfo_string42:
	.asciz	"unsigned int"          @ string offset=727
.Linfo_string43:
	.asciz	"uint32_t"              @ string offset=740
.Linfo_string44:
	.asciz	"audioFrames"           @ string offset=749
.Linfo_string45:
	.asciz	"audioInChannels"       @ string offset=761
.Linfo_string46:
	.asciz	"audioOutChannels"      @ string offset=777
.Linfo_string47:
	.asciz	"audioSampleRate"       @ string offset=794
.Linfo_string48:
	.asciz	"analogFrames"          @ string offset=810
.Linfo_string49:
	.asciz	"analogInChannels"      @ string offset=823
.Linfo_string50:
	.asciz	"analogOutChannels"     @ string offset=840
.Linfo_string51:
	.asciz	"analogSampleRate"      @ string offset=858
.Linfo_string52:
	.asciz	"digitalFrames"         @ string offset=875
.Linfo_string53:
	.asciz	"digitalChannels"       @ string offset=889
.Linfo_string54:
	.asciz	"digitalSampleRate"     @ string offset=905
.Linfo_string55:
	.asciz	"audioFramesElapsed"    @ string offset=923
.Linfo_string56:
	.asciz	"long long unsigned int" @ string offset=942
.Linfo_string57:
	.asciz	"uint64_t"              @ string offset=965
.Linfo_string58:
	.asciz	"multiplexerChannels"   @ string offset=974
.Linfo_string59:
	.asciz	"multiplexerStartingChannel" @ string offset=994
.Linfo_string60:
	.asciz	"multiplexerAnalogIn"   @ string offset=1021
.Linfo_string61:
	.asciz	"audioExpanderEnabled"  @ string offset=1041
.Linfo_string62:
	.asciz	"flags"                 @ string offset=1062
.Linfo_string63:
	.asciz	"projectName"           @ string offset=1068
.Linfo_string64:
	.asciz	"char"                  @ string offset=1080
.Linfo_string65:
	.asciz	"sizetype"              @ string offset=1085
.Linfo_string66:
	.asciz	"underrunCount"         @ string offset=1094
.Linfo_string67:
	.asciz	"BelaContext"           @ string offset=1108
.Linfo_string68:
	.asciz	"int"                   @ string offset=1120
.Linfo_string69:
	.asciz	"_ZL10analogReadP11BelaContextii" @ string offset=1124
.Linfo_string70:
	.asciz	"analogRead"            @ string offset=1156
.Linfo_string71:
	.asciz	"context"               @ string offset=1167
.Linfo_string72:
	.asciz	"frame"                 @ string offset=1175
.Linfo_string73:
	.asciz	"channel"               @ string offset=1181
.Linfo_string74:
	.asciz	"currentRawValue"       @ string offset=1189
.Linfo_string75:
	.asciz	"_ZN13PotentiometerD2Ev" @ string offset=1205
.Linfo_string76:
	.asciz	"_ZN15AnalogInterfaceC2Ev" @ string offset=1228
.Linfo_string77:
	.asciz	"_ZN15AnalogInterfaceD2Ev" @ string offset=1253
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
	.long	.Lfunc_begin2-.Lfunc_begin0
	.long	.Ltmp3-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc1:
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	7                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	128                     @ 1135869952
	.byte	128                     @ DW_OP_stack_value
	.byte	208                     @ 
	.byte	157                     @ 
	.byte	4                       @ 
	.byte	159                     @ 
	.long	0
	.long	0
.Ldebug_loc2:
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc3:
	.long	.Ltmp7-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	7                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	128                     @ 1119092736
	.byte	128                     @ DW_OP_stack_value
	.byte	208                     @ 
	.byte	149                     @ 
	.byte	4                       @ 
	.byte	159                     @ 
	.long	0
	.long	0
.Ldebug_loc4:
	.long	.Ltmp7-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	7                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	128                     @ 3253731328
	.byte	128                     @ DW_OP_stack_value
	.byte	192                     @ 
	.byte	143                     @ 
	.byte	12                      @ 
	.byte	159                     @ 
	.long	0
	.long	0
.Ldebug_loc5:
	.long	.Ltmp15-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	7                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	128                     @ 1135869952
	.byte	128                     @ DW_OP_stack_value
	.byte	208                     @ 
	.byte	157                     @ 
	.byte	4                       @ 
	.byte	159                     @ 
	.long	0
	.long	0
.Ldebug_loc6:
	.long	.Ltmp15-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc7:
	.long	.Ltmp17-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	7                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	128                     @ 1065353216
	.byte	128                     @ DW_OP_stack_value
	.byte	128                     @ 
	.byte	252                     @ 
	.byte	3                       @ 
	.byte	159                     @ 
	.long	0
	.long	0
.Ldebug_loc8:
	.long	.Ltmp17-.Lfunc_begin0
	.long	.Lfunc_end3-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc9:
	.long	.Lfunc_begin5-.Lfunc_begin0
	.long	.Ltmp22-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc10:
	.long	.Lfunc_begin5-.Lfunc_begin0
	.long	.Ltmp23-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	82                      @ DW_OP_reg2
	.long	0
	.long	0
	.section	.debug_abbrev,"",%progbits
.Lsection_abbrev:
	.byte	1                       @ Abbreviation Code
	.byte	17                      @ DW_TAG_compile_unit
	.byte	1                       @ DW_CHILDREN_yes
	.byte	37                      @ DW_AT_producer
	.byte	14                      @ DW_FORM_strp
	.byte	19                      @ DW_AT_language
	.byte	5                       @ DW_FORM_data2
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	16                      @ DW_AT_stmt_list
	.byte	23                      @ DW_FORM_sec_offset
	.byte	27                      @ DW_AT_comp_dir
	.byte	14                      @ DW_FORM_strp
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	2                       @ Abbreviation Code
	.byte	2                       @ DW_TAG_class_type
	.byte	1                       @ DW_CHILDREN_yes
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	11                      @ DW_AT_byte_size
	.byte	11                      @ DW_FORM_data1
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	3                       @ Abbreviation Code
	.byte	13                      @ DW_TAG_member
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	56                      @ DW_AT_data_member_location
	.byte	11                      @ DW_FORM_data1
	.byte	50                      @ DW_AT_accessibility
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	4                       @ Abbreviation Code
	.byte	13                      @ DW_TAG_member
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	56                      @ DW_AT_data_member_location
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	5                       @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	60                      @ DW_AT_declaration
	.byte	25                      @ DW_FORM_flag_present
	.byte	63                      @ DW_AT_external
	.byte	25                      @ DW_FORM_flag_present
	.byte	50                      @ DW_AT_accessibility
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	6                       @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	52                      @ DW_AT_artificial
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	7                       @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	8                       @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	60                      @ DW_AT_declaration
	.byte	25                      @ DW_FORM_flag_present
	.byte	63                      @ DW_AT_external
	.byte	25                      @ DW_FORM_flag_present
	.byte	50                      @ DW_AT_accessibility
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	9                       @ Abbreviation Code
	.byte	36                      @ DW_TAG_base_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	62                      @ DW_AT_encoding
	.byte	11                      @ DW_FORM_data1
	.byte	11                      @ DW_AT_byte_size
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	10                      @ Abbreviation Code
	.byte	15                      @ DW_TAG_pointer_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	11                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	64                      @ DW_AT_frame_base
	.byte	24                      @ DW_FORM_exprloc
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	12                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	24                      @ DW_FORM_exprloc
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	13                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	64                      @ DW_AT_frame_base
	.byte	24                      @ DW_FORM_exprloc
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	14                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	24                      @ DW_FORM_exprloc
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	52                      @ DW_AT_artificial
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	15                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	23                      @ DW_FORM_sec_offset
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	16                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	32                      @ DW_AT_inline
	.byte	11                      @ DW_FORM_data1
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	17                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	52                      @ DW_AT_artificial
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	18                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	32                      @ DW_AT_inline
	.byte	11                      @ DW_FORM_data1
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	19                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	20                      @ Abbreviation Code
	.byte	22                      @ DW_TAG_typedef
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	5                       @ DW_FORM_data2
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	21                      @ Abbreviation Code
	.byte	19                      @ DW_TAG_structure_type
	.byte	1                       @ DW_CHILDREN_yes
	.byte	11                      @ DW_AT_byte_size
	.byte	5                       @ DW_FORM_data2
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	22                      @ Abbreviation Code
	.byte	13                      @ DW_TAG_member
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	5                       @ DW_FORM_data2
	.byte	56                      @ DW_AT_data_member_location
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	23                      @ Abbreviation Code
	.byte	13                      @ DW_TAG_member
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	5                       @ DW_FORM_data2
	.byte	56                      @ DW_AT_data_member_location
	.byte	5                       @ DW_FORM_data2
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	24                      @ Abbreviation Code
	.byte	38                      @ DW_TAG_const_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	25                      @ Abbreviation Code
	.byte	22                      @ DW_TAG_typedef
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	26                      @ Abbreviation Code
	.byte	1                       @ DW_TAG_array_type
	.byte	1                       @ DW_CHILDREN_yes
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	27                      @ Abbreviation Code
	.byte	33                      @ DW_TAG_subrange_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	55                      @ DW_AT_count
	.byte	5                       @ DW_FORM_data2
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	28                      @ Abbreviation Code
	.byte	36                      @ DW_TAG_base_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	11                      @ DW_AT_byte_size
	.byte	11                      @ DW_FORM_data1
	.byte	62                      @ DW_AT_encoding
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	29                      @ Abbreviation Code
	.byte	29                      @ DW_TAG_inlined_subroutine
	.byte	0                       @ DW_CHILDREN_no
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	85                      @ DW_AT_ranges
	.byte	23                      @ DW_FORM_sec_offset
	.byte	88                      @ DW_AT_call_file
	.byte	11                      @ DW_FORM_data1
	.byte	89                      @ DW_AT_call_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	30                      @ Abbreviation Code
	.byte	29                      @ DW_TAG_inlined_subroutine
	.byte	1                       @ DW_CHILDREN_yes
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	85                      @ DW_AT_ranges
	.byte	23                      @ DW_FORM_sec_offset
	.byte	88                      @ DW_AT_call_file
	.byte	11                      @ DW_FORM_data1
	.byte	89                      @ DW_AT_call_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	31                      @ Abbreviation Code
	.byte	29                      @ DW_TAG_inlined_subroutine
	.byte	1                       @ DW_CHILDREN_yes
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	88                      @ DW_AT_call_file
	.byte	11                      @ DW_FORM_data1
	.byte	89                      @ DW_AT_call_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	32                      @ Abbreviation Code
	.byte	29                      @ DW_TAG_inlined_subroutine
	.byte	0                       @ DW_CHILDREN_no
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	88                      @ DW_AT_call_file
	.byte	11                      @ DW_FORM_data1
	.byte	89                      @ DW_AT_call_line
	.byte	11                      @ DW_FORM_data1
	.ascii	"\266B"                 @ DW_AT_GNU_discriminator
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	33                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	5                       @ DW_FORM_data2
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	32                      @ DW_AT_inline
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	34                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	5                       @ DW_FORM_data2
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	35                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	32                      @ DW_AT_inline
	.byte	11                      @ DW_FORM_data1
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	36                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	64                      @ DW_AT_frame_base
	.byte	24                      @ DW_FORM_exprloc
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	37                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	23                      @ DW_FORM_sec_offset
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	38                      @ Abbreviation Code
	.byte	29                      @ DW_TAG_inlined_subroutine
	.byte	0                       @ DW_CHILDREN_no
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	88                      @ DW_AT_call_file
	.byte	11                      @ DW_FORM_data1
	.byte	89                      @ DW_AT_call_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	39                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	0                       @ EOM(3)
	.section	.debug_info,"",%progbits
.Lsection_info:
.Lcu_begin0:
	.long	1685                    @ Length of Unit
	.short	4                       @ DWARF version number
	.long	.Lsection_abbrev        @ Offset Into Abbrev. Section
	.byte	4                       @ Address Size (in bytes)
	.byte	1                       @ Abbrev [1] 0xb:0x68e DW_TAG_compile_unit
	.long	.Linfo_string0          @ DW_AT_producer
	.short	4                       @ DW_AT_language
	.long	.Linfo_string1          @ DW_AT_name
	.long	.Lline_table_start0     @ DW_AT_stmt_list
	.long	.Linfo_string2          @ DW_AT_comp_dir
	.long	.Lfunc_begin0           @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin0 @ DW_AT_high_pc
	.byte	2                       @ Abbrev [2] 0x26:0xd6 DW_TAG_class_type
	.long	.Linfo_string10         @ DW_AT_name
	.byte	24                      @ DW_AT_byte_size
	.byte	2                       @ DW_AT_decl_file
	.byte	9                       @ DW_AT_decl_line
	.byte	3                       @ Abbrev [3] 0x2e:0xd DW_TAG_member
	.long	.Linfo_string3          @ DW_AT_name
	.long	252                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	12                      @ DW_AT_decl_line
	.byte	0                       @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x3b:0xd DW_TAG_member
	.long	.Linfo_string5          @ DW_AT_name
	.long	252                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	13                      @ DW_AT_decl_line
	.byte	4                       @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	4                       @ Abbrev [4] 0x48:0xc DW_TAG_member
	.long	.Linfo_string6          @ DW_AT_name
	.long	252                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	23                      @ DW_AT_decl_line
	.byte	8                       @ DW_AT_data_member_location
	.byte	4                       @ Abbrev [4] 0x54:0xc DW_TAG_member
	.long	.Linfo_string7          @ DW_AT_name
	.long	252                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	23                      @ DW_AT_decl_line
	.byte	12                      @ DW_AT_data_member_location
	.byte	4                       @ Abbrev [4] 0x60:0xc DW_TAG_member
	.long	.Linfo_string8          @ DW_AT_name
	.long	252                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	24                      @ DW_AT_decl_line
	.byte	16                      @ DW_AT_data_member_location
	.byte	4                       @ Abbrev [4] 0x6c:0xc DW_TAG_member
	.long	.Linfo_string9          @ DW_AT_name
	.long	252                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	24                      @ DW_AT_decl_line
	.byte	20                      @ DW_AT_data_member_location
	.byte	5                       @ Abbrev [5] 0x78:0xe DW_TAG_subprogram
	.long	.Linfo_string10         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	15                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0x80:0x5 DW_TAG_formal_parameter
	.long	259                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	5                       @ Abbrev [5] 0x86:0x18 DW_TAG_subprogram
	.long	.Linfo_string10         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	16                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0x8e:0x5 DW_TAG_formal_parameter
	.long	259                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	7                       @ Abbrev [7] 0x93:0x5 DW_TAG_formal_parameter
	.long	252                     @ DW_AT_type
	.byte	7                       @ Abbrev [7] 0x98:0x5 DW_TAG_formal_parameter
	.long	252                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	5                       @ Abbrev [5] 0x9e:0xe DW_TAG_subprogram
	.long	.Linfo_string11         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	17                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0xa6:0x5 DW_TAG_formal_parameter
	.long	259                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	8                       @ Abbrev [8] 0xac:0x17 DW_TAG_subprogram
	.long	.Linfo_string12         @ DW_AT_linkage_name
	.long	.Linfo_string13         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	18                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0xb8:0x5 DW_TAG_formal_parameter
	.long	259                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	7                       @ Abbrev [7] 0xbd:0x5 DW_TAG_formal_parameter
	.long	252                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	8                       @ Abbrev [8] 0xc3:0x1c DW_TAG_subprogram
	.long	.Linfo_string14         @ DW_AT_linkage_name
	.long	.Linfo_string15         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	19                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0xcf:0x5 DW_TAG_formal_parameter
	.long	259                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	7                       @ Abbrev [7] 0xd4:0x5 DW_TAG_formal_parameter
	.long	252                     @ DW_AT_type
	.byte	7                       @ Abbrev [7] 0xd9:0x5 DW_TAG_formal_parameter
	.long	252                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	8                       @ Abbrev [8] 0xdf:0x1c DW_TAG_subprogram
	.long	.Linfo_string16         @ DW_AT_linkage_name
	.long	.Linfo_string17         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	20                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0xeb:0x5 DW_TAG_formal_parameter
	.long	259                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	7                       @ Abbrev [7] 0xf0:0x5 DW_TAG_formal_parameter
	.long	252                     @ DW_AT_type
	.byte	7                       @ Abbrev [7] 0xf5:0x5 DW_TAG_formal_parameter
	.long	252                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	9                       @ Abbrev [9] 0xfc:0x7 DW_TAG_base_type
	.long	.Linfo_string4          @ DW_AT_name
	.byte	4                       @ DW_AT_encoding
	.byte	4                       @ DW_AT_byte_size
	.byte	10                      @ Abbrev [10] 0x103:0x5 DW_TAG_pointer_type
	.long	38                      @ DW_AT_type
	.byte	11                      @ Abbrev [11] 0x108:0x1b DW_TAG_subprogram
	.long	.Lfunc_begin0           @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	283                     @ DW_AT_object_pointer
	.long	364                     @ DW_AT_abstract_origin
	.byte	12                      @ Abbrev [12] 0x11b:0x7 DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	380                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	13                      @ Abbrev [13] 0x123:0x25 DW_TAG_subprogram
	.long	.Lfunc_begin1           @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	316                     @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	14                      @ DW_AT_decl_line
	.long	.Linfo_string75         @ DW_AT_linkage_name
	.long	158                     @ DW_AT_specification
	.byte	14                      @ Abbrev [14] 0x13c:0xb DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	.Linfo_string19         @ DW_AT_name
	.long	390                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	11                      @ Abbrev [11] 0x148:0x24 DW_TAG_subprogram
	.long	.Lfunc_begin2           @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	347                     @ DW_AT_object_pointer
	.long	1455                    @ DW_AT_abstract_origin
	.byte	12                      @ Abbrev [12] 0x15b:0x7 DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	1467                    @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x162:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            @ DW_AT_location
	.long	1476                    @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	16                      @ Abbrev [16] 0x16c:0x1a DW_TAG_subprogram
	.byte	1                       @ DW_AT_decl_file
	.byte	7                       @ DW_AT_decl_line
	.long	.Linfo_string18         @ DW_AT_linkage_name
	.long	120                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	380                     @ DW_AT_object_pointer
	.byte	17                      @ Abbrev [17] 0x17c:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string19         @ DW_AT_name
	.long	390                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	10                      @ Abbrev [10] 0x186:0x5 DW_TAG_pointer_type
	.long	38                      @ DW_AT_type
	.byte	18                      @ Abbrev [18] 0x18b:0x2a DW_TAG_subprogram
	.long	195                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	405                     @ DW_AT_object_pointer
	.byte	17                      @ Abbrev [17] 0x195:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string19         @ DW_AT_name
	.long	390                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	19                      @ Abbrev [19] 0x19e:0xb DW_TAG_formal_parameter
	.long	.Linfo_string20         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	19                      @ DW_AT_decl_line
	.long	252                     @ DW_AT_type
	.byte	19                      @ Abbrev [19] 0x1a9:0xb DW_TAG_formal_parameter
	.long	.Linfo_string21         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	19                      @ DW_AT_decl_line
	.long	252                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	18                      @ Abbrev [18] 0x1b5:0x2a DW_TAG_subprogram
	.long	223                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	447                     @ DW_AT_object_pointer
	.byte	17                      @ Abbrev [17] 0x1bf:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string19         @ DW_AT_name
	.long	390                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	19                      @ Abbrev [19] 0x1c8:0xb DW_TAG_formal_parameter
	.long	.Linfo_string20         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	20                      @ DW_AT_decl_line
	.long	252                     @ DW_AT_type
	.byte	19                      @ Abbrev [19] 0x1d3:0xb DW_TAG_formal_parameter
	.long	.Linfo_string21         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	20                      @ DW_AT_decl_line
	.long	252                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	2                       @ Abbrev [2] 0x1df:0xc3 DW_TAG_class_type
	.long	.Linfo_string33         @ DW_AT_name
	.byte	104                     @ DW_AT_byte_size
	.byte	2                       @ DW_AT_decl_file
	.byte	29                      @ DW_AT_decl_line
	.byte	3                       @ Abbrev [3] 0x1e7:0xd DW_TAG_member
	.long	.Linfo_string22         @ DW_AT_name
	.long	38                      @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	31                      @ DW_AT_decl_line
	.byte	0                       @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x1f4:0xd DW_TAG_member
	.long	.Linfo_string23         @ DW_AT_name
	.long	38                      @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	32                      @ DW_AT_decl_line
	.byte	24                      @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x201:0xd DW_TAG_member
	.long	.Linfo_string24         @ DW_AT_name
	.long	38                      @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	33                      @ DW_AT_decl_line
	.byte	48                      @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x20e:0xd DW_TAG_member
	.long	.Linfo_string25         @ DW_AT_name
	.long	38                      @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	34                      @ DW_AT_decl_line
	.byte	72                      @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x21b:0xd DW_TAG_member
	.long	.Linfo_string26         @ DW_AT_name
	.long	674                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	36                      @ DW_AT_decl_line
	.byte	96                      @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x228:0xd DW_TAG_member
	.long	.Linfo_string28         @ DW_AT_name
	.long	674                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	37                      @ DW_AT_decl_line
	.byte	97                      @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x235:0xd DW_TAG_member
	.long	.Linfo_string29         @ DW_AT_name
	.long	674                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	38                      @ DW_AT_decl_line
	.byte	98                      @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x242:0xd DW_TAG_member
	.long	.Linfo_string30         @ DW_AT_name
	.long	674                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	39                      @ DW_AT_decl_line
	.byte	99                      @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x24f:0xd DW_TAG_member
	.long	.Linfo_string31         @ DW_AT_name
	.long	674                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	40                      @ DW_AT_decl_line
	.byte	100                     @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	3                       @ Abbrev [3] 0x25c:0xd DW_TAG_member
	.long	.Linfo_string32         @ DW_AT_name
	.long	674                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	41                      @ DW_AT_decl_line
	.byte	101                     @ DW_AT_data_member_location
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	5                       @ Abbrev [5] 0x269:0xe DW_TAG_subprogram
	.long	.Linfo_string33         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	43                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0x271:0x5 DW_TAG_formal_parameter
	.long	681                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	5                       @ Abbrev [5] 0x277:0xe DW_TAG_subprogram
	.long	.Linfo_string34         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	44                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0x27f:0x5 DW_TAG_formal_parameter
	.long	681                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	8                       @ Abbrev [8] 0x285:0x1c DW_TAG_subprogram
	.long	.Linfo_string35         @ DW_AT_linkage_name
	.long	.Linfo_string36         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	45                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	6                       @ Abbrev [6] 0x291:0x5 DW_TAG_formal_parameter
	.long	681                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	7                       @ Abbrev [7] 0x296:0x5 DW_TAG_formal_parameter
	.long	686                     @ DW_AT_type
	.byte	7                       @ Abbrev [7] 0x29b:0x5 DW_TAG_formal_parameter
	.long	1134                    @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	9                       @ Abbrev [9] 0x2a2:0x7 DW_TAG_base_type
	.long	.Linfo_string27         @ DW_AT_name
	.byte	2                       @ DW_AT_encoding
	.byte	1                       @ DW_AT_byte_size
	.byte	10                      @ Abbrev [10] 0x2a9:0x5 DW_TAG_pointer_type
	.long	479                     @ DW_AT_type
	.byte	10                      @ Abbrev [10] 0x2ae:0x5 DW_TAG_pointer_type
	.long	691                     @ DW_AT_type
	.byte	20                      @ Abbrev [20] 0x2b3:0xc DW_TAG_typedef
	.long	703                     @ DW_AT_type
	.long	.Linfo_string67         @ DW_AT_name
	.byte	3                       @ DW_AT_decl_file
	.short	413                     @ DW_AT_decl_line
	.byte	21                      @ Abbrev [21] 0x2bf:0x13e DW_TAG_structure_type
	.short	352                     @ DW_AT_byte_size
	.byte	3                       @ DW_AT_decl_file
	.byte	223                     @ DW_AT_decl_line
	.byte	4                       @ Abbrev [4] 0x2c4:0xc DW_TAG_member
	.long	.Linfo_string37         @ DW_AT_name
	.long	1021                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.byte	241                     @ DW_AT_decl_line
	.byte	0                       @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x2d0:0xd DW_TAG_member
	.long	.Linfo_string38         @ DW_AT_name
	.long	1036                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	256                     @ DW_AT_decl_line
	.byte	4                       @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x2dd:0xd DW_TAG_member
	.long	.Linfo_string39         @ DW_AT_name
	.long	1021                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	275                     @ DW_AT_decl_line
	.byte	8                       @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x2ea:0xd DW_TAG_member
	.long	.Linfo_string40         @ DW_AT_name
	.long	1036                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	290                     @ DW_AT_decl_line
	.byte	12                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x2f7:0xd DW_TAG_member
	.long	.Linfo_string41         @ DW_AT_name
	.long	1046                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	300                     @ DW_AT_decl_line
	.byte	16                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x304:0xd DW_TAG_member
	.long	.Linfo_string44         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	314                     @ DW_AT_decl_line
	.byte	20                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x311:0xd DW_TAG_member
	.long	.Linfo_string45         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	316                     @ DW_AT_decl_line
	.byte	24                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x31e:0xd DW_TAG_member
	.long	.Linfo_string46         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	318                     @ DW_AT_decl_line
	.byte	28                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x32b:0xd DW_TAG_member
	.long	.Linfo_string47         @ DW_AT_name
	.long	1031                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	320                     @ DW_AT_decl_line
	.byte	32                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x338:0xd DW_TAG_member
	.long	.Linfo_string48         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	333                     @ DW_AT_decl_line
	.byte	36                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x345:0xd DW_TAG_member
	.long	.Linfo_string49         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	338                     @ DW_AT_decl_line
	.byte	40                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x352:0xd DW_TAG_member
	.long	.Linfo_string50         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	343                     @ DW_AT_decl_line
	.byte	44                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x35f:0xd DW_TAG_member
	.long	.Linfo_string51         @ DW_AT_name
	.long	1031                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	354                     @ DW_AT_decl_line
	.byte	48                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x36c:0xd DW_TAG_member
	.long	.Linfo_string52         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	357                     @ DW_AT_decl_line
	.byte	52                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x379:0xd DW_TAG_member
	.long	.Linfo_string53         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	361                     @ DW_AT_decl_line
	.byte	56                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x386:0xd DW_TAG_member
	.long	.Linfo_string54         @ DW_AT_name
	.long	1031                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	363                     @ DW_AT_decl_line
	.byte	60                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x393:0xd DW_TAG_member
	.long	.Linfo_string55         @ DW_AT_name
	.long	1079                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	371                     @ DW_AT_decl_line
	.byte	64                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x3a0:0xd DW_TAG_member
	.long	.Linfo_string58         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	377                     @ DW_AT_decl_line
	.byte	72                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x3ad:0xd DW_TAG_member
	.long	.Linfo_string59         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	383                     @ DW_AT_decl_line
	.byte	76                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x3ba:0xd DW_TAG_member
	.long	.Linfo_string60         @ DW_AT_name
	.long	1021                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	390                     @ DW_AT_decl_line
	.byte	80                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x3c7:0xd DW_TAG_member
	.long	.Linfo_string61         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	396                     @ DW_AT_decl_line
	.byte	84                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x3d4:0xd DW_TAG_member
	.long	.Linfo_string62         @ DW_AT_name
	.long	1074                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	406                     @ DW_AT_decl_line
	.byte	88                      @ DW_AT_data_member_location
	.byte	22                      @ Abbrev [22] 0x3e1:0xd DW_TAG_member
	.long	.Linfo_string63         @ DW_AT_name
	.long	1102                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	409                     @ DW_AT_decl_line
	.byte	92                      @ DW_AT_data_member_location
	.byte	23                      @ Abbrev [23] 0x3ee:0xe DW_TAG_member
	.long	.Linfo_string66         @ DW_AT_name
	.long	1129                    @ DW_AT_type
	.byte	3                       @ DW_AT_decl_file
	.short	412                     @ DW_AT_decl_line
	.short	348                     @ DW_AT_data_member_location
	.byte	0                       @ End Of Children Mark
	.byte	24                      @ Abbrev [24] 0x3fd:0x5 DW_TAG_const_type
	.long	1026                    @ DW_AT_type
	.byte	10                      @ Abbrev [10] 0x402:0x5 DW_TAG_pointer_type
	.long	1031                    @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x407:0x5 DW_TAG_const_type
	.long	252                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x40c:0x5 DW_TAG_const_type
	.long	1041                    @ DW_AT_type
	.byte	10                      @ Abbrev [10] 0x411:0x5 DW_TAG_pointer_type
	.long	252                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x416:0x5 DW_TAG_const_type
	.long	1051                    @ DW_AT_type
	.byte	10                      @ Abbrev [10] 0x41b:0x5 DW_TAG_pointer_type
	.long	1056                    @ DW_AT_type
	.byte	25                      @ Abbrev [25] 0x420:0xb DW_TAG_typedef
	.long	1067                    @ DW_AT_type
	.long	.Linfo_string43         @ DW_AT_name
	.byte	4                       @ DW_AT_decl_file
	.byte	51                      @ DW_AT_decl_line
	.byte	9                       @ Abbrev [9] 0x42b:0x7 DW_TAG_base_type
	.long	.Linfo_string42         @ DW_AT_name
	.byte	7                       @ DW_AT_encoding
	.byte	4                       @ DW_AT_byte_size
	.byte	24                      @ Abbrev [24] 0x432:0x5 DW_TAG_const_type
	.long	1056                    @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x437:0x5 DW_TAG_const_type
	.long	1084                    @ DW_AT_type
	.byte	25                      @ Abbrev [25] 0x43c:0xb DW_TAG_typedef
	.long	1095                    @ DW_AT_type
	.long	.Linfo_string57         @ DW_AT_name
	.byte	4                       @ DW_AT_decl_file
	.byte	58                      @ DW_AT_decl_line
	.byte	9                       @ Abbrev [9] 0x447:0x7 DW_TAG_base_type
	.long	.Linfo_string56         @ DW_AT_name
	.byte	7                       @ DW_AT_encoding
	.byte	8                       @ DW_AT_byte_size
	.byte	26                      @ Abbrev [26] 0x44e:0xd DW_TAG_array_type
	.long	1115                    @ DW_AT_type
	.byte	27                      @ Abbrev [27] 0x453:0x7 DW_TAG_subrange_type
	.long	1122                    @ DW_AT_type
	.short	256                     @ DW_AT_count
	.byte	0                       @ End Of Children Mark
	.byte	9                       @ Abbrev [9] 0x45b:0x7 DW_TAG_base_type
	.long	.Linfo_string64         @ DW_AT_name
	.byte	8                       @ DW_AT_encoding
	.byte	1                       @ DW_AT_byte_size
	.byte	28                      @ Abbrev [28] 0x462:0x7 DW_TAG_base_type
	.long	.Linfo_string65         @ DW_AT_name
	.byte	8                       @ DW_AT_byte_size
	.byte	7                       @ DW_AT_encoding
	.byte	24                      @ Abbrev [24] 0x469:0x5 DW_TAG_const_type
	.long	1067                    @ DW_AT_type
	.byte	9                       @ Abbrev [9] 0x46e:0x7 DW_TAG_base_type
	.long	.Linfo_string68         @ DW_AT_name
	.byte	5                       @ DW_AT_encoding
	.byte	4                       @ DW_AT_byte_size
	.byte	13                      @ Abbrev [13] 0x475:0xdf DW_TAG_subprogram
	.long	.Lfunc_begin3           @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	1166                    @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	28                      @ DW_AT_decl_line
	.long	.Linfo_string76         @ DW_AT_linkage_name
	.long	617                     @ DW_AT_specification
	.byte	14                      @ Abbrev [14] 0x48e:0xb DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	.Linfo_string19         @ DW_AT_name
	.long	1683                    @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	29                      @ Abbrev [29] 0x499:0xb DW_TAG_inlined_subroutine
	.long	364                     @ DW_AT_abstract_origin
	.long	.Ldebug_ranges0         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	28                      @ DW_AT_call_line
	.byte	29                      @ Abbrev [29] 0x4a4:0xb DW_TAG_inlined_subroutine
	.long	364                     @ DW_AT_abstract_origin
	.long	.Ldebug_ranges1         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	28                      @ DW_AT_call_line
	.byte	30                      @ Abbrev [30] 0x4af:0x1e DW_TAG_inlined_subroutine
	.long	395                     @ DW_AT_abstract_origin
	.long	.Ldebug_ranges2         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	40                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x4ba:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc8            @ DW_AT_location
	.long	414                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x4c3:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7            @ DW_AT_location
	.long	425                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	31                      @ Abbrev [31] 0x4cd:0x22 DW_TAG_inlined_subroutine
	.long	437                     @ DW_AT_abstract_origin
	.long	.Ltmp11                 @ DW_AT_low_pc
	.long	.Ltmp12-.Ltmp11         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	32                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x4dc:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            @ DW_AT_location
	.long	456                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x4e5:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            @ DW_AT_location
	.long	467                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	31                      @ Abbrev [31] 0x4ef:0x22 DW_TAG_inlined_subroutine
	.long	437                     @ DW_AT_abstract_origin
	.long	.Ltmp13                 @ DW_AT_low_pc
	.long	.Ltmp14-.Ltmp13         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	35                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x4fe:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4            @ DW_AT_location
	.long	456                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x507:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc3            @ DW_AT_location
	.long	467                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	31                      @ Abbrev [31] 0x511:0x22 DW_TAG_inlined_subroutine
	.long	437                     @ DW_AT_abstract_origin
	.long	.Ltmp16                 @ DW_AT_low_pc
	.long	.Ltmp17-.Ltmp16         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	38                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x520:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            @ DW_AT_location
	.long	456                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x529:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5            @ DW_AT_location
	.long	467                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	32                      @ Abbrev [32] 0x533:0x10 DW_TAG_inlined_subroutine
	.long	364                     @ DW_AT_abstract_origin
	.long	.Ltmp9                  @ DW_AT_low_pc
	.long	.Ltmp10-.Ltmp9          @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	28                      @ DW_AT_call_line
	.byte	2                       @ DW_AT_GNU_discriminator
	.byte	32                      @ Abbrev [32] 0x543:0x10 DW_TAG_inlined_subroutine
	.long	364                     @ DW_AT_abstract_origin
	.long	.Ltmp14                 @ DW_AT_low_pc
	.long	.Ltmp16-.Ltmp14         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	28                      @ DW_AT_call_line
	.byte	1                       @ DW_AT_GNU_discriminator
	.byte	0                       @ End Of Children Mark
	.byte	13                      @ Abbrev [13] 0x554:0x25 DW_TAG_subprogram
	.long	.Lfunc_begin4           @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	1389                    @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	53                      @ DW_AT_decl_line
	.long	.Linfo_string77         @ DW_AT_linkage_name
	.long	631                     @ DW_AT_specification
	.byte	14                      @ Abbrev [14] 0x56d:0xb DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	.Linfo_string19         @ DW_AT_name
	.long	1683                    @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	33                      @ Abbrev [33] 0x579:0x36 DW_TAG_subprogram
	.long	.Linfo_string69         @ DW_AT_linkage_name
	.long	.Linfo_string70         @ DW_AT_name
	.byte	3                       @ DW_AT_decl_file
	.short	1465                    @ DW_AT_decl_line
	.long	252                     @ DW_AT_type
	.byte	1                       @ DW_AT_inline
	.byte	34                      @ Abbrev [34] 0x58a:0xc DW_TAG_formal_parameter
	.long	.Linfo_string71         @ DW_AT_name
	.byte	3                       @ DW_AT_decl_file
	.short	1465                    @ DW_AT_decl_line
	.long	686                     @ DW_AT_type
	.byte	34                      @ Abbrev [34] 0x596:0xc DW_TAG_formal_parameter
	.long	.Linfo_string72         @ DW_AT_name
	.byte	3                       @ DW_AT_decl_file
	.short	1465                    @ DW_AT_decl_line
	.long	1134                    @ DW_AT_type
	.byte	34                      @ Abbrev [34] 0x5a2:0xc DW_TAG_formal_parameter
	.long	.Linfo_string73         @ DW_AT_name
	.byte	3                       @ DW_AT_decl_file
	.short	1465                    @ DW_AT_decl_line
	.long	1134                    @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	35                      @ Abbrev [35] 0x5af:0x21 DW_TAG_subprogram
	.byte	1                       @ DW_AT_decl_file
	.byte	21                      @ DW_AT_decl_line
	.long	172                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	1467                    @ DW_AT_object_pointer
	.byte	17                      @ Abbrev [17] 0x5bb:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string19         @ DW_AT_name
	.long	390                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	19                      @ Abbrev [19] 0x5c4:0xb DW_TAG_formal_parameter
	.long	.Linfo_string74         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	21                      @ DW_AT_decl_line
	.long	252                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	36                      @ Abbrev [36] 0x5d0:0xc3 DW_TAG_subprogram
	.long	.Lfunc_begin5           @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	1509                    @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	60                      @ DW_AT_decl_line
	.long	645                     @ DW_AT_specification
	.byte	14                      @ Abbrev [14] 0x5e5:0xb DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	.Linfo_string19         @ DW_AT_name
	.long	1683                    @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	37                      @ Abbrev [37] 0x5f0:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc9            @ DW_AT_location
	.long	.Linfo_string71         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	60                      @ DW_AT_decl_line
	.long	686                     @ DW_AT_type
	.byte	37                      @ Abbrev [37] 0x5ff:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           @ DW_AT_location
	.long	.Linfo_string72         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	60                      @ DW_AT_decl_line
	.long	1134                    @ DW_AT_type
	.byte	38                      @ Abbrev [38] 0x60e:0xf DW_TAG_inlined_subroutine
	.long	1401                    @ DW_AT_abstract_origin
	.long	.Ltmp22                 @ DW_AT_low_pc
	.long	.Ltmp23-.Ltmp22         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	62                      @ DW_AT_call_line
	.byte	38                      @ Abbrev [38] 0x61d:0xf DW_TAG_inlined_subroutine
	.long	1401                    @ DW_AT_abstract_origin
	.long	.Ltmp24                 @ DW_AT_low_pc
	.long	.Ltmp25-.Ltmp24         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	63                      @ DW_AT_call_line
	.byte	38                      @ Abbrev [38] 0x62c:0xf DW_TAG_inlined_subroutine
	.long	1401                    @ DW_AT_abstract_origin
	.long	.Ltmp26                 @ DW_AT_low_pc
	.long	.Ltmp27-.Ltmp26         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	64                      @ DW_AT_call_line
	.byte	38                      @ Abbrev [38] 0x63b:0xf DW_TAG_inlined_subroutine
	.long	1401                    @ DW_AT_abstract_origin
	.long	.Ltmp28                 @ DW_AT_low_pc
	.long	.Ltmp29-.Ltmp28         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	65                      @ DW_AT_call_line
	.byte	30                      @ Abbrev [30] 0x64a:0x11 DW_TAG_inlined_subroutine
	.long	1455                    @ DW_AT_abstract_origin
	.long	.Ldebug_ranges3         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	68                      @ DW_AT_call_line
	.byte	39                      @ Abbrev [39] 0x655:0x5 DW_TAG_formal_parameter
	.long	1476                    @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	30                      @ Abbrev [30] 0x65b:0x11 DW_TAG_inlined_subroutine
	.long	1455                    @ DW_AT_abstract_origin
	.long	.Ldebug_ranges4         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	69                      @ DW_AT_call_line
	.byte	39                      @ Abbrev [39] 0x666:0x5 DW_TAG_formal_parameter
	.long	1476                    @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	30                      @ Abbrev [30] 0x66c:0x11 DW_TAG_inlined_subroutine
	.long	1455                    @ DW_AT_abstract_origin
	.long	.Ldebug_ranges5         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	70                      @ DW_AT_call_line
	.byte	39                      @ Abbrev [39] 0x677:0x5 DW_TAG_formal_parameter
	.long	1476                    @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	31                      @ Abbrev [31] 0x67d:0x15 DW_TAG_inlined_subroutine
	.long	1455                    @ DW_AT_abstract_origin
	.long	.Ltmp39                 @ DW_AT_low_pc
	.long	.Ltmp40-.Ltmp39         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	71                      @ DW_AT_call_line
	.byte	39                      @ Abbrev [39] 0x68c:0x5 DW_TAG_formal_parameter
	.long	1476                    @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	10                      @ Abbrev [10] 0x693:0x5 DW_TAG_pointer_type
	.long	479                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.section	.debug_ranges,"",%progbits
.Ldebug_range:
.Ldebug_ranges0:
	.long	.Ltmp5-.Lfunc_begin0
	.long	.Ltmp6-.Lfunc_begin0
	.long	.Ltmp7-.Lfunc_begin0
	.long	.Ltmp8-.Lfunc_begin0
	.long	.Ltmp12-.Lfunc_begin0
	.long	.Ltmp13-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges1:
	.long	.Ltmp6-.Lfunc_begin0
	.long	.Ltmp7-.Lfunc_begin0
	.long	.Ltmp10-.Lfunc_begin0
	.long	.Ltmp11-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges2:
	.long	.Ltmp8-.Lfunc_begin0
	.long	.Ltmp9-.Lfunc_begin0
	.long	.Ltmp17-.Lfunc_begin0
	.long	.Ltmp18-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges3:
	.long	.Ltmp30-.Lfunc_begin0
	.long	.Ltmp31-.Lfunc_begin0
	.long	.Ltmp32-.Lfunc_begin0
	.long	.Ltmp33-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges4:
	.long	.Ltmp33-.Lfunc_begin0
	.long	.Ltmp34-.Lfunc_begin0
	.long	.Ltmp35-.Lfunc_begin0
	.long	.Ltmp36-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges5:
	.long	.Ltmp36-.Lfunc_begin0
	.long	.Ltmp37-.Lfunc_begin0
	.long	.Ltmp38-.Lfunc_begin0
	.long	.Ltmp39-.Lfunc_begin0
	.long	0
	.long	0
	.section	.debug_macinfo,"",%progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       @ End Of Macro List Mark
	.section	.debug_pubnames,"",%progbits
	.long	.LpubNames_end0-.LpubNames_begin0 @ Length of Public Names Info
.LpubNames_begin0:
	.short	2                       @ DWARF Version
	.long	.Lcu_begin0             @ Offset of Compilation Unit Info
	.long	1689                    @ Compilation Unit Length
	.long	291                     @ DIE offset
	.asciz	"Potentiometer::~Potentiometer" @ External Name
	.long	364                     @ DIE offset
	.asciz	"Potentiometer::Potentiometer" @ External Name
	.long	1488                    @ DIE offset
	.asciz	"AnalogInterface::read" @ External Name
	.long	1455                    @ DIE offset
	.asciz	"Potentiometer::convertCurrentValue" @ External Name
	.long	437                     @ DIE offset
	.asciz	"Potentiometer::setNewRange" @ External Name
	.long	1364                    @ DIE offset
	.asciz	"AnalogInterface::~AnalogInterface" @ External Name
	.long	1141                    @ DIE offset
	.asciz	"AnalogInterface::AnalogInterface" @ External Name
	.long	395                     @ DIE offset
	.asciz	"Potentiometer::setOldRange" @ External Name
	.long	1401                    @ DIE offset
	.asciz	"analogRead"            @ External Name
	.long	0                       @ End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",%progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 @ Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       @ DWARF Version
	.long	.Lcu_begin0             @ Offset of Compilation Unit Info
	.long	1689                    @ Compilation Unit Length
	.long	1115                    @ DIE offset
	.asciz	"char"                  @ External Name
	.long	479                     @ DIE offset
	.asciz	"AnalogInterface"       @ External Name
	.long	1134                    @ DIE offset
	.asciz	"int"                   @ External Name
	.long	252                     @ DIE offset
	.asciz	"float"                 @ External Name
	.long	1056                    @ DIE offset
	.asciz	"uint32_t"              @ External Name
	.long	691                     @ DIE offset
	.asciz	"BelaContext"           @ External Name
	.long	1067                    @ DIE offset
	.asciz	"unsigned int"          @ External Name
	.long	674                     @ DIE offset
	.asciz	"bool"                  @ External Name
	.long	1084                    @ DIE offset
	.asciz	"uint64_t"              @ External Name
	.long	1095                    @ DIE offset
	.asciz	"long long unsigned int" @ External Name
	.long	38                      @ DIE offset
	.asciz	"Potentiometer"         @ External Name
	.long	0                       @ End Mark
.LpubTypes_end0:
	.cfi_sections .debug_frame

	.globl	_ZN13PotentiometerC1Ev
	.type	_ZN13PotentiometerC1Ev,%function
_ZN13PotentiometerC1Ev = _ZN13PotentiometerC2Ev
	.globl	_ZN13PotentiometerD1Ev
	.type	_ZN13PotentiometerD1Ev,%function
_ZN13PotentiometerD1Ev = _ZN13PotentiometerD2Ev
	.globl	_ZN15AnalogInterfaceC1Ev
	.type	_ZN15AnalogInterfaceC1Ev,%function
_ZN15AnalogInterfaceC1Ev = _ZN15AnalogInterfaceC2Ev
	.globl	_ZN15AnalogInterfaceD1Ev
	.type	_ZN15AnalogInterfaceD1Ev,%function
_ZN15AnalogInterfaceD1Ev = _ZN15AnalogInterfaceD2Ev
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
	.section	.debug_line,"",%progbits
.Lline_table_start0:
