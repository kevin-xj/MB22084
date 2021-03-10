opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	PF462XXX
opt include "f:\doc\datesheet\mcu\pf\ide3.0.1_200917\data\include\pf462xxx.cgen.inc"
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
	FNCALL	_main,_ADC_INITIAL
	FNCALL	_main,_AD_baseGetFuc
	FNCALL	_main,_DelayMs
	FNCALL	_main,_EEPROM_Init
	FNCALL	_main,_Event_checkFuc
	FNCALL	_main,_GLO_cdsCheckFuc
	FNCALL	_main,_INT_INITIAL
	FNCALL	_main,_Mode_changeCheckFuc
	FNCALL	_main,_POWER_INITIAL
	FNCALL	_main,_Sola_checkFuc
	FNCALL	_main,_Solar_BaseDefine
	FNCALL	_main,_TestFunc_Disable
	FNCALL	_main,_TestFunc_Enable
	FNCALL	_main,_Version_Write
	FNCALL	_main,_WDT_INITIAL
	FNCALL	_main,___lwdiv
	FNCALL	_main,___wmul
	FNCALL	_main,_chrg_ModeCheck
	FNCALL	_chrg_ModeCheck,_Charg_Disp
	FNCALL	_chrg_ModeCheck,_DelayMs
	FNCALL	_Charg_Disp,_DelayMs
	FNCALL	_Version_Write,_EEPROMread
	FNCALL	_Version_Write,_EEPROMwrite
	FNCALL	_Solar_BaseDefine,_AD_baseWriteFuc
	FNCALL	_Solar_BaseDefine,_DelayMs
	FNCALL	_Solar_BaseDefine,_GET_ADC_DATA
	FNCALL	_Solar_BaseDefine,___lwdiv
	FNCALL	_Solar_BaseDefine,_oneGLO
	FNCALL	_oneGLO,_DelayMs
	FNCALL	_AD_baseWriteFuc,_EEPROMread
	FNCALL	_AD_baseWriteFuc,_EEPROMwrite
	FNCALL	_Sola_checkFuc,_GET_ADC_DATA
	FNCALL	_Sola_checkFuc,___lwdiv
	FNCALL	_Mode_changeCheckFuc,_DelayMs
	FNCALL	_GLO_cdsCheckFuc,___lwdiv
	FNCALL	_GLO_cdsCheckFuc,___wmul
	FNCALL	_Event_checkFuc,_DelayMs
	FNCALL	_Event_checkFuc,_TIMER1_INTSTART
	FNCALL	_Event_checkFuc,_TIMER1_INTSTOP
	FNCALL	_Event_checkFuc,_eventEnterOFF
	FNCALL	_Event_checkFuc,_eventExitOFF
	FNCALL	_eventExitOFF,_WDT_INITIAL
	FNCALL	_DelayMs,_DelayUs
	FNCALL	_EEPROM_Init,_EEPROMread
	FNCALL	_EEPROM_Init,_EEPROMwrite
	FNCALL	_AD_baseGetFuc,_EEPROMread
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_g_event_t
	global	_g_checkMode
	global	_Seg_0F
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"main.c"
	line	277

;initializer for _g_event_t
	retlw	04h
	line	259

;initializer for _g_checkMode
	retlw	04h
	line	329

;initializer for _Seg_0F
	retlw	0C0h
	retlw	0F9h
	retlw	0A4h
	retlw	0B0h
	retlw	099h
	retlw	092h
	retlw	082h
	retlw	0F8h
	retlw	080h
	retlw	090h
	retlw	088h
	retlw	083h
	retlw	0C6h
	retlw	0A1h
	retlw	086h
	retlw	08Eh
	retlw	0BFh
	retlw	0EFh
	global	_g_ledkeep
	global	Solar_BaseDefine@ad_vpre
	global	Sola_checkFuc@ad_vpre
	global	_g_gloCurValue
	global	_g_gloRecValue
	global	_g_adBaseValue
	global	GLO_cdsCheckFuc@av_check_dt
	global	GLO_cdsCheckFuc@av_check_lt
	global	_g_cdsCmp
	global	_g_light_stvalue
	global	_g_checkStBits
	global	_g_gloCntTimer
	global	_g_gloEnvt_st
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_MSCKCON
_MSCKCON	set	27
	global	_CMCON0
_CMCON0	set	25
	global	_WDTCON
_WDTCON	set	24
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_INTCON
_INTCON	set	11
	global	_PORTC
_PORTC	set	7
	global	_PORTA
_PORTA	set	5
	global	_GO_DONE
_GO_DONE	set	249
	global	_ADON
_ADON	set	248
	global	_SWDTEN
_SWDTEN	set	192
	global	_TMR1ON
_TMR1ON	set	128
	global	_EEIF
_EEIF	set	103
	global	_TMR1IF
_TMR1IF	set	96
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_INTE
_INTE	set	92
	global	_PAIE
_PAIE	set	91
	global	_INTF
_INTF	set	89
	global	_PAIF
_PAIF	set	88
	global	_PC5
_PC5	set	61
	global	_PC3
_PC3	set	59
	global	_PC1
_PC1	set	57
	global	_PA7
_PA7	set	47
	global	_PA6
_PA6	set	46
	global	_PA4
_PA4	set	44
	global	_PA3
_PA3	set	43
	global	_PA2
_PA2	set	42
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_EECON1
_EECON1	set	156
	global	_EEADR
_EEADR	set	155
	global	_EEDAT
_EEDAT	set	154
	global	_IOCA
_IOCA	set	150
	global	_WPUA
_WPUA	set	149
	global	_ANSEL
_ANSEL	set	145
	global	_OSCCON
_OSCCON	set	143
	global	_WPUC
_WPUC	set	136
	global	_TRISC
_TRISC	set	135
	global	_TRISA
_TRISA	set	133
	global	_OPTION
_OPTION	set	129
	global	_WR
_WR	set	1256
	global	_RD
_RD	set	1248
	global	_WPUA3
_WPUA3	set	1195
	global	_WPUA2
_WPUA2	set	1194
	global	_TMR1IE
_TMR1IE	set	1120
	global	_WPUC1
_WPUC1	set	1089
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA2
_TRISA2	set	1066
	global	_INTEDG
_INTEDG	set	1038
	global	_PSA
_PSA	set	1035
; #config settings
	file	"mb22084_v1.0.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMMON,class=COMMON,space=1,noexec
global __pbssCOMMON
__pbssCOMMON:
_g_ledkeep:
       ds      2

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
Solar_BaseDefine@ad_vpre:
       ds      2

Sola_checkFuc@ad_vpre:
       ds      2

_g_gloCurValue:
       ds      2

_g_gloRecValue:
       ds      2

_g_adBaseValue:
       ds      2

GLO_cdsCheckFuc@av_check_dt:
       ds      1

GLO_cdsCheckFuc@av_check_lt:
       ds      1

_g_cdsCmp:
       ds      1

_g_light_stvalue:
       ds      1

_g_checkStBits:
       ds      1

_g_gloCntTimer:
       ds      1

_g_gloEnvt_st:
       ds      1

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"main.c"
	line	277
_g_event_t:
       ds      1

psect	dataBANK0
	file	"main.c"
	line	259
_g_checkMode:
       ds      1

psect	dataBANK0
	file	"main.c"
	line	329
_Seg_0F:
       ds      18

	file	"mb22084_v1.0.as"
	line	#
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
	fcall	__pidataBANK0+8		;fetch initializer
	movwf	__pdataBANK0+8&07fh		
	fcall	__pidataBANK0+9		;fetch initializer
	movwf	__pdataBANK0+9&07fh		
	fcall	__pidataBANK0+10		;fetch initializer
	movwf	__pdataBANK0+10&07fh		
	fcall	__pidataBANK0+11		;fetch initializer
	movwf	__pdataBANK0+11&07fh		
	fcall	__pidataBANK0+12		;fetch initializer
	movwf	__pdataBANK0+12&07fh		
	fcall	__pidataBANK0+13		;fetch initializer
	movwf	__pdataBANK0+13&07fh		
	fcall	__pidataBANK0+14		;fetch initializer
	movwf	__pdataBANK0+14&07fh		
	fcall	__pidataBANK0+15		;fetch initializer
	movwf	__pdataBANK0+15&07fh		
	fcall	__pidataBANK0+16		;fetch initializer
	movwf	__pdataBANK0+16&07fh		
	fcall	__pidataBANK0+17		;fetch initializer
	movwf	__pdataBANK0+17&07fh		
	fcall	__pidataBANK0+18		;fetch initializer
	movwf	__pdataBANK0+18&07fh		
	fcall	__pidataBANK0+19		;fetch initializer
	movwf	__pdataBANK0+19&07fh		
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+011h)
	fcall	clear_ram0
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2,merge=1
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_DelayMs:	; 1 bytes @ 0x0
?_ISR:	; 1 bytes @ 0x0
??_ISR:	; 1 bytes @ 0x0
?_oneGLO:	; 1 bytes @ 0x0
?_Charg_Disp:	; 1 bytes @ 0x0
?_TIMER1_INTSTART:	; 1 bytes @ 0x0
?_TIMER1_INTSTOP:	; 1 bytes @ 0x0
?_POWER_INITIAL:	; 1 bytes @ 0x0
?_ADC_INITIAL:	; 1 bytes @ 0x0
?_WDT_INITIAL:	; 1 bytes @ 0x0
?_INT_INITIAL:	; 1 bytes @ 0x0
?_eventEnterOFF:	; 1 bytes @ 0x0
?_eventExitOFF:	; 1 bytes @ 0x0
?_Mode_changeCheckFuc:	; 1 bytes @ 0x0
?_Event_checkFuc:	; 1 bytes @ 0x0
?_chrg_ModeCheck:	; 1 bytes @ 0x0
?_Sola_checkFuc:	; 1 bytes @ 0x0
?_GLO_cdsCheckFuc:	; 1 bytes @ 0x0
?_Solar_BaseDefine:	; 1 bytes @ 0x0
?_DelayUs:	; 1 bytes @ 0x0
?_EEPROMread:	; 1 bytes @ 0x0
?_EEPROM_Init:	; 1 bytes @ 0x0
?_Version_Write:	; 1 bytes @ 0x0
?_AD_baseGetFuc:	; 1 bytes @ 0x0
?_TestFunc_Enable:	; 1 bytes @ 0x0
?_TestFunc_Disable:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	ds	2
?_EEPROMwrite:	; 1 bytes @ 0x2
??_TIMER1_INTSTART:	; 1 bytes @ 0x2
??_TIMER1_INTSTOP:	; 1 bytes @ 0x2
??_POWER_INITIAL:	; 1 bytes @ 0x2
??_ADC_INITIAL:	; 1 bytes @ 0x2
??_WDT_INITIAL:	; 1 bytes @ 0x2
??_INT_INITIAL:	; 1 bytes @ 0x2
??_eventEnterOFF:	; 1 bytes @ 0x2
??_eventExitOFF:	; 1 bytes @ 0x2
??_DelayUs:	; 1 bytes @ 0x2
??_EEPROMread:	; 1 bytes @ 0x2
??_TestFunc_Enable:	; 1 bytes @ 0x2
??_TestFunc_Disable:	; 1 bytes @ 0x2
	global	?_GET_ADC_DATA
?_GET_ADC_DATA:	; 2 bytes @ 0x2
	global	?___wmul
?___wmul:	; 2 bytes @ 0x2
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x2
	global	EEPROMread@EEAddr
EEPROMread@EEAddr:	; 1 bytes @ 0x2
	global	EEPROMwrite@Data
EEPROMwrite@Data:	; 1 bytes @ 0x2
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x2
	ds	1
??_EEPROMwrite:	; 1 bytes @ 0x3
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x3
	global	EEPROMread@ReEEPROMread
EEPROMread@ReEEPROMread:	; 1 bytes @ 0x3
	global	EEPROMwrite@EEAddr
EEPROMwrite@EEAddr:	; 1 bytes @ 0x3
	ds	1
??_DelayMs:	; 1 bytes @ 0x4
??_AD_baseGetFuc:	; 1 bytes @ 0x4
	global	DelayMs@Time
DelayMs@Time:	; 1 bytes @ 0x4
	global	EEPROMwrite@gietag
EEPROMwrite@gietag:	; 1 bytes @ 0x4
	global	AD_baseGetFuc@ad_vl2
AD_baseGetFuc@ad_vl2:	; 1 bytes @ 0x4
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x4
	ds	1
?_AD_baseWriteFuc:	; 1 bytes @ 0x5
??_GET_ADC_DATA:	; 1 bytes @ 0x5
??_EEPROM_Init:	; 1 bytes @ 0x5
??_Version_Write:	; 1 bytes @ 0x5
	global	GET_ADC_DATA@AD_chBuff
GET_ADC_DATA@AD_chBuff:	; 1 bytes @ 0x5
	global	DelayMs@a
DelayMs@a:	; 1 bytes @ 0x5
	global	EEPROM_Init@ep_t
EEPROM_Init@ep_t:	; 1 bytes @ 0x5
	global	Version_Write@V_d
Version_Write@V_d:	; 1 bytes @ 0x5
	global	AD_baseGetFuc@ad_vh2
AD_baseGetFuc@ad_vh2:	; 1 bytes @ 0x5
	global	AD_baseWriteFuc@ad_vt
AD_baseWriteFuc@ad_vt:	; 2 bytes @ 0x5
	ds	1
??___wmul:	; 1 bytes @ 0x6
	global	DelayMs@b
DelayMs@b:	; 1 bytes @ 0x6
	global	Version_Write@D_d
Version_Write@D_d:	; 1 bytes @ 0x6
	global	AD_baseGetFuc@ad_vl
AD_baseGetFuc@ad_vl:	; 1 bytes @ 0x6
	global	GET_ADC_DATA@ADC_DATA
GET_ADC_DATA@ADC_DATA:	; 2 bytes @ 0x6
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x6
	ds	1
??_AD_baseWriteFuc:	; 1 bytes @ 0x7
??_oneGLO:	; 1 bytes @ 0x7
??_Charg_Disp:	; 1 bytes @ 0x7
??_Mode_changeCheckFuc:	; 1 bytes @ 0x7
??_Event_checkFuc:	; 1 bytes @ 0x7
	global	Charg_Disp@chg_t
Charg_Disp@chg_t:	; 1 bytes @ 0x7
	global	AD_baseGetFuc@ad_vh
AD_baseGetFuc@ad_vh:	; 1 bytes @ 0x7
	ds	1
??_chrg_ModeCheck:	; 1 bytes @ 0x8
??_GLO_cdsCheckFuc:	; 1 bytes @ 0x8
??___lwdiv:	; 1 bytes @ 0x8
	global	GET_ADC_DATA@AN_CH
GET_ADC_DATA@AN_CH:	; 1 bytes @ 0x8
	global	chrg_ModeCheck@ch_i
chrg_ModeCheck@ch_i:	; 1 bytes @ 0x8
	global	GLO_cdsCheckFuc@m_adpre
GLO_cdsCheckFuc@m_adpre:	; 1 bytes @ 0x8
	ds	1
??_main:	; 1 bytes @ 0x9
	global	main@main_i
main@main_i:	; 1 bytes @ 0x9
	ds	1
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	AD_baseWriteFuc@ad_cl
AD_baseWriteFuc@ad_cl:	; 1 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	1
	global	AD_baseWriteFuc@ad_ch
AD_baseWriteFuc@ad_ch:	; 1 bytes @ 0x1
	ds	1
	global	AD_baseWriteFuc@ad_vl
AD_baseWriteFuc@ad_vl:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	AD_baseWriteFuc@ad_vh
AD_baseWriteFuc@ad_vh:	; 1 bytes @ 0x3
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x4
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
??_Sola_checkFuc:	; 1 bytes @ 0x7
??_Solar_BaseDefine:	; 1 bytes @ 0x7
	ds	4
	global	Sola_checkFuc@ad_total
Sola_checkFuc@ad_total:	; 20 bytes @ 0xB
	global	Solar_BaseDefine@ad_total
Solar_BaseDefine@ad_total:	; 20 bytes @ 0xB
	ds	20
	global	Sola_checkFuc@z
Sola_checkFuc@z:	; 1 bytes @ 0x1F
	global	Solar_BaseDefine@define_t
Solar_BaseDefine@define_t:	; 1 bytes @ 0x1F
	ds	1
	global	Sola_checkFuc@ad_sum
Sola_checkFuc@ad_sum:	; 2 bytes @ 0x20
	global	Solar_BaseDefine@ad_sum
Solar_BaseDefine@ad_sum:	; 2 bytes @ 0x20
	ds	2
	global	Sola_checkFuc@ad_v
Sola_checkFuc@ad_v:	; 2 bytes @ 0x22
	global	Solar_BaseDefine@ad_v
Solar_BaseDefine@ad_v:	; 2 bytes @ 0x22
	ds	2
	global	Sola_checkFuc@j
Sola_checkFuc@j:	; 1 bytes @ 0x24
	global	Solar_BaseDefine@j
Solar_BaseDefine@j:	; 1 bytes @ 0x24
	ds	1
	global	Sola_checkFuc@i
Sola_checkFuc@i:	; 1 bytes @ 0x25
	global	Solar_BaseDefine@i
Solar_BaseDefine@i:	; 1 bytes @ 0x25
	ds	1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        20
;!    BSS         19
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     10      12
;!    BANK0            80     38      75
;!    BANK1            32      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_GLO_cdsCheckFuc
;!    _main->_chrg_ModeCheck
;!    _chrg_ModeCheck->_Charg_Disp
;!    _Charg_Disp->_DelayMs
;!    _Version_Write->_EEPROMwrite
;!    _Solar_BaseDefine->_GET_ADC_DATA
;!    _oneGLO->_DelayMs
;!    _AD_baseWriteFuc->_EEPROMwrite
;!    _Sola_checkFuc->_GET_ADC_DATA
;!    _Mode_changeCheckFuc->_DelayMs
;!    _GLO_cdsCheckFuc->___wmul
;!    ___lwdiv->___wmul
;!    _Event_checkFuc->_DelayMs
;!    _DelayMs->_DelayUs
;!    _EEPROM_Init->_EEPROMwrite
;!    _AD_baseGetFuc->_EEPROMread
;!
;!Critical Paths under _ISR in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_Sola_checkFuc
;!    _main->_Solar_BaseDefine
;!    _Solar_BaseDefine->___lwdiv
;!    _Sola_checkFuc->___lwdiv
;!    _GLO_cdsCheckFuc->___lwdiv
;!
;!Critical Paths under _ISR in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK1
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0   13211
;!                                              9 COMMON     1     1      0
;!                        _ADC_INITIAL
;!                      _AD_baseGetFuc
;!                            _DelayMs
;!                        _EEPROM_Init
;!                     _Event_checkFuc
;!                    _GLO_cdsCheckFuc
;!                        _INT_INITIAL
;!                _Mode_changeCheckFuc
;!                      _POWER_INITIAL
;!                      _Sola_checkFuc
;!                   _Solar_BaseDefine
;!                   _TestFunc_Disable
;!                    _TestFunc_Enable
;!                      _Version_Write
;!                        _WDT_INITIAL
;!                            ___lwdiv
;!                             ___wmul
;!                     _chrg_ModeCheck
;! ---------------------------------------------------------------------------------
;! (1) _chrg_ModeCheck                                       1     1      0     476
;!                                              8 COMMON     1     1      0
;!                         _Charg_Disp
;!                            _DelayMs
;! ---------------------------------------------------------------------------------
;! (2) _Charg_Disp                                           1     1      0     238
;!                                              7 COMMON     1     1      0
;!                            _DelayMs
;! ---------------------------------------------------------------------------------
;! (1) _Version_Write                                        4     4      0    1099
;!                                              5 COMMON     2     2      0
;!                         _EEPROMread
;!                        _EEPROMwrite
;! ---------------------------------------------------------------------------------
;! (1) _TestFunc_Enable                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _TestFunc_Disable                                     0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Solar_BaseDefine                                    31    31      0    4046
;!                                              7 BANK0     31    31      0
;!                    _AD_baseWriteFuc
;!                            _DelayMs
;!                       _GET_ADC_DATA
;!                            ___lwdiv
;!                             _oneGLO
;! ---------------------------------------------------------------------------------
;! (2) _oneGLO                                               0     0      0     204
;!                            _DelayMs
;! ---------------------------------------------------------------------------------
;! (2) _AD_baseWriteFuc                                      6     4      2    1421
;!                                              5 COMMON     2     0      2
;!                                              0 BANK0      4     4      0
;!                         _EEPROMread
;!                        _EEPROMwrite
;! ---------------------------------------------------------------------------------
;! (1) _Sola_checkFuc                                       31    31      0    2248
;!                                              7 BANK0     31    31      0
;!                       _GET_ADC_DATA
;!                            ___lwdiv
;! ---------------------------------------------------------------------------------
;! (2) _GET_ADC_DATA                                         7     4      3     148
;!                                              2 COMMON     7     4      3
;! ---------------------------------------------------------------------------------
;! (1) _POWER_INITIAL                                        0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Mode_changeCheckFuc                                  1     1      0     204
;!                                              7 COMMON     1     1      0
;!                            _DelayMs
;! ---------------------------------------------------------------------------------
;! (1) _INT_INITIAL                                          1     1      0       0
;! ---------------------------------------------------------------------------------
;! (1) _GLO_cdsCheckFuc                                      1     1      0    1681
;!                                              8 COMMON     1     1      0
;!                            ___lwdiv
;!                             ___wmul
;! ---------------------------------------------------------------------------------
;! (1) ___wmul                                               6     2      4     592
;!                                              2 COMMON     6     2      4
;! ---------------------------------------------------------------------------------
;! (1) ___lwdiv                                              7     3      4    1055
;!                                              0 BANK0      7     3      4
;!                             ___wmul (ARG)
;! ---------------------------------------------------------------------------------
;! (1) _Event_checkFuc                                       0     0      0     204
;!                            _DelayMs
;!                    _TIMER1_INTSTART
;!                     _TIMER1_INTSTOP
;!                      _eventEnterOFF
;!                       _eventExitOFF
;! ---------------------------------------------------------------------------------
;! (2) _eventExitOFF                                         1     1      0       0
;!                        _WDT_INITIAL
;! ---------------------------------------------------------------------------------
;! (1) _WDT_INITIAL                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _eventEnterOFF                                        1     1      0       0
;! ---------------------------------------------------------------------------------
;! (2) _TIMER1_INTSTOP                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _TIMER1_INTSTART                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _DelayMs                                              3     3      0     204
;!                                              4 COMMON     3     3      0
;!                            _DelayUs
;! ---------------------------------------------------------------------------------
;! (3) _DelayUs                                              2     2      0      68
;!                                              2 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _EEPROM_Init                                          1     1      0    1099
;!                                              5 COMMON     1     1      0
;!                         _EEPROMread
;!                        _EEPROMwrite
;! ---------------------------------------------------------------------------------
;! (2) _EEPROMwrite                                          3     2      1     966
;!                                              2 COMMON     3     2      1
;! ---------------------------------------------------------------------------------
;! (1) _AD_baseGetFuc                                        4     4      0     263
;!                                              4 COMMON     4     4      0
;!                         _EEPROMread
;! ---------------------------------------------------------------------------------
;! (2) _EEPROMread                                           2     2      0      65
;!                                              2 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _ADC_INITIAL                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _ISR                                                  3     3      0       0
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 5
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _ADC_INITIAL
;!   _AD_baseGetFuc
;!     _EEPROMread
;!   _DelayMs
;!     _DelayUs
;!   _EEPROM_Init
;!     _EEPROMread
;!     _EEPROMwrite
;!   _Event_checkFuc
;!     _DelayMs
;!       _DelayUs
;!     _TIMER1_INTSTART
;!     _TIMER1_INTSTOP
;!     _eventEnterOFF
;!     _eventExitOFF
;!       _WDT_INITIAL
;!   _GLO_cdsCheckFuc
;!     ___lwdiv
;!       ___wmul (ARG)
;!     ___wmul
;!   _INT_INITIAL
;!   _Mode_changeCheckFuc
;!     _DelayMs
;!       _DelayUs
;!   _POWER_INITIAL
;!   _Sola_checkFuc
;!     _GET_ADC_DATA
;!     ___lwdiv
;!       ___wmul (ARG)
;!   _Solar_BaseDefine
;!     _AD_baseWriteFuc
;!       _EEPROMread
;!       _EEPROMwrite
;!     _DelayMs
;!       _DelayUs
;!     _GET_ADC_DATA
;!     ___lwdiv
;!       ___wmul (ARG)
;!     _oneGLO
;!       _DelayMs
;!         _DelayUs
;!   _TestFunc_Disable
;!   _TestFunc_Enable
;!   _Version_Write
;!     _EEPROMread
;!     _EEPROMwrite
;!   _WDT_INITIAL
;!   ___lwdiv
;!     ___wmul (ARG)
;!   ___wmul
;!   _chrg_ModeCheck
;!     _Charg_Disp
;!       _DelayMs
;!         _DelayUs
;!     _DelayMs
;!       _DelayUs
;!
;! _ISR (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               20      0       0       6        0.0%
;!BITBANK1            20      0       0       5        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     26      4B       4       93.8%
;!BITBANK0            50      0       0       3        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      A       C       1       85.7%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      57       8        0.0%
;!ABS                  0      0      57       7        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%
;!EEDATA             100      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 1923 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  main_i          1    9[COMMON] unsigned char 
;;  main_j          1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ADC_INITIAL
;;		_AD_baseGetFuc
;;		_DelayMs
;;		_EEPROM_Init
;;		_Event_checkFuc
;;		_GLO_cdsCheckFuc
;;		_INT_INITIAL
;;		_Mode_changeCheckFuc
;;		_POWER_INITIAL
;;		_Sola_checkFuc
;;		_Solar_BaseDefine
;;		_TestFunc_Disable
;;		_TestFunc_Enable
;;		_Version_Write
;;		_WDT_INITIAL
;;		___lwdiv
;;		___wmul
;;		_chrg_ModeCheck
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"main.c"
	line	1923
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"main.c"
	line	1923
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1925
	
l4500:	
;main.c: 1926: unsigned char main_j = 0;
	clrf	(main@main_i)
	line	1930
	
l4502:	
;main.c: 1930: POWER_INITIAL();
	fcall	_POWER_INITIAL
	line	1932
	
l4504:	
;main.c: 1932: ADC_INITIAL();
	fcall	_ADC_INITIAL
	line	1933
	
l4506:	
;main.c: 1933: WDT_INITIAL();
	fcall	_WDT_INITIAL
	line	1934
	
l4508:	
;main.c: 1934: INT_INITIAL();
	fcall	_INT_INITIAL
	line	1935
	
l4510:	
;main.c: 1935: EEPROM_Init();
	fcall	_EEPROM_Init
	line	1936
	
l4512:	
;main.c: 1936: Version_Write();
	fcall	_Version_Write
	line	1942
	
l4514:	
;main.c: 1942: PC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7	;volatile
	line	1943
	
l4516:	
;main.c: 1943: PA6 = 0;
	bcf	(46/8),(46)&7	;volatile
	line	1944
	
l4518:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	
l4520:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	1946
	
l4522:	
;main.c: 1946: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1947
	
l4524:	
;main.c: 1947: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1948
	
l4526:	
;main.c: 1948: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1949
	
l4528:	
;main.c: 1949: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1952
	
l4530:	
;main.c: 1952: TestFunc_Enable();
	fcall	_TestFunc_Enable
	line	1954
	
l4532:	
;main.c: 1954: if(!PA2 && !PA4 && !PA3)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7	;volatile
	goto	u3601
	goto	u3600
u3601:
	goto	l4550
u3600:
	
l4534:	
	btfsc	(44/8),(44)&7	;volatile
	goto	u3611
	goto	u3610
u3611:
	goto	l4550
u3610:
	
l4536:	
	btfsc	(43/8),(43)&7	;volatile
	goto	u3621
	goto	u3620
u3621:
	goto	l4550
u3620:
	line	1956
	
l4538:	
;main.c: 1955: {
;main.c: 1956: DelayMs(100);
	movlw	low(064h)
	fcall	_DelayMs
	line	1958
	
l4540:	
;main.c: 1958: if(!PA2 && !PA4 && !PA3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(42/8),(42)&7	;volatile
	goto	u3631
	goto	u3630
u3631:
	goto	l4550
u3630:
	
l4542:	
	btfsc	(44/8),(44)&7	;volatile
	goto	u3641
	goto	u3640
u3641:
	goto	l4550
u3640:
	
l4544:	
	btfsc	(43/8),(43)&7	;volatile
	goto	u3651
	goto	u3650
u3651:
	goto	l4550
u3650:
	line	1962
	
l4546:	
;main.c: 1959: {
;main.c: 1962: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1963
;main.c: 1963: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1964
;main.c: 1964: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1965
;main.c: 1965: DelayMs(250);
	movlw	low(0FAh)
	fcall	_DelayMs
	line	1967
	
l4548:	
;main.c: 1967: Solar_BaseDefine();
	fcall	_Solar_BaseDefine
	line	1971
;main.c: 1971: while(1)
	
l1502:	
	line	1972
# 1972 "main.c"
clrwdt ;# 
psect	maintext
	goto	l1502
	line	1978
	
l4550:	
;main.c: 1975: }
;main.c: 1976: }
;main.c: 1978: TestFunc_Disable();
	fcall	_TestFunc_Disable
	line	1981
	
l4552:	
;main.c: 1981: PA6 = 1;
	bsf	(46/8),(46)&7	;volatile
	line	1982
;main.c: 1982: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1983
;main.c: 1983: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1984
	
l4554:	
;main.c: 1984: PA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(46/8),(46)&7	;volatile
	line	1985
;main.c: 1985: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1986
;main.c: 1986: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1987
;main.c: 1987: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1988
	
l4556:	
;main.c: 1988: PA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(46/8),(46)&7	;volatile
	line	1989
;main.c: 1989: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1990
;main.c: 1990: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1991
	
l4558:	
;main.c: 1991: PA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(46/8),(46)&7	;volatile
	line	2025
	
l4560:	
;main.c: 2025: if(AD_baseGetFuc() == 0)
	fcall	_AD_baseGetFuc
	xorlw	0
	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l1505
u3660:
	line	2026
	
l4562:	
;main.c: 2026: AD_baseGetFuc();
	fcall	_AD_baseGetFuc
	
l1505:	
	line	2030
;main.c: 2030: g_gloRecValue = (g_adBaseValue * 13)/10;
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	movf	(_g_adBaseValue+1),w	;volatile
	movwf	(___wmul@multiplier+1)
	movf	(_g_adBaseValue),w	;volatile
	movwf	(___wmul@multiplier)
	movlw	0Dh
	movwf	(___wmul@multiplicand)
	clrf	(___wmul@multiplicand+1)
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(___lwdiv@dividend+1)
	movf	(0+(?___wmul)),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(_g_gloRecValue+1)	;volatile
	movf	(0+(?___lwdiv)),w
	movwf	(_g_gloRecValue)	;volatile
	line	2031
	
l4564:	
;main.c: 2031: g_cdsCmp = g_gloRecValue-g_adBaseValue;
	movf	(_g_adBaseValue),w	;volatile
	subwf	(_g_gloRecValue),w	;volatile
	movwf	(_g_cdsCmp)	;volatile
	line	2035
;main.c: 2035: while(1)
	
l1506:	
	line	2037
# 2037 "main.c"
clrwdt ;# 
psect	maintext
	line	2038
	
l4566:	
;main.c: 2038: if(g_checkMode == OFF_MODE)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_g_checkMode)),w	;volatile
	btfss	status,2
	goto	u3671
	goto	u3670
u3671:
	goto	l4570
u3670:
	line	2040
	
l4568:	
;main.c: 2039: {
;main.c: 2040: main_i = chrg_ModeCheck();
	fcall	_chrg_ModeCheck
	movwf	(main@main_i)
	line	2043
	
l4570:	
;main.c: 2041: }
;main.c: 2043: if(main_i != 1)
		decf	((main@main_i)),w
	btfsc	status,2
	goto	u3681
	goto	u3680
u3681:
	goto	l4586
u3680:
	line	2046
	
l4572:	
;main.c: 2044: {
;main.c: 2046: ADON = 1;
	bsf	(248/8),(248)&7	;volatile
	line	2047
	
l4574:	
;main.c: 2047: DelayMs(1);
	movlw	low(01h)
	fcall	_DelayMs
	line	2049
	
l4576:	
;main.c: 2049: Sola_checkFuc();
	fcall	_Sola_checkFuc
	line	2050
	
l4578:	
;main.c: 2050: ADON = 0;
	bcf	(248/8),(248)&7	;volatile
	line	2052
	
l4580:	
;main.c: 2052: GLO_cdsCheckFuc();
	fcall	_GLO_cdsCheckFuc
	line	2054
	
l4582:	
;main.c: 2054: Mode_changeCheckFuc();
	fcall	_Mode_changeCheckFuc
	line	2056
	
l4584:	
;main.c: 2056: Event_checkFuc();
	fcall	_Event_checkFuc
	line	2058
	
l4586:	
;main.c: 2057: }
;main.c: 2058: main_i = 0;
	clrf	(main@main_i)
	line	2059
	
l4588:	
;main.c: 2059: if((g_checkMode != OFF_MODE) || PC1)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_g_checkMode)),w	;volatile
	btfss	status,2
	goto	u3691
	goto	u3690
u3691:
	goto	l1511
u3690:
	
l4590:	
	btfss	(57/8),(57)&7	;volatile
	goto	u3701
	goto	u3700
u3701:
	goto	l1506
u3700:
	
l1511:	
	line	2061
# 2061 "main.c"
clrwdt ;# 
	line	2062
# 2062 "main.c"
sleep ;# 
psect	maintext
	goto	l1506
	global	start
	ljmp	start
	opt stack 0
	line	2066
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_chrg_ModeCheck

;; *************** function _chrg_ModeCheck *****************
;; Defined at:
;;		line 1112 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ch_i            1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Charg_Disp
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	1112
global __ptext1
__ptext1:	;psect for function _chrg_ModeCheck
psect	text1
	file	"main.c"
	line	1112
	global	__size_of_chrg_ModeCheck
	__size_of_chrg_ModeCheck	equ	__end_of_chrg_ModeCheck-_chrg_ModeCheck
	
_chrg_ModeCheck:	
;incstack = 0
	opt	stack 3
; Regs used in _chrg_ModeCheck: [wreg+status,2+status,0+pclath+cstack]
	line	1118
	
l4160:	
;main.c: 1115: unsigned char ch_i;
;main.c: 1118: if(!PC1)
	btfsc	(57/8),(57)&7	;volatile
	goto	u3181
	goto	u3180
u3181:
	goto	l4202
u3180:
	line	1120
	
l4162:	
;main.c: 1119: {
;main.c: 1120: DelayMs(100);
	movlw	low(064h)
	fcall	_DelayMs
	line	1121
	
l4164:	
;main.c: 1121: if(!PC1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(57/8),(57)&7	;volatile
	goto	u3191
	goto	u3190
u3191:
	goto	l4202
u3190:
	line	1126
	
l4166:	
;main.c: 1125: {
;main.c: 1126: Charg_Disp();
	fcall	_Charg_Disp
	line	1128
	
l4168:	
;main.c: 1128: for(ch_i = 10;ch_i--;)
	movlw	low(0Ah)
	movwf	(chrg_ModeCheck@ch_i)
	goto	l4200
	line	1129
	
l1334:	
	line	1130
# 1130 "main.c"
clrwdt ;# 
psect	text1
	line	1131
	
l4170:	
;main.c: 1131: DelayMs(100);
	movlw	low(064h)
	fcall	_DelayMs
	line	1132
	
l4172:	
;main.c: 1132: if(!PA2 || !PA4 || !PA3 || PC1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u3201
	goto	u3200
u3201:
	goto	l4180
u3200:
	
l4174:	
	btfss	(44/8),(44)&7	;volatile
	goto	u3211
	goto	u3210
u3211:
	goto	l4180
u3210:
	
l4176:	
	btfss	(43/8),(43)&7	;volatile
	goto	u3221
	goto	u3220
u3221:
	goto	l4180
u3220:
	
l4178:	
	btfss	(57/8),(57)&7	;volatile
	goto	u3231
	goto	u3230
u3231:
	goto	l4200
u3230:
	line	1134
	
l4180:	
;main.c: 1133: {
;main.c: 1134: DelayMs(100);
	movlw	low(064h)
	fcall	_DelayMs
	line	1135
	
l4182:	
;main.c: 1135: if(!PA2 || !PA4 || !PA3 || PC1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u3241
	goto	u3240
u3241:
	goto	l1340
u3240:
	
l4184:	
	btfss	(44/8),(44)&7	;volatile
	goto	u3251
	goto	u3250
u3251:
	goto	l1340
u3250:
	
l4186:	
	btfss	(43/8),(43)&7	;volatile
	goto	u3261
	goto	u3260
u3261:
	goto	l1340
u3260:
	
l4188:	
	btfss	(57/8),(57)&7	;volatile
	goto	u3271
	goto	u3270
u3271:
	goto	l4200
u3270:
	
l1340:	
	line	1137
# 1137 "main.c"
clrwdt ;# 
psect	text1
	line	1138
;main.c: 1138: SWDTEN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(192/8),(192)&7	;volatile
	line	1139
;main.c: 1139: if(PC1)
	btfss	(57/8),(57)&7	;volatile
	goto	u3281
	goto	u3280
u3281:
	goto	l4196
u3280:
	line	1141
	
l4190:	
;main.c: 1140: {
;main.c: 1141: return 1;
	movlw	low(01h)
	goto	l1342
	line	1145
	
l4196:	
;main.c: 1143: else
;main.c: 1144: {
;main.c: 1145: return 2;
	movlw	low(02h)
	goto	l1342
	line	1128
	
l4200:	
	decf	(chrg_ModeCheck@ch_i),f
		incf	(((chrg_ModeCheck@ch_i))),w
	btfss	status,2
	goto	u3291
	goto	u3290
u3291:
	goto	l1334
u3290:
	goto	l4166
	line	1153
	
l4202:	
;main.c: 1146: }
;main.c: 1147: }
;main.c: 1148: }
;main.c: 1149: }
;main.c: 1150: }
;main.c: 1151: }
;main.c: 1152: }
;main.c: 1153: return 0;
	movlw	low(0)
	line	1155
	
l1342:	
	return
	opt stack 0
GLOBAL	__end_of_chrg_ModeCheck
	__end_of_chrg_ModeCheck:
	signat	_chrg_ModeCheck,89
	global	_Charg_Disp

;; *************** function _Charg_Disp *****************
;; Defined at:
;;		line 403 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  chg_t           1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		_chrg_ModeCheck
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	403
global __ptext2
__ptext2:	;psect for function _Charg_Disp
psect	text2
	file	"main.c"
	line	403
	global	__size_of_Charg_Disp
	__size_of_Charg_Disp	equ	__end_of_Charg_Disp-_Charg_Disp
	
_Charg_Disp:	
;incstack = 0
	opt	stack 3
; Regs used in _Charg_Disp: [wreg+status,2+status,0+pclath+cstack]
	line	406
	
l3738:	
;main.c: 405: unsigned char chg_t;
;main.c: 406: PC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7	;volatile
	line	408
	
l3740:	
;main.c: 408: chg_t = 150;
	movlw	low(096h)
	movwf	(Charg_Disp@chg_t)
	line	409
;main.c: 409: while(chg_t--)
	goto	l3746
	
l1120:	
	line	411
# 411 "main.c"
clrwdt ;# 
psect	text2
	line	412
;main.c: 412: PA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(46/8),(46)&7	;volatile
	line	413
	
l3742:	
;main.c: 413: DelayMs(3);
	movlw	low(03h)
	fcall	_DelayMs
	line	414
	
l3744:	
;main.c: 414: PA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(46/8),(46)&7	;volatile
	line	415
;main.c: 415: DelayMs(7);
	movlw	low(07h)
	fcall	_DelayMs
	line	409
	
l3746:	
	decf	(Charg_Disp@chg_t),f
		incf	(((Charg_Disp@chg_t))),w
	btfss	status,2
	goto	u2561
	goto	u2560
u2561:
	goto	l1120
u2560:
	line	419
	
l1122:	
	return
	opt stack 0
GLOBAL	__end_of_Charg_Disp
	__end_of_Charg_Disp:
	signat	_Charg_Disp,89
	global	_Version_Write

;; *************** function _Version_Write *****************
;; Defined at:
;;		line 1583 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  D_d             1    6[COMMON] unsigned char 
;;  V_d             1    5[COMMON] unsigned char 
;;  D_rd            1    0        unsigned char 
;;  V_rd            1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_EEPROMread
;;		_EEPROMwrite
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	1583
global __ptext3
__ptext3:	;psect for function _Version_Write
psect	text3
	file	"main.c"
	line	1583
	global	__size_of_Version_Write
	__size_of_Version_Write	equ	__end_of_Version_Write-_Version_Write
	
_Version_Write:	
;incstack = 0
	opt	stack 5
; Regs used in _Version_Write: [wreg+status,2+status,0+pclath+cstack]
	line	1589
	
l4372:	
;main.c: 1585: unsigned char V_d, D_d,V_rd, D_rd;
;main.c: 1589: EEPROMwrite(0x01, 0x84);
	movlw	low(084h)
	movwf	(EEPROMwrite@Data)
	movlw	low(01h)
	fcall	_EEPROMwrite
	line	1590
;main.c: 1590: EEPROMwrite(0x02, 0x10);
	movlw	low(010h)
	movwf	(EEPROMwrite@Data)
	movlw	low(02h)
	fcall	_EEPROMwrite
	line	1593
	
l4374:	
;main.c: 1593: V_d = EEPROMread(0x01);
	movlw	low(01h)
	fcall	_EEPROMread
	movwf	(Version_Write@V_d)
	line	1594
	
l4376:	
;main.c: 1594: D_d = EEPROMread(0x02);
	movlw	low(02h)
	fcall	_EEPROMread
	movwf	(Version_Write@D_d)
	line	1596
	
l4378:	
;main.c: 1596: if((V_d != 0x84) || (D_d != 0x10))
		movlw	132
	xorwf	((Version_Write@V_d)),w
	btfss	status,2
	goto	u3541
	goto	u3540
u3541:
	goto	l4382
u3540:
	
l4380:	
		movlw	16
	xorwf	((Version_Write@D_d)),w
	btfsc	status,2
	goto	u3551
	goto	u3550
u3551:
	goto	l1446
u3550:
	line	1598
	
l4382:	
;main.c: 1597: {
;main.c: 1598: EEPROMwrite(0x01, 0x84);
	movlw	low(084h)
	movwf	(EEPROMwrite@Data)
	movlw	low(01h)
	fcall	_EEPROMwrite
	line	1599
;main.c: 1599: EEPROMwrite(0x02, 0x10);
	movlw	low(010h)
	movwf	(EEPROMwrite@Data)
	movlw	low(02h)
	fcall	_EEPROMwrite
	line	1602
	
l1446:	
	return
	opt stack 0
GLOBAL	__end_of_Version_Write
	__end_of_Version_Write:
	signat	_Version_Write,89
	global	_TestFunc_Enable

;; *************** function _TestFunc_Enable *****************
;; Defined at:
;;		line 1863 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	1863
global __ptext4
__ptext4:	;psect for function _TestFunc_Enable
psect	text4
	file	"main.c"
	line	1863
	global	__size_of_TestFunc_Enable
	__size_of_TestFunc_Enable	equ	__end_of_TestFunc_Enable-_TestFunc_Enable
	
_TestFunc_Enable:	
;incstack = 0
	opt	stack 6
; Regs used in _TestFunc_Enable: [wreg+status,2+status,0]
	line	1876
;main.c: 1876: do{TRISA |= 0B00011100;WPUA |= 0B00011100;}while(0);;
	
l1486:	
	
l4400:	
	movlw	low(01Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	iorwf	(133)^080h,f	;volatile
	movlw	low(01Ch)
	iorwf	(149)^080h,f	;volatile
	line	1880
	
l1488:	
	return
	opt stack 0
GLOBAL	__end_of_TestFunc_Enable
	__end_of_TestFunc_Enable:
	signat	_TestFunc_Enable,89
	global	_TestFunc_Disable

;; *************** function _TestFunc_Disable *****************
;; Defined at:
;;		line 1891 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	1891
global __ptext5
__ptext5:	;psect for function _TestFunc_Disable
psect	text5
	file	"main.c"
	line	1891
	global	__size_of_TestFunc_Disable
	__size_of_TestFunc_Disable	equ	__end_of_TestFunc_Disable-_TestFunc_Disable
	
_TestFunc_Disable:	
;incstack = 0
	opt	stack 6
; Regs used in _TestFunc_Disable: [wreg+status,2+status,0]
	line	1907
;main.c: 1907: do{TRISA &= 0B11100011;PORTA &= 0B11100011;}while(0);;
	
l1491:	
	
l4402:	
	movlw	low(0E3h)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(133)^080h,f	;volatile
	movlw	low(0E3h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(5),f	;volatile
	line	1912
	
l1493:	
	return
	opt stack 0
GLOBAL	__end_of_TestFunc_Disable
	__end_of_TestFunc_Disable:
	signat	_TestFunc_Disable,89
	global	_Solar_BaseDefine

;; *************** function _Solar_BaseDefine *****************
;; Defined at:
;;		line 1375 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ad_total       20   11[BANK0 ] unsigned int [10]
;;  ad_v            2   34[BANK0 ] unsigned int 
;;  ad_sum          2   32[BANK0 ] unsigned int 
;;  i               1   37[BANK0 ] unsigned char 
;;  j               1   36[BANK0 ] unsigned char 
;;  define_t        1   31[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      27       0
;;      Temps:          0       4       0
;;      Totals:         0      31       0
;;Total ram usage:       31 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AD_baseWriteFuc
;;		_DelayMs
;;		_GET_ADC_DATA
;;		___lwdiv
;;		_oneGLO
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	1375
global __ptext6
__ptext6:	;psect for function _Solar_BaseDefine
psect	text6
	file	"main.c"
	line	1375
	global	__size_of_Solar_BaseDefine
	__size_of_Solar_BaseDefine	equ	__end_of_Solar_BaseDefine-_Solar_BaseDefine
	
_Solar_BaseDefine:	
;incstack = 0
	opt	stack 3
; Regs used in _Solar_BaseDefine: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1385
	
l4304:	
;main.c: 1378: unsigned char define_t,i,j;
;main.c: 1379: unsigned int ad_v,ad_total[10],ad_sum;
;main.c: 1381: static unsigned int ad_vpre = 0;
;main.c: 1385: ADON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(248/8),(248)&7	;volatile
	line	1386
	
l4306:	
;main.c: 1386: DelayMs(100);
	movlw	low(064h)
	fcall	_DelayMs
	line	1388
	
l4308:	
;main.c: 1388: for(define_t = 50;define_t--;)
	movlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Solar_BaseDefine@define_t)
	goto	l4352
	line	1389
	
l1391:	
	line	1391
# 1391 "main.c"
clrwdt ;# 
psect	text6
	line	1392
	
l4310:	
;main.c: 1392: ad_sum = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Solar_BaseDefine@ad_sum)
	clrf	(Solar_BaseDefine@ad_sum+1)
	line	1393
;main.c: 1393: for(i = 0;i < 10;i++)
	clrf	(Solar_BaseDefine@i)
	line	1395
	
l4316:	
;main.c: 1394: {
;main.c: 1395: ad_total[i] = GET_ADC_DATA (0);
	movlw	low(0)
	fcall	_GET_ADC_DATA
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(Solar_BaseDefine@i),w
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(0+(?_GET_ADC_DATA)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_GET_ADC_DATA)),w
	movwf	indf
	line	1396
	
l4318:	
;main.c: 1396: ad_sum += ad_total[i];
	clrc
	rlf	(Solar_BaseDefine@i),w
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Solar_BaseDefine+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Solar_BaseDefine+0)+0+1
	movf	0+(??_Solar_BaseDefine+0)+0,w
	addwf	(Solar_BaseDefine@ad_sum),f
	skipnc
	incf	(Solar_BaseDefine@ad_sum+1),f
	movf	1+(??_Solar_BaseDefine+0)+0,w
	addwf	(Solar_BaseDefine@ad_sum+1),f
	line	1393
	
l4320:	
	incf	(Solar_BaseDefine@i),f
	
l4322:	
	movlw	low(0Ah)
	subwf	(Solar_BaseDefine@i),w
	skipc
	goto	u3471
	goto	u3470
u3471:
	goto	l4316
u3470:
	
l1393:	
	line	1399
;main.c: 1397: }
;main.c: 1399: for(i = 1;i < 10;i++)
	clrf	(Solar_BaseDefine@i)
	incf	(Solar_BaseDefine@i),f
	line	1401
	
l4328:	
;main.c: 1400: {
;main.c: 1401: for(j=0;j<10-i;j++)
	clrf	(Solar_BaseDefine@j)
	goto	l4336
	line	1403
	
l4330:	
;main.c: 1402: {
;main.c: 1403: if(ad_total[j]> ad_total[j+1])
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(Solar_BaseDefine@j),w
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Solar_BaseDefine+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Solar_BaseDefine+0)+0+1
	clrc
	rlf	(Solar_BaseDefine@j),w
	addlw	02h
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Solar_BaseDefine+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Solar_BaseDefine+2)+0+1
	movf	1+(??_Solar_BaseDefine+0)+0,w
	subwf	1+(??_Solar_BaseDefine+2)+0,w
	skipz
	goto	u3485
	movf	0+(??_Solar_BaseDefine+0)+0,w
	subwf	0+(??_Solar_BaseDefine+2)+0,w
u3485:
	skipnc
	goto	u3481
	goto	u3480
u3481:
	goto	l1398
u3480:
	line	1405
	
l4332:	
;main.c: 1404: {
;main.c: 1405: ad_v = ad_total[j];
	clrc
	rlf	(Solar_BaseDefine@j),w
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Solar_BaseDefine@ad_v)
	incf	fsr0,f
	movf	indf,w
	movwf	(Solar_BaseDefine@ad_v+1)
	line	1406
;main.c: 1406: ad_total[j]=ad_total[j+1];
	clrc
	rlf	(Solar_BaseDefine@j),w
	addlw	02h
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Solar_BaseDefine+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Solar_BaseDefine+0)+0+1
	clrc
	rlf	(Solar_BaseDefine@j),w
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	0+(??_Solar_BaseDefine+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_Solar_BaseDefine+0)+0,w
	movwf	indf
	line	1407
;main.c: 1407: ad_total[j+1] = ad_v;
	clrc
	rlf	(Solar_BaseDefine@j),w
	addlw	02h
	addlw	low(Solar_BaseDefine@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(Solar_BaseDefine@ad_v),w
	movwf	indf
	incf	fsr0,f
	movf	(Solar_BaseDefine@ad_v+1),w
	movwf	indf
	line	1408
	
l1398:	
	line	1409
# 1409 "main.c"
clrwdt ;# 
psect	text6
	line	1401
	
l4334:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Solar_BaseDefine@j),f
	
l4336:	
	movlw	0
	movwf	(??_Solar_BaseDefine+0)+0+1
	movf	(Solar_BaseDefine@i),w
	sublw	0Ah
	movwf	(??_Solar_BaseDefine+0)+0
	skipc
	decf	(??_Solar_BaseDefine+0)+0+1,f
	movf	1+(??_Solar_BaseDefine+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u3495
	movf	0+(??_Solar_BaseDefine+0)+0,w
	subwf	(Solar_BaseDefine@j),w
u3495:

	skipc
	goto	u3491
	goto	u3490
u3491:
	goto	l4330
u3490:
	
l1399:	
	line	1411
# 1411 "main.c"
clrwdt ;# 
psect	text6
	line	1399
	
l4338:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Solar_BaseDefine@i),f
	
l4340:	
	movlw	low(0Ah)
	subwf	(Solar_BaseDefine@i),w
	skipc
	goto	u3501
	goto	u3500
u3501:
	goto	l4328
u3500:
	line	1413
	
l4342:	
;main.c: 1412: }
;main.c: 1413: ad_sum = ad_sum - ad_total[0] - ad_total[9];
	movf	(Solar_BaseDefine@ad_total),w
	addwf	0+(Solar_BaseDefine@ad_total)+012h,w
	movwf	(??_Solar_BaseDefine+0)+0
	movf	(Solar_BaseDefine@ad_total+1),w
	skipnc
	incf	(Solar_BaseDefine@ad_total+1),w
	addwf	1+(Solar_BaseDefine@ad_total)+012h,w
	movwf	1+(??_Solar_BaseDefine+0)+0
	comf	(??_Solar_BaseDefine+0)+0,f
	comf	(??_Solar_BaseDefine+0)+1,f
	incf	(??_Solar_BaseDefine+0)+0,f
	skipnz
	incf	(??_Solar_BaseDefine+0)+1,f
	movf	0+(??_Solar_BaseDefine+0)+0,w
	addwf	(Solar_BaseDefine@ad_sum),f
	skipnc
	incf	(Solar_BaseDefine@ad_sum+1),f
	movf	1+(??_Solar_BaseDefine+0)+0,w
	addwf	(Solar_BaseDefine@ad_sum+1),f
	line	1414
	
l4344:	
;main.c: 1414: ad_sum >>= 3;
	clrc
	rrf	(Solar_BaseDefine@ad_sum+1),f
	rrf	(Solar_BaseDefine@ad_sum),f
	clrc
	rrf	(Solar_BaseDefine@ad_sum+1),f
	rrf	(Solar_BaseDefine@ad_sum),f
	clrc
	rrf	(Solar_BaseDefine@ad_sum+1),f
	rrf	(Solar_BaseDefine@ad_sum),f
	line	1416
;main.c: 1416: ad_v = 2 * ad_sum + (10 - 2)*ad_vpre;
	movf	(Solar_BaseDefine@ad_sum+1),w
	movwf	(Solar_BaseDefine@ad_v+1)
	movf	(Solar_BaseDefine@ad_sum),w
	movwf	(Solar_BaseDefine@ad_v)
	
l4346:	
	clrc
	rlf	(Solar_BaseDefine@ad_v),f
	rlf	(Solar_BaseDefine@ad_v+1),f
	movf	(Solar_BaseDefine@ad_vpre+1),w
	movwf	(??_Solar_BaseDefine+0)+0+1
	movf	(Solar_BaseDefine@ad_vpre),w
	movwf	(??_Solar_BaseDefine+0)+0
	clrc
	rlf	(??_Solar_BaseDefine+0)+0,f
	rlf	(??_Solar_BaseDefine+0)+1,f
	clrc
	rlf	(??_Solar_BaseDefine+0)+0,f
	rlf	(??_Solar_BaseDefine+0)+1,f
	clrc
	rlf	(??_Solar_BaseDefine+0)+0,f
	rlf	(??_Solar_BaseDefine+0)+1,f
	movf	0+(??_Solar_BaseDefine+0)+0,w
	addwf	(Solar_BaseDefine@ad_v),f
	skipnc
	incf	(Solar_BaseDefine@ad_v+1),f
	movf	1+(??_Solar_BaseDefine+0)+0,w
	addwf	(Solar_BaseDefine@ad_v+1),f
	line	1417
	
l4348:	
;main.c: 1417: ad_v = ad_v/10;
	movlw	0Ah
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	movf	(Solar_BaseDefine@ad_v+1),w
	movwf	(___lwdiv@dividend+1)
	movf	(Solar_BaseDefine@ad_v),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(Solar_BaseDefine@ad_v+1)
	movf	(0+(?___lwdiv)),w
	movwf	(Solar_BaseDefine@ad_v)
	line	1418
	
l4350:	
;main.c: 1418: ad_vpre = ad_v;
	movf	(Solar_BaseDefine@ad_v+1),w
	movwf	(Solar_BaseDefine@ad_vpre+1)
	movf	(Solar_BaseDefine@ad_v),w
	movwf	(Solar_BaseDefine@ad_vpre)
	line	1388
	
l4352:	
	decf	(Solar_BaseDefine@define_t),f
		incf	(((Solar_BaseDefine@define_t))),w
	btfss	status,2
	goto	u3511
	goto	u3510
u3511:
	goto	l1391
u3510:
	line	1422
	
l4354:	
;main.c: 1419: }
;main.c: 1422: AD_baseWriteFuc(ad_v);
	movf	(Solar_BaseDefine@ad_v+1),w
	movwf	(AD_baseWriteFuc@ad_vt+1)
	movf	(Solar_BaseDefine@ad_v),w
	movwf	(AD_baseWriteFuc@ad_vt)
	fcall	_AD_baseWriteFuc
	line	1424
	
l4356:	
;main.c: 1424: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(248/8),(248)&7	;volatile
	line	1427
;main.c: 1427: oneGLO();
	fcall	_oneGLO
	line	1428
# 1428 "main.c"
clrwdt ;# 
psect	text6
	line	1429
;main.c: 1429: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1430
;main.c: 1430: oneGLO();
	fcall	_oneGLO
	line	1431
# 1431 "main.c"
clrwdt ;# 
psect	text6
	line	1432
;main.c: 1432: DelayMs(200);
	movlw	low(0C8h)
	fcall	_DelayMs
	line	1433
;main.c: 1433: oneGLO();
	fcall	_oneGLO
	line	1434
	
l1401:	
	return
	opt stack 0
GLOBAL	__end_of_Solar_BaseDefine
	__end_of_Solar_BaseDefine:
	signat	_Solar_BaseDefine,89
	global	_oneGLO

;; *************** function _oneGLO *****************
;; Defined at:
;;		line 393 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		_Solar_BaseDefine
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	line	393
global __ptext7
__ptext7:	;psect for function _oneGLO
psect	text7
	file	"main.c"
	line	393
	global	__size_of_oneGLO
	__size_of_oneGLO	equ	__end_of_oneGLO-_oneGLO
	
_oneGLO:	
;incstack = 0
	opt	stack 3
; Regs used in _oneGLO: [wreg+status,2+status,0+pclath+cstack]
	line	395
	
l3732:	
;main.c: 395: PC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7	;volatile
	line	396
;main.c: 396: PA6 = 1;
	bsf	(46/8),(46)&7	;volatile
	line	397
	
l3734:	
;main.c: 397: DelayMs(100);
	movlw	low(064h)
	fcall	_DelayMs
	line	398
# 398 "main.c"
clrwdt ;# 
psect	text7
	line	399
	
l3736:	
;main.c: 399: PA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(46/8),(46)&7	;volatile
	line	401
	
l1116:	
	return
	opt stack 0
GLOBAL	__end_of_oneGLO
	__end_of_oneGLO:
	signat	_oneGLO,89
	global	_AD_baseWriteFuc

;; *************** function _AD_baseWriteFuc *****************
;; Defined at:
;;		line 1643 in file "main.c"
;; Parameters:    Size  Location     Type
;;  ad_vt           2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  ad_vh           1    3[BANK0 ] unsigned char 
;;  ad_vl           1    2[BANK0 ] unsigned char 
;;  ad_ch           1    1[BANK0 ] unsigned char 
;;  ad_cl           1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         2       4       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_EEPROMread
;;		_EEPROMwrite
;; This function is called by:
;;		_Solar_BaseDefine
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	line	1643
global __ptext8
__ptext8:	;psect for function _AD_baseWriteFuc
psect	text8
	file	"main.c"
	line	1643
	global	__size_of_AD_baseWriteFuc
	__size_of_AD_baseWriteFuc	equ	__end_of_AD_baseWriteFuc-_AD_baseWriteFuc
	
_AD_baseWriteFuc:	
;incstack = 0
	opt	stack 4
; Regs used in _AD_baseWriteFuc: [wreg+status,2+status,0+pclath+cstack]
	line	1648
	
l3812:	
;main.c: 1645: unsigned char ad_vl,ad_vh;
;main.c: 1646: unsigned char ad_cl,ad_ch;
;main.c: 1648: ad_vl = (unsigned char)ad_vt;
	movf	(AD_baseWriteFuc@ad_vt),w
	movwf	(AD_baseWriteFuc@ad_vl)
	line	1650
;main.c: 1650: ad_vh = (unsigned char)(ad_vt>>8)&0xff;
	movf	0+(AD_baseWriteFuc@ad_vt)+01h,w
	movwf	(AD_baseWriteFuc@ad_vh)
	line	1653
	
l3814:	
;main.c: 1653: EEPROMwrite(0x12, ad_vh);
	movf	(AD_baseWriteFuc@ad_vh),w
	movwf	(EEPROMwrite@Data)
	movlw	low(012h)
	fcall	_EEPROMwrite
	line	1654
	
l3816:	
;main.c: 1654: EEPROMwrite(0x13, ad_vl);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(AD_baseWriteFuc@ad_vl),w
	movwf	(EEPROMwrite@Data)
	movlw	low(013h)
	fcall	_EEPROMwrite
	line	1656
	
l3818:	
;main.c: 1656: ad_ch = EEPROMread(0x12);
	movlw	low(012h)
	fcall	_EEPROMread
	bcf	status, 5	;RP0=0, select bank0
	movwf	(AD_baseWriteFuc@ad_ch)
	line	1657
	
l3820:	
;main.c: 1657: ad_cl = EEPROMread(0x13);
	movlw	low(013h)
	fcall	_EEPROMread
	bcf	status, 5	;RP0=0, select bank0
	movwf	(AD_baseWriteFuc@ad_cl)
	line	1660
;main.c: 1660: if((ad_cl != ad_vl ) || (ad_ch != ad_vh))
	movf	(AD_baseWriteFuc@ad_cl),w
	xorwf	(AD_baseWriteFuc@ad_vl),w
	skipz
	goto	u2591
	goto	u2590
u2591:
	goto	l3824
u2590:
	
l3822:	
	movf	(AD_baseWriteFuc@ad_ch),w
	xorwf	(AD_baseWriteFuc@ad_vh),w
	skipnz
	goto	u2601
	goto	u2600
u2601:
	goto	l1457
u2600:
	line	1662
	
l3824:	
;main.c: 1661: {
;main.c: 1662: EEPROMwrite(0x12, ad_vh);
	movf	(AD_baseWriteFuc@ad_vh),w
	movwf	(EEPROMwrite@Data)
	movlw	low(012h)
	fcall	_EEPROMwrite
	line	1663
;main.c: 1663: EEPROMwrite(0x13, ad_vl);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(AD_baseWriteFuc@ad_vl),w
	movwf	(EEPROMwrite@Data)
	movlw	low(013h)
	fcall	_EEPROMwrite
	line	1666
	
l1457:	
	return
	opt stack 0
GLOBAL	__end_of_AD_baseWriteFuc
	__end_of_AD_baseWriteFuc:
	signat	_AD_baseWriteFuc,4217
	global	_Sola_checkFuc

;; *************** function _Sola_checkFuc *****************
;; Defined at:
;;		line 1231 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ad_total       20   11[BANK0 ] unsigned int [10]
;;  ad_v            2   34[BANK0 ] unsigned int 
;;  ad_sum          2   32[BANK0 ] unsigned int 
;;  i               1   37[BANK0 ] unsigned char 
;;  j               1   36[BANK0 ] unsigned char 
;;  z               1   31[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      27       0
;;      Temps:          0       4       0
;;      Totals:         0      31       0
;;Total ram usage:       31 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_GET_ADC_DATA
;;		___lwdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	line	1231
global __ptext9
__ptext9:	;psect for function _Sola_checkFuc
psect	text9
	file	"main.c"
	line	1231
	global	__size_of_Sola_checkFuc
	__size_of_Sola_checkFuc	equ	__end_of_Sola_checkFuc-_Sola_checkFuc
	
_Sola_checkFuc:	
;incstack = 0
	opt	stack 5
; Regs used in _Sola_checkFuc: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1243
	
l4206:	
;main.c: 1238: unsigned char i,j,z;
;main.c: 1239: unsigned int ad_v,ad_total[10],ad_sum;
;main.c: 1240: static unsigned int ad_vpre = 0;
;main.c: 1243: for(z = 10;z--;)
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Sola_checkFuc@z)
	goto	l4250
	line	1245
	
l4208:	
;main.c: 1244: {
;main.c: 1245: ad_sum = 0;
	clrf	(Sola_checkFuc@ad_sum)
	clrf	(Sola_checkFuc@ad_sum+1)
	line	1246
;main.c: 1246: for(i = 0;i < 10;i++)
	clrf	(Sola_checkFuc@i)
	line	1248
	
l4214:	
;main.c: 1247: {
;main.c: 1248: ad_total[i] = GET_ADC_DATA (0);
	movlw	low(0)
	fcall	_GET_ADC_DATA
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(Sola_checkFuc@i),w
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(0+(?_GET_ADC_DATA)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_GET_ADC_DATA)),w
	movwf	indf
	line	1249
	
l4216:	
;main.c: 1249: ad_sum += ad_total[i];
	clrc
	rlf	(Sola_checkFuc@i),w
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Sola_checkFuc+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Sola_checkFuc+0)+0+1
	movf	0+(??_Sola_checkFuc+0)+0,w
	addwf	(Sola_checkFuc@ad_sum),f
	skipnc
	incf	(Sola_checkFuc@ad_sum+1),f
	movf	1+(??_Sola_checkFuc+0)+0,w
	addwf	(Sola_checkFuc@ad_sum+1),f
	line	1246
	
l4218:	
	incf	(Sola_checkFuc@i),f
	
l4220:	
	movlw	low(0Ah)
	subwf	(Sola_checkFuc@i),w
	skipc
	goto	u3301
	goto	u3300
u3301:
	goto	l4214
u3300:
	
l1354:	
	line	1251
;main.c: 1250: }
;main.c: 1251: for(i = 1;i < 10;i++)
	clrf	(Sola_checkFuc@i)
	incf	(Sola_checkFuc@i),f
	line	1253
	
l4226:	
;main.c: 1252: {
;main.c: 1253: for(j=0;j<10-i;j++)
	clrf	(Sola_checkFuc@j)
	goto	l4234
	line	1255
	
l4228:	
;main.c: 1254: {
;main.c: 1255: if(ad_total[j]> ad_total[j+1])
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(Sola_checkFuc@j),w
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Sola_checkFuc+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Sola_checkFuc+0)+0+1
	clrc
	rlf	(Sola_checkFuc@j),w
	addlw	02h
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Sola_checkFuc+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Sola_checkFuc+2)+0+1
	movf	1+(??_Sola_checkFuc+0)+0,w
	subwf	1+(??_Sola_checkFuc+2)+0,w
	skipz
	goto	u3315
	movf	0+(??_Sola_checkFuc+0)+0,w
	subwf	0+(??_Sola_checkFuc+2)+0,w
u3315:
	skipnc
	goto	u3311
	goto	u3310
u3311:
	goto	l1359
u3310:
	line	1257
	
l4230:	
;main.c: 1256: {
;main.c: 1257: ad_v = ad_total[j];
	clrc
	rlf	(Sola_checkFuc@j),w
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Sola_checkFuc@ad_v)
	incf	fsr0,f
	movf	indf,w
	movwf	(Sola_checkFuc@ad_v+1)
	line	1258
;main.c: 1258: ad_total[j]=ad_total[j+1];
	clrc
	rlf	(Sola_checkFuc@j),w
	addlw	02h
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Sola_checkFuc+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Sola_checkFuc+0)+0+1
	clrc
	rlf	(Sola_checkFuc@j),w
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	0+(??_Sola_checkFuc+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_Sola_checkFuc+0)+0,w
	movwf	indf
	line	1259
;main.c: 1259: ad_total[j+1] = ad_v;
	clrc
	rlf	(Sola_checkFuc@j),w
	addlw	02h
	addlw	low(Sola_checkFuc@ad_total|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(Sola_checkFuc@ad_v),w
	movwf	indf
	incf	fsr0,f
	movf	(Sola_checkFuc@ad_v+1),w
	movwf	indf
	line	1260
	
l1359:	
	line	1261
# 1261 "main.c"
clrwdt ;# 
psect	text9
	line	1253
	
l4232:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Sola_checkFuc@j),f
	
l4234:	
	movlw	0
	movwf	(??_Sola_checkFuc+0)+0+1
	movf	(Sola_checkFuc@i),w
	sublw	0Ah
	movwf	(??_Sola_checkFuc+0)+0
	skipc
	decf	(??_Sola_checkFuc+0)+0+1,f
	movf	1+(??_Sola_checkFuc+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u3325
	movf	0+(??_Sola_checkFuc+0)+0,w
	subwf	(Sola_checkFuc@j),w
u3325:

	skipc
	goto	u3321
	goto	u3320
u3321:
	goto	l4228
u3320:
	
l1360:	
	line	1263
# 1263 "main.c"
clrwdt ;# 
psect	text9
	line	1251
	
l4236:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Sola_checkFuc@i),f
	
l4238:	
	movlw	low(0Ah)
	subwf	(Sola_checkFuc@i),w
	skipc
	goto	u3331
	goto	u3330
u3331:
	goto	l4226
u3330:
	line	1267
	
l4240:	
;main.c: 1264: }
;main.c: 1267: ad_sum = ad_sum - ad_total[0] - ad_total[9];
	movf	(Sola_checkFuc@ad_total),w
	addwf	0+(Sola_checkFuc@ad_total)+012h,w
	movwf	(??_Sola_checkFuc+0)+0
	movf	(Sola_checkFuc@ad_total+1),w
	skipnc
	incf	(Sola_checkFuc@ad_total+1),w
	addwf	1+(Sola_checkFuc@ad_total)+012h,w
	movwf	1+(??_Sola_checkFuc+0)+0
	comf	(??_Sola_checkFuc+0)+0,f
	comf	(??_Sola_checkFuc+0)+1,f
	incf	(??_Sola_checkFuc+0)+0,f
	skipnz
	incf	(??_Sola_checkFuc+0)+1,f
	movf	0+(??_Sola_checkFuc+0)+0,w
	addwf	(Sola_checkFuc@ad_sum),f
	skipnc
	incf	(Sola_checkFuc@ad_sum+1),f
	movf	1+(??_Sola_checkFuc+0)+0,w
	addwf	(Sola_checkFuc@ad_sum+1),f
	line	1268
	
l4242:	
;main.c: 1268: ad_sum >>= 3;
	clrc
	rrf	(Sola_checkFuc@ad_sum+1),f
	rrf	(Sola_checkFuc@ad_sum),f
	clrc
	rrf	(Sola_checkFuc@ad_sum+1),f
	rrf	(Sola_checkFuc@ad_sum),f
	clrc
	rrf	(Sola_checkFuc@ad_sum+1),f
	rrf	(Sola_checkFuc@ad_sum),f
	line	1273
;main.c: 1273: ad_v = 2 * ad_sum + (10 - 2)*ad_vpre;
	movf	(Sola_checkFuc@ad_sum+1),w
	movwf	(Sola_checkFuc@ad_v+1)
	movf	(Sola_checkFuc@ad_sum),w
	movwf	(Sola_checkFuc@ad_v)
	
l4244:	
	clrc
	rlf	(Sola_checkFuc@ad_v),f
	rlf	(Sola_checkFuc@ad_v+1),f
	movf	(Sola_checkFuc@ad_vpre+1),w
	movwf	(??_Sola_checkFuc+0)+0+1
	movf	(Sola_checkFuc@ad_vpre),w
	movwf	(??_Sola_checkFuc+0)+0
	clrc
	rlf	(??_Sola_checkFuc+0)+0,f
	rlf	(??_Sola_checkFuc+0)+1,f
	clrc
	rlf	(??_Sola_checkFuc+0)+0,f
	rlf	(??_Sola_checkFuc+0)+1,f
	clrc
	rlf	(??_Sola_checkFuc+0)+0,f
	rlf	(??_Sola_checkFuc+0)+1,f
	movf	0+(??_Sola_checkFuc+0)+0,w
	addwf	(Sola_checkFuc@ad_v),f
	skipnc
	incf	(Sola_checkFuc@ad_v+1),f
	movf	1+(??_Sola_checkFuc+0)+0,w
	addwf	(Sola_checkFuc@ad_v+1),f
	line	1274
	
l4246:	
;main.c: 1274: ad_v = ad_v/10;
	movlw	0Ah
	movwf	(___lwdiv@divisor)
	clrf	(___lwdiv@divisor+1)
	movf	(Sola_checkFuc@ad_v+1),w
	movwf	(___lwdiv@dividend+1)
	movf	(Sola_checkFuc@ad_v),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(Sola_checkFuc@ad_v+1)
	movf	(0+(?___lwdiv)),w
	movwf	(Sola_checkFuc@ad_v)
	line	1275
	
l4248:	
;main.c: 1275: ad_vpre = ad_v;
	movf	(Sola_checkFuc@ad_v+1),w
	movwf	(Sola_checkFuc@ad_vpre+1)
	movf	(Sola_checkFuc@ad_v),w
	movwf	(Sola_checkFuc@ad_vpre)
	line	1243
	
l4250:	
	decf	(Sola_checkFuc@z),f
		incf	(((Sola_checkFuc@z))),w
	btfss	status,2
	goto	u3341
	goto	u3340
u3341:
	goto	l4208
u3340:
	line	1280
	
l4252:	
;main.c: 1277: }
;main.c: 1280: if(g_adBaseValue == 0)return;
	movf	((_g_adBaseValue)),w	;volatile
iorwf	((_g_adBaseValue+1)),w	;volatile
	btfss	status,2
	goto	u3351
	goto	u3350
u3351:
	goto	l1362
u3350:
	goto	l1363
	
l1362:	
	line	1282
;main.c: 1282: if((g_gloCntTimer & 0x80) == 0x80)
	btfss	(_g_gloCntTimer),(7)&7	;volatile
	goto	u3361
	goto	u3360
u3361:
	goto	l1364
u3360:
	line	1284
	
l4256:	
;main.c: 1283: {
;main.c: 1284: if(ad_v <= g_adBaseValue)
	movf	(Sola_checkFuc@ad_v+1),w
	subwf	(_g_adBaseValue+1),w	;volatile
	skipz
	goto	u3375
	movf	(Sola_checkFuc@ad_v),w
	subwf	(_g_adBaseValue),w	;volatile
u3375:
	skipc
	goto	u3371
	goto	u3370
u3371:
	goto	l4260
u3370:
	line	1285
	
l4258:	
;main.c: 1285: g_gloEnvt_st = NORMAL_ENVT;
	movlw	low(01h)
	movwf	(_g_gloEnvt_st)	;volatile
	goto	l1364
	line	1288
	
l4260:	
;main.c: 1286: else
;main.c: 1287: {
;main.c: 1288: g_gloEnvt_st = BEYOND_ENVT;
	movlw	low(02h)
	movwf	(_g_gloEnvt_st)	;volatile
	line	1290
	
l1364:	
	line	1292
;main.c: 1289: }
;main.c: 1290: }
;main.c: 1292: g_gloCurValue = ad_v;
	movf	(Sola_checkFuc@ad_v+1),w
	movwf	(_g_gloCurValue+1)	;volatile
	movf	(Sola_checkFuc@ad_v),w
	movwf	(_g_gloCurValue)	;volatile
	line	1294
	
l1363:	
	return
	opt stack 0
GLOBAL	__end_of_Sola_checkFuc
	__end_of_Sola_checkFuc:
	signat	_Sola_checkFuc,89
	global	_GET_ADC_DATA

;; *************** function _GET_ADC_DATA *****************
;; Defined at:
;;		line 535 in file "main.c"
;; Parameters:    Size  Location     Type
;;  AN_CH           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  AN_CH           1    8[COMMON] unsigned char 
;;  ADC_DATA        2    6[COMMON] unsigned int 
;;  AD_chBuff       1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Sola_checkFuc
;;		_Solar_BaseDefine
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	535
global __ptext10
__ptext10:	;psect for function _GET_ADC_DATA
psect	text10
	file	"main.c"
	line	535
	global	__size_of_GET_ADC_DATA
	__size_of_GET_ADC_DATA	equ	__end_of_GET_ADC_DATA-_GET_ADC_DATA
	
_GET_ADC_DATA:	
;incstack = 0
	opt	stack 5
; Regs used in _GET_ADC_DATA: [wreg+status,2+status,0]
;GET_ADC_DATA@AN_CH stored from wreg
	movwf	(GET_ADC_DATA@AN_CH)
	line	538
	
l3764:	
	line	540
	
l3766:	
;main.c: 540: if(AN_CH != 0)
	movf	((GET_ADC_DATA@AN_CH)),w
	btfsc	status,2
	goto	u2571
	goto	u2570
u2571:
	goto	l1137
u2570:
	line	542
	
l3768:	
;main.c: 541: {
;main.c: 542: AD_chBuff = ADCON0 & 0B11100011;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(31),w	;volatile
	movwf	(GET_ADC_DATA@AD_chBuff)
	
l3770:	
	movlw	low(0E3h)
	andwf	(GET_ADC_DATA@AD_chBuff),f
	line	544
	
l3772:	
;main.c: 544: AN_CH <<= 2;
	clrc
	rlf	(GET_ADC_DATA@AN_CH),f
	clrc
	rlf	(GET_ADC_DATA@AN_CH),f
	line	545
	
l3774:	
;main.c: 545: AD_chBuff |= AN_CH;
	movf	(GET_ADC_DATA@AN_CH),w
	iorwf	(GET_ADC_DATA@AD_chBuff),f
	line	547
;main.c: 547: ADCON0 = AD_chBuff;
	movf	(GET_ADC_DATA@AD_chBuff),w
	movwf	(31)	;volatile
	line	548
	
l1137:	
	line	549
# 549 "main.c"
clrwdt ;# 
psect	text10
	line	551
	
l3776:	
;main.c: 551: GO_DONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7	;volatile
	line	552
;main.c: 552: while( GO_DONE==1 );
	
l1138:	
	btfsc	(249/8),(249)&7	;volatile
	goto	u2581
	goto	u2580
u2581:
	goto	l1138
u2580:
	line	557
	
l3778:	
;main.c: 557: ADC_DATA = ADRESH;
	movf	(30),w	;volatile
	movwf	(GET_ADC_DATA@ADC_DATA)
	clrf	(GET_ADC_DATA@ADC_DATA+1)
	line	558
;main.c: 558: ADC_DATA <<= 8;
	movf	(GET_ADC_DATA@ADC_DATA),w
	movwf	(GET_ADC_DATA@ADC_DATA+1)
	clrf	(GET_ADC_DATA@ADC_DATA)
	line	559
;main.c: 559: ADC_DATA |= ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	iorwf	(GET_ADC_DATA@ADC_DATA),f
	line	562
;main.c: 562: return ADC_DATA;
	movf	(GET_ADC_DATA@ADC_DATA+1),w
	movwf	(?_GET_ADC_DATA+1)
	movf	(GET_ADC_DATA@ADC_DATA),w
	movwf	(?_GET_ADC_DATA)
	line	563
	
l1141:	
	return
	opt stack 0
GLOBAL	__end_of_GET_ADC_DATA
	__end_of_GET_ADC_DATA:
	signat	_GET_ADC_DATA,4218
	global	_POWER_INITIAL

;; *************** function _POWER_INITIAL *****************
;; Defined at:
;;		line 468 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	468
global __ptext11
__ptext11:	;psect for function _POWER_INITIAL
psect	text11
	file	"main.c"
	line	468
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
;incstack = 0
	opt	stack 6
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	470
	
l3868:	
;main.c: 470: OSCCON = 0B01100001;
	movlw	low(061h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	472
	
l3870:	
;main.c: 472: INTCON = 0;
	clrf	(11)	;volatile
	line	473
	
l3872:	
;main.c: 473: TRISA = 0B10011101;
	movlw	low(09Dh)
	movwf	(133)^080h	;volatile
	line	474
;main.c: 474: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	476
	
l3874:	
;main.c: 476: TRISC = 0B00001011;
	movlw	low(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	481
	
l3876:	
;main.c: 481: PORTC = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	483
;main.c: 483: WPUA = 0B00011100;
	movlw	low(01Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(149)^080h	;volatile
	line	484
	
l3878:	
;main.c: 484: WPUC = 0;
	clrf	(136)^080h	;volatile
	line	485
	
l3880:	
;main.c: 485: WPUC1 = 1;
	bsf	(1089/8)^080h,(1089)&7	;volatile
	line	489
	
l3882:	
;main.c: 489: OPTION = 0B00001000;
	movlw	low(08h)
	movwf	(129)^080h	;volatile
	line	493
;main.c: 493: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	496
	
l3884:	
;main.c: 496: CMCON0 = 0B00000111;
	movlw	low(07h)
	movwf	(25)	;volatile
	line	499
	
l3886:	
;main.c: 499: g_checkStBits = 0;
	clrf	(_g_checkStBits)	;volatile
	line	500
	
l1131:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
	signat	_POWER_INITIAL,89
	global	_Mode_changeCheckFuc

;; *************** function _Mode_changeCheckFuc *****************
;; Defined at:
;;		line 769 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	line	769
global __ptext12
__ptext12:	;psect for function _Mode_changeCheckFuc
psect	text12
	file	"main.c"
	line	769
	global	__size_of_Mode_changeCheckFuc
	__size_of_Mode_changeCheckFuc	equ	__end_of_Mode_changeCheckFuc-_Mode_changeCheckFuc
	
_Mode_changeCheckFuc:	
;incstack = 0
	opt	stack 4
; Regs used in _Mode_changeCheckFuc: [wreg+status,2+status,0+pclath+cstack]
	line	772
;main.c: 772: do{TRISA |= 0B00011100;WPUA |= 0B00011100;}while(0);;
	
l1170:	
	
l3904:	
	movlw	low(01Ch)
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(133)^080h,f	;volatile
	movlw	low(01Ch)
	iorwf	(149)^080h,f	;volatile
	line	773
	
l3906:	
;main.c: 773: DelayMs(1);
	movlw	low(01h)
	fcall	_DelayMs
	line	775
	
l3908:	
;main.c: 775: if(!PA2 || !PA4 || !PA3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u2671
	goto	u2670
u2671:
	goto	l3914
u2670:
	
l3910:	
	btfss	(44/8),(44)&7	;volatile
	goto	u2681
	goto	u2680
u2681:
	goto	l3914
u2680:
	
l3912:	
	btfsc	(43/8),(43)&7	;volatile
	goto	u2691
	goto	u2690
u2691:
	goto	l3928
u2690:
	line	777
	
l3914:	
;main.c: 776: {
;main.c: 777: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	778
	
l3916:	
;main.c: 778: if(!PA2 || !PA4 || !PA3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u2701
	goto	u2700
u2701:
	goto	l1177
u2700:
	
l3918:	
	btfss	(44/8),(44)&7	;volatile
	goto	u2711
	goto	u2710
u2711:
	goto	l1177
u2710:
	
l3920:	
	btfsc	(43/8),(43)&7	;volatile
	goto	u2721
	goto	u2720
u2721:
	goto	l3936
u2720:
	
l1177:	
	line	781
;main.c: 779: {
;main.c: 781: if(!PA2)
	btfsc	(42/8),(42)&7	;volatile
	goto	u2731
	goto	u2730
u2731:
	goto	l1178
u2730:
	line	784
	
l3922:	
;main.c: 782: {
;main.c: 784: g_checkMode = OFF2HI_MODE;
	movlw	low(01h)
	movwf	(_g_checkMode)	;volatile
	line	785
;main.c: 785: }
	goto	l3936
	line	786
	
l1178:	
;main.c: 786: else if(!PA4)
	btfsc	(44/8),(44)&7	;volatile
	goto	u2741
	goto	u2740
u2741:
	goto	l1180
u2740:
	line	789
	
l3924:	
;main.c: 787: {
;main.c: 789: g_checkMode = GLO_MODE;
	movlw	low(03h)
	movwf	(_g_checkMode)	;volatile
	line	790
;main.c: 790: }
	goto	l3936
	line	791
	
l1180:	
;main.c: 791: else if(!PA3)
	btfsc	(43/8),(43)&7	;volatile
	goto	u2751
	goto	u2750
u2751:
	goto	l1175
u2750:
	line	794
	
l3926:	
;main.c: 792: {
;main.c: 794: g_checkMode = GLO2HI_MODE;
	movlw	low(02h)
	movwf	(_g_checkMode)	;volatile
	goto	l3936
	line	796
	
l1175:	
	line	798
;main.c: 795: }
;main.c: 796: }
;main.c: 798: }else
	goto	l3936
	line	799
	
l3928:	
;main.c: 799: if((PORTA & 0B00011100) == 0B00011100)
	movlw	low(01Ch)
	andwf	(5),w	;volatile
	movwf	(??_Mode_changeCheckFuc+0)+0
		movlw	28
	xorwf	((??_Mode_changeCheckFuc+0)+0),w
	btfss	status,2
	goto	u2761
	goto	u2760
u2761:
	goto	l3936
u2760:
	line	801
	
l3930:	
;main.c: 800: {
;main.c: 801: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	802
	
l3932:	
;main.c: 802: if((PORTA & 0B00011100) == 0B00011100)
	movlw	low(01Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(5),w	;volatile
	movwf	(??_Mode_changeCheckFuc+0)+0
		movlw	28
	xorwf	((??_Mode_changeCheckFuc+0)+0),w
	btfss	status,2
	goto	u2771
	goto	u2770
u2771:
	goto	l1175
u2770:
	line	805
	
l3934:	
;main.c: 803: {
;main.c: 805: g_checkMode = OFF_MODE;
	clrf	(_g_checkMode)	;volatile
	line	809
	
l3936:	
	movlw	low(0E3h)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(133)^080h,f	;volatile
	
l3938:	
	movlw	low(0E3h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(5),f	;volatile
	line	811
	
l1188:	
	return
	opt stack 0
GLOBAL	__end_of_Mode_changeCheckFuc
	__end_of_Mode_changeCheckFuc:
	signat	_Mode_changeCheckFuc,89
	global	_INT_INITIAL

;; *************** function _INT_INITIAL *****************
;; Defined at:
;;		line 591 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ReadAPin        1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=0
	line	591
global __ptext13
__ptext13:	;psect for function _INT_INITIAL
psect	text13
	file	"main.c"
	line	591
	global	__size_of_INT_INITIAL
	__size_of_INT_INITIAL	equ	__end_of_INT_INITIAL-_INT_INITIAL
	
_INT_INITIAL:	
;incstack = 0
	opt	stack 6
; Regs used in _INT_INITIAL: [wreg]
	line	597
	
l3894:	
;main.c: 593: unsigned char ReadAPin;
;main.c: 597: IOCA = 0B10011100;
	movlw	low(09Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	598
;main.c: 598: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	600
	
l3896:	
;main.c: 600: INTEDG =0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7	;volatile
	line	604
	
l3898:	
;main.c: 604: PAIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	605
	
l3900:	
;main.c: 605: PAIE = 1;
	bsf	(91/8),(91)&7	;volatile
	line	606
	
l3902:	
;main.c: 606: GIE =1;
	bsf	(95/8),(95)&7	;volatile
	line	607
	
l1147:	
	return
	opt stack 0
GLOBAL	__end_of_INT_INITIAL
	__end_of_INT_INITIAL:
	signat	_INT_INITIAL,89
	global	_GLO_cdsCheckFuc

;; *************** function _GLO_cdsCheckFuc *****************
;; Defined at:
;;		line 1307 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  m_adpre         1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lwdiv
;;		___wmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	line	1307
global __ptext14
__ptext14:	;psect for function _GLO_cdsCheckFuc
psect	text14
	file	"main.c"
	line	1307
	global	__size_of_GLO_cdsCheckFuc
	__size_of_GLO_cdsCheckFuc	equ	__end_of_GLO_cdsCheckFuc-_GLO_cdsCheckFuc
	
_GLO_cdsCheckFuc:	
;incstack = 0
	opt	stack 5
; Regs used in _GLO_cdsCheckFuc: [wreg+status,2+status,0+pclath+cstack]
	line	1314
	
l4262:	
;main.c: 1309: unsigned char m_adpre;
;main.c: 1310: static unsigned char av_check_lt = 0;
;main.c: 1311: static unsigned char av_check_dt = 0;
;main.c: 1314: if(g_gloCntTimer > 0x80)
	movlw	low(081h)
	subwf	(_g_gloCntTimer),w	;volatile
	skipc
	goto	u3381
	goto	u3380
u3381:
	goto	l1373
u3380:
	line	1316
	
l4264:	
;main.c: 1315: {
;main.c: 1316: g_gloCntTimer--;
	decf	(_g_gloCntTimer),f	;volatile
	line	1317
	
l4266:	
;main.c: 1317: if(g_gloCntTimer==0x80)
		movlw	128
	xorwf	((_g_gloCntTimer)),w	;volatile
	btfss	status,2
	goto	u3391
	goto	u3390
u3391:
	goto	l1373
u3390:
	line	1320
	
l4268:	
;main.c: 1318: {
;main.c: 1320: if(g_gloEnvt_st == NORMAL_ENVT)
		decf	((_g_gloEnvt_st)),w	;volatile
	btfss	status,2
	goto	u3401
	goto	u3400
u3401:
	goto	l4272
u3400:
	line	1321
	
l4270:	
;main.c: 1321: g_gloRecValue = g_adBaseValue + g_cdsCmp;
	movf	(_g_cdsCmp),w	;volatile
	movwf	(_g_gloRecValue)	;volatile
	clrf	(_g_gloRecValue+1)	;volatile
	movf	(_g_adBaseValue),w	;volatile
	addwf	(_g_gloRecValue),f	;volatile
	skipnc
	incf	(_g_gloRecValue+1),f	;volatile
	movf	(_g_adBaseValue+1),w	;volatile
	addwf	(_g_gloRecValue+1),f	;volatile
	goto	l1373
	line	1323
	
l4272:	
;main.c: 1322: else
;main.c: 1323: if(g_gloEnvt_st == BEYOND_ENVT)
		movlw	2
	xorwf	((_g_gloEnvt_st)),w	;volatile
	btfss	status,2
	goto	u3411
	goto	u3410
u3411:
	goto	l1373
u3410:
	line	1326
	
l4274:	
;main.c: 1324: {
;main.c: 1326: m_adpre = g_adBaseValue*100/g_gloCurValue;
	movf	(_g_gloCurValue+1),w	;volatile
	movwf	(___lwdiv@divisor+1)
	movf	(_g_gloCurValue),w	;volatile
	movwf	(___lwdiv@divisor)
	movf	(_g_adBaseValue+1),w	;volatile
	movwf	(___wmul@multiplier+1)
	movf	(_g_adBaseValue),w	;volatile
	movwf	(___wmul@multiplier)
	movlw	064h
	movwf	(___wmul@multiplicand)
	clrf	(___wmul@multiplicand+1)
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(___lwdiv@dividend+1)
	movf	(0+(?___wmul)),w
	movwf	(___lwdiv@dividend)
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	movwf	(GLO_cdsCheckFuc@m_adpre)
	line	1328
	
l4276:	
;main.c: 1328: if(m_adpre < 40)
	movlw	low(028h)
	subwf	(GLO_cdsCheckFuc@m_adpre),w
	skipnc
	goto	u3421
	goto	u3420
u3421:
	goto	l4280
u3420:
	goto	l4270
	line	1332
	
l4280:	
;main.c: 1330: else
;main.c: 1331: {
;main.c: 1332: g_gloRecValue = g_gloCurValue + g_cdsCmp;
	movf	(_g_cdsCmp),w	;volatile
	movwf	(_g_gloRecValue)	;volatile
	clrf	(_g_gloRecValue+1)	;volatile
	movf	(_g_gloCurValue),w	;volatile
	addwf	(_g_gloRecValue),f	;volatile
	skipnc
	incf	(_g_gloRecValue+1),f	;volatile
	movf	(_g_gloCurValue+1),w	;volatile
	addwf	(_g_gloRecValue+1),f	;volatile
	line	1338
	
l1373:	
	line	1341
;main.c: 1333: }
;main.c: 1334: }
;main.c: 1336: }
;main.c: 1338: }
;main.c: 1341: if( g_gloCurValue > g_gloRecValue)
	movf	(_g_gloCurValue+1),w	;volatile
	subwf	(_g_gloRecValue+1),w	;volatile
	skipz
	goto	u3435
	movf	(_g_gloCurValue),w	;volatile
	subwf	(_g_gloRecValue),w	;volatile
u3435:
	skipnc
	goto	u3431
	goto	u3430
u3431:
	goto	l4292
u3430:
	line	1343
	
l4282:	
;main.c: 1342: {
;main.c: 1343: av_check_lt++;
	incf	(GLO_cdsCheckFuc@av_check_lt),f
	line	1344
	
l4284:	
;main.c: 1344: av_check_dt= 0;
	clrf	(GLO_cdsCheckFuc@av_check_dt)
	line	1346
	
l4286:	
;main.c: 1346: if(av_check_lt > 1)
	movlw	low(02h)
	subwf	(GLO_cdsCheckFuc@av_check_lt),w
	skipc
	goto	u3441
	goto	u3440
u3441:
	goto	l1385
u3440:
	line	1348
	
l4288:	
;main.c: 1347: {
;main.c: 1348: av_check_lt = 0;
	clrf	(GLO_cdsCheckFuc@av_check_lt)
	line	1349
	
l4290:	
;main.c: 1349: ((g_checkStBits) &= ~(0B00000010));
	bcf	(_g_checkStBits)+(1/8),(1)&7	;volatile
	goto	l1385
	line	1353
	
l4292:	
;main.c: 1353: if( g_gloCurValue <= g_adBaseValue)
	movf	(_g_gloCurValue+1),w	;volatile
	subwf	(_g_adBaseValue+1),w	;volatile
	skipz
	goto	u3455
	movf	(_g_gloCurValue),w	;volatile
	subwf	(_g_adBaseValue),w	;volatile
u3455:
	skipc
	goto	u3451
	goto	u3450
u3451:
	goto	l1385
u3450:
	line	1355
	
l4294:	
;main.c: 1354: {
;main.c: 1355: av_check_dt++;
	incf	(GLO_cdsCheckFuc@av_check_dt),f
	line	1356
	
l4296:	
;main.c: 1356: av_check_lt = 0;
	clrf	(GLO_cdsCheckFuc@av_check_lt)
	line	1358
	
l4298:	
;main.c: 1358: if(av_check_dt > 1)
	movlw	low(02h)
	subwf	(GLO_cdsCheckFuc@av_check_dt),w
	skipc
	goto	u3461
	goto	u3460
u3461:
	goto	l1385
u3460:
	line	1360
	
l4300:	
;main.c: 1359: {
;main.c: 1360: av_check_dt = 0;
	clrf	(GLO_cdsCheckFuc@av_check_dt)
	line	1361
	
l4302:	
;main.c: 1361: ((g_checkStBits) |= (0B00000010));
	bsf	(_g_checkStBits)+(1/8),(1)&7	;volatile
	line	1366
	
l1385:	
	return
	opt stack 0
GLOBAL	__end_of_GLO_cdsCheckFuc
	__end_of_GLO_cdsCheckFuc:
	signat	_GLO_cdsCheckFuc,89
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "f:\doc\datesheet\mcu\pf\ide3.0.1_200917\data\sources\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    2[COMMON] unsigned int 
;;  multiplicand    2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 300/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GLO_cdsCheckFuc
;;		_main
;;		_Seg_Display
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=2
	file	"f:\doc\datesheet\mcu\pf\ide3.0.1_200917\data\sources\common\Umul16.c"
	line	15
global __ptext15
__ptext15:	;psect for function ___wmul
psect	text15
	file	"f:\doc\datesheet\mcu\pf\ide3.0.1_200917\data\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;incstack = 0
	opt	stack 6
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l3826:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	45
	
l3828:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l3832
u2610:
	line	46
	
l3830:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	47
	
l3832:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	48
	
l3834:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	49
	
l3836:	
	movf	((___wmul@multiplier)),w
iorwf	((___wmul@multiplier+1)),w
	btfss	status,2
	goto	u2621
	goto	u2620
u2621:
	goto	l3828
u2620:
	line	52
	
l3838:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	53
	
l1520:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 6 in file "f:\doc\datesheet\mcu\pf\ide3.0.1_200917\data\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[BANK0 ] unsigned int 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Sola_checkFuc
;;		_GLO_cdsCheckFuc
;;		_Solar_BaseDefine
;;		_main
;;		_Seg_Display
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=2
	file	"f:\doc\datesheet\mcu\pf\ide3.0.1_200917\data\sources\common\lwdiv.c"
	line	6
global __ptext16
__ptext16:	;psect for function ___lwdiv
psect	text16
	file	"f:\doc\datesheet\mcu\pf\ide3.0.1_200917\data\sources\common\lwdiv.c"
	line	6
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;incstack = 0
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	14
	
l3842:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	15
	
l3844:	
	movf	((___lwdiv@divisor)),w
iorwf	((___lwdiv@divisor+1)),w
	btfsc	status,2
	goto	u2631
	goto	u2630
u2631:
	goto	l3864
u2630:
	line	16
	
l3846:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	17
	goto	l3850
	line	18
	
l3848:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	19
	incf	(___lwdiv@counter),f
	line	17
	
l3850:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2641
	goto	u2640
u2641:
	goto	l3848
u2640:
	line	22
	
l3852:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	23
	
l3854:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2655
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2655:
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l3860
u2650:
	line	24
	
l3856:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	25
	
l3858:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	27
	
l3860:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	28
	
l3862:	
	decfsz	(___lwdiv@counter),f
	goto	u2661
	goto	u2660
u2661:
	goto	l3852
u2660:
	line	30
	
l3864:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	31
	
l1857:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_Event_checkFuc

;; *************** function _Event_checkFuc *****************
;; Defined at:
;;		line 822 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DelayMs
;;		_TIMER1_INTSTART
;;		_TIMER1_INTSTOP
;;		_eventEnterOFF
;;		_eventExitOFF
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	822
global __ptext17
__ptext17:	;psect for function _Event_checkFuc
psect	text17
	file	"main.c"
	line	822
	global	__size_of_Event_checkFuc
	__size_of_Event_checkFuc	equ	__end_of_Event_checkFuc-_Event_checkFuc
	
_Event_checkFuc:	
;incstack = 0
	opt	stack 4
; Regs used in _Event_checkFuc: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	827
	
l3940:	
;main.c: 827: if((g_checkMode != OFF_MODE) && (g_event_t == OFF_MODE))
	movf	((_g_checkMode)),w	;volatile
	btfsc	status,2
	goto	u2781
	goto	u2780
u2781:
	goto	l4154
u2780:
	
l3942:	
	movf	((_g_event_t)),w	;volatile
	btfss	status,2
	goto	u2791
	goto	u2790
u2791:
	goto	l4154
u2790:
	line	828
	
l3944:	
;main.c: 828: eventExitOFF();
	fcall	_eventExitOFF
	goto	l4154
	line	846
;main.c: 846: do{TRISC3 = 0;PC3=0;}while(0);;
	
l1194:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	847
	
l3946:	
;main.c: 847: g_event_t = OFF_MODE;
	clrf	(_g_event_t)	;volatile
	line	850
	
l3948:	
;main.c: 850: PC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	851
	
l3950:	
	btfss	(46/8),(46)&7	;volatile
	goto	u2801
	goto	u2800
u2801:
	goto	l3956
u2800:
	
l3952:	
	bcf	(46/8),(46)&7	;volatile
	
l3954:	
	clrf	(_g_gloCntTimer)	;volatile
	line	852
	
l3956:	
;main.c: 852: eventEnterOFF();
	fcall	_eventEnterOFF
	line	853
;main.c: 853: break;
	goto	l1312
	line	855
;main.c: 855: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
	
l1203:	
	btfss	(46/8),(46)&7	;volatile
	goto	u2811
	goto	u2810
u2811:
	goto	l3962
u2810:
	
l3958:	
	bcf	(46/8),(46)&7	;volatile
	
l3960:	
	clrf	(_g_gloCntTimer)	;volatile
	line	857
	
l3962:	
;main.c: 857: g_event_t = OFF2HI_MODE;
	movlw	low(01h)
	movwf	(_g_event_t)	;volatile
	line	858
	
l3964:	
;main.c: 858: if(((g_checkStBits) & (0B00000010)))
	btfss	(_g_checkStBits),(1)&7	;volatile
	goto	u2821
	goto	u2820
u2821:
	goto	l1312
u2820:
	line	860
	
l3966:	
;main.c: 859: {
;main.c: 860: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1083/8)^080h,(1083)&7	;volatile
	line	861
;main.c: 861: if(PA7)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(47/8),(47)&7	;volatile
	goto	u2831
	goto	u2830
u2831:
	goto	l1312
u2830:
	line	863
	
l3968:	
;main.c: 862: {
;main.c: 863: PC5 = 1;
	bsf	(61/8),(61)&7	;volatile
	line	866
	
l3970:	
;main.c: 866: g_ledkeep = 9000;
	movlw	028h
	movwf	(_g_ledkeep)	;volatile
	movlw	023h
	movwf	((_g_ledkeep))+1	;volatile
	line	867
	
l3972:	
;main.c: 867: TIMER1_INTSTART();
	fcall	_TIMER1_INTSTART
	line	868
	
l3974:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1066/8)^080h,(1066)&7	;volatile
	
l3976:	
	bsf	(1194/8)^080h,(1194)&7	;volatile
	line	869
;main.c: 869: while(1)
	
l1212:	
	line	871
# 871 "main.c"
clrwdt ;# 
psect	text17
	line	872
	
l3978:	
;main.c: 872: DelayMs(2);
	movlw	low(02h)
	fcall	_DelayMs
	line	873
	
l3980:	
;main.c: 873: if(PA7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(47/8),(47)&7	;volatile
	goto	u2841
	goto	u2840
u2841:
	goto	l3986
u2840:
	line	875
	
l3982:	
;main.c: 874: {
;main.c: 875: if(g_ledkeep < (9000-1000))
	movlw	01Fh
	subwf	(_g_ledkeep+1),w	;volatile
	movlw	040h
	skipnz
	subwf	(_g_ledkeep),w	;volatile
	skipnc
	goto	u2851
	goto	u2850
u2851:
	goto	l3986
u2850:
	line	876
	
l3984:	
;main.c: 876: g_ledkeep = 9000;
	movlw	028h
	movwf	(_g_ledkeep)	;volatile
	movlw	023h
	movwf	((_g_ledkeep))+1	;volatile
	line	878
	
l3986:	
;main.c: 877: }
;main.c: 878: if(g_ledkeep == 0)
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l1215
u2860:
	goto	l3996
	line	879
	
l1215:	
	line	880
;main.c: 880: if(PA2)
	btfss	(42/8),(42)&7	;volatile
	goto	u2871
	goto	u2870
u2871:
	goto	l1212
u2870:
	line	882
	
l3990:	
;main.c: 881: {
;main.c: 882: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	883
	
l3992:	
;main.c: 883: if(PA2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u2881
	goto	u2880
u2881:
	goto	l1212
u2880:
	line	888
	
l3996:	
;main.c: 885: }
;main.c: 886: }
;main.c: 888: if(g_ledkeep == 0)
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u2891
	goto	u2890
u2891:
	goto	l1220
u2890:
	line	890
	
l3998:	
;main.c: 889: {
;main.c: 890: g_ledkeep = 1000;
	movlw	0E8h
	movwf	(_g_ledkeep)	;volatile
	movlw	03h
	movwf	((_g_ledkeep))+1	;volatile
	line	891
	
l4000:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	
l4002:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	892
;main.c: 892: while(1)
	
l1223:	
	line	894
# 894 "main.c"
clrwdt ;# 
psect	text17
	line	895
	
l4004:	
;main.c: 895: DelayMs(2);
	movlw	low(02h)
	fcall	_DelayMs
	line	896
	
l4006:	
;main.c: 896: if(g_ledkeep == 0)break;
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u2901
	goto	u2900
u2901:
	goto	l1224
u2900:
	goto	l1225
	
l1224:	
	line	897
;main.c: 897: if(PA2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u2911
	goto	u2910
u2911:
	goto	l1223
u2910:
	line	899
	
l4010:	
;main.c: 898: {
;main.c: 899: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	900
	
l4012:	
;main.c: 900: if(PA2)break;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u2921
	goto	u2920
u2921:
	goto	l1223
u2920:
	line	892
	
l1225:	
	line	903
;main.c: 901: }
;main.c: 902: }
;main.c: 903: PC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7	;volatile
	line	905
	
l4016:	
;main.c: 905: g_ledkeep = 700;
	movlw	0BCh
	movwf	(_g_ledkeep)	;volatile
	movlw	02h
	movwf	((_g_ledkeep))+1	;volatile
	line	906
;main.c: 906: while(1)
	
l1229:	
	line	908
# 908 "main.c"
clrwdt ;# 
psect	text17
	line	909
	
l4018:	
;main.c: 909: DelayMs(2);
	movlw	low(02h)
	fcall	_DelayMs
	line	910
	
l4020:	
;main.c: 910: if(g_ledkeep == 0)break;
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u2931
	goto	u2930
u2931:
	goto	l1230
u2930:
	goto	l1231
	
l1230:	
	line	911
;main.c: 911: if(PA2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u2941
	goto	u2940
u2941:
	goto	l1229
u2940:
	line	913
	
l4024:	
;main.c: 912: {
;main.c: 913: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	914
	
l4026:	
;main.c: 914: if(PA2)break;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u2951
	goto	u2950
u2951:
	goto	l1229
u2950:
	line	906
	
l1231:	
	line	918
;main.c: 915: }
;main.c: 916: }
;main.c: 918: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7	;volatile
	line	919
;main.c: 919: }
	goto	l1236
	line	920
	
l1220:	
	line	923
;main.c: 920: else
;main.c: 921: {
;main.c: 923: PC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	926
;main.c: 924: }
;main.c: 926: do{TRISA2=0;PA2=0;}while(0);;
	
l1236:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1066/8)^080h,(1066)&7	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7	;volatile
	line	927
	
l4030:	
;main.c: 927: TIMER1_INTSTOP();
	fcall	_TIMER1_INTSTOP
	goto	l1312
	line	933
;main.c: 933: case GLO2HI_MODE:
	
l1238:	
	line	935
;main.c: 935: PC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	936
	
l4032:	
;main.c: 936: g_event_t = GLO2HI_MODE;
	movlw	low(02h)
	movwf	(_g_event_t)	;volatile
	line	937
	
l4034:	
;main.c: 937: if(((g_checkStBits) & (0B00000010)))
	btfss	(_g_checkStBits),(1)&7	;volatile
	goto	u2961
	goto	u2960
u2961:
	goto	l1291
u2960:
	line	939
	
l4036:	
;main.c: 938: {
;main.c: 939: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1083/8)^080h,(1083)&7	;volatile
	line	940
;main.c: 940: if(PA7)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(47/8),(47)&7	;volatile
	goto	u2971
	goto	u2970
u2971:
	goto	l1285
u2970:
	line	942
;main.c: 941: {
;main.c: 942: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
	
l1241:	
	btfss	(46/8),(46)&7	;volatile
	goto	u2981
	goto	u2980
u2981:
	goto	l4042
u2980:
	
l4038:	
	bcf	(46/8),(46)&7	;volatile
	
l4040:	
	clrf	(_g_gloCntTimer)	;volatile
	line	943
	
l4042:	
;main.c: 943: PC5 = 1;
	bsf	(61/8),(61)&7	;volatile
	line	944
	
l4044:	
;main.c: 944: g_ledkeep = 9000;
	movlw	028h
	movwf	(_g_ledkeep)	;volatile
	movlw	023h
	movwf	((_g_ledkeep))+1	;volatile
	line	945
	
l4046:	
;main.c: 945: TIMER1_INTSTART();
	fcall	_TIMER1_INTSTART
	line	946
	
l4048:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1067/8)^080h,(1067)&7	;volatile
	
l4050:	
	bsf	(1195/8)^080h,(1195)&7	;volatile
	line	947
;main.c: 947: while(1)
	
l1248:	
	line	949
# 949 "main.c"
clrwdt ;# 
psect	text17
	line	950
	
l4052:	
;main.c: 950: DelayMs(2);
	movlw	low(02h)
	fcall	_DelayMs
	line	951
	
l4054:	
;main.c: 951: if(PA7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(47/8),(47)&7	;volatile
	goto	u2991
	goto	u2990
u2991:
	goto	l4060
u2990:
	line	953
	
l4056:	
;main.c: 952: {
;main.c: 953: if(g_ledkeep < (9000-1000))
	movlw	01Fh
	subwf	(_g_ledkeep+1),w	;volatile
	movlw	040h
	skipnz
	subwf	(_g_ledkeep),w	;volatile
	skipnc
	goto	u3001
	goto	u3000
u3001:
	goto	l4060
u3000:
	line	954
	
l4058:	
;main.c: 954: g_ledkeep = 9000;
	movlw	028h
	movwf	(_g_ledkeep)	;volatile
	movlw	023h
	movwf	((_g_ledkeep))+1	;volatile
	line	956
	
l4060:	
;main.c: 955: }
;main.c: 956: if(g_ledkeep == 0)
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u3011
	goto	u3010
u3011:
	goto	l1251
u3010:
	goto	l4070
	line	957
	
l1251:	
	line	958
;main.c: 958: if(PA3)
	btfss	(43/8),(43)&7	;volatile
	goto	u3021
	goto	u3020
u3021:
	goto	l1248
u3020:
	line	960
	
l4064:	
;main.c: 959: {
;main.c: 960: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	961
	
l4066:	
;main.c: 961: if(PA3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(43/8),(43)&7	;volatile
	goto	u3031
	goto	u3030
u3031:
	goto	l1248
u3030:
	line	967
	
l4070:	
;main.c: 963: }
;main.c: 964: }
;main.c: 967: if(g_ledkeep == 0)
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u3041
	goto	u3040
u3041:
	goto	l1256
u3040:
	line	969
	
l4072:	
;main.c: 968: {
;main.c: 969: g_ledkeep = 1000;
	movlw	0E8h
	movwf	(_g_ledkeep)	;volatile
	movlw	03h
	movwf	((_g_ledkeep))+1	;volatile
	line	970
	
l4074:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	
l4076:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	971
;main.c: 971: while(1)
	
l1259:	
	line	973
# 973 "main.c"
clrwdt ;# 
psect	text17
	line	974
	
l4078:	
;main.c: 974: DelayMs(2);
	movlw	low(02h)
	fcall	_DelayMs
	line	975
	
l4080:	
;main.c: 975: if(g_ledkeep == 0)break;
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u3051
	goto	u3050
u3051:
	goto	l1260
u3050:
	goto	l1261
	
l1260:	
	line	976
;main.c: 976: if(PA2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u3061
	goto	u3060
u3061:
	goto	l1259
u3060:
	line	978
	
l4084:	
;main.c: 977: {
;main.c: 978: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	979
	
l4086:	
;main.c: 979: if(PA2)break;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(42/8),(42)&7	;volatile
	goto	u3071
	goto	u3070
u3071:
	goto	l1259
u3070:
	line	971
	
l1261:	
	line	982
;main.c: 980: }
;main.c: 981: }
;main.c: 982: PC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7	;volatile
	line	983
;main.c: 983: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while(0);;} }while(0);;
	
l1265:	
	btfsc	(46/8),(46)&7	;volatile
	goto	u3081
	goto	u3080
u3081:
	goto	l4096
u3080:
	
l4090:	
	bsf	(46/8),(46)&7	;volatile
	
l4092:	
	clrf	(_g_gloCntTimer)	;volatile
	
l4094:	
	movlw	low(082h)
	iorwf	(_g_gloCntTimer),f	;volatile
	line	986
	
l4096:	
;main.c: 986: g_ledkeep = 700;
	movlw	0BCh
	movwf	(_g_ledkeep)	;volatile
	movlw	02h
	movwf	((_g_ledkeep))+1	;volatile
	line	987
;main.c: 987: while(1)
	
l1270:	
	line	989
# 989 "main.c"
clrwdt ;# 
psect	text17
	line	990
	
l4098:	
;main.c: 990: DelayMs(2);
	movlw	low(02h)
	fcall	_DelayMs
	line	991
	
l4100:	
;main.c: 991: if(g_ledkeep == 0)break;
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfss	status,2
	goto	u3091
	goto	u3090
u3091:
	goto	l1271
u3090:
	goto	l1272
	
l1271:	
	line	992
;main.c: 992: if(PA3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(43/8),(43)&7	;volatile
	goto	u3101
	goto	u3100
u3101:
	goto	l1270
u3100:
	line	994
	
l4104:	
;main.c: 993: {
;main.c: 994: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	995
	
l4106:	
;main.c: 995: if(PA3)break;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(43/8),(43)&7	;volatile
	goto	u3111
	goto	u3110
u3111:
	goto	l1270
u3110:
	line	987
	
l1272:	
	line	998
;main.c: 996: }
;main.c: 997: }
;main.c: 998: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7	;volatile
	line	999
;main.c: 999: }
	goto	l4116
	line	1000
	
l1256:	
	line	1001
;main.c: 1000: else{
;main.c: 1001: PC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	1002
;main.c: 1002: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while(0);;} }while(0);;
	
l1277:	
	btfsc	(46/8),(46)&7	;volatile
	goto	u3121
	goto	u3120
u3121:
	goto	l4116
u3120:
	
l4110:	
	bsf	(46/8),(46)&7	;volatile
	
l4112:	
	clrf	(_g_gloCntTimer)	;volatile
	
l4114:	
	movlw	low(082h)
	iorwf	(_g_gloCntTimer),f	;volatile
	line	1005
	
l4116:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1067/8)^080h,(1067)&7	;volatile
	
l4118:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(43/8),(43)&7	;volatile
	goto	l4030
	line	1010
;main.c: 1009: {
;main.c: 1010: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while(0);;} }while(0);;
	
l1285:	
	btfsc	(46/8),(46)&7	;volatile
	goto	u3131
	goto	u3130
u3131:
	goto	l1312
u3130:
	
l4122:	
	bsf	(46/8),(46)&7	;volatile
	
l4124:	
	clrf	(_g_gloCntTimer)	;volatile
	
l4126:	
	movlw	low(082h)
	iorwf	(_g_gloCntTimer),f	;volatile
	goto	l1312
	line	1014
;main.c: 1013: {
;main.c: 1014: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
	
l1291:	
	btfss	(46/8),(46)&7	;volatile
	goto	u3141
	goto	u3140
u3141:
	goto	l1312
u3140:
	
l4128:	
	bcf	(46/8),(46)&7	;volatile
	
l4130:	
	clrf	(_g_gloCntTimer)	;volatile
	goto	l1312
	line	1018
;main.c: 1018: case GLO_MODE:
	
l1296:	
	line	1021
;main.c: 1021: PC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	1022
	
l4132:	
;main.c: 1022: g_event_t = GLO_MODE;
	movlw	low(03h)
	movwf	(_g_event_t)	;volatile
	line	1023
	
l4134:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1083/8)^080h,(1083)&7	;volatile
	
l4136:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7	;volatile
	line	1024
	
l4138:	
;main.c: 1024: if(((g_checkStBits) & (0B00000010)))
	btfss	(_g_checkStBits),(1)&7	;volatile
	goto	u3151
	goto	u3150
u3151:
	goto	l1306
u3150:
	line	1026
	
l4140:	
;main.c: 1025: {
;main.c: 1026: PC5 = 0;
	bcf	(61/8),(61)&7	;volatile
	line	1027
;main.c: 1027: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while(0);;} }while(0);;
	
l1300:	
	btfsc	(46/8),(46)&7	;volatile
	goto	u3161
	goto	u3160
u3161:
	goto	l1312
u3160:
	goto	l4122
	line	1030
;main.c: 1029: {
;main.c: 1030: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
	
l1306:	
	btfss	(46/8),(46)&7	;volatile
	goto	u3171
	goto	u3170
u3171:
	goto	l1312
u3170:
	goto	l4128
	line	830
	
l4154:	
	movf	(_g_checkMode),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           10     6 (fixed)
; simple_byte           13     7 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	4
	subwf	fsr,w
skipnc
goto l1312
movlw high(S4612)
movwf pclath
	movlw low(S4612)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4612:
	ljmp	l1194
	ljmp	l1203
	ljmp	l1238
	ljmp	l1296
psect	text17

	line	1038
	
l1312:	
	return
	opt stack 0
GLOBAL	__end_of_Event_checkFuc
	__end_of_Event_checkFuc:
	signat	_Event_checkFuc,89
	global	_eventExitOFF

;; *************** function _eventExitOFF *****************
;; Defined at:
;;		line 647 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ReadAPin        1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_WDT_INITIAL
;; This function is called by:
;;		_Event_checkFuc
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	line	647
global __ptext18
__ptext18:	;psect for function _eventExitOFF
psect	text18
	file	"main.c"
	line	647
	global	__size_of_eventExitOFF
	__size_of_eventExitOFF	equ	__end_of_eventExitOFF-_eventExitOFF
	
_eventExitOFF:	
;incstack = 0
	opt	stack 4
; Regs used in _eventExitOFF: [wreg+status,2+status,0+pclath+cstack]
	line	651
	
l3796:	
;main.c: 649: unsigned char ReadAPin;
;main.c: 651: WDT_INITIAL();
	fcall	_WDT_INITIAL
	line	652
	
l3798:	
;main.c: 652: IOCA |= 0B10000000;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(150)^080h+(7/8),(7)&7	;volatile
	line	653
	
l3800:	
;main.c: 653: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	654
	
l3802:	
;main.c: 654: PAIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	656
	
l3804:	
;main.c: 656: INTF =0;
	bcf	(89/8),(89)&7	;volatile
	line	657
	
l3806:	
;main.c: 657: INTE =0;
	bcf	(92/8),(92)&7	;volatile
	line	658
	
l3808:	
	movlw	low(0E3h)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(133)^080h,f	;volatile
	
l3810:	
	movlw	low(0E3h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(5),f	;volatile
	line	660
	
l1157:	
	return
	opt stack 0
GLOBAL	__end_of_eventExitOFF
	__end_of_eventExitOFF:
	signat	_eventExitOFF,89
	global	_WDT_INITIAL

;; *************** function _WDT_INITIAL *****************
;; Defined at:
;;		line 573 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eventExitOFF
;;		_main
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	573
global __ptext19
__ptext19:	;psect for function _WDT_INITIAL
psect	text19
	file	"main.c"
	line	573
	global	__size_of_WDT_INITIAL
	__size_of_WDT_INITIAL	equ	__end_of_WDT_INITIAL-_WDT_INITIAL
	
_WDT_INITIAL:	
;incstack = 0
	opt	stack 6
; Regs used in _WDT_INITIAL: [wreg]
	line	576
	
l3706:	
# 576 "main.c"
clrwdt ;# 
psect	text19
	line	577
;main.c: 577: PSA = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1035/8)^080h,(1035)&7	;volatile
	line	578
	
l3708:	
;main.c: 578: WDTCON = 0B00010010;
	movlw	low(012h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	580
	
l3710:	
;main.c: 580: SWDTEN = 1;
	bsf	(192/8),(192)&7	;volatile
	line	581
	
l1144:	
	return
	opt stack 0
GLOBAL	__end_of_WDT_INITIAL
	__end_of_WDT_INITIAL:
	signat	_WDT_INITIAL,89
	global	_eventEnterOFF

;; *************** function _eventEnterOFF *****************
;; Defined at:
;;		line 618 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ReadAPin        1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Event_checkFuc
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	line	618
global __ptext20
__ptext20:	;psect for function _eventEnterOFF
psect	text20
	file	"main.c"
	line	618
	global	__size_of_eventEnterOFF
	__size_of_eventEnterOFF	equ	__end_of_eventEnterOFF-_eventEnterOFF
	
_eventEnterOFF:	
;incstack = 0
	opt	stack 5
; Regs used in _eventEnterOFF: [wreg+status,2+status,0]
	line	623
	
l3782:	
# 623 "main.c"
clrwdt ;# 
psect	text20
	line	624
;main.c: 624: SWDTEN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(192/8),(192)&7	;volatile
	line	626
;main.c: 626: IOCA &= 0B01111111;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(150)^080h+(7/8),(7)&7	;volatile
	line	628
	
l3784:	
;main.c: 628: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	629
	
l3786:	
;main.c: 629: PAIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	631
	
l3788:	
;main.c: 631: INTF =0;
	bcf	(89/8),(89)&7	;volatile
	line	632
	
l3790:	
;main.c: 632: INTE =1;
	bsf	(92/8),(92)&7	;volatile
	line	634
	
l3792:	
	movlw	low(01Ch)
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(133)^080h,f	;volatile
	
l3794:	
	movlw	low(01Ch)
	iorwf	(149)^080h,f	;volatile
	line	636
	
l1152:	
	return
	opt stack 0
GLOBAL	__end_of_eventEnterOFF
	__end_of_eventEnterOFF:
	signat	_eventEnterOFF,89
	global	_TIMER1_INTSTOP

;; *************** function _TIMER1_INTSTOP *****************
;; Defined at:
;;		line 453 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Event_checkFuc
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=0
	line	453
global __ptext21
__ptext21:	;psect for function _TIMER1_INTSTOP
psect	text21
	file	"main.c"
	line	453
	global	__size_of_TIMER1_INTSTOP
	__size_of_TIMER1_INTSTOP	equ	__end_of_TIMER1_INTSTOP-_TIMER1_INTSTOP
	
_TIMER1_INTSTOP:	
;incstack = 0
	opt	stack 5
; Regs used in _TIMER1_INTSTOP: []
	line	455
	
l3762:	
;main.c: 455: TMR1IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1120/8)^080h,(1120)&7	;volatile
	line	456
;main.c: 456: TMR1ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(128/8),(128)&7	;volatile
	line	457
;main.c: 457: PEIE=0;
	bcf	(94/8),(94)&7	;volatile
	line	458
	
l1128:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_INTSTOP
	__end_of_TIMER1_INTSTOP:
	signat	_TIMER1_INTSTOP,89
	global	_TIMER1_INTSTART

;; *************** function _TIMER1_INTSTART *****************
;; Defined at:
;;		line 429 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 300/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Event_checkFuc
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	line	429
global __ptext22
__ptext22:	;psect for function _TIMER1_INTSTART
psect	text22
	file	"main.c"
	line	429
	global	__size_of_TIMER1_INTSTART
	__size_of_TIMER1_INTSTART	equ	__end_of_TIMER1_INTSTART-_TIMER1_INTSTART
	
_TIMER1_INTSTART:	
;incstack = 0
	opt	stack 5
; Regs used in _TIMER1_INTSTART: [wreg+status,2]
	line	432
	
l3748:	
;main.c: 432: T1CON = 0B00000000;
	clrf	(16)	;volatile
	line	435
	
l3750:	
;main.c: 435: TMR1L = 0XC0;
	movlw	low(0C0h)
	movwf	(14)	;volatile
	line	437
	
l3752:	
;main.c: 437: TMR1H = 0XE0;
	movlw	low(0E0h)
	movwf	(15)	;volatile
	line	439
	
l3754:	
;main.c: 439: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7	;volatile
	line	440
	
l3756:	
;main.c: 440: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7	;volatile
	line	441
	
l3758:	
;main.c: 441: PEIE=1;
	bsf	(94/8),(94)&7	;volatile
	line	442
	
l3760:	
;main.c: 442: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	444
	
l1125:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_INTSTART
	__end_of_TIMER1_INTSTART:
	signat	_TIMER1_INTSTART,89
	global	_DelayMs

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 1457 in file "main.c"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    4[COMMON] unsigned char 
;;  b               1    6[COMMON] unsigned char 
;;  a               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_oneGLO
;;		_Charg_Disp
;;		_Mode_changeCheckFuc
;;		_Event_checkFuc
;;		_chrg_ModeCheck
;;		_Solar_BaseDefine
;;		_main
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	1457
global __ptext23
__ptext23:	;psect for function _DelayMs
psect	text23
	file	"main.c"
	line	1457
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
;incstack = 0
	opt	stack 4
; Regs used in _DelayMs: [wreg+status,2+status,0+pclath+cstack]
;DelayMs@Time stored from wreg
	movwf	(DelayMs@Time)
	line	1460
	
l3688:	
;main.c: 1459: unsigned char a,b;
;main.c: 1460: for(a=0;a<Time;a++)
	clrf	(DelayMs@a)
	goto	l3704
	line	1462
	
l3690:	
;main.c: 1461: {
;main.c: 1462: for(b=0;b<5;b++)
	clrf	(DelayMs@b)
	line	1464
	
l3696:	
;main.c: 1463: {
;main.c: 1464: DelayUs(98);
	movlw	low(062h)
	fcall	_DelayUs
	line	1462
	
l3698:	
	incf	(DelayMs@b),f
	
l3700:	
	movlw	low(05h)
	subwf	(DelayMs@b),w
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l3696
u2500:
	
l1413:	
	line	1466
# 1466 "main.c"
clrwdt ;# 
psect	text23
	line	1460
	
l3702:	
	incf	(DelayMs@a),f
	
l3704:	
	movf	(DelayMs@Time),w
	subwf	(DelayMs@a),w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l3690
u2510:
	
l1414:	
	line	1468
# 1468 "main.c"
clrwdt ;# 
psect	text23
	line	1469
	
l1415:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
	signat	_DelayMs,4217
	global	_DelayUs

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 1441 in file "main.c"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    2[COMMON] unsigned char 
;;  a               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DelayMs
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	line	1441
global __ptext24
__ptext24:	;psect for function _DelayUs
psect	text24
	file	"main.c"
	line	1441
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
;incstack = 0
	opt	stack 4
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	movwf	(DelayUs@Time)
	line	1444
	
l3682:	
;main.c: 1443: unsigned char a;
;main.c: 1444: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l3686
	line	1445
	
l1405:	
	line	1446
;main.c: 1445: {
;main.c: 1446: __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	1444
	
l3684:	
	incf	(DelayUs@a),f
	
l3686:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l1405
u2490:
	line	1450
	
l1407:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
	signat	_DelayUs,4217
	global	_EEPROM_Init

;; *************** function _EEPROM_Init *****************
;; Defined at:
;;		line 1550 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ep_t            1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 300/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_EEPROMread
;;		_EEPROMwrite
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	line	1550
global __ptext25
__ptext25:	;psect for function _EEPROM_Init
psect	text25
	file	"main.c"
	line	1550
	global	__size_of_EEPROM_Init
	__size_of_EEPROM_Init	equ	__end_of_EEPROM_Init-_EEPROM_Init
	
_EEPROM_Init:	
;incstack = 0
	opt	stack 5
; Regs used in _EEPROM_Init: [wreg+status,2+status,0+pclath+cstack]
	line	1554
	
l4358:	
;main.c: 1552: unsigned char ep_t;
;main.c: 1554: EEPROMwrite(0x03, 0xAA);
	movlw	low(0AAh)
	movwf	(EEPROMwrite@Data)
	movlw	low(03h)
	fcall	_EEPROMwrite
	line	1556
	
l4360:	
;main.c: 1556: ep_t = EEPROMread(0X03);
	movlw	low(03h)
	fcall	_EEPROMread
	movwf	(EEPROM_Init@ep_t)
	line	1558
	
l4362:	
;main.c: 1558: if(ep_t != 0xAA)
		movlw	170
	xorwf	((EEPROM_Init@ep_t)),w
	btfsc	status,2
	goto	u3521
	goto	u3520
u3521:
	goto	l1438
u3520:
	line	1560
	
l4364:	
;main.c: 1559: {
;main.c: 1560: EEPROMwrite(0x03, 0xAA);
	movlw	low(0AAh)
	movwf	(EEPROMwrite@Data)
	movlw	low(03h)
	fcall	_EEPROMwrite
	line	1561
	
l1438:	
	line	1564
;main.c: 1561: }
;main.c: 1564: EEPROMwrite(0x03, 0xAA);
	movlw	low(0AAh)
	movwf	(EEPROMwrite@Data)
	movlw	low(03h)
	fcall	_EEPROMwrite
	line	1566
	
l4366:	
;main.c: 1566: ep_t = EEPROMread(0X03);
	movlw	low(03h)
	fcall	_EEPROMread
	movwf	(EEPROM_Init@ep_t)
	line	1568
	
l4368:	
;main.c: 1568: if(ep_t != 0xAA)
		movlw	170
	xorwf	((EEPROM_Init@ep_t)),w
	btfsc	status,2
	goto	u3531
	goto	u3530
u3531:
	goto	l1440
u3530:
	line	1570
	
l4370:	
;main.c: 1569: {
;main.c: 1570: EEPROMwrite(0x03, 0xAA);
	movlw	low(0AAh)
	movwf	(EEPROMwrite@Data)
	movlw	low(03h)
	fcall	_EEPROMwrite
	line	1572
	
l1440:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_Init
	__end_of_EEPROM_Init:
	signat	_EEPROM_Init,89
	global	_EEPROMwrite

;; *************** function _EEPROMwrite *****************
;; Defined at:
;;		line 1517 in file "main.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;;  Data            1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    3[COMMON] unsigned char 
;;  gietag          1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_Init
;;		_Version_Write
;;		_AD_baseWriteFuc
;; This function uses a non-reentrant model
;;
psect	text26,local,class=CODE,delta=2,merge=1,group=0
	line	1517
global __ptext26
__ptext26:	;psect for function _EEPROMwrite
psect	text26
	file	"main.c"
	line	1517
	global	__size_of_EEPROMwrite
	__size_of_EEPROMwrite	equ	__end_of_EEPROMwrite-_EEPROMwrite
	
_EEPROMwrite:	
;incstack = 0
	opt	stack 5
; Regs used in _EEPROMwrite: [wreg+status,2+status,0]
;EEPROMwrite@EEAddr stored from wreg
	movwf	(EEPROMwrite@EEAddr)
	line	1521
	
l3712:	
;main.c: 1519: unsigned char gietag;
;main.c: 1521: gietag = GIE;
	movlw	0
	btfsc	(95/8),(95)&7	;volatile
	movlw	1
	movwf	(EEPROMwrite@gietag)
	line	1522
	
l3714:	
;main.c: 1522: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	1523
;main.c: 1523: while(GIE);
	
l1429:	
	btfsc	(95/8),(95)&7	;volatile
	goto	u2521
	goto	u2520
u2521:
	goto	l1429
u2520:
	line	1527
	
l3716:	
;main.c: 1527: EEADR = EEAddr;
	movf	(EEPROMwrite@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	1528
;main.c: 1528: EEDAT = Data;
	movf	(EEPROMwrite@Data),w
	movwf	(154)^080h	;volatile
	line	1529
	
l3718:	
;main.c: 1529: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7	;volatile
	line	1530
	
l3720:	
;main.c: 1530: EECON1 |= 0x34;
	movlw	low(034h)
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(156)^080h,f	;volsfr
	line	1531
	
l3722:	
;main.c: 1531: WR = 1;
	bsf	(1256/8)^080h,(1256)&7	;volsfr
	line	1532
;main.c: 1532: while(WR);
	
l1432:	
	btfsc	(1256/8)^080h,(1256)&7	;volsfr
	goto	u2531
	goto	u2530
u2531:
	goto	l1432
u2530:
	
l1434:	
	line	1536
;main.c: 1536: GIE = gietag;
	btfsc	(EEPROMwrite@gietag),0
	goto	u2541
	goto	u2540
	
u2541:
	bsf	(95/8),(95)&7	;volatile
	goto	u2554
u2540:
	bcf	(95/8),(95)&7	;volatile
u2554:
	line	1537
	
l1435:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROMwrite
	__end_of_EEPROMwrite:
	signat	_EEPROMwrite,8313
	global	_AD_baseGetFuc

;; *************** function _AD_baseGetFuc *****************
;; Defined at:
;;		line 1613 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ad_vh           1    7[COMMON] unsigned char 
;;  ad_vl           1    6[COMMON] unsigned char 
;;  ad_vh2          1    5[COMMON] unsigned char 
;;  ad_vl2          1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, pclath, cstack
;; Tracked objects:
;;		On entry : 200/0
;;		On exit  : 200/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_EEPROMread
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text27,local,class=CODE,delta=2,merge=1,group=0
	line	1613
global __ptext27
__ptext27:	;psect for function _AD_baseGetFuc
psect	text27
	file	"main.c"
	line	1613
	global	__size_of_AD_baseGetFuc
	__size_of_AD_baseGetFuc	equ	__end_of_AD_baseGetFuc-_AD_baseGetFuc
	
_AD_baseGetFuc:	
;incstack = 0
	opt	stack 5
; Regs used in _AD_baseGetFuc: [wreg+pclath+cstack]
	line	1617
	
l4384:	
;main.c: 1615: unsigned char ad_vl,ad_vh,ad_vl2,ad_vh2;
;main.c: 1617: ad_vh = EEPROMread(0x12);
	movlw	low(012h)
	fcall	_EEPROMread
	movwf	(AD_baseGetFuc@ad_vh)
	line	1618
;main.c: 1618: ad_vl = EEPROMread(0x13);
	movlw	low(013h)
	fcall	_EEPROMread
	movwf	(AD_baseGetFuc@ad_vl)
	line	1620
;main.c: 1620: ad_vh2 = EEPROMread(0x12);
	movlw	low(012h)
	fcall	_EEPROMread
	movwf	(AD_baseGetFuc@ad_vh2)
	line	1621
;main.c: 1621: ad_vl2 = EEPROMread(0x13);
	movlw	low(013h)
	fcall	_EEPROMread
	movwf	(AD_baseGetFuc@ad_vl2)
	line	1623
	
l4386:	
;main.c: 1623: if((ad_vh == ad_vh2) && (ad_vl == ad_vl2))
	movf	(AD_baseGetFuc@ad_vh),w
	xorwf	(AD_baseGetFuc@ad_vh2),w
	skipz
	goto	u3561
	goto	u3560
u3561:
	goto	l4396
u3560:
	
l4388:	
	movf	(AD_baseGetFuc@ad_vl),w
	xorwf	(AD_baseGetFuc@ad_vl2),w
	skipz
	goto	u3571
	goto	u3570
u3571:
	goto	l4396
u3570:
	line	1625
	
l4390:	
;main.c: 1624: {
;main.c: 1625: g_adBaseValue = (unsigned int)ad_vh;
	movf	(AD_baseGetFuc@ad_vh),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_g_adBaseValue)	;volatile
	clrf	(_g_adBaseValue+1)	;volatile
	line	1627
;main.c: 1627: g_adBaseValue <<= 8;
	movf	(_g_adBaseValue),w	;volatile
	movwf	(_g_adBaseValue+1)	;volatile
	clrf	(_g_adBaseValue)	;volatile
	line	1628
;main.c: 1628: g_adBaseValue |= ad_vl;
	movf	(AD_baseGetFuc@ad_vl),w
	iorwf	(_g_adBaseValue),f	;volatile
	line	1629
;main.c: 1629: return 1;
	movlw	low(01h)
	goto	l1450
	line	1631
	
l4396:	
;main.c: 1631: return 0;
	movlw	low(0)
	line	1632
	
l1450:	
	return
	opt stack 0
GLOBAL	__end_of_AD_baseGetFuc
	__end_of_AD_baseGetFuc:
	signat	_AD_baseGetFuc,89
	global	_EEPROMread

;; *************** function _EEPROMread *****************
;; Defined at:
;;		line 1497 in file "main.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    2[COMMON] unsigned char 
;;  ReEEPROMread    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 300/100
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_EEPROM_Init
;;		_Version_Write
;;		_AD_baseGetFuc
;;		_AD_baseWriteFuc
;; This function uses a non-reentrant model
;;
psect	text28,local,class=CODE,delta=2,merge=1,group=0
	line	1497
global __ptext28
__ptext28:	;psect for function _EEPROMread
psect	text28
	file	"main.c"
	line	1497
	global	__size_of_EEPROMread
	__size_of_EEPROMread	equ	__end_of_EEPROMread-_EEPROMread
	
_EEPROMread:	
;incstack = 0
	opt	stack 5
; Regs used in _EEPROMread: [wreg]
;EEPROMread@EEAddr stored from wreg
	movwf	(EEPROMread@EEAddr)
	line	1501
	
l3724:	
;main.c: 1499: unsigned char ReEEPROMread;
;main.c: 1501: EEADR = EEAddr;
	movf	(EEPROMread@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	1502
	
l3726:	
;main.c: 1502: RD = 1;
	bsf	(1248/8)^080h,(1248)&7	;volsfr
	line	1503
;main.c: 1503: ReEEPROMread = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(EEPROMread@ReEEPROMread)
	line	1504
	
l3728:	
;main.c: 1504: RD = 0;
	bcf	(1248/8)^080h,(1248)&7	;volsfr
	line	1505
;main.c: 1505: return ReEEPROMread;
	movf	(EEPROMread@ReEEPROMread),w
	line	1506
	
l1426:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROMread
	__end_of_EEPROMread:
	signat	_EEPROMread,4217
	global	_ADC_INITIAL

;; *************** function _ADC_INITIAL *****************
;; Defined at:
;;		line 511 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text29,local,class=CODE,delta=2,merge=1,group=0
	line	511
global __ptext29
__ptext29:	;psect for function _ADC_INITIAL
psect	text29
	file	"main.c"
	line	511
	global	__size_of_ADC_INITIAL
	__size_of_ADC_INITIAL	equ	__end_of_ADC_INITIAL-_ADC_INITIAL
	
_ADC_INITIAL:	
;incstack = 0
	opt	stack 6
; Regs used in _ADC_INITIAL: [wreg+status,2]
	line	513
	
l3888:	
;main.c: 513: ANSEL = 0B00010001;
	movlw	low(011h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	514
	
l3890:	
;main.c: 514: ADCON1 = 0B00000000;
	clrf	(159)^080h	;volatile
	line	517
	
l3892:	
;main.c: 517: ADCON0 = 0B10000000;
	movlw	low(080h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	526
	
l1134:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_INITIAL
	__end_of_ADC_INITIAL:
	signat	_ADC_INITIAL,89
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 333 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ReadAPin        1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 300/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text30,local,class=CODE,delta=2,merge=1,group=0
	line	333
global __ptext30
__ptext30:	;psect for function _ISR
psect	text30
	file	"main.c"
	line	333
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
;incstack = 0
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text30
	line	338
	
i1l2616:	
;main.c: 335: unsigned char ReadAPin;
;main.c: 338: if(INTE && INTF)
	btfss	(92/8),(92)&7	;volatile
	goto	u110_21
	goto	u110_20
u110_21:
	goto	i1l1105
u110_20:
	
i1l2618:	
	btfss	(89/8),(89)&7	;volatile
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l1105
u111_20:
	line	340
	
i1l2620:	
;main.c: 339: {
;main.c: 340: INTF = 0;
	bcf	(89/8),(89)&7	;volatile
	line	341
;main.c: 341: INTE = 1;
	bsf	(92/8),(92)&7	;volatile
	line	347
;main.c: 347: }else
	goto	i1l2630
	
i1l1105:	
	line	349
;main.c: 349: if(PAIE && PAIF)
	btfss	(91/8),(91)&7	;volatile
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l2630
u112_20:
	
i1l2622:	
	btfss	(88/8),(88)&7	;volatile
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l2630
u113_20:
	line	351
	
i1l2624:	
;main.c: 350: {
;main.c: 351: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(5),w	;volatile
	line	352
	
i1l2626:	
;main.c: 352: PAIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	353
	
i1l2628:	
;main.c: 353: PAIE = 1;
	bsf	(91/8),(91)&7	;volatile
	line	369
	
i1l2630:	
;main.c: 366: }
;main.c: 369: if(TMR1IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7	;volatile
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l1110
u114_20:
	line	371
	
i1l2632:	
;main.c: 370: {
;main.c: 371: TMR1IF = 0;
	bcf	(96/8),(96)&7	;volatile
	line	376
	
i1l2634:	
;main.c: 376: TMR1L = 0XC0;
	movlw	low(0C0h)
	movwf	(14)	;volatile
	line	378
;main.c: 378: TMR1H = 0XE0;
	movlw	low(0E0h)
	movwf	(15)	;volatile
	line	381
	
i1l2636:	
;main.c: 381: if(g_ledkeep > 0)g_ledkeep--;
	movf	((_g_ledkeep)),w	;volatile
iorwf	((_g_ledkeep+1)),w	;volatile
	btfsc	status,2
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l1110
u115_20:
	
i1l2638:	
	movlw	01h
	subwf	(_g_ledkeep),f	;volatile
	movlw	0
	skipc
	decf	(_g_ledkeep+1),f	;volatile
	subwf	(_g_ledkeep+1),f	;volatile
	line	383
	
i1l1110:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
	signat	_ISR,89
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
