//Deviec:PF462XXX
//-----------------------Variable---------------------------------
		_g_checkMode		EQU		47H
		_g_adBaseValue		EQU		62H
		_g_gloEnvt_st		EQU		6AH
		_g_gloCntTimer		EQU		69H
		_g_gloRecValue		EQU		60H
		_g_gloCurValue		EQU		5EH
		_g_checkStBits		EQU		68H
		_g_light_stvalue		EQU		67H
		_g_ledkeep		EQU		7AH
		_g_event_t		EQU		46H
		_g_cdsCmp		EQU		66H
		_Seg_0F		EQU		48H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	48CH 			//0009 	3C8C
		LJUMP 	0BH 			//000A 	380B
		LDWI 	4H 			//000B 	2A04
		ORG		000CH
		STR 	46H 			//000C 	01C6
		STR 	47H 			//000D 	01C7
		LDWI 	C0H 			//000E 	2AC0
		STR 	48H 			//000F 	01C8
		LDWI 	F9H 			//0010 	2AF9
		STR 	49H 			//0011 	01C9
		LDWI 	A4H 			//0012 	2AA4
		STR 	4AH 			//0013 	01CA
		ORG		0014H
		LDWI 	B0H 			//0014 	2AB0
		STR 	4BH 			//0015 	01CB
		LDWI 	99H 			//0016 	2A99
		STR 	4CH 			//0017 	01CC
		LDWI 	92H 			//0018 	2A92
		STR 	4DH 			//0019 	01CD
		LDWI 	82H 			//001A 	2A82
		STR 	4EH 			//001B 	01CE
		ORG		001CH
		LDWI 	F8H 			//001C 	2AF8
		STR 	4FH 			//001D 	01CF
		LDWI 	80H 			//001E 	2A80
		STR 	50H 			//001F 	01D0
		LDWI 	90H 			//0020 	2A90
		STR 	51H 			//0021 	01D1
		LDWI 	88H 			//0022 	2A88
		STR 	52H 			//0023 	01D2
		ORG		0024H
		LDWI 	83H 			//0024 	2A83
		STR 	53H 			//0025 	01D3
		LDWI 	C6H 			//0026 	2AC6
		STR 	54H 			//0027 	01D4
		LDWI 	A1H 			//0028 	2AA1
		STR 	55H 			//0029 	01D5
		LDWI 	86H 			//002A 	2A86
		STR 	56H 			//002B 	01D6
		ORG		002CH
		LDWI 	8EH 			//002C 	2A8E
		STR 	57H 			//002D 	01D7
		LDWI 	BFH 			//002E 	2ABF
		STR 	58H 			//002F 	01D8
		LDWI 	EFH 			//0030 	2AEF
		STR 	59H 			//0031 	01D9
		LDWI 	5AH 			//0032 	2A5A
		BCR 	STATUS,7 		//0033 	1383
		ORG		0034H
		STR 	FSR 			//0034 	0184
		LDWI 	6BH 			//0035 	2A6B
		LCALL 	622H 			//0036 	3622
		CLRR 	7AH 			//0037 	017A
		CLRR 	7BH 			//0038 	017B
		CLRR 	STATUS 			//0039 	0103
		LJUMP 	31CH 			//003A 	3B1C

		//;main.c: 827: if((g_checkMode != OFF_MODE) && (g_event_t == OFF_MODE))
		LDR 	47H,0 			//003B 	0847
		ORG		003CH
		BTSC 	STATUS,2 		//003C 	1503
		LJUMP 	12AH 			//003D 	392A
		LDR 	46H,0 			//003E 	0846
		BTSS 	STATUS,2 		//003F 	1D03
		LJUMP 	12AH 			//0040 	392A

		//;main.c: 828: eventExitOFF();
		LCALL 	5FEH 			//0041 	35FE
		LJUMP 	12AH 			//0042 	392A

		//;main.c: 846: do{TRISC3 = 0;PC3=0;}while(0);;
		BSR 	STATUS,5 		//0043 	1A83
		ORG		0044H
		BCR 	7H,3 			//0044 	1187
		BCR 	STATUS,5 		//0045 	1283
		BCR 	7H,3 			//0046 	1187

		//;main.c: 847: g_event_t = OFF_MODE;
		CLRR 	46H 			//0047 	0146

		//;main.c: 850: PC5 = 0;
		BCR 	7H,5 			//0048 	1287
		BTSS 	5H,6 			//0049 	1F05
		LJUMP 	4DH 			//004A 	384D
		BCR 	5H,6 			//004B 	1305
		ORG		004CH
		CLRR 	69H 			//004C 	0169

		//;main.c: 852: eventEnterOFF();
		LJUMP 	5CCH 			//004D 	3DCC

		//;main.c: 855: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
		//;main.c: 853: break;
		BTSS 	5H,6 			//004E 	1F05
		LJUMP 	52H 			//004F 	3852
		BCR 	5H,6 			//0050 	1305
		CLRR 	69H 			//0051 	0169

		//;main.c: 857: g_event_t = OFF2HI_MODE;
		LDWI 	1H 			//0052 	2A01
		STR 	46H 			//0053 	01C6
		ORG		0054H

		//;main.c: 858: if(((g_checkStBits) & (0B00000010)))
		BTSS 	68H,1 			//0054 	1CE8
		RET		 					//0055 	0004

		//;main.c: 859: {
		//;main.c: 860: TRISC3 = 1;
		BSR 	STATUS,5 		//0056 	1A83
		BSR 	7H,3 			//0057 	1987

		//;main.c: 861: if(PA7)
		BCR 	STATUS,5 		//0058 	1283
		BTSS 	5H,7 			//0059 	1F85
		RET		 					//005A 	0004

		//;main.c: 862: {
		//;main.c: 863: PC5 = 1;
		//;main.c: 866: g_ledkeep = 9000;
		LCALL 	13FH 			//005B 	313F
		ORG		005CH

		//;main.c: 867: TIMER1_INTSTART();
		LCALL 	5DCH 			//005C 	35DC
		BSR 	STATUS,5 		//005D 	1A83
		BSR 	5H,2 			//005E 	1905
		BSR 	15H,2 			//005F 	1915

		//;main.c: 869: while(1)
		CLRWDT	 			//0060 	0001

		//;main.c: 872: DelayMs(2);
		LDWI 	2H 			//0061 	2A02
		LCALL 	5B9H 			//0062 	35B9

		//;main.c: 873: if(PA7)
		BCR 	STATUS,5 		//0063 	1283
		ORG		0064H
		BCR 	STATUS,6 		//0064 	1303
		BTSS 	5H,7 			//0065 	1F85
		LJUMP 	6FH 			//0066 	386F

		//;main.c: 874: {
		//;main.c: 875: if(g_ledkeep < (9000-1000))
		LDWI 	1FH 			//0067 	2A1F
		SUBWR 	7BH,0 			//0068 	0C7B
		LDWI 	40H 			//0069 	2A40
		BTSC 	STATUS,2 		//006A 	1503
		SUBWR 	7AH,0 			//006B 	0C7A
		ORG		006CH
		BTSC 	STATUS,0 		//006C 	1403
		LJUMP 	6FH 			//006D 	386F

		//;main.c: 876: g_ledkeep = 9000;
		LCALL 	145H 			//006E 	3145

		//;main.c: 877: }
		//;main.c: 878: if(g_ledkeep == 0)
		LDR 	7AH,0 			//006F 	087A
		IORWR 	7BH,0 			//0070 	037B
		BTSC 	STATUS,2 		//0071 	1503
		LJUMP 	7BH 			//0072 	387B

		//;main.c: 880: if(PA2)
		BTSS 	5H,2 			//0073 	1D05
		ORG		0074H
		LJUMP 	60H 			//0074 	3860

		//;main.c: 881: {
		//;main.c: 882: DelayMs(10);
		LDWI 	AH 			//0075 	2A0A
		LCALL 	5B9H 			//0076 	35B9

		//;main.c: 883: if(PA2)
		BCR 	STATUS,5 		//0077 	1283
		BCR 	STATUS,6 		//0078 	1303
		BTSS 	5H,2 			//0079 	1D05
		LJUMP 	60H 			//007A 	3860

		//;main.c: 885: }
		//;main.c: 886: }
		//;main.c: 888: if(g_ledkeep == 0)
		LDR 	7AH,0 			//007B 	087A
		ORG		007CH
		IORWR 	7BH,0 			//007C 	037B
		BTSS 	STATUS,2 		//007D 	1D03
		LJUMP 	A7H 			//007E 	38A7

		//;main.c: 889: {
		//;main.c: 890: g_ledkeep = 1000;
		LCALL 	136H 			//007F 	3136

		//;main.c: 892: while(1)
		CLRWDT	 			//0080 	0001

		//;main.c: 895: DelayMs(2);
		LDWI 	2H 			//0081 	2A02
		LCALL 	5B9H 			//0082 	35B9

		//;main.c: 896: if(g_ledkeep == 0)break;
		//;main.c: 897: if(PA2)
		LCALL 	154H 			//0083 	3154
		ORG		0084H
		BTSC 	STATUS,2 		//0084 	1503
		LJUMP 	90H 			//0085 	3890
		BTSS 	5H,2 			//0086 	1D05
		LJUMP 	80H 			//0087 	3880

		//;main.c: 898: {
		//;main.c: 899: DelayMs(10);
		LDWI 	AH 			//0088 	2A0A
		LCALL 	5B9H 			//0089 	35B9

		//;main.c: 900: if(PA2)break;
		BCR 	STATUS,5 		//008A 	1283
		BCR 	STATUS,6 		//008B 	1303
		ORG		008CH
		BTSS 	5H,2 			//008C 	1D05
		LJUMP 	80H 			//008D 	3880

		//;main.c: 901: }
		//;main.c: 902: }
		//;main.c: 903: PC5 = 0;
		BCR 	STATUS,5 		//008E 	1283
		BCR 	STATUS,6 		//008F 	1303
		BCR 	7H,5 			//0090 	1287

		//;main.c: 905: g_ledkeep = 700;
		LCALL 	14AH 			//0091 	314A

		//;main.c: 906: while(1)
		CLRWDT	 			//0092 	0001

		//;main.c: 909: DelayMs(2);
		LDWI 	2H 			//0093 	2A02
		ORG		0094H
		LCALL 	5B9H 			//0094 	35B9

		//;main.c: 910: if(g_ledkeep == 0)break;
		LDR 	7AH,0 			//0095 	087A
		IORWR 	7BH,0 			//0096 	037B
		BTSC 	STATUS,2 		//0097 	1503
		LJUMP 	A3H 			//0098 	38A3

		//;main.c: 911: if(PA2)
		BCR 	STATUS,5 		//0099 	1283
		BCR 	STATUS,6 		//009A 	1303
		BTSS 	5H,2 			//009B 	1D05
		ORG		009CH
		LJUMP 	92H 			//009C 	3892

		//;main.c: 912: {
		//;main.c: 913: DelayMs(10);
		LDWI 	AH 			//009D 	2A0A
		LCALL 	5B9H 			//009E 	35B9

		//;main.c: 914: if(PA2)break;
		BCR 	STATUS,5 		//009F 	1283
		BCR 	STATUS,6 		//00A0 	1303
		BTSS 	5H,2 			//00A1 	1D05
		LJUMP 	92H 			//00A2 	3892

		//;main.c: 915: }
		//;main.c: 916: }
		//;main.c: 918: TRISC3 = 1;
		BSR 	STATUS,5 		//00A3 	1A83
		ORG		00A4H
		BCR 	STATUS,6 		//00A4 	1303
		BSR 	7H,3 			//00A5 	1987

		//;main.c: 919: }
		LJUMP 	A8H 			//00A6 	38A8

		//;main.c: 920: else
		//;main.c: 921: {
		//;main.c: 923: PC5 = 0;
		BCR 	7H,5 			//00A7 	1287

		//;main.c: 924: }
		//;main.c: 926: do{TRISA2=0;PA2=0;}while(0);;
		BSR 	STATUS,5 		//00A8 	1A83
		BCR 	5H,2 			//00A9 	1105
		BCR 	STATUS,5 		//00AA 	1283
		BCR 	5H,2 			//00AB 	1105
		ORG		00ACH

		//;main.c: 927: TIMER1_INTSTOP();
		LJUMP 	638H 			//00AC 	3E38

		//;main.c: 933: case GLO2HI_MODE:
		//;main.c: 935: PC5 = 0;
		BCR 	7H,5 			//00AD 	1287

		//;main.c: 936: g_event_t = GLO2HI_MODE;
		LDWI 	2H 			//00AE 	2A02
		STR 	46H 			//00AF 	01C6

		//;main.c: 937: if(((g_checkStBits) & (0B00000010)))
		BTSS 	68H,1 			//00B0 	1CE8
		LJUMP 	11BH 			//00B1 	391B

		//;main.c: 938: {
		//;main.c: 939: TRISC3 = 1;
		BSR 	STATUS,5 		//00B2 	1A83
		BSR 	7H,3 			//00B3 	1987
		ORG		00B4H

		//;main.c: 940: if(PA7)
		BCR 	STATUS,5 		//00B4 	1283
		BTSS 	5H,7 			//00B5 	1F85
		LJUMP 	114H 			//00B6 	3914

		//;main.c: 941: {
		//;main.c: 942: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
		BTSS 	5H,6 			//00B7 	1F05
		LJUMP 	BBH 			//00B8 	38BB
		BCR 	5H,6 			//00B9 	1305
		CLRR 	69H 			//00BA 	0169

		//;main.c: 943: PC5 = 1;
		//;main.c: 944: g_ledkeep = 9000;
		LCALL 	13FH 			//00BB 	313F
		ORG		00BCH

		//;main.c: 945: TIMER1_INTSTART();
		LCALL 	5DCH 			//00BC 	35DC
		BSR 	STATUS,5 		//00BD 	1A83
		BSR 	5H,3 			//00BE 	1985
		BSR 	15H,3 			//00BF 	1995

		//;main.c: 947: while(1)
		CLRWDT	 			//00C0 	0001

		//;main.c: 950: DelayMs(2);
		LDWI 	2H 			//00C1 	2A02
		LCALL 	5B9H 			//00C2 	35B9

		//;main.c: 951: if(PA7)
		BCR 	STATUS,5 		//00C3 	1283
		ORG		00C4H
		BCR 	STATUS,6 		//00C4 	1303
		BTSS 	5H,7 			//00C5 	1F85
		LJUMP 	CFH 			//00C6 	38CF

		//;main.c: 952: {
		//;main.c: 953: if(g_ledkeep < (9000-1000))
		LDWI 	1FH 			//00C7 	2A1F
		SUBWR 	7BH,0 			//00C8 	0C7B
		LDWI 	40H 			//00C9 	2A40
		BTSC 	STATUS,2 		//00CA 	1503
		SUBWR 	7AH,0 			//00CB 	0C7A
		ORG		00CCH
		BTSC 	STATUS,0 		//00CC 	1403
		LJUMP 	CFH 			//00CD 	38CF

		//;main.c: 954: g_ledkeep = 9000;
		LCALL 	145H 			//00CE 	3145

		//;main.c: 955: }
		//;main.c: 956: if(g_ledkeep == 0)
		LDR 	7AH,0 			//00CF 	087A
		IORWR 	7BH,0 			//00D0 	037B
		BTSC 	STATUS,2 		//00D1 	1503
		LJUMP 	DBH 			//00D2 	38DB

		//;main.c: 958: if(PA3)
		BTSS 	5H,3 			//00D3 	1D85
		ORG		00D4H
		LJUMP 	C0H 			//00D4 	38C0

		//;main.c: 959: {
		//;main.c: 960: DelayMs(10);
		LDWI 	AH 			//00D5 	2A0A
		LCALL 	5B9H 			//00D6 	35B9

		//;main.c: 961: if(PA3)
		BCR 	STATUS,5 		//00D7 	1283
		BCR 	STATUS,6 		//00D8 	1303
		BTSS 	5H,3 			//00D9 	1D85
		LJUMP 	C0H 			//00DA 	38C0

		//;main.c: 963: }
		//;main.c: 964: }
		//;main.c: 967: if(g_ledkeep == 0)
		LDR 	7AH,0 			//00DB 	087A
		ORG		00DCH
		IORWR 	7BH,0 			//00DC 	037B
		BTSS 	STATUS,2 		//00DD 	1D03
		LJUMP 	10AH 			//00DE 	390A

		//;main.c: 968: {
		//;main.c: 969: g_ledkeep = 1000;
		LCALL 	136H 			//00DF 	3136

		//;main.c: 971: while(1)
		CLRWDT	 			//00E0 	0001

		//;main.c: 974: DelayMs(2);
		LDWI 	2H 			//00E1 	2A02
		LCALL 	5B9H 			//00E2 	35B9

		//;main.c: 975: if(g_ledkeep == 0)break;
		//;main.c: 976: if(PA2)
		LCALL 	154H 			//00E3 	3154
		ORG		00E4H
		BTSC 	STATUS,2 		//00E4 	1503
		LJUMP 	F0H 			//00E5 	38F0
		BTSS 	5H,2 			//00E6 	1D05
		LJUMP 	E0H 			//00E7 	38E0

		//;main.c: 977: {
		//;main.c: 978: DelayMs(10);
		LDWI 	AH 			//00E8 	2A0A
		LCALL 	5B9H 			//00E9 	35B9

		//;main.c: 979: if(PA2)break;
		BCR 	STATUS,5 		//00EA 	1283
		BCR 	STATUS,6 		//00EB 	1303
		ORG		00ECH
		BTSS 	5H,2 			//00EC 	1D05
		LJUMP 	E0H 			//00ED 	38E0

		//;main.c: 980: }
		//;main.c: 981: }
		//;main.c: 982: PC5 = 0;
		BCR 	STATUS,5 		//00EE 	1283
		BCR 	STATUS,6 		//00EF 	1303
		BCR 	7H,5 			//00F0 	1287

		//;main.c: 983: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while(
		//+                          0);;} }while(0);;
		BTSC 	5H,6 			//00F1 	1705
		LJUMP 	F4H 			//00F2 	38F4
		LCALL 	14FH 			//00F3 	314F
		ORG		00F4H

		//;main.c: 986: g_ledkeep = 700;
		LCALL 	14AH 			//00F4 	314A

		//;main.c: 987: while(1)
		CLRWDT	 			//00F5 	0001

		//;main.c: 990: DelayMs(2);
		LDWI 	2H 			//00F6 	2A02
		LCALL 	5B9H 			//00F7 	35B9

		//;main.c: 991: if(g_ledkeep == 0)break;
		LDR 	7AH,0 			//00F8 	087A
		IORWR 	7BH,0 			//00F9 	037B
		BTSC 	STATUS,2 		//00FA 	1503
		LJUMP 	106H 			//00FB 	3906
		ORG		00FCH

		//;main.c: 992: if(PA3)
		BCR 	STATUS,5 		//00FC 	1283
		BCR 	STATUS,6 		//00FD 	1303
		BTSS 	5H,3 			//00FE 	1D85
		LJUMP 	F5H 			//00FF 	38F5

		//;main.c: 993: {
		//;main.c: 994: DelayMs(10);
		LDWI 	AH 			//0100 	2A0A
		LCALL 	5B9H 			//0101 	35B9

		//;main.c: 995: if(PA3)break;
		BCR 	STATUS,5 		//0102 	1283
		BCR 	STATUS,6 		//0103 	1303
		ORG		0104H
		BTSS 	5H,3 			//0104 	1D85
		LJUMP 	F5H 			//0105 	38F5

		//;main.c: 996: }
		//;main.c: 997: }
		//;main.c: 998: TRISC3 = 1;
		BSR 	STATUS,5 		//0106 	1A83
		BCR 	STATUS,6 		//0107 	1303
		BSR 	7H,3 			//0108 	1987

		//;main.c: 999: }
		LJUMP 	10EH 			//0109 	390E

		//;main.c: 1000: else{
		//;main.c: 1001: PC5 = 0;
		BCR 	7H,5 			//010A 	1287

		//;main.c: 1002: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while
		//+                          (0);;} }while(0);;
		BTSC 	5H,6 			//010B 	1705
		ORG		010CH
		LJUMP 	10EH 			//010C 	390E
		LCALL 	14FH 			//010D 	314F
		BSR 	STATUS,5 		//010E 	1A83
		BCR 	5H,3 			//010F 	1185
		BCR 	STATUS,5 		//0110 	1283
		BCR 	5H,3 			//0111 	1185
		LJUMP 	ACH 			//0112 	38AC

		//;main.c: 1009: {
		//;main.c: 1010: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while
		//+                          (0);;} }while(0);;
		//;main.c: 1025: {
		//;main.c: 1026: PC5 = 0;
		BCR 	7H,5 			//0113 	1287
		ORG		0114H

		//;main.c: 1027: do{if(!PA6){ PA6 = 1; do{ g_gloCntTimer = 0; g_gloCntTimer |= 0x82;}while
		//+                          (0);;} }while(0);;
		BTSC 	5H,6 			//0114 	1705
		RET		 					//0115 	0004
		BSR 	5H,6 			//0116 	1B05
		CLRR 	69H 			//0117 	0169
		LDWI 	82H 			//0118 	2A82
		IORWR 	69H,1 			//0119 	03E9
		RET		 					//011A 	0004

		//;main.c: 1013: {
		//;main.c: 1014: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
		BTSS 	5H,6 			//011B 	1F05
		ORG		011CH
		RET		 					//011C 	0004
		BCR 	5H,6 			//011D 	1305
		CLRR 	69H 			//011E 	0169
		RET		 					//011F 	0004

		//;main.c: 1018: case GLO_MODE:
		//;main.c: 1021: PC5 = 0;
		BCR 	7H,5 			//0120 	1287

		//;main.c: 1022: g_event_t = GLO_MODE;
		LDWI 	3H 			//0121 	2A03
		STR 	46H 			//0122 	01C6
		BSR 	STATUS,5 		//0123 	1A83
		ORG		0124H
		BCR 	7H,3 			//0124 	1187
		BCR 	STATUS,5 		//0125 	1283
		BCR 	7H,3 			//0126 	1187

		//;main.c: 1024: if(((g_checkStBits) & (0B00000010)))
		BTSC 	68H,1 			//0127 	14E8
		LJUMP 	113H 			//0128 	3913
		LJUMP 	11BH 			//0129 	391B

		//;main.c: 1029: {
		//;main.c: 1030: do{if(PA6){ PA6 = 0; do{ g_gloCntTimer = 0;}while(0);;} }while(0);;
		LDR 	47H,0 			//012A 	0847
		STR 	FSR 			//012B 	0184
		ORG		012CH
		LDWI 	4H 			//012C 	2A04
		SUBWR 	FSR,0 			//012D 	0C04
		BTSC 	STATUS,0 		//012E 	1403
		RET		 					//012F 	0004
		LDWI 	6H 			//0130 	2A06
		STR 	PCLATH 			//0131 	018A
		LDWI 	3EH 			//0132 	2A3E
		ADDWR 	FSR,0 			//0133 	0B04
		ORG		0134H
		STR 	PCL 			//0134 	0182
		RET		 					//0135 	0004
		LDWI 	E8H 			//0136 	2AE8
		STR 	7AH 			//0137 	01FA
		LDWI 	3H 			//0138 	2A03
		STR 	7BH 			//0139 	01FB
		BSR 	STATUS,5 		//013A 	1A83
		BCR 	7H,3 			//013B 	1187
		ORG		013CH
		BCR 	STATUS,5 		//013C 	1283
		BCR 	7H,3 			//013D 	1187
		RET		 					//013E 	0004
		BSR 	7H,5 			//013F 	1A87
		LDWI 	28H 			//0140 	2A28
		STR 	7AH 			//0141 	01FA
		LDWI 	23H 			//0142 	2A23
		STR 	7BH 			//0143 	01FB
		ORG		0144H
		RET		 					//0144 	0004
		LDWI 	28H 			//0145 	2A28
		STR 	7AH 			//0146 	01FA
		LDWI 	23H 			//0147 	2A23
		STR 	7BH 			//0148 	01FB
		RET		 					//0149 	0004
		LDWI 	BCH 			//014A 	2ABC
		STR 	7AH 			//014B 	01FA
		ORG		014CH
		LDWI 	2H 			//014C 	2A02
		STR 	7BH 			//014D 	01FB
		RET		 					//014E 	0004
		BSR 	5H,6 			//014F 	1B05
		CLRR 	69H 			//0150 	0169
		LDWI 	82H 			//0151 	2A82
		IORWR 	69H,1 			//0152 	03E9
		RET		 					//0153 	0004
		ORG		0154H
		LDR 	7AH,0 			//0154 	087A
		IORWR 	7BH,0 			//0155 	037B
		BCR 	STATUS,5 		//0156 	1283
		BCR 	STATUS,6 		//0157 	1303
		RET		 					//0158 	0004

		//;main.c: 1378: unsigned char define_t,i,j;
		//;main.c: 1379: unsigned int ad_v,ad_total[10],ad_sum;
		//;main.c: 1381: static unsigned int ad_vpre = 0;
		//;main.c: 1385: ADON = 1;
		BCR 	STATUS,5 		//0159 	1283
		BCR 	STATUS,6 		//015A 	1303
		BSR 	1FH,0 			//015B 	181F
		ORG		015CH

		//;main.c: 1386: DelayMs(100);
		LDWI 	64H 			//015C 	2A64
		LCALL 	5B9H 			//015D 	35B9

		//;main.c: 1388: for(define_t = 50;define_t--;)
		LDWI 	32H 			//015E 	2A32
		BCR 	STATUS,5 		//015F 	1283
		BCR 	STATUS,6 		//0160 	1303
		STR 	3FH 			//0161 	01BF
		LJUMP 	20EH 			//0162 	3A0E
		CLRWDT	 			//0163 	0001
		ORG		0164H

		//;main.c: 1392: ad_sum = 0;
		BCR 	STATUS,5 		//0164 	1283
		BCR 	STATUS,6 		//0165 	1303
		CLRR 	40H 			//0166 	0140
		CLRR 	41H 			//0167 	0141

		//;main.c: 1393: for(i = 0;i < 10;i++)
		CLRR 	45H 			//0168 	0145

		//;main.c: 1394: {
		//;main.c: 1395: ad_total[i] = GET_ADC_DATA (0);
		LDWI 	0H 			//0169 	2A00
		LCALL 	4B4H 			//016A 	34B4
		BCR 	STATUS,5 		//016B 	1283
		ORG		016CH
		BCR 	STATUS,0 		//016C 	1003
		RLR 	45H,0 			//016D 	0545
		ADDWI 	2BH 			//016E 	272B

		//;main.c: 1396: ad_sum += ad_total[i];
		LCALL 	222H 			//016F 	3222
		RLR 	45H,0 			//0170 	0545
		LCALL 	22BH 			//0171 	322B
		LCALL 	239H 			//0172 	3239
		LDWI 	AH 			//0173 	2A0A
		ORG		0174H
		INCR	45H,1 			//0174 	09C5
		SUBWR 	45H,0 			//0175 	0C45
		BTSS 	STATUS,0 		//0176 	1C03
		LJUMP 	169H 			//0177 	3969

		//;main.c: 1397: }
		//;main.c: 1399: for(i = 1;i < 10;i++)
		CLRR 	45H 			//0178 	0145
		INCR	45H,1 			//0179 	09C5

		//;main.c: 1400: {
		//;main.c: 1401: for(j=0;j<10-i;j++)
		CLRR 	44H 			//017A 	0144
		CLRR 	28H 			//017B 	0128
		ORG		017CH
		LDR 	45H,0 			//017C 	0845
		SUBWI 	AH 			//017D 	280A
		STR 	27H 			//017E 	01A7
		BTSS 	STATUS,0 		//017F 	1C03
		DECR 	28H,1 			//0180 	0DA8
		LDR 	28H,0 			//0181 	0828
		XORWI 	80H 			//0182 	2680
		SUBWI 	80H 			//0183 	2880
		ORG		0184H
		BTSS 	STATUS,2 		//0184 	1D03
		LJUMP 	188H 			//0185 	3988
		LDR 	27H,0 			//0186 	0827
		SUBWR 	44H,0 			//0187 	0C44
		BTSC 	STATUS,0 		//0188 	1403
		LJUMP 	1C5H 			//0189 	39C5

		//;main.c: 1402: {
		//;main.c: 1403: if(ad_total[j]> ad_total[j+1])
		BCR 	STATUS,5 		//018A 	1283
		BCR 	STATUS,6 		//018B 	1303
		ORG		018CH
		BCR 	STATUS,0 		//018C 	1003
		RLR 	44H,0 			//018D 	0544
		ADDWI 	2BH 			//018E 	272B
		STR 	FSR 			//018F 	0184
		BCR 	STATUS,7 		//0190 	1383
		LDR 	INDF,0 			//0191 	0800
		STR 	27H 			//0192 	01A7
		INCR	FSR,1 			//0193 	0984
		ORG		0194H
		LDR 	INDF,0 			//0194 	0800
		STR 	28H 			//0195 	01A8
		LCALL 	233H 			//0196 	3233
		LDR 	INDF,0 			//0197 	0800
		STR 	29H 			//0198 	01A9
		INCR	FSR,1 			//0199 	0984
		LDR 	INDF,0 			//019A 	0800
		STR 	2AH 			//019B 	01AA
		ORG		019CH
		LDR 	28H,0 			//019C 	0828
		SUBWR 	2AH,0 			//019D 	0C2A
		BTSS 	STATUS,2 		//019E 	1D03
		LJUMP 	1A2H 			//019F 	39A2
		LDR 	27H,0 			//01A0 	0827
		SUBWR 	29H,0 			//01A1 	0C29
		BTSC 	STATUS,0 		//01A2 	1403
		LJUMP 	1C0H 			//01A3 	39C0
		ORG		01A4H

		//;main.c: 1404: {
		//;main.c: 1405: ad_v = ad_total[j];
		BCR 	STATUS,0 		//01A4 	1003
		RLR 	44H,0 			//01A5 	0544
		ADDWI 	2BH 			//01A6 	272B
		STR 	FSR 			//01A7 	0184
		LDR 	INDF,0 			//01A8 	0800
		STR 	42H 			//01A9 	01C2
		INCR	FSR,1 			//01AA 	0984
		LDR 	INDF,0 			//01AB 	0800
		ORG		01ACH
		STR 	43H 			//01AC 	01C3

		//;main.c: 1406: ad_total[j]=ad_total[j+1];
		BCR 	STATUS,0 		//01AD 	1003
		RLR 	44H,0 			//01AE 	0544
		ADDWI 	2H 			//01AF 	2702
		LCALL 	22BH 			//01B0 	322B
		BCR 	STATUS,0 		//01B1 	1003
		RLR 	44H,0 			//01B2 	0544
		ADDWI 	2BH 			//01B3 	272B
		ORG		01B4H
		STR 	FSR 			//01B4 	0184
		LDR 	27H,0 			//01B5 	0827
		STR 	INDF 			//01B6 	0180
		INCR	FSR,1 			//01B7 	0984
		LDR 	28H,0 			//01B8 	0828
		STR 	INDF 			//01B9 	0180

		//;main.c: 1407: ad_total[j+1] = ad_v;
		LCALL 	233H 			//01BA 	3233
		LDR 	42H,0 			//01BB 	0842
		ORG		01BCH
		STR 	INDF 			//01BC 	0180
		INCR	FSR,1 			//01BD 	0984
		LDR 	43H,0 			//01BE 	0843
		STR 	INDF 			//01BF 	0180
		CLRWDT	 			//01C0 	0001
		BCR 	STATUS,5 		//01C1 	1283
		BCR 	STATUS,6 		//01C2 	1303
		INCR	44H,1 			//01C3 	09C4
		ORG		01C4H
		LJUMP 	17BH 			//01C4 	397B
		CLRWDT	 			//01C5 	0001
		LDWI 	AH 			//01C6 	2A0A
		BCR 	STATUS,5 		//01C7 	1283
		BCR 	STATUS,6 		//01C8 	1303
		INCR	45H,1 			//01C9 	09C5
		SUBWR 	45H,0 			//01CA 	0C45
		BTSS 	STATUS,0 		//01CB 	1C03
		ORG		01CCH
		LJUMP 	17AH 			//01CC 	397A

		//;main.c: 1412: }
		//;main.c: 1413: ad_sum = ad_sum - ad_total[0] - ad_total[9];
		LDR 	2BH,0 			//01CD 	082B
		ADDWR 	3DH,0 			//01CE 	0B3D
		STR 	27H 			//01CF 	01A7
		LDR 	2CH,0 			//01D0 	082C
		BTSC 	STATUS,0 		//01D1 	1403
		INCR	2CH,0 			//01D2 	092C
		ADDWR 	3EH,0 			//01D3 	0B3E
		ORG		01D4H
		STR 	28H 			//01D4 	01A8
		COMR 	27H,1 			//01D5 	0FA7
		COMR 	28H,1 			//01D6 	0FA8
		INCR	27H,1 			//01D7 	09A7
		BTSC 	STATUS,2 		//01D8 	1503
		INCR	28H,1 			//01D9 	09A8
		LCALL 	239H 			//01DA 	3239

		//;main.c: 1414: ad_sum >>= 3;
		BCR 	STATUS,0 		//01DB 	1003
		ORG		01DCH
		RRR	41H,1 			//01DC 	06C1
		RRR	40H,1 			//01DD 	06C0
		BCR 	STATUS,0 		//01DE 	1003
		RRR	41H,1 			//01DF 	06C1
		RRR	40H,1 			//01E0 	06C0
		BCR 	STATUS,0 		//01E1 	1003
		RRR	41H,1 			//01E2 	06C1
		RRR	40H,1 			//01E3 	06C0
		ORG		01E4H

		//;main.c: 1416: ad_v = 2 * ad_sum + (10 - 2)*ad_vpre;
		LDR 	41H,0 			//01E4 	0841
		STR 	43H 			//01E5 	01C3
		LDR 	40H,0 			//01E6 	0840
		STR 	42H 			//01E7 	01C2
		BCR 	STATUS,0 		//01E8 	1003
		RLR 	42H,1 			//01E9 	05C2
		RLR 	43H,1 			//01EA 	05C3
		LDR 	5BH,0 			//01EB 	085B
		ORG		01ECH
		STR 	28H 			//01EC 	01A8
		LDR 	5AH,0 			//01ED 	085A
		STR 	27H 			//01EE 	01A7
		BCR 	STATUS,0 		//01EF 	1003
		RLR 	27H,1 			//01F0 	05A7
		RLR 	28H,1 			//01F1 	05A8
		BCR 	STATUS,0 		//01F2 	1003
		RLR 	27H,1 			//01F3 	05A7
		ORG		01F4H
		RLR 	28H,1 			//01F4 	05A8
		BCR 	STATUS,0 		//01F5 	1003
		RLR 	27H,1 			//01F6 	05A7
		RLR 	28H,1 			//01F7 	05A8
		LDR 	27H,0 			//01F8 	0827
		ADDWR 	42H,1 			//01F9 	0BC2
		BTSC 	STATUS,0 		//01FA 	1403
		INCR	43H,1 			//01FB 	09C3
		ORG		01FCH
		LDR 	28H,0 			//01FC 	0828
		ADDWR 	43H,1 			//01FD 	0BC3

		//;main.c: 1417: ad_v = ad_v/10;
		LDWI 	AH 			//01FE 	2A0A
		STR 	20H 			//01FF 	01A0
		CLRR 	21H 			//0200 	0121
		LDR 	43H,0 			//0201 	0843
		STR 	23H 			//0202 	01A3
		LDR 	42H,0 			//0203 	0842
		ORG		0204H
		STR 	22H 			//0204 	01A2
		LCALL 	462H 			//0205 	3462
		LDR 	21H,0 			//0206 	0821
		STR 	43H 			//0207 	01C3
		LDR 	20H,0 			//0208 	0820
		STR 	42H 			//0209 	01C2

		//;main.c: 1418: ad_vpre = ad_v;
		LDR 	43H,0 			//020A 	0843
		STR 	5BH 			//020B 	01DB
		ORG		020CH
		LDR 	42H,0 			//020C 	0842
		STR 	5AH 			//020D 	01DA
		DECR 	3FH,1 			//020E 	0DBF
		INCRSZ 	3FH,0 		//020F 	0A3F
		LJUMP 	163H 			//0210 	3963

		//;main.c: 1419: }
		//;main.c: 1422: AD_baseWriteFuc(ad_v);
		LDR 	43H,0 			//0211 	0843
		STR 	76H 			//0212 	01F6
		LDR 	42H,0 			//0213 	0842
		ORG		0214H
		STR 	75H 			//0214 	01F5
		LCALL 	4D9H 			//0215 	34D9

		//;main.c: 1424: ADON = 0;
		BCR 	STATUS,5 		//0216 	1283
		BCR 	STATUS,6 		//0217 	1303
		BCR 	1FH,0 			//0218 	101F

		//;main.c: 1427: oneGLO();
		LCALL 	5E8H 			//0219 	35E8
		CLRWDT	 			//021A 	0001

		//;main.c: 1429: DelayMs(200);
		LDWI 	C8H 			//021B 	2AC8
		ORG		021CH
		LCALL 	5B9H 			//021C 	35B9

		//;main.c: 1430: oneGLO();
		LCALL 	5E8H 			//021D 	35E8
		CLRWDT	 			//021E 	0001

		//;main.c: 1432: DelayMs(200);
		LDWI 	C8H 			//021F 	2AC8
		LCALL 	5B9H 			//0220 	35B9

		//;main.c: 1433: oneGLO();
		LJUMP 	5E8H 			//0221 	3DE8
		STR 	FSR 			//0222 	0184
		LDR 	72H,0 			//0223 	0872
		ORG		0224H
		BCR 	STATUS,7 		//0224 	1383
		STR 	INDF 			//0225 	0180
		INCR	FSR,1 			//0226 	0984
		LDR 	73H,0 			//0227 	0873
		STR 	INDF 			//0228 	0180
		BCR 	STATUS,0 		//0229 	1003
		RET		 					//022A 	0004
		ADDWI 	2BH 			//022B 	272B
		ORG		022CH
		STR 	FSR 			//022C 	0184
		LDR 	INDF,0 			//022D 	0800
		STR 	27H 			//022E 	01A7
		INCR	FSR,1 			//022F 	0984
		LDR 	INDF,0 			//0230 	0800
		STR 	28H 			//0231 	01A8
		RET		 					//0232 	0004
		BCR 	STATUS,0 		//0233 	1003
		ORG		0234H
		RLR 	44H,0 			//0234 	0544
		ADDWI 	2H 			//0235 	2702
		ADDWI 	2BH 			//0236 	272B
		STR 	FSR 			//0237 	0184
		RET		 					//0238 	0004
		LDR 	27H,0 			//0239 	0827
		ADDWR 	40H,1 			//023A 	0BC0
		BTSC 	STATUS,0 		//023B 	1403
		ORG		023CH
		INCR	41H,1 			//023C 	09C1
		LDR 	28H,0 			//023D 	0828
		ADDWR 	41H,1 			//023E 	0BC1
		RET		 					//023F 	0004

		//;main.c: 1238: unsigned char i,j,z;
		//;main.c: 1239: unsigned int ad_v,ad_total[10],ad_sum;
		//;main.c: 1240: static unsigned int ad_vpre = 0;
		//;main.c: 1243: for(z = 10;z--;)
		LDWI 	AH 			//0240 	2A0A
		BCR 	STATUS,5 		//0241 	1283
		BCR 	STATUS,6 		//0242 	1303
		STR 	3FH 			//0243 	01BF
		ORG		0244H
		LJUMP 	2EDH 			//0244 	3AED

		//;main.c: 1244: {
		//;main.c: 1245: ad_sum = 0;
		CLRR 	40H 			//0245 	0140
		CLRR 	41H 			//0246 	0141

		//;main.c: 1246: for(i = 0;i < 10;i++)
		CLRR 	45H 			//0247 	0145

		//;main.c: 1247: {
		//;main.c: 1248: ad_total[i] = GET_ADC_DATA (0);
		LDWI 	0H 			//0248 	2A00
		LCALL 	4B4H 			//0249 	34B4
		BCR 	STATUS,5 		//024A 	1283
		BCR 	STATUS,0 		//024B 	1003
		ORG		024CH
		RLR 	45H,0 			//024C 	0545
		ADDWI 	2BH 			//024D 	272B

		//;main.c: 1249: ad_sum += ad_total[i];
		LCALL 	222H 			//024E 	3222
		RLR 	45H,0 			//024F 	0545
		LCALL 	307H 			//0250 	3307
		LCALL 	315H 			//0251 	3315
		LDWI 	AH 			//0252 	2A0A
		INCR	45H,1 			//0253 	09C5
		ORG		0254H
		SUBWR 	45H,0 			//0254 	0C45
		BTSS 	STATUS,0 		//0255 	1C03
		LJUMP 	248H 			//0256 	3A48

		//;main.c: 1250: }
		//;main.c: 1251: for(i = 1;i < 10;i++)
		CLRR 	45H 			//0257 	0145
		INCR	45H,1 			//0258 	09C5

		//;main.c: 1252: {
		//;main.c: 1253: for(j=0;j<10-i;j++)
		CLRR 	44H 			//0259 	0144
		CLRR 	28H 			//025A 	0128
		LDR 	45H,0 			//025B 	0845
		ORG		025CH
		SUBWI 	AH 			//025C 	280A
		STR 	27H 			//025D 	01A7
		BTSS 	STATUS,0 		//025E 	1C03
		DECR 	28H,1 			//025F 	0DA8
		LDR 	28H,0 			//0260 	0828
		XORWI 	80H 			//0261 	2680
		SUBWI 	80H 			//0262 	2880
		BTSS 	STATUS,2 		//0263 	1D03
		ORG		0264H
		LJUMP 	267H 			//0264 	3A67
		LDR 	27H,0 			//0265 	0827
		SUBWR 	44H,0 			//0266 	0C44
		BTSC 	STATUS,0 		//0267 	1403
		LJUMP 	2A4H 			//0268 	3AA4

		//;main.c: 1254: {
		//;main.c: 1255: if(ad_total[j]> ad_total[j+1])
		BCR 	STATUS,5 		//0269 	1283
		BCR 	STATUS,6 		//026A 	1303
		BCR 	STATUS,0 		//026B 	1003
		ORG		026CH
		RLR 	44H,0 			//026C 	0544
		ADDWI 	2BH 			//026D 	272B
		STR 	FSR 			//026E 	0184
		BCR 	STATUS,7 		//026F 	1383
		LDR 	INDF,0 			//0270 	0800
		STR 	27H 			//0271 	01A7
		INCR	FSR,1 			//0272 	0984
		LDR 	INDF,0 			//0273 	0800
		ORG		0274H
		STR 	28H 			//0274 	01A8
		LCALL 	30FH 			//0275 	330F
		LDR 	INDF,0 			//0276 	0800
		STR 	29H 			//0277 	01A9
		INCR	FSR,1 			//0278 	0984
		LDR 	INDF,0 			//0279 	0800
		STR 	2AH 			//027A 	01AA
		LDR 	28H,0 			//027B 	0828
		ORG		027CH
		SUBWR 	2AH,0 			//027C 	0C2A
		BTSS 	STATUS,2 		//027D 	1D03
		LJUMP 	281H 			//027E 	3A81
		LDR 	27H,0 			//027F 	0827
		SUBWR 	29H,0 			//0280 	0C29
		BTSC 	STATUS,0 		//0281 	1403
		LJUMP 	29FH 			//0282 	3A9F

		//;main.c: 1256: {
		//;main.c: 1257: ad_v = ad_total[j];
		BCR 	STATUS,0 		//0283 	1003
		ORG		0284H
		RLR 	44H,0 			//0284 	0544
		ADDWI 	2BH 			//0285 	272B
		STR 	FSR 			//0286 	0184
		LDR 	INDF,0 			//0287 	0800
		STR 	42H 			//0288 	01C2
		INCR	FSR,1 			//0289 	0984
		LDR 	INDF,0 			//028A 	0800
		STR 	43H 			//028B 	01C3
		ORG		028CH

		//;main.c: 1258: ad_total[j]=ad_total[j+1];
		BCR 	STATUS,0 		//028C 	1003
		RLR 	44H,0 			//028D 	0544
		ADDWI 	2H 			//028E 	2702
		LCALL 	307H 			//028F 	3307
		BCR 	STATUS,0 		//0290 	1003
		RLR 	44H,0 			//0291 	0544
		ADDWI 	2BH 			//0292 	272B
		STR 	FSR 			//0293 	0184
		ORG		0294H
		LDR 	27H,0 			//0294 	0827
		STR 	INDF 			//0295 	0180
		INCR	FSR,1 			//0296 	0984
		LDR 	28H,0 			//0297 	0828
		STR 	INDF 			//0298 	0180

		//;main.c: 1259: ad_total[j+1] = ad_v;
		LCALL 	30FH 			//0299 	330F
		LDR 	42H,0 			//029A 	0842
		STR 	INDF 			//029B 	0180
		ORG		029CH
		INCR	FSR,1 			//029C 	0984
		LDR 	43H,0 			//029D 	0843
		STR 	INDF 			//029E 	0180
		CLRWDT	 			//029F 	0001
		BCR 	STATUS,5 		//02A0 	1283
		BCR 	STATUS,6 		//02A1 	1303
		INCR	44H,1 			//02A2 	09C4
		LJUMP 	25AH 			//02A3 	3A5A
		ORG		02A4H
		CLRWDT	 			//02A4 	0001
		LDWI 	AH 			//02A5 	2A0A
		BCR 	STATUS,5 		//02A6 	1283
		BCR 	STATUS,6 		//02A7 	1303
		INCR	45H,1 			//02A8 	09C5
		SUBWR 	45H,0 			//02A9 	0C45
		BTSS 	STATUS,0 		//02AA 	1C03
		LJUMP 	259H 			//02AB 	3A59
		ORG		02ACH

		//;main.c: 1264: }
		//;main.c: 1267: ad_sum = ad_sum - ad_total[0] - ad_total[9];
		LDR 	2BH,0 			//02AC 	082B
		ADDWR 	3DH,0 			//02AD 	0B3D
		STR 	27H 			//02AE 	01A7
		LDR 	2CH,0 			//02AF 	082C
		BTSC 	STATUS,0 		//02B0 	1403
		INCR	2CH,0 			//02B1 	092C
		ADDWR 	3EH,0 			//02B2 	0B3E
		STR 	28H 			//02B3 	01A8
		ORG		02B4H
		COMR 	27H,1 			//02B4 	0FA7
		COMR 	28H,1 			//02B5 	0FA8
		INCR	27H,1 			//02B6 	09A7
		BTSC 	STATUS,2 		//02B7 	1503
		INCR	28H,1 			//02B8 	09A8
		LCALL 	315H 			//02B9 	3315

		//;main.c: 1268: ad_sum >>= 3;
		BCR 	STATUS,0 		//02BA 	1003
		RRR	41H,1 			//02BB 	06C1
		ORG		02BCH
		RRR	40H,1 			//02BC 	06C0
		BCR 	STATUS,0 		//02BD 	1003
		RRR	41H,1 			//02BE 	06C1
		RRR	40H,1 			//02BF 	06C0
		BCR 	STATUS,0 		//02C0 	1003
		RRR	41H,1 			//02C1 	06C1
		RRR	40H,1 			//02C2 	06C0

		//;main.c: 1273: ad_v = 2 * ad_sum + (10 - 2)*ad_vpre;
		LDR 	41H,0 			//02C3 	0841
		ORG		02C4H
		STR 	43H 			//02C4 	01C3
		LDR 	40H,0 			//02C5 	0840
		STR 	42H 			//02C6 	01C2
		BCR 	STATUS,0 		//02C7 	1003
		RLR 	42H,1 			//02C8 	05C2
		RLR 	43H,1 			//02C9 	05C3
		LDR 	5DH,0 			//02CA 	085D
		STR 	28H 			//02CB 	01A8
		ORG		02CCH
		LDR 	5CH,0 			//02CC 	085C
		STR 	27H 			//02CD 	01A7
		BCR 	STATUS,0 		//02CE 	1003
		RLR 	27H,1 			//02CF 	05A7
		RLR 	28H,1 			//02D0 	05A8
		BCR 	STATUS,0 		//02D1 	1003
		RLR 	27H,1 			//02D2 	05A7
		RLR 	28H,1 			//02D3 	05A8
		ORG		02D4H
		BCR 	STATUS,0 		//02D4 	1003
		RLR 	27H,1 			//02D5 	05A7
		RLR 	28H,1 			//02D6 	05A8
		LDR 	27H,0 			//02D7 	0827
		ADDWR 	42H,1 			//02D8 	0BC2
		BTSC 	STATUS,0 		//02D9 	1403
		INCR	43H,1 			//02DA 	09C3
		LDR 	28H,0 			//02DB 	0828
		ORG		02DCH
		ADDWR 	43H,1 			//02DC 	0BC3

		//;main.c: 1274: ad_v = ad_v/10;
		LDWI 	AH 			//02DD 	2A0A
		STR 	20H 			//02DE 	01A0
		CLRR 	21H 			//02DF 	0121
		LDR 	43H,0 			//02E0 	0843
		STR 	23H 			//02E1 	01A3
		LDR 	42H,0 			//02E2 	0842
		STR 	22H 			//02E3 	01A2
		ORG		02E4H
		LCALL 	462H 			//02E4 	3462
		LDR 	21H,0 			//02E5 	0821
		STR 	43H 			//02E6 	01C3
		LDR 	20H,0 			//02E7 	0820
		STR 	42H 			//02E8 	01C2

		//;main.c: 1275: ad_vpre = ad_v;
		LDR 	43H,0 			//02E9 	0843
		STR 	5DH 			//02EA 	01DD
		LDR 	42H,0 			//02EB 	0842
		ORG		02ECH
		STR 	5CH 			//02EC 	01DC
		DECR 	3FH,1 			//02ED 	0DBF
		INCRSZ 	3FH,0 		//02EE 	0A3F
		LJUMP 	245H 			//02EF 	3A45

		//;main.c: 1277: }
		//;main.c: 1280: if(g_adBaseValue == 0)return;
		LDR 	62H,0 			//02F0 	0862
		IORWR 	63H,0 			//02F1 	0363
		BTSC 	STATUS,2 		//02F2 	1503
		RET		 					//02F3 	0004
		ORG		02F4H

		//;main.c: 1282: if((g_gloCntTimer & 0x80) == 0x80)
		BTSS 	69H,7 			//02F4 	1FE9
		LJUMP 	302H 			//02F5 	3B02

		//;main.c: 1283: {
		//;main.c: 1284: if(ad_v <= g_adBaseValue)
		LDR 	43H,0 			//02F6 	0843
		SUBWR 	63H,0 			//02F7 	0C63
		BTSS 	STATUS,2 		//02F8 	1D03
		LJUMP 	2FCH 			//02F9 	3AFC
		LDR 	42H,0 			//02FA 	0842
		SUBWR 	62H,0 			//02FB 	0C62
		ORG		02FCH
		BTSS 	STATUS,0 		//02FC 	1C03
		LJUMP 	300H 			//02FD 	3B00

		//;main.c: 1285: g_gloEnvt_st = NORMAL_ENVT;
		LDWI 	1H 			//02FE 	2A01
		LJUMP 	301H 			//02FF 	3B01

		//;main.c: 1286: else
		//;main.c: 1287: {
		//;main.c: 1288: g_gloEnvt_st = BEYOND_ENVT;
		LDWI 	2H 			//0300 	2A02
		STR 	6AH 			//0301 	01EA

		//;main.c: 1289: }
		//;main.c: 1290: }
		//;main.c: 1292: g_gloCurValue = ad_v;
		LDR 	43H,0 			//0302 	0843
		STR 	5FH 			//0303 	01DF
		ORG		0304H
		LDR 	42H,0 			//0304 	0842
		STR 	5EH 			//0305 	01DE
		RET		 					//0306 	0004
		ADDWI 	2BH 			//0307 	272B
		STR 	FSR 			//0308 	0184
		LDR 	INDF,0 			//0309 	0800
		STR 	27H 			//030A 	01A7
		INCR	FSR,1 			//030B 	0984
		ORG		030CH
		LDR 	INDF,0 			//030C 	0800
		STR 	28H 			//030D 	01A8
		RET		 					//030E 	0004
		BCR 	STATUS,0 		//030F 	1003
		RLR 	44H,0 			//0310 	0544
		ADDWI 	2H 			//0311 	2702
		ADDWI 	2BH 			//0312 	272B
		STR 	FSR 			//0313 	0184
		ORG		0314H
		RET		 					//0314 	0004
		LDR 	27H,0 			//0315 	0827
		ADDWR 	40H,1 			//0316 	0BC0
		BTSC 	STATUS,0 		//0317 	1403
		INCR	41H,1 			//0318 	09C1
		LDR 	28H,0 			//0319 	0828
		ADDWR 	41H,1 			//031A 	0BC1
		RET		 					//031B 	0004
		ORG		031CH

		//;main.c: 1926: unsigned char main_j = 0;
		CLRR 	79H 			//031C 	0179

		//;main.c: 1930: POWER_INITIAL();
		LCALL 	571H 			//031D 	3571

		//;main.c: 1932: ADC_INITIAL();
		LCALL 	62AH 			//031E 	362A

		//;main.c: 1933: WDT_INITIAL();
		LCALL 	607H 			//031F 	3607

		//;main.c: 1934: INT_INITIAL();
		LCALL 	5F3H 			//0320 	35F3

		//;main.c: 1935: EEPROM_Init();
		LCALL 	539H 			//0321 	3539

		//;main.c: 1936: Version_Write();
		LCALL 	4FDH 			//0322 	34FD

		//;main.c: 1942: PC5 = 0;
		BCR 	STATUS,5 		//0323 	1283
		ORG		0324H
		BCR 	STATUS,6 		//0324 	1303
		BCR 	7H,5 			//0325 	1287

		//;main.c: 1943: PA6 = 0;
		BCR 	5H,6 			//0326 	1305
		BSR 	STATUS,5 		//0327 	1A83
		BCR 	7H,3 			//0328 	1187
		BCR 	STATUS,5 		//0329 	1283
		BCR 	7H,3 			//032A 	1187

		//;main.c: 1946: DelayMs(250);
		LDWI 	FAH 			//032B 	2AFA
		ORG		032CH
		LCALL 	5B9H 			//032C 	35B9

		//;main.c: 1947: DelayMs(250);
		LDWI 	FAH 			//032D 	2AFA
		LCALL 	5B9H 			//032E 	35B9

		//;main.c: 1948: DelayMs(250);
		LDWI 	FAH 			//032F 	2AFA
		LCALL 	5B9H 			//0330 	35B9

		//;main.c: 1949: DelayMs(250);
		LDWI 	FAH 			//0331 	2AFA
		LCALL 	5B9H 			//0332 	35B9

		//;main.c: 1952: TestFunc_Enable();
		LCALL 	632H 			//0333 	3632
		ORG		0334H

		//;main.c: 1954: if(!PA2 && !PA4 && !PA3)
		BCR 	STATUS,5 		//0334 	1283
		BTSS 	5H,2 			//0335 	1D05
		BTSC 	5H,4 			//0336 	1605
		LJUMP 	34EH 			//0337 	3B4E
		BTSC 	5H,3 			//0338 	1585
		LJUMP 	34EH 			//0339 	3B4E

		//;main.c: 1955: {
		//;main.c: 1956: DelayMs(100);
		LDWI 	64H 			//033A 	2A64
		LCALL 	5B9H 			//033B 	35B9
		ORG		033CH

		//;main.c: 1958: if(!PA2 && !PA4 && !PA3)
		BCR 	STATUS,5 		//033C 	1283
		BCR 	STATUS,6 		//033D 	1303
		BTSS 	5H,2 			//033E 	1D05
		BTSC 	5H,4 			//033F 	1605
		LJUMP 	34EH 			//0340 	3B4E
		BTSC 	5H,3 			//0341 	1585
		LJUMP 	34EH 			//0342 	3B4E

		//;main.c: 1959: {
		//;main.c: 1962: DelayMs(250);
		LDWI 	FAH 			//0343 	2AFA
		ORG		0344H
		LCALL 	5B9H 			//0344 	35B9

		//;main.c: 1963: DelayMs(250);
		LDWI 	FAH 			//0345 	2AFA
		LCALL 	5B9H 			//0346 	35B9

		//;main.c: 1964: DelayMs(250);
		LDWI 	FAH 			//0347 	2AFA
		LCALL 	5B9H 			//0348 	35B9

		//;main.c: 1965: DelayMs(250);
		LDWI 	FAH 			//0349 	2AFA
		LCALL 	5B9H 			//034A 	35B9

		//;main.c: 1967: Solar_BaseDefine();
		LCALL 	159H 			//034B 	3159
		ORG		034CH

		//;main.c: 1971: while(1)
		CLRWDT	 			//034C 	0001
		LJUMP 	34CH 			//034D 	3B4C

		//;main.c: 1975: }
		//;main.c: 1976: }
		//;main.c: 1978: TestFunc_Disable();
		LCALL 	642H 			//034E 	3642

		//;main.c: 1981: PA6 = 1;
		BSR 	5H,6 			//034F 	1B05

		//;main.c: 1982: DelayMs(200);
		LDWI 	C8H 			//0350 	2AC8
		LCALL 	5B9H 			//0351 	35B9

		//;main.c: 1983: DelayMs(200);
		LDWI 	C8H 			//0352 	2AC8
		LCALL 	5B9H 			//0353 	35B9
		ORG		0354H

		//;main.c: 1984: PA6 = 0;
		BCR 	STATUS,5 		//0354 	1283
		BCR 	STATUS,6 		//0355 	1303
		BCR 	5H,6 			//0356 	1305

		//;main.c: 1985: DelayMs(200);
		LDWI 	C8H 			//0357 	2AC8
		LCALL 	5B9H 			//0358 	35B9

		//;main.c: 1986: DelayMs(200);
		LDWI 	C8H 			//0359 	2AC8
		LCALL 	5B9H 			//035A 	35B9

		//;main.c: 1987: DelayMs(200);
		LDWI 	C8H 			//035B 	2AC8
		ORG		035CH
		LCALL 	5B9H 			//035C 	35B9

		//;main.c: 1988: PA6 = 1;
		BCR 	STATUS,5 		//035D 	1283
		BCR 	STATUS,6 		//035E 	1303
		BSR 	5H,6 			//035F 	1B05

		//;main.c: 1989: DelayMs(200);
		LDWI 	C8H 			//0360 	2AC8
		LCALL 	5B9H 			//0361 	35B9

		//;main.c: 1990: DelayMs(200);
		LDWI 	C8H 			//0362 	2AC8
		LCALL 	5B9H 			//0363 	35B9
		ORG		0364H

		//;main.c: 1991: PA6 = 0;
		BCR 	STATUS,5 		//0364 	1283
		BCR 	STATUS,6 		//0365 	1303
		BCR 	5H,6 			//0366 	1305

		//;main.c: 2025: if(AD_baseGetFuc() == 0)
		LCALL 	51BH 			//0367 	351B
		XORWI 	0H 			//0368 	2600
		BTSS 	STATUS,2 		//0369 	1D03
		LJUMP 	36CH 			//036A 	3B6C

		//;main.c: 2026: AD_baseGetFuc();
		LCALL 	51BH 			//036B 	351B
		ORG		036CH

		//;main.c: 2030: g_gloRecValue = (g_adBaseValue * 13)/10;
		LDWI 	AH 			//036C 	2A0A
		BCR 	STATUS,5 		//036D 	1283
		STR 	20H 			//036E 	01A0
		CLRR 	21H 			//036F 	0121
		LDR 	63H,0 			//0370 	0863
		STR 	73H 			//0371 	01F3
		LDR 	62H,0 			//0372 	0862
		STR 	72H 			//0373 	01F2
		ORG		0374H
		LDWI 	DH 			//0374 	2A0D
		STR 	74H 			//0375 	01F4
		CLRR 	75H 			//0376 	0175
		LCALL 	58BH 			//0377 	358B
		LCALL 	39EH 			//0378 	339E
		LCALL 	462H 			//0379 	3462
		LDR 	21H,0 			//037A 	0821
		STR 	61H 			//037B 	01E1
		ORG		037CH
		LDR 	20H,0 			//037C 	0820
		STR 	60H 			//037D 	01E0

		//;main.c: 2031: g_cdsCmp = g_gloRecValue-g_adBaseValue;
		LDR 	62H,0 			//037E 	0862
		SUBWR 	60H,0 			//037F 	0C60
		STR 	66H 			//0380 	01E6

		//;main.c: 2035: while(1)
		CLRWDT	 			//0381 	0001

		//;main.c: 2038: if(g_checkMode == OFF_MODE)
		BCR 	STATUS,5 		//0382 	1283
		BCR 	STATUS,6 		//0383 	1303
		ORG		0384H
		LDR 	47H,0 			//0384 	0847
		BTSS 	STATUS,2 		//0385 	1D03
		LJUMP 	389H 			//0386 	3B89

		//;main.c: 2039: {
		//;main.c: 2040: main_i = chrg_ModeCheck();
		LCALL 	434H 			//0387 	3434
		STR 	79H 			//0388 	01F9

		//;main.c: 2041: }
		//;main.c: 2043: if(main_i != 1)
		DECR 	79H,0 			//0389 	0D79
		BTSC 	STATUS,2 		//038A 	1503
		LJUMP 	394H 			//038B 	3B94
		ORG		038CH

		//;main.c: 2044: {
		//;main.c: 2046: ADON = 1;
		BSR 	1FH,0 			//038C 	181F

		//;main.c: 2047: DelayMs(1);
		LDWI 	1H 			//038D 	2A01
		LCALL 	5B9H 			//038E 	35B9

		//;main.c: 2049: Sola_checkFuc();
		LCALL 	240H 			//038F 	3240

		//;main.c: 2050: ADON = 0;
		BCR 	1FH,0 			//0390 	101F

		//;main.c: 2052: GLO_cdsCheckFuc();
		LCALL 	3A3H 			//0391 	33A3

		//;main.c: 2054: Mode_changeCheckFuc();
		LCALL 	3FAH 			//0392 	33FA

		//;main.c: 2056: Event_checkFuc();
		LCALL 	3BH 			//0393 	303B
		ORG		0394H

		//;main.c: 2057: }
		//;main.c: 2058: main_i = 0;
		CLRR 	79H 			//0394 	0179

		//;main.c: 2059: if((g_checkMode != OFF_MODE) || PC1)
		BCR 	STATUS,5 		//0395 	1283
		LDR 	47H,0 			//0396 	0847
		BTSS 	STATUS,2 		//0397 	1D03
		LJUMP 	39BH 			//0398 	3B9B
		BTSS 	7H,1 			//0399 	1C87
		LJUMP 	381H 			//039A 	3B81
		CLRWDT	 			//039B 	0001
		ORG		039CH
		SLEEP	 			//039C 	0002
		LJUMP 	381H 			//039D 	3B81
		LDR 	73H,0 			//039E 	0873
		STR 	23H 			//039F 	01A3
		LDR 	72H,0 			//03A0 	0872
		STR 	22H 			//03A1 	01A2
		RET		 					//03A2 	0004

		//;main.c: 1309: unsigned char m_adpre;
		//;main.c: 1310: static unsigned char av_check_lt = 0;
		//;main.c: 1311: static unsigned char av_check_dt = 0;
		//;main.c: 1314: if(g_gloCntTimer > 0x80)
		LDWI 	81H 			//03A3 	2A81
		ORG		03A4H
		SUBWR 	69H,0 			//03A4 	0C69
		BTSS 	STATUS,0 		//03A5 	1C03
		LJUMP 	3D8H 			//03A6 	3BD8

		//;main.c: 1315: {
		//;main.c: 1316: g_gloCntTimer--;
		DECR 	69H,1 			//03A7 	0DE9

		//;main.c: 1317: if(g_gloCntTimer==0x80)
		LDWI 	80H 			//03A8 	2A80
		XORWR 	69H,0 			//03A9 	0469
		BTSS 	STATUS,2 		//03AA 	1D03
		LJUMP 	3D8H 			//03AB 	3BD8
		ORG		03ACH

		//;main.c: 1318: {
		//;main.c: 1320: if(g_gloEnvt_st == NORMAL_ENVT)
		DECRSZ 	6AH,0 		//03AC 	0E6A
		LJUMP 	3B7H 			//03AD 	3BB7

		//;main.c: 1321: g_gloRecValue = g_adBaseValue + g_cdsCmp;
		LDR 	66H,0 			//03AE 	0866
		STR 	60H 			//03AF 	01E0
		CLRR 	61H 			//03B0 	0161
		LDR 	62H,0 			//03B1 	0862
		ADDWR 	60H,1 			//03B2 	0BE0
		BTSC 	STATUS,0 		//03B3 	1403
		ORG		03B4H
		INCR	61H,1 			//03B4 	09E1
		LDR 	63H,0 			//03B5 	0863
		LJUMP 	3D7H 			//03B6 	3BD7

		//;main.c: 1322: else
		//;main.c: 1323: if(g_gloEnvt_st == BEYOND_ENVT)
		LDWI 	2H 			//03B7 	2A02
		XORWR 	6AH,0 			//03B8 	046A
		BTSS 	STATUS,2 		//03B9 	1D03
		LJUMP 	3D8H 			//03BA 	3BD8

		//;main.c: 1324: {
		//;main.c: 1326: m_adpre = g_adBaseValue*100/g_gloCurValue;
		LDR 	5FH,0 			//03BB 	085F
		ORG		03BCH
		STR 	21H 			//03BC 	01A1
		LDR 	5EH,0 			//03BD 	085E
		STR 	20H 			//03BE 	01A0
		LDR 	63H,0 			//03BF 	0863
		STR 	73H 			//03C0 	01F3
		LDR 	62H,0 			//03C1 	0862
		STR 	72H 			//03C2 	01F2
		LDWI 	64H 			//03C3 	2A64
		ORG		03C4H
		STR 	74H 			//03C4 	01F4
		CLRR 	75H 			//03C5 	0175
		LCALL 	58BH 			//03C6 	358B
		LCALL 	39EH 			//03C7 	339E
		LCALL 	462H 			//03C8 	3462
		LDR 	20H,0 			//03C9 	0820
		STR 	78H 			//03CA 	01F8

		//;main.c: 1328: if(m_adpre < 40)
		LDWI 	28H 			//03CB 	2A28
		ORG		03CCH
		SUBWR 	78H,0 			//03CC 	0C78
		BTSS 	STATUS,0 		//03CD 	1C03
		LJUMP 	3AEH 			//03CE 	3BAE

		//;main.c: 1330: else
		//;main.c: 1331: {
		//;main.c: 1332: g_gloRecValue = g_gloCurValue + g_cdsCmp;
		LDR 	66H,0 			//03CF 	0866
		STR 	60H 			//03D0 	01E0
		CLRR 	61H 			//03D1 	0161
		LDR 	5EH,0 			//03D2 	085E
		ADDWR 	60H,1 			//03D3 	0BE0
		ORG		03D4H
		BTSC 	STATUS,0 		//03D4 	1403
		INCR	61H,1 			//03D5 	09E1
		LDR 	5FH,0 			//03D6 	085F
		ADDWR 	61H,1 			//03D7 	0BE1

		//;main.c: 1333: }
		//;main.c: 1334: }
		//;main.c: 1336: }
		//;main.c: 1338: }
		//;main.c: 1341: if( g_gloCurValue > g_gloRecValue)
		LDR 	5FH,0 			//03D8 	085F
		SUBWR 	61H,0 			//03D9 	0C61
		BTSS 	STATUS,2 		//03DA 	1D03
		LJUMP 	3DEH 			//03DB 	3BDE
		ORG		03DCH
		LDR 	5EH,0 			//03DC 	085E
		SUBWR 	60H,0 			//03DD 	0C60
		BTSC 	STATUS,0 		//03DE 	1403
		LJUMP 	3E9H 			//03DF 	3BE9
		LDWI 	2H 			//03E0 	2A02

		//;main.c: 1342: {
		//;main.c: 1343: av_check_lt++;
		INCR	65H,1 			//03E1 	09E5

		//;main.c: 1344: av_check_dt= 0;
		CLRR 	64H 			//03E2 	0164

		//;main.c: 1346: if(av_check_lt > 1)
		SUBWR 	65H,0 			//03E3 	0C65
		ORG		03E4H
		BTSS 	STATUS,0 		//03E4 	1C03
		RET		 					//03E5 	0004

		//;main.c: 1347: {
		//;main.c: 1348: av_check_lt = 0;
		CLRR 	65H 			//03E6 	0165

		//;main.c: 1349: ((g_checkStBits) &= ~(0B00000010));
		BCR 	68H,1 			//03E7 	10E8
		RET		 					//03E8 	0004

		//;main.c: 1353: if( g_gloCurValue <= g_adBaseValue)
		LDR 	5FH,0 			//03E9 	085F
		SUBWR 	63H,0 			//03EA 	0C63
		BTSS 	STATUS,2 		//03EB 	1D03
		ORG		03ECH
		LJUMP 	3EFH 			//03EC 	3BEF
		LDR 	5EH,0 			//03ED 	085E
		SUBWR 	62H,0 			//03EE 	0C62
		BTSS 	STATUS,0 		//03EF 	1C03
		RET		 					//03F0 	0004
		LDWI 	2H 			//03F1 	2A02

		//;main.c: 1354: {
		//;main.c: 1355: av_check_dt++;
		INCR	64H,1 			//03F2 	09E4

		//;main.c: 1356: av_check_lt = 0;
		CLRR 	65H 			//03F3 	0165
		ORG		03F4H

		//;main.c: 1358: if(av_check_dt > 1)
		SUBWR 	64H,0 			//03F4 	0C64
		BTSS 	STATUS,0 		//03F5 	1C03
		RET		 					//03F6 	0004

		//;main.c: 1359: {
		//;main.c: 1360: av_check_dt = 0;
		CLRR 	64H 			//03F7 	0164

		//;main.c: 1361: ((g_checkStBits) |= (0B00000010));
		BSR 	68H,1 			//03F8 	18E8
		RET		 					//03F9 	0004

		//;main.c: 772: do{TRISA |= 0B00011100;WPUA |= 0B00011100;}while(0);;
		LDWI 	1CH 			//03FA 	2A1C
		BSR 	STATUS,5 		//03FB 	1A83
		ORG		03FCH
		IORWR 	5H,1 			//03FC 	0385
		IORWR 	15H,1 			//03FD 	0395

		//;main.c: 773: DelayMs(1);
		LDWI 	1H 			//03FE 	2A01
		LCALL 	5B9H 			//03FF 	35B9

		//;main.c: 775: if(!PA2 || !PA4 || !PA3)
		BCR 	STATUS,5 		//0400 	1283
		BCR 	STATUS,6 		//0401 	1303
		BTSC 	5H,2 			//0402 	1505
		BTSS 	5H,4 			//0403 	1E05
		ORG		0404H
		LJUMP 	407H 			//0404 	3C07
		BTSC 	5H,3 			//0405 	1585
		LJUMP 	41DH 			//0406 	3C1D

		//;main.c: 776: {
		//;main.c: 777: DelayMs(10);
		LDWI 	AH 			//0407 	2A0A
		LCALL 	5B9H 			//0408 	35B9

		//;main.c: 778: if(!PA2 || !PA4 || !PA3)
		BCR 	STATUS,5 		//0409 	1283
		BCR 	STATUS,6 		//040A 	1303
		BTSC 	5H,2 			//040B 	1505
		ORG		040CH
		BTSS 	5H,4 			//040C 	1E05
		LJUMP 	410H 			//040D 	3C10
		BTSC 	5H,3 			//040E 	1585
		LJUMP 	42DH 			//040F 	3C2D

		//;main.c: 779: {
		//;main.c: 781: if(!PA2)
		BTSC 	5H,2 			//0410 	1505
		LJUMP 	414H 			//0411 	3C14

		//;main.c: 782: {
		//;main.c: 784: g_checkMode = OFF2HI_MODE;
		LDWI 	1H 			//0412 	2A01
		LJUMP 	41BH 			//0413 	3C1B
		ORG		0414H

		//;main.c: 785: }
		//;main.c: 786: else if(!PA4)
		BTSC 	5H,4 			//0414 	1605
		LJUMP 	418H 			//0415 	3C18

		//;main.c: 787: {
		//;main.c: 789: g_checkMode = GLO_MODE;
		LDWI 	3H 			//0416 	2A03
		LJUMP 	41BH 			//0417 	3C1B

		//;main.c: 790: }
		//;main.c: 791: else if(!PA3)
		BTSC 	5H,3 			//0418 	1585
		LJUMP 	42DH 			//0419 	3C2D

		//;main.c: 792: {
		//;main.c: 794: g_checkMode = GLO2HI_MODE;
		LDWI 	2H 			//041A 	2A02
		STR 	47H 			//041B 	01C7
		ORG		041CH

		//;main.c: 795: }
		//;main.c: 796: }
		//;main.c: 798: }else
		LJUMP 	42DH 			//041C 	3C2D

		//;main.c: 799: if((PORTA & 0B00011100) == 0B00011100)
		LDWI 	1CH 			//041D 	2A1C
		ANDWR 	5H,0 			//041E 	0205
		STR 	77H 			//041F 	01F7
		XORWI 	1CH 			//0420 	261C
		BTSS 	STATUS,2 		//0421 	1D03
		LJUMP 	42DH 			//0422 	3C2D

		//;main.c: 800: {
		//;main.c: 801: DelayMs(10);
		LDWI 	AH 			//0423 	2A0A
		ORG		0424H
		LCALL 	5B9H 			//0424 	35B9

		//;main.c: 802: if((PORTA & 0B00011100) == 0B00011100)
		LDWI 	1CH 			//0425 	2A1C
		BCR 	STATUS,5 		//0426 	1283
		BCR 	STATUS,6 		//0427 	1303
		ANDWR 	5H,0 			//0428 	0205
		STR 	77H 			//0429 	01F7
		XORWI 	1CH 			//042A 	261C
		BTSC 	STATUS,2 		//042B 	1503
		ORG		042CH

		//;main.c: 803: {
		//;main.c: 805: g_checkMode = OFF_MODE;
		CLRR 	47H 			//042C 	0147
		LJUMP 	42EH 			//042D 	3C2E
		LDWI 	E3H 			//042E 	2AE3
		BSR 	STATUS,5 		//042F 	1A83
		ANDWR 	5H,1 			//0430 	0285
		BCR 	STATUS,5 		//0431 	1283
		ANDWR 	5H,1 			//0432 	0285
		RET		 					//0433 	0004
		ORG		0434H

		//;main.c: 1115: unsigned char ch_i;
		//;main.c: 1118: if(!PC1)
		BTSC 	7H,1 			//0434 	1487
		RETW 	0H 			//0435 	2100

		//;main.c: 1119: {
		//;main.c: 1120: DelayMs(100);
		LDWI 	64H 			//0436 	2A64
		LCALL 	5B9H 			//0437 	35B9

		//;main.c: 1121: if(!PC1)
		BCR 	STATUS,5 		//0438 	1283
		BCR 	STATUS,6 		//0439 	1303
		BTSC 	7H,1 			//043A 	1487
		RETW 	0H 			//043B 	2100
		ORG		043CH

		//;main.c: 1125: {
		//;main.c: 1126: Charg_Disp();
		LCALL 	5A4H 			//043C 	35A4

		//;main.c: 1128: for(ch_i = 10;ch_i--;)
		LDWI 	AH 			//043D 	2A0A
		STR 	78H 			//043E 	01F8
		LJUMP 	45EH 			//043F 	3C5E
		CLRWDT	 			//0440 	0001

		//;main.c: 1131: DelayMs(100);
		LDWI 	64H 			//0441 	2A64
		LCALL 	5B9H 			//0442 	35B9

		//;main.c: 1132: if(!PA2 || !PA4 || !PA3 || PC1)
		BCR 	STATUS,5 		//0443 	1283
		ORG		0444H
		BCR 	STATUS,6 		//0444 	1303
		BTSC 	5H,2 			//0445 	1505
		BTSS 	5H,4 			//0446 	1E05
		LJUMP 	44CH 			//0447 	3C4C
		BTSS 	5H,3 			//0448 	1D85
		LJUMP 	44CH 			//0449 	3C4C
		BTSS 	7H,1 			//044A 	1C87
		LJUMP 	45EH 			//044B 	3C5E
		ORG		044CH

		//;main.c: 1133: {
		//;main.c: 1134: DelayMs(100);
		LDWI 	64H 			//044C 	2A64
		LCALL 	5B9H 			//044D 	35B9

		//;main.c: 1135: if(!PA2 || !PA4 || !PA3 || PC1)
		BCR 	STATUS,5 		//044E 	1283
		BCR 	STATUS,6 		//044F 	1303
		BTSC 	5H,2 			//0450 	1505
		BTSS 	5H,4 			//0451 	1E05
		LJUMP 	457H 			//0452 	3C57
		BTSS 	5H,3 			//0453 	1D85
		ORG		0454H
		LJUMP 	457H 			//0454 	3C57
		BTSS 	7H,1 			//0455 	1C87
		LJUMP 	45EH 			//0456 	3C5E
		CLRWDT	 			//0457 	0001

		//;main.c: 1138: SWDTEN = 0;
		BCR 	STATUS,5 		//0458 	1283
		BCR 	STATUS,6 		//0459 	1303
		BCR 	18H,0 			//045A 	1018

		//;main.c: 1139: if(PC1)
		BTSC 	7H,1 			//045B 	1487
		ORG		045CH

		//;main.c: 1140: {
		//;main.c: 1141: return 1;
		RETW 	1H 			//045C 	2101

		//;main.c: 1143: else
		//;main.c: 1144: {
		//;main.c: 1145: return 2;
		RETW 	2H 			//045D 	2102
		DECR 	78H,1 			//045E 	0DF8
		INCRSZ 	78H,0 		//045F 	0A78
		LJUMP 	440H 			//0460 	3C40
		LJUMP 	43CH 			//0461 	3C3C
		CLRR 	25H 			//0462 	0125
		CLRR 	26H 			//0463 	0126
		ORG		0464H
		LDR 	20H,0 			//0464 	0820
		IORWR 	21H,0 			//0465 	0321
		BTSC 	STATUS,2 		//0466 	1503
		LJUMP 	487H 			//0467 	3C87
		CLRR 	24H 			//0468 	0124
		INCR	24H,1 			//0469 	09A4
		BTSC 	21H,7 			//046A 	17A1
		LJUMP 	470H 			//046B 	3C70
		ORG		046CH
		BCR 	STATUS,0 		//046C 	1003
		RLR 	20H,1 			//046D 	05A0
		RLR 	21H,1 			//046E 	05A1
		LJUMP 	469H 			//046F 	3C69
		BCR 	STATUS,0 		//0470 	1003
		RLR 	25H,1 			//0471 	05A5
		RLR 	26H,1 			//0472 	05A6
		LDR 	21H,0 			//0473 	0821
		ORG		0474H
		SUBWR 	23H,0 			//0474 	0C23
		BTSS 	STATUS,2 		//0475 	1D03
		LJUMP 	479H 			//0476 	3C79
		LDR 	20H,0 			//0477 	0820
		SUBWR 	22H,0 			//0478 	0C22
		BTSS 	STATUS,0 		//0479 	1C03
		LJUMP 	483H 			//047A 	3C83
		LDR 	20H,0 			//047B 	0820
		ORG		047CH
		SUBWR 	22H,1 			//047C 	0CA2
		LDR 	21H,0 			//047D 	0821
		BTSS 	STATUS,0 		//047E 	1C03
		DECR 	23H,1 			//047F 	0DA3
		SUBWR 	23H,1 			//0480 	0CA3
		BSR 	25H,0 			//0481 	1825
		BCR 	STATUS,0 		//0482 	1003
		RRR	21H,1 			//0483 	06A1
		ORG		0484H
		RRR	20H,1 			//0484 	06A0
		DECRSZ 	24H,1 		//0485 	0EA4
		LJUMP 	470H 			//0486 	3C70
		LDR 	26H,0 			//0487 	0826
		STR 	21H 			//0488 	01A1
		LDR 	25H,0 			//0489 	0825
		STR 	20H 			//048A 	01A0
		RET		 					//048B 	0004
		ORG		048CH

		//;main.c: 335: unsigned char ReadAPin;
		//;main.c: 338: if(INTE && INTF)
		BTSC 	INTCON,4 		//048C 	160B
		BTSS 	INTCON,1 		//048D 	1C8B
		LJUMP 	492H 			//048E 	3C92

		//;main.c: 339: {
		//;main.c: 340: INTF = 0;
		BCR 	INTCON,1 		//048F 	108B

		//;main.c: 341: INTE = 1;
		BSR 	INTCON,4 		//0490 	1A0B

		//;main.c: 347: }else
		LJUMP 	49AH 			//0491 	3C9A

		//;main.c: 349: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//0492 	158B
		BTSS 	INTCON,0 		//0493 	1C0B
		ORG		0494H
		LJUMP 	49AH 			//0494 	3C9A

		//;main.c: 350: {
		//;main.c: 351: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0495 	1283
		BCR 	STATUS,6 		//0496 	1303
		LDR 	5H,0 			//0497 	0805

		//;main.c: 352: PAIF = 0;
		BCR 	INTCON,0 		//0498 	100B

		//;main.c: 353: PAIE = 1;
		BSR 	INTCON,3 		//0499 	198B

		//;main.c: 366: }
		//;main.c: 369: if(TMR1IF)
		BCR 	STATUS,5 		//049A 	1283
		BCR 	STATUS,6 		//049B 	1303
		ORG		049CH
		BTSS 	CH,0 			//049C 	1C0C
		LJUMP 	4ADH 			//049D 	3CAD

		//;main.c: 370: {
		//;main.c: 371: TMR1IF = 0;
		BCR 	CH,0 			//049E 	100C

		//;main.c: 376: TMR1L = 0XC0;
		LDWI 	C0H 			//049F 	2AC0
		STR 	EH 			//04A0 	018E

		//;main.c: 378: TMR1H = 0XE0;
		LDWI 	E0H 			//04A1 	2AE0
		STR 	FH 			//04A2 	018F

		//;main.c: 381: if(g_ledkeep > 0)g_ledkeep--;
		LDR 	7AH,0 			//04A3 	087A
		ORG		04A4H
		IORWR 	7BH,0 			//04A4 	037B
		BTSC 	STATUS,2 		//04A5 	1503
		LJUMP 	4ADH 			//04A6 	3CAD
		LDWI 	1H 			//04A7 	2A01
		SUBWR 	7AH,1 			//04A8 	0CFA
		LDWI 	0H 			//04A9 	2A00
		BTSS 	STATUS,0 		//04AA 	1C03
		DECR 	7BH,1 			//04AB 	0DFB
		ORG		04ACH
		SUBWR 	7BH,1 			//04AC 	0CFB
		LDR 	71H,0 			//04AD 	0871
		STR 	PCLATH 			//04AE 	018A
		SWAPR 	70H,0 			//04AF 	0770
		STR 	STATUS 			//04B0 	0183
		SWAPR 	7EH,1 			//04B1 	07FE
		SWAPR 	7EH,0 			//04B2 	077E
		RETI		 			//04B3 	0009
		ORG		04B4H
		STR 	78H 			//04B4 	01F8

		//;main.c: 540: if(AN_CH != 0)
		LDR 	78H,0 			//04B5 	0878
		BTSC 	STATUS,2 		//04B6 	1503
		LJUMP 	4C6H 			//04B7 	3CC6

		//;main.c: 541: {
		//;main.c: 542: AD_chBuff = ADCON0 & 0B11100011;
		BCR 	STATUS,5 		//04B8 	1283
		BCR 	STATUS,6 		//04B9 	1303
		LDR 	1FH,0 			//04BA 	081F
		STR 	75H 			//04BB 	01F5
		ORG		04BCH
		LDWI 	E3H 			//04BC 	2AE3
		ANDWR 	75H,1 			//04BD 	02F5

		//;main.c: 544: AN_CH <<= 2;
		BCR 	STATUS,0 		//04BE 	1003
		RLR 	78H,1 			//04BF 	05F8
		BCR 	STATUS,0 		//04C0 	1003
		RLR 	78H,1 			//04C1 	05F8

		//;main.c: 545: AD_chBuff |= AN_CH;
		LDR 	78H,0 			//04C2 	0878
		IORWR 	75H,1 			//04C3 	03F5
		ORG		04C4H

		//;main.c: 547: ADCON0 = AD_chBuff;
		LDR 	75H,0 			//04C4 	0875
		STR 	1FH 			//04C5 	019F
		CLRWDT	 			//04C6 	0001

		//;main.c: 551: GO_DONE = 1;
		BCR 	STATUS,5 		//04C7 	1283
		BCR 	STATUS,6 		//04C8 	1303
		BSR 	1FH,1 			//04C9 	189F

		//;main.c: 552: while( GO_DONE==1 );
		BTSC 	1FH,1 			//04CA 	149F
		LJUMP 	4CAH 			//04CB 	3CCA
		ORG		04CCH

		//;main.c: 557: ADC_DATA = ADRESH;
		LDR 	1EH,0 			//04CC 	081E
		STR 	76H 			//04CD 	01F6
		CLRR 	77H 			//04CE 	0177

		//;main.c: 558: ADC_DATA <<= 8;
		STR 	77H 			//04CF 	01F7
		CLRR 	76H 			//04D0 	0176

		//;main.c: 559: ADC_DATA |= ADRESL;
		BSR 	STATUS,5 		//04D1 	1A83
		LDR 	1EH,0 			//04D2 	081E
		IORWR 	76H,1 			//04D3 	03F6
		ORG		04D4H

		//;main.c: 562: return ADC_DATA;
		LDR 	77H,0 			//04D4 	0877
		STR 	73H 			//04D5 	01F3
		LDR 	76H,0 			//04D6 	0876
		STR 	72H 			//04D7 	01F2
		RET		 					//04D8 	0004

		//;main.c: 1645: unsigned char ad_vl,ad_vh;
		//;main.c: 1646: unsigned char ad_cl,ad_ch;
		//;main.c: 1648: ad_vl = (unsigned char)ad_vt;
		LDR 	75H,0 			//04D9 	0875
		STR 	22H 			//04DA 	01A2

		//;main.c: 1650: ad_vh = (unsigned char)(ad_vt>>8)&0xff;
		LDR 	76H,0 			//04DB 	0876
		ORG		04DCH
		STR 	23H 			//04DC 	01A3

		//;main.c: 1653: EEPROMwrite(0x12, ad_vh);
		LDR 	23H,0 			//04DD 	0823
		STR 	72H 			//04DE 	01F2
		LDWI 	12H 			//04DF 	2A12
		LCALL 	555H 			//04E0 	3555

		//;main.c: 1654: EEPROMwrite(0x13, ad_vl);
		LCALL 	4F8H 			//04E1 	34F8
		LCALL 	555H 			//04E2 	3555

		//;main.c: 1656: ad_ch = EEPROMread(0x12);
		LDWI 	12H 			//04E3 	2A12
		ORG		04E4H
		LCALL 	619H 			//04E4 	3619
		BCR 	STATUS,5 		//04E5 	1283
		STR 	21H 			//04E6 	01A1

		//;main.c: 1657: ad_cl = EEPROMread(0x13);
		LDWI 	13H 			//04E7 	2A13
		LCALL 	619H 			//04E8 	3619
		BCR 	STATUS,5 		//04E9 	1283
		STR 	20H 			//04EA 	01A0

		//;main.c: 1660: if((ad_cl != ad_vl ) || (ad_ch != ad_vh))
		XORWR 	22H,0 			//04EB 	0422
		ORG		04ECH
		BTSS 	STATUS,2 		//04EC 	1D03
		LJUMP 	4F2H 			//04ED 	3CF2
		LDR 	21H,0 			//04EE 	0821
		XORWR 	23H,0 			//04EF 	0423
		BTSC 	STATUS,2 		//04F0 	1503
		RET		 					//04F1 	0004

		//;main.c: 1661: {
		//;main.c: 1662: EEPROMwrite(0x12, ad_vh);
		LDR 	23H,0 			//04F2 	0823
		STR 	72H 			//04F3 	01F2
		ORG		04F4H
		LDWI 	12H 			//04F4 	2A12
		LCALL 	555H 			//04F5 	3555

		//;main.c: 1663: EEPROMwrite(0x13, ad_vl);
		LCALL 	4F8H 			//04F6 	34F8
		LJUMP 	555H 			//04F7 	3D55
		BCR 	STATUS,5 		//04F8 	1283
		BCR 	STATUS,6 		//04F9 	1303
		LDR 	22H,0 			//04FA 	0822
		STR 	72H 			//04FB 	01F2
		ORG		04FCH
		RETW 	13H 			//04FC 	2113

		//;main.c: 1585: unsigned char V_d, D_d,V_rd, D_rd;
		//;main.c: 1589: EEPROMwrite(0x01, 0x84);
		LDWI 	84H 			//04FD 	2A84
		STR 	72H 			//04FE 	01F2
		LDWI 	1H 			//04FF 	2A01
		LCALL 	555H 			//0500 	3555

		//;main.c: 1590: EEPROMwrite(0x02, 0x10);
		LDWI 	10H 			//0501 	2A10
		STR 	72H 			//0502 	01F2
		LDWI 	2H 			//0503 	2A02
		ORG		0504H
		LCALL 	555H 			//0504 	3555

		//;main.c: 1593: V_d = EEPROMread(0x01);
		LDWI 	1H 			//0505 	2A01
		LCALL 	619H 			//0506 	3619
		STR 	75H 			//0507 	01F5

		//;main.c: 1594: D_d = EEPROMread(0x02);
		LDWI 	2H 			//0508 	2A02
		LCALL 	619H 			//0509 	3619
		STR 	76H 			//050A 	01F6

		//;main.c: 1596: if((V_d != 0x84) || (D_d != 0x10))
		LDWI 	84H 			//050B 	2A84
		ORG		050CH
		XORWR 	75H,0 			//050C 	0475
		BTSS 	STATUS,2 		//050D 	1D03
		LJUMP 	513H 			//050E 	3D13
		LDWI 	10H 			//050F 	2A10
		XORWR 	76H,0 			//0510 	0476
		BTSC 	STATUS,2 		//0511 	1503
		RET		 					//0512 	0004

		//;main.c: 1597: {
		//;main.c: 1598: EEPROMwrite(0x01, 0x84);
		LDWI 	84H 			//0513 	2A84
		ORG		0514H
		STR 	72H 			//0514 	01F2
		LDWI 	1H 			//0515 	2A01
		LCALL 	555H 			//0516 	3555

		//;main.c: 1599: EEPROMwrite(0x02, 0x10);
		LDWI 	10H 			//0517 	2A10
		STR 	72H 			//0518 	01F2
		LDWI 	2H 			//0519 	2A02
		LJUMP 	555H 			//051A 	3D55

		//;main.c: 1615: unsigned char ad_vl,ad_vh,ad_vl2,ad_vh2;
		//;main.c: 1617: ad_vh = EEPROMread(0x12);
		LDWI 	12H 			//051B 	2A12
		ORG		051CH
		LCALL 	619H 			//051C 	3619
		STR 	77H 			//051D 	01F7

		//;main.c: 1618: ad_vl = EEPROMread(0x13);
		LDWI 	13H 			//051E 	2A13
		LCALL 	619H 			//051F 	3619
		STR 	76H 			//0520 	01F6

		//;main.c: 1620: ad_vh2 = EEPROMread(0x12);
		LDWI 	12H 			//0521 	2A12
		LCALL 	619H 			//0522 	3619
		STR 	75H 			//0523 	01F5
		ORG		0524H

		//;main.c: 1621: ad_vl2 = EEPROMread(0x13);
		LDWI 	13H 			//0524 	2A13
		LCALL 	619H 			//0525 	3619
		STR 	74H 			//0526 	01F4

		//;main.c: 1623: if((ad_vh == ad_vh2) && (ad_vl == ad_vl2))
		LDR 	77H,0 			//0527 	0877
		XORWR 	75H,0 			//0528 	0475
		BTSS 	STATUS,2 		//0529 	1D03
		RETW 	0H 			//052A 	2100
		LDR 	76H,0 			//052B 	0876
		ORG		052CH
		XORWR 	74H,0 			//052C 	0474
		BTSS 	STATUS,2 		//052D 	1D03
		RETW 	0H 			//052E 	2100

		//;main.c: 1624: {
		//;main.c: 1625: g_adBaseValue = (unsigned int)ad_vh;
		LDR 	77H,0 			//052F 	0877
		BCR 	STATUS,5 		//0530 	1283
		STR 	62H 			//0531 	01E2
		CLRR 	63H 			//0532 	0163

		//;main.c: 1627: g_adBaseValue <<= 8;
		LDR 	62H,0 			//0533 	0862
		ORG		0534H
		STR 	63H 			//0534 	01E3
		CLRR 	62H 			//0535 	0162

		//;main.c: 1628: g_adBaseValue |= ad_vl;
		LDR 	76H,0 			//0536 	0876
		IORWR 	62H,1 			//0537 	03E2

		//;main.c: 1629: return 1;
		RETW 	1H 			//0538 	2101

		//;main.c: 1552: unsigned char ep_t;
		//;main.c: 1554: EEPROMwrite(0x03, 0xAA);
		LDWI 	AAH 			//0539 	2AAA
		STR 	72H 			//053A 	01F2
		LDWI 	3H 			//053B 	2A03
		ORG		053CH
		LCALL 	555H 			//053C 	3555

		//;main.c: 1556: ep_t = EEPROMread(0X03);
		LDWI 	3H 			//053D 	2A03
		LCALL 	619H 			//053E 	3619
		STR 	75H 			//053F 	01F5

		//;main.c: 1558: if(ep_t != 0xAA)
		XORWI 	AAH 			//0540 	26AA

		//;main.c: 1559: {
		//;main.c: 1560: EEPROMwrite(0x03, 0xAA);
		LDWI 	AAH 			//0541 	2AAA
		STR 	72H 			//0542 	01F2
		LDWI 	3H 			//0543 	2A03
		ORG		0544H
		BTSC 	STATUS,2 		//0544 	1503
		LJUMP 	54AH 			//0545 	3D4A
		LCALL 	555H 			//0546 	3555

		//;main.c: 1561: }
		//;main.c: 1564: EEPROMwrite(0x03, 0xAA);
		LDWI 	AAH 			//0547 	2AAA
		STR 	72H 			//0548 	01F2
		LDWI 	3H 			//0549 	2A03
		LCALL 	555H 			//054A 	3555

		//;main.c: 1566: ep_t = EEPROMread(0X03);
		LDWI 	3H 			//054B 	2A03
		ORG		054CH
		LCALL 	619H 			//054C 	3619
		STR 	75H 			//054D 	01F5

		//;main.c: 1568: if(ep_t != 0xAA)
		XORWI 	AAH 			//054E 	26AA
		BTSC 	STATUS,2 		//054F 	1503
		RET		 					//0550 	0004

		//;main.c: 1569: {
		//;main.c: 1570: EEPROMwrite(0x03, 0xAA);
		LDWI 	AAH 			//0551 	2AAA
		STR 	72H 			//0552 	01F2
		LDWI 	3H 			//0553 	2A03
		ORG		0554H
		LJUMP 	555H 			//0554 	3D55
		STR 	73H 			//0555 	01F3

		//;main.c: 1519: unsigned char gietag;
		//;main.c: 1521: gietag = GIE;
		LDWI 	0H 			//0556 	2A00
		BTSC 	INTCON,7 		//0557 	178B
		LDWI 	1H 			//0558 	2A01
		STR 	74H 			//0559 	01F4

		//;main.c: 1522: GIE = 0;
		BCR 	INTCON,7 		//055A 	138B

		//;main.c: 1523: while(GIE);
		BTSC 	INTCON,7 		//055B 	178B
		ORG		055CH
		LJUMP 	55BH 			//055C 	3D5B

		//;main.c: 1527: EEADR = EEAddr;
		LDR 	73H,0 			//055D 	0873
		BSR 	STATUS,5 		//055E 	1A83
		BCR 	STATUS,6 		//055F 	1303
		STR 	1BH 			//0560 	019B

		//;main.c: 1528: EEDAT = Data;
		LDR 	72H,0 			//0561 	0872
		STR 	1AH 			//0562 	019A

		//;main.c: 1529: EEIF = 0;
		BCR 	STATUS,5 		//0563 	1283
		ORG		0564H
		BCR 	CH,7 			//0564 	138C

		//;main.c: 1530: EECON1 |= 0x34;
		LDWI 	34H 			//0565 	2A34
		BSR 	STATUS,5 		//0566 	1A83
		IORWR 	1CH,1 			//0567 	039C

		//;main.c: 1531: WR = 1;
		BSR 	1DH,0 			//0568 	181D

		//;main.c: 1532: while(WR);
		BTSC 	1DH,0 			//0569 	141D
		LJUMP 	569H 			//056A 	3D69

		//;main.c: 1536: GIE = gietag;
		BTSS 	74H,0 			//056B 	1C74
		ORG		056CH
		LJUMP 	56FH 			//056C 	3D6F
		BSR 	INTCON,7 		//056D 	1B8B
		RET		 					//056E 	0004
		BCR 	INTCON,7 		//056F 	138B
		RET		 					//0570 	0004

		//;main.c: 470: OSCCON = 0B01100001;
		LDWI 	61H 			//0571 	2A61
		BSR 	STATUS,5 		//0572 	1A83
		STR 	FH 			//0573 	018F
		ORG		0574H

		//;main.c: 472: INTCON = 0;
		CLRR 	INTCON 			//0574 	010B

		//;main.c: 473: TRISA = 0B10011101;
		LDWI 	9DH 			//0575 	2A9D
		STR 	5H 			//0576 	0185

		//;main.c: 474: PORTA = 0;
		BCR 	STATUS,5 		//0577 	1283
		CLRR 	5H 			//0578 	0105

		//;main.c: 476: TRISC = 0B00001011;
		LDWI 	BH 			//0579 	2A0B
		BSR 	STATUS,5 		//057A 	1A83
		STR 	7H 			//057B 	0187
		ORG		057CH

		//;main.c: 481: PORTC = 0;
		BCR 	STATUS,5 		//057C 	1283
		CLRR 	7H 			//057D 	0107

		//;main.c: 483: WPUA = 0B00011100;
		LDWI 	1CH 			//057E 	2A1C
		BSR 	STATUS,5 		//057F 	1A83
		STR 	15H 			//0580 	0195

		//;main.c: 484: WPUC = 0;
		CLRR 	8H 			//0581 	0108

		//;main.c: 485: WPUC1 = 1;
		BSR 	8H,1 			//0582 	1888

		//;main.c: 489: OPTION = 0B00001000;
		LDWI 	8H 			//0583 	2A08
		ORG		0584H
		STR 	1H 			//0584 	0181

		//;main.c: 493: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0585 	1283
		CLRR 	1BH 			//0586 	011B

		//;main.c: 496: CMCON0 = 0B00000111;
		LDWI 	7H 			//0587 	2A07
		STR 	19H 			//0588 	0199

		//;main.c: 499: g_checkStBits = 0;
		CLRR 	68H 			//0589 	0168
		RET		 					//058A 	0004
		CLRR 	76H 			//058B 	0176
		ORG		058CH
		CLRR 	77H 			//058C 	0177
		BTSS 	72H,0 			//058D 	1C72
		LJUMP 	595H 			//058E 	3D95
		LDR 	74H,0 			//058F 	0874
		ADDWR 	76H,1 			//0590 	0BF6
		BTSC 	STATUS,0 		//0591 	1403
		INCR	77H,1 			//0592 	09F7
		LDR 	75H,0 			//0593 	0875
		ORG		0594H
		ADDWR 	77H,1 			//0594 	0BF7
		BCR 	STATUS,0 		//0595 	1003
		RLR 	74H,1 			//0596 	05F4
		RLR 	75H,1 			//0597 	05F5
		BCR 	STATUS,0 		//0598 	1003
		RRR	73H,1 			//0599 	06F3
		RRR	72H,1 			//059A 	06F2
		LDR 	72H,0 			//059B 	0872
		ORG		059CH
		IORWR 	73H,0 			//059C 	0373
		BTSS 	STATUS,2 		//059D 	1D03
		LJUMP 	58DH 			//059E 	3D8D
		LDR 	77H,0 			//059F 	0877
		STR 	73H 			//05A0 	01F3
		LDR 	76H,0 			//05A1 	0876
		STR 	72H 			//05A2 	01F2
		RET		 					//05A3 	0004
		ORG		05A4H

		//;main.c: 1146: }
		//;main.c: 1147: }
		//;main.c: 1148: }
		//;main.c: 1149: }
		//;main.c: 1150: }
		//;main.c: 1151: }
		//;main.c: 1152: }
		//;main.c: 1153: return 0;
		BCR 	STATUS,5 		//05A4 	1283
		BCR 	STATUS,6 		//05A5 	1303
		BCR 	7H,5 			//05A6 	1287

		//;main.c: 408: chg_t = 150;
		LDWI 	96H 			//05A7 	2A96
		STR 	77H 			//05A8 	01F7

		//;main.c: 409: while(chg_t--)
		DECR 	77H,1 			//05A9 	0DF7
		INCRSZ 	77H,0 		//05AA 	0A77
		LJUMP 	5ADH 			//05AB 	3DAD
		ORG		05ACH
		RET		 					//05AC 	0004
		CLRWDT	 			//05AD 	0001

		//;main.c: 412: PA6 = 1;
		BCR 	STATUS,5 		//05AE 	1283
		BCR 	STATUS,6 		//05AF 	1303
		BSR 	5H,6 			//05B0 	1B05

		//;main.c: 413: DelayMs(3);
		LDWI 	3H 			//05B1 	2A03
		LCALL 	5B9H 			//05B2 	35B9

		//;main.c: 414: PA6 = 0;
		BCR 	STATUS,5 		//05B3 	1283
		ORG		05B4H
		BCR 	STATUS,6 		//05B4 	1303
		BCR 	5H,6 			//05B5 	1305

		//;main.c: 415: DelayMs(7);
		LDWI 	7H 			//05B6 	2A07
		LCALL 	5B9H 			//05B7 	35B9
		LJUMP 	5A9H 			//05B8 	3DA9
		STR 	74H 			//05B9 	01F4

		//;main.c: 1459: unsigned char a,b;
		//;main.c: 1460: for(a=0;a<Time;a++)
		CLRR 	75H 			//05BA 	0175
		LDR 	74H,0 			//05BB 	0874
		ORG		05BCH
		SUBWR 	75H,0 			//05BC 	0C75
		BTSC 	STATUS,0 		//05BD 	1403
		LJUMP 	5CAH 			//05BE 	3DCA

		//;main.c: 1461: {
		//;main.c: 1462: for(b=0;b<5;b++)
		CLRR 	76H 			//05BF 	0176

		//;main.c: 1463: {
		//;main.c: 1464: DelayUs(98);
		LDWI 	62H 			//05C0 	2A62
		LCALL 	610H 			//05C1 	3610
		LDWI 	5H 			//05C2 	2A05
		INCR	76H,1 			//05C3 	09F6
		ORG		05C4H
		SUBWR 	76H,0 			//05C4 	0C76
		BTSS 	STATUS,0 		//05C5 	1C03
		LJUMP 	5C0H 			//05C6 	3DC0
		CLRWDT	 			//05C7 	0001
		INCR	75H,1 			//05C8 	09F5
		LJUMP 	5BBH 			//05C9 	3DBB
		CLRWDT	 			//05CA 	0001
		RET		 					//05CB 	0004
		ORG		05CCH
		CLRWDT	 			//05CC 	0001

		//;main.c: 624: SWDTEN = 0;
		BCR 	STATUS,5 		//05CD 	1283
		BCR 	STATUS,6 		//05CE 	1303
		BCR 	18H,0 			//05CF 	1018

		//;main.c: 626: IOCA &= 0B01111111;
		BSR 	STATUS,5 		//05D0 	1A83
		BCR 	16H,7 			//05D1 	1396

		//;main.c: 628: ReadAPin = PORTA;
		BCR 	STATUS,5 		//05D2 	1283
		LDR 	5H,0 			//05D3 	0805
		ORG		05D4H

		//;main.c: 629: PAIF = 0;
		BCR 	INTCON,0 		//05D4 	100B

		//;main.c: 631: INTF =0;
		BCR 	INTCON,1 		//05D5 	108B

		//;main.c: 632: INTE =1;
		BSR 	INTCON,4 		//05D6 	1A0B
		LDWI 	1CH 			//05D7 	2A1C
		BSR 	STATUS,5 		//05D8 	1A83
		IORWR 	5H,1 			//05D9 	0385
		IORWR 	15H,1 			//05DA 	0395
		RET		 					//05DB 	0004
		ORG		05DCH

		//;main.c: 432: T1CON = 0B00000000;
		CLRR 	10H 			//05DC 	0110

		//;main.c: 435: TMR1L = 0XC0;
		LDWI 	C0H 			//05DD 	2AC0
		STR 	EH 			//05DE 	018E

		//;main.c: 437: TMR1H = 0XE0;
		LDWI 	E0H 			//05DF 	2AE0
		STR 	FH 			//05E0 	018F

		//;main.c: 439: TMR1IE = 1;
		BSR 	STATUS,5 		//05E1 	1A83
		BSR 	CH,0 			//05E2 	180C

		//;main.c: 440: TMR1ON = 1;
		BCR 	STATUS,5 		//05E3 	1283
		ORG		05E4H
		BSR 	10H,0 			//05E4 	1810

		//;main.c: 441: PEIE=1;
		BSR 	INTCON,6 		//05E5 	1B0B

		//;main.c: 442: GIE = 1;
		BSR 	INTCON,7 		//05E6 	1B8B
		RET		 					//05E7 	0004

		//;main.c: 395: PC5 = 0;
		BCR 	STATUS,5 		//05E8 	1283
		BCR 	STATUS,6 		//05E9 	1303
		BCR 	7H,5 			//05EA 	1287

		//;main.c: 396: PA6 = 1;
		BSR 	5H,6 			//05EB 	1B05
		ORG		05ECH

		//;main.c: 397: DelayMs(100);
		LDWI 	64H 			//05EC 	2A64
		LCALL 	5B9H 			//05ED 	35B9
		CLRWDT	 			//05EE 	0001

		//;main.c: 399: PA6 = 0;
		BCR 	STATUS,5 		//05EF 	1283
		BCR 	STATUS,6 		//05F0 	1303
		BCR 	5H,6 			//05F1 	1305
		RET		 					//05F2 	0004

		//;main.c: 593: unsigned char ReadAPin;
		//;main.c: 597: IOCA = 0B10011100;
		LDWI 	9CH 			//05F3 	2A9C
		ORG		05F4H
		BSR 	STATUS,5 		//05F4 	1A83
		STR 	16H 			//05F5 	0196

		//;main.c: 598: ReadAPin = PORTA;
		BCR 	STATUS,5 		//05F6 	1283
		LDR 	5H,0 			//05F7 	0805

		//;main.c: 600: INTEDG =0;
		BSR 	STATUS,5 		//05F8 	1A83
		BCR 	1H,6 			//05F9 	1301

		//;main.c: 604: PAIF = 0;
		BCR 	INTCON,0 		//05FA 	100B

		//;main.c: 605: PAIE = 1;
		BSR 	INTCON,3 		//05FB 	198B
		ORG		05FCH

		//;main.c: 606: GIE =1;
		BSR 	INTCON,7 		//05FC 	1B8B
		RET		 					//05FD 	0004

		//;main.c: 649: unsigned char ReadAPin;
		//;main.c: 651: WDT_INITIAL();
		LCALL 	607H 			//05FE 	3607

		//;main.c: 652: IOCA |= 0B10000000;
		BSR 	STATUS,5 		//05FF 	1A83
		BSR 	16H,7 			//0600 	1B96

		//;main.c: 653: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0601 	1283
		LDR 	5H,0 			//0602 	0805

		//;main.c: 654: PAIF = 0;
		BCR 	INTCON,0 		//0603 	100B
		ORG		0604H

		//;main.c: 656: INTF =0;
		BCR 	INTCON,1 		//0604 	108B

		//;main.c: 657: INTE =0;
		BCR 	INTCON,4 		//0605 	120B
		LJUMP 	42EH 			//0606 	3C2E
		CLRWDT	 			//0607 	0001

		//;main.c: 577: PSA = 0;
		BSR 	STATUS,5 		//0608 	1A83
		BCR 	STATUS,6 		//0609 	1303
		BCR 	1H,3 			//060A 	1181

		//;main.c: 578: WDTCON = 0B00010010;
		LDWI 	12H 			//060B 	2A12
		ORG		060CH
		BCR 	STATUS,5 		//060C 	1283
		STR 	18H 			//060D 	0198

		//;main.c: 580: SWDTEN = 1;
		BSR 	18H,0 			//060E 	1818
		RET		 					//060F 	0004
		STR 	72H 			//0610 	01F2

		//;main.c: 1443: unsigned char a;
		//;main.c: 1444: for(a=0;a<Time;a++)
		CLRR 	73H 			//0611 	0173
		LDR 	72H,0 			//0612 	0872
		SUBWR 	73H,0 			//0613 	0C73
		ORG		0614H
		BTSC 	STATUS,0 		//0614 	1403
		RET		 					//0615 	0004

		//;main.c: 1445: {
		//;main.c: 1446: __nop();
		NOP		 					//0616 	0000
		INCR	73H,1 			//0617 	09F3
		LJUMP 	612H 			//0618 	3E12

		//;main.c: 1631: return 0;
		STR 	72H 			//0619 	01F2

		//;main.c: 1499: unsigned char ReEEPROMread;
		//;main.c: 1501: EEADR = EEAddr;
		BSR 	STATUS,5 		//061A 	1A83
		BCR 	STATUS,6 		//061B 	1303
		ORG		061CH
		STR 	1BH 			//061C 	019B

		//;main.c: 1502: RD = 1;
		BSR 	1CH,0 			//061D 	181C

		//;main.c: 1503: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//061E 	081A
		STR 	73H 			//061F 	01F3

		//;main.c: 1504: RD = 0;
		BCR 	1CH,0 			//0620 	101C

		//;main.c: 1505: return ReEEPROMread;
		RET		 					//0621 	0004
		CLRWDT	 			//0622 	0001
		CLRR 	INDF 			//0623 	0100
		ORG		0624H
		INCR	FSR,1 			//0624 	0984
		XORWR 	FSR,0 			//0625 	0404
		BTSC 	STATUS,2 		//0626 	1503
		RETW 	0H 			//0627 	2100
		XORWR 	FSR,0 			//0628 	0404
		LJUMP 	623H 			//0629 	3E23

		//;main.c: 513: ANSEL = 0B00010001;
		LDWI 	11H 			//062A 	2A11
		BSR 	STATUS,5 		//062B 	1A83
		ORG		062CH
		STR 	11H 			//062C 	0191

		//;main.c: 514: ADCON1 = 0B00000000;
		CLRR 	1FH 			//062D 	011F

		//;main.c: 517: ADCON0 = 0B10000000;
		LDWI 	80H 			//062E 	2A80
		BCR 	STATUS,5 		//062F 	1283
		STR 	1FH 			//0630 	019F
		RET		 					//0631 	0004

		//;main.c: 1876: do{TRISA |= 0B00011100;WPUA |= 0B00011100;}while(0);;
		LDWI 	1CH 			//0632 	2A1C
		BSR 	STATUS,5 		//0633 	1A83
		ORG		0634H
		BCR 	STATUS,6 		//0634 	1303
		IORWR 	5H,1 			//0635 	0385
		IORWR 	15H,1 			//0636 	0395
		RET		 					//0637 	0004

		//;main.c: 455: TMR1IE = 0;
		BSR 	STATUS,5 		//0638 	1A83
		BCR 	CH,0 			//0639 	100C

		//;main.c: 456: TMR1ON = 0;
		BCR 	STATUS,5 		//063A 	1283
		BCR 	10H,0 			//063B 	1010
		ORG		063CH

		//;main.c: 457: PEIE=0;
		BCR 	INTCON,6 		//063C 	130B
		RET		 					//063D 	0004
		LJUMP 	43H 			//063E 	3843
		LJUMP 	4EH 			//063F 	384E
		LJUMP 	ADH 			//0640 	38AD
		LJUMP 	120H 			//0641 	3920

		//;main.c: 1907: do{TRISA &= 0B11100011;PORTA &= 0B11100011;}while(0);;
		LJUMP 	42EH 			//0642 	3C2E
			END
