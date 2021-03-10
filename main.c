/***************************************************************************************
* FILE		: main.c
* Description	: 
*			  
* Copyright (c) 2020 by KLIV. All Rights Reserved.
* 
* History:
* Version		Name       		Date			Description
   1.0		kevin zhong	2020/05/13	Initial Version
   
*****************************
������̣�WDT 512ms����һ�μ���غ�̫���ܰ�ĵ�ѹ �˴��漰�� WDT��AD
		  ���ʵʱ��������״̬����ͨ��WDT�����INT���ѣ�PIR_CTR��Test_port2��Key_OFF2HI��Test_port1��KEY_GLO��KEY_GLO2HI��
		  
20200702	���ڲ������ؿ����л��ܿ쵼���ж��޷��������ж�ֻ�𵽻���sleep���ã���Mode_changeCheckFuc�д����ƽ�任ʶ��
20200704	�����������С�����½ӵغ󹦺ĺܴ󣬸�Ϊ���ش�λ�����0��֮������λ�������led�����ڼ�����Ϊ�������Ƿ��п��ز���
20200729	��С̫���ܲ���������ʱ�䣬�������������Ƽ��
20200817	solar check��PC2�ĳ�PA0,TestPort3��PA0�ĳ�PC0
2020024		��Ӱ汾��¼
20200904	�����������ҵ�BISS���ԣ�����˶��ڷ�BISS��⣨OFF��GLO��ʱBISS�����ߺ���Ҫ�õ�BISS��OFF2HI,GLO2HI��ʱBISS������ģʽ�л�
20200909	����LED���Ƶĳ�����ʽ�����������PIR����ڣ���Ϊ��PIR�źź������20S�����ж�ʵ�֣���Ӳ����������Ӧ�ĵ�����һ�δ���68ms�����ʱ��1.4S��
			��ӦӲ���汾KLV_MB22084_Ver1.0202000909_PIR68MS
20200919	���������������ȣ�����LED����ʱ���к㶨���󴥷�����Ӳ��������ʱ���Ϊ2S��Ϊ��ϴ˹��ܣ������ƽ���ǰ2S��BIS�رգ�Ȼ�����������ʱ�����
			��BIS���´������2S��Ӳ������ʱ��

20201021	ȥ����USB�˵Ĳ��Զ���ģʽ����Ϊ��⿪��ȫ���Ͷ���
20201103	���������ʾ�Ͳ���usb�Զ�����������INTΪ����Դ
20201126	������ȥ��PC4�ļ��
20201216    ��Hi_LED port ��ΪPC5
20201218    �Ժ�����Ϊ���ģʽ�����ѷ�ʽ��ע��charge�����˳�ʱ  ���صĶ˿��Ƿ���Ҫ����

20201229	1���޸�GLOON ��GLODFF��ʵ��
			2�����GLO����������ֻ�����ģʽ��NORMAL_ENVT��BEYOND_ENVT
			3��������Sola_checkFuc���ɺ���Sola_checkFuc��GLO_cdsCheckFuc

20210104	1���޸�����ͨ״GLOģʽ�µķ�ֵ���Է�ֹ�˿��������˸
			2���޸���һ��BUD��beyondģʽ�¡��������ֵӦ��'<' ������'>'

20210105	��CDS_COMP�滻��һ�����ݶ���ֵ��̬�趨��g_cdsCmp
****************************************************************************************/
#include <syscfg.h>
#include "PF462XXX.h"
/***********************�궨��*****************************/
#define  uint8_t     unsigned char 
#define  uint16_t      unsigned int
#define  uint32_t     unsigned long

//#define BIT0	(0x01 << 0)
//#define BIT1	(0x01 << 1)
//#define BIT2	(0x01 << 2)
//#define BIT3	(0x01 << 3)
//#define BIT4	(0x01 << 4)
//#define BIT5	(0x01 << 5)
//#define BIT6	(0x01 << 6)
//#define BIT7	(0x01 << 7)
#define BIT0	0B00000001
#define BIT1	0B00000010
#define BIT2	0B00000100
#define BIT3	0B00001000
#define BIT4	0B00010000
#define BIT5	0B00100000
#define BIT6	0B01000000
#define BIT7	0B10000000



#define SET_BIT(REG, BIT)     ((REG) |= (BIT))
#define CLEAR_BIT(REG, BIT)   ((REG) &= ~(BIT))
#define READ_BIT(REG, BIT)    ((REG) & (BIT))
#define CLEAR_REG(REG)        ((REG) = (0x0))
#define WRITE_REG(REG, VAL)   ((REG) = (VAL))
#define READ_REG(REG)         ((REG))



#define	PIR_CTR    		PA7
//#define	HI_PORT			PA5
#define	HI_PORT			PC5

//#define	Sola_check		PC2		//AN6
#define	Sola_check		PA0		//AN0

#define	Key_OFF2HI		PA2
//#define	LED_CTR			PC4


//#define	Batt_check		PC0		//AN4
//#define	KEY_GLO			PA3
//#define	KEY_GLO2HI		PA4
#define	KEY_GLO			PA4
#define	KEY_GLO2HI		PA3

#define GLO_PORT		PA6

//����������������
#define OFF2HI_PULL		do{TRISA2=1;WPUA2=1;}while(0);
#define GLO2HI_PULL		do{TRISA3=1;WPUA3=1;}while(0);
#define GLO_PULL		do{TRISA4=1;WPUA4=1;}while(0);
#define ALL_KEY_PULL	do{TRISA |= 0B00011100;WPUA |= 0B00011100;}while(0);

//#define KEY_CHECK_OFF2HI	(PORTA | 0B00011000)!= 0B00011000  
//#define KEY_CHECK_GLO2HI	(PORTA | 0B00010100)!= 0B00010100
//#define KEY_CHECK_GLO		(PORTA | 0B00001100)!= 0B00001100

//�������0����
#define OFF2HI_DOWN		do{TRISA2=0;PA2=0;}while(0); 
#define GLO2HI_DOWN		do{TRISA3=0;PA3=0;}while(0); 
#define GLO_DOWN		do{TRISA4=0;PA4=0;}while(0); 
#define ALL_KEYD_DOWN	do{TRISA &= 0B11100011;PORTA &= 0B11100011;}while(0);

#define  PWM3Dir  		TRISC4

#define SOLA_EN_BIT		BIT1
//#define PIR_EN_BIT		BIT2
#define KEY_EN_BIT		BIT3
#define TEST_EN_BIT		BIT4

#define OFF_STATE_BIT	0B00011100		//�������Ŷ����ø���Ϊoff״̬

//led�����ͷ��ʱ�����
//#define LED_KEEPON_TIME 10000			//����ʱ�� 10000x2ms=20s
#define LED_KEEPON_TIME 9000			//����ʱ�� 9000x2ms=18s + 2S �����𴥷�ʱ��
#define LED_WAIT_OFF_TRIG	1000		//����ǰ����BISS
#define LED_WAIT_TIME	1000			//������ĵȴ�ʱ�䣬��ʱ���ڴ�����Ч
#define	LED_KEEPCLOSE_TIME	700			//���ʱ�� 700x2ms=1.4s

//#define AV_BASE_VLAU	403				//��Ӧ1.3V
//#define AV_BASE_VLAU	294				
//#define AV_BASE_VL	3
#define AV_LEVE_CHECK	93				//0.3V
//#define AV_BASE_VL	297
//#define AV_LIGHT_VL(x)  	(x + (AV_LEVE_CHECK<<1))	//�Ӱ������Ļ�ֵ +0.6V
#define AV_LIGHT_VL(x)  	(x + AV_LEVE_CHECK)	//�Ӱ������Ļ�ֵ +0.3V
#define AV_DACK_VL(x)		(x - AV_LEVE_CHECK)		//���������Ļ�ֵ -0.3V
#define SOLAR_CHECK_TIME	2			//̫���ܰ�������������
#define SOLAR_LOOP_TIME	2

//#define SOLAR_DEFINE_UP_LEVE	7

//#define SOLAR_DEFINE_DOWN_LEVE	12

//#define CDS_COMP	35
#define CDS_COMP_MAX	40		//40%
#define CDS_REVISE_PER	13		//1.3

#define BATERY_VOLTAGE	646		//4.16V
//#define BATTERY_CHEK_TIME	20		//20X520MS ��10S
#define BATTERY_CHEK_TIME	3		//2X520MS ��1S


//�汾��д�����
#define VERSION_TADD	0x01
#define VERSION_VADD	0x02

#define VERSION_T	0x84
#define VERSION_V	0x10

#define DIO  	PA1				//������������
#define RCLK  	PC3				//ʱ�������źš�����������Ч
#define SCLK  	PC5				//�����źš���������������Ч

#define DIODir 		TRISA1
#define RCLKDir		TRISC3
#define SCLKDir  	TRISC5

#define LEDON	HI_PORT = 1
#define LEDOFF	HI_PORT = 0
#define GLOON	GLO_PORT = 1
#define GLOOFF	GLO_PORT = 0




#define GLO_TIMEON	do{		\
			g_gloCntTimer = 0;\
			g_gloCntTimer |= 0x82;}while(0);			//0B10000010 BIT7Ϊʹ��λ������7λΪ��ʱλ


#define GLO_TIMEOFF	do{		\
			g_gloCntTimer = 0;}while(0);			//BIT7��0 ���ܶ�ʱ������7λ�����ʼ����ʱ��

#define GLO_TURNON	do{if(!GLO_PORT){	\
										GLOON; \
										GLO_TIMEON;}\
									}while(0);
			
			
#define GLO_TURNOFF	do{if(GLO_PORT){	\
										GLOOFF;	\
										GLO_TIMEOFF;}\
									}while(0);


#define CHRG_PORT		PC1		//USB ����,����ʱ�����ͣ��γ������ߣ���Ҫ������
//#define CHRG_PULL		WPUC4	//pc4��������
#define CHRG_PULL		WPUC1	//pc4��������

//test ʹ��
#define BEEP  			PA1			//�������˿�
//
//#define	Test_port1		PC1
//#define	Test_port2		PC4
//#define Test_port3		PC0


//#define  IIC_SCLDIR  TRISC1
//#define  IIC_SDADIR	 TRISC4
//
//#define  IIC_SCLPULL	WPUC1
//#define  IIC_SDAPULL	WPUC4

//#define  TESTPORT1_DIR  TRISC1
//#define  TESTPORT2_DIR	 TRISC4
//#define 	TESTPORT_ENDIR	TRISA1
//#define 	TESTPORT_VALUE	PA1

//#define  TESTPORT1_SCLPULL	WPUC1
//#define  TESTPORT2_SDAPULL	WPUC4
//#define  TESTPORT_ENPULL	WPUA1


#define BIS_SLEEP		do{TRISC3 = 0;PC3=0;}while(0);		//BISS��AC=0
#define BIS_WORK		TRISC3 = 1				//����AC


//����5�ֹ���ģʽ������INITAL_MODEΪ�ϵ���״̬ģʽ
typedef enum{
	OFF_MODE,
	OFF2HI_MODE,
	GLO2HI_MODE,
	GLO_MODE,
	INITAL_MODE
}checkMode_type;

typedef enum{
	SUM2MOON,		//����״̬
	MOON2SUN		//��ҹ״̬
}LIGHT_STATUS;

typedef enum{
	INITAL_ENVT,
	NORMAL_ENVT,		//�Ƿ���������ģʽ
	BEYOND_ENVT			//�з�����ʹ������
}GLO_ENVT_STATUS;

//typedef enum{
//
//	USB_NOIUSE_ST,		//USBδ����
//	USB_CHRG_NOTFULL,	//usb���뵫δ����
//	USB_CHRG_FULL		//USB���룬������
//}CHRG_MODE_STATUS;


#define FILTER_TOTAL	10
#define FLITER_PRE		2


/***********************ȫ�ֱ�������*****************************/
volatile checkMode_type g_checkMode=INITAL_MODE;

volatile uint16_t g_adBaseValue = 0;
volatile GLO_ENVT_STATUS g_gloEnvt_st = INITAL_ENVT;
volatile uint8_t g_gloCntTimer = 0;				//GLO���ⶨʱ����BIT7Ϊʹ��λ��Bit0~Bit6Ϊ��ʱλ��WDT 0.5Sһ�Σ���ʱ1S
volatile uint16_t g_gloRecValue = 0;				//GLO�����ż�ֵ
volatile uint16_t g_gloCurValue = 0;				//GLO����ģʽ��ǰֵ
//volatile checkMode_type g_checkMode_pre=INITAL_MODE;


volatile uint8_t g_checkStBits = 0;			//bit0:sola check,bit1:Pir check,bit2: �������ؼ�⣬bit3:����ģʽ���

//volatile uint8_t g_piren = 0;				//=0 PIRδ������=1 PIR����

volatile LIGHT_STATUS g_light_stvalue = SUM2MOON;

volatile uint16_t g_ledkeep = 0;
//volatile uint8_t g_ch_tim = BATTERY_CHEK_TIME;
volatile uint8_t g_event_t = INITAL_MODE;

volatile uint8_t g_cdsCmp = 0;
//volatile CHRG_MODE_STATUS g_chrgmod_t;
/***********************��������*****************************/
void POWER_INITIAL (void);
void ADC_INITIAL (void);
uint16_t GET_ADC_DATA (uint8_t AN_CH);
void PWM_INITIAL(uint16_t frz_t,uint8_t div);
void WDT_INITIAL (void);
void INT_INITIAL(void);
void eventEnterOFF(void);
void eventExitOFF(void);
void DelayUs(uint8_t Time);
void DelayMs(uint8_t Time);
void DelayS(uint8_t Time);
void Test_modeFuc(void);
void Mode_changeCheckFuc(void);
void PWM_Disable(void);
void Sola_checkFuc(void);
void Solar_BaseDefine(void);

void EEPROMwrite(uint8_t EEAddr,uint8_t Data);
uint8_t EEPROMread(uint8_t EEAddr);
void EEPROM_Init(void);
void Version_Write(void);


uint8_t AD_baseGetFuc(void);
void AD_baseWriteFuc(uint16_t ad_vt);
void VREG_INITIAL(void);

//74HC595�������
void Seg_Display(uint16_t date);			// �������ʾ
void SegDisplay_Init(void);					//����ܳ�ʼ��
void Seg_OUT(uint8_t X);					// ����ܵ��ֽڴ�����λ����
void Seg_Lock(void);
void Event_checkFuc(void);
void Sola_baseCheck(void);
void oneBeep(void);							//һ������
void oneGLO(void);

void TIMER1_INTSTART(void);
void TIMER1_INTSTOP(void);

uint8_t chrg_ModeCheck(void);
void GLO_cdsCheckFuc(void);


//�������ģ��
// 0	 1	  2	   3	4	 5	  6	   7	8	 9	  A	   b	C    d	  E    F    -     .
//0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E,0xbf,0xef
uint8_t Seg_0F[] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E,0xbf,0xef};


/***********************��������*****************************/
void interrupt ISR(void)//PIC_HI-TECHʹ��
{ 
	uint8_t ReadAPin;

 //PC1�ⲿ�жϴ���**********************
	if(INTE && INTF)//
	{
		INTF = 0;  //��PC1 INT ��־λ
		INTE = 1;  //���Ƚ�ֹPC1�ж�
	//	SET_BIT(g_checkStBits, TEST_EN_BIT);		//����ģʽ��λ
	
//		WDT_INITIAL();			//����ʹ�ܿ��Ź�
//		g_checkStBits |= TEST_EN_BIT;

	}else
//PA��ƽ�仯�ж�**********************
	if(PAIE && PAIF)//
    {
		ReadAPin = PORTA; //��ȡPORTA������PAIF��־
		PAIF = 0;  //��PAIF��־λ
		PAIE = 1;  //���Ƚ�ֹPA0�ж�
	//	IOCA2 =0;  //��ֹPA0��ƽ�仯�ж�

//		if(PIR_CTR)	SET_BIT(g_checkStBits, PIR_EN_BIT);//PIR����

//		SET_BIT(g_checkStBits, KEY_EN_BIT);			//���������д���

//	if(PIR_CTR) g_checkStBits |= PIR_EN_BIT;			//PIR����
//	else
//	  g_checkStBits |= KEY_EN_BIT; 						//���������д���

	//	oneGLO();

    }

	  //��ʱ��1���жϴ���  2MS����һ��
	 if(TMR1IF)//
	{
		TMR1IF = 0;
		//TMR1L = 0XC0;  //��ʱ1MS=>TMR1=4000*0.125US=500US
		//��ֵ=65536-4000=61536=>0XF060
		//TMR1H = 0XE0;  //����ֵ=>TMR1H=0XE0;TMR1L=0XC0

		TMR1L = 0XC0;	//��ʱ500US=>TMR1=8000*0.25US=2ms
		//��ֵ=65536-8000=57536=>0XE0C0
		TMR1H = 0XE0;	//����ֵ=>TMR1H=0XC1;TMR1L=0X80	  
		 
//		GLO_PORT = ~GLO_PORT; //��ת��ƽ			
		if(g_ledkeep > 0)g_ledkeep--;
	} 
} 

void oneBeep()
{
	BEEP = 1;//������ʾ
	DelayMs(200);
	BEEP = 0;

}

void oneGLO()
{
	LEDOFF;
	GLOON;
	DelayMs(100);
	CLRWDT();
	GLOOFF;

}

void Charg_Disp(void)
{
	uint8_t chg_t;
	LEDOFF;

	chg_t = 150;
	while(chg_t--)
	{
		CLRWDT();		 //�忴�Ź�
		GLOON;
		DelayMs(3);
		GLOOFF;
		DelayMs(7);
	}
	
	
}

/*==================================================================
* Function	    : TIMER1_INTSTART
* Description	: TIMER1��ʱ���жϿ�������
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TIMER1_INTSTART()
{
	//��Ҫ���ж������¸���ʼֵ
	T1CON = 0B00000000; //B[5:4]=00,T1ʱ�ӷ�Ƶ 1:1
					 //B1=0,T1ʱ��Դѡ���ڲ�ʱ��
					 //T1SYNC=8M/2T=4M=0.25US
	TMR1L = 0XC0;	//��ʱ500US=>TMR1=8000*0.25US=2ms
	//��ֵ=65536-8000=57536=>0XE0C0
	TMR1H = 0XE0;	//����ֵ=>TMR1H=0XC1;TMR1L=0X80	  
	
	TMR1IE = 1;//ʹ��TMER1���ж�
	TMR1ON = 1;//ʹ��TMER1����
	PEIE=1;    //ʹ�������ж�
	GIE = 1;   //ʹ��ȫ���ж�

}
/*==================================================================
* Function	    : TIMER1_INTSTOP
* Description	: TIMER1��ʱ���жϹرպ���
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TIMER1_INTSTOP()
{
	TMR1IE = 0;//ʹ��TMER1���ж�
	TMR1ON = 0;//ʹ��TMER1����
	PEIE=0;    //ʹ�������ж�
}


/*==================================================================
* Function	: POWER_INITIAL
* Description	: ϵͳ��ʼ��
* Input Para	: 
* Output Para	: 
* Return Value: 
==================================================================*/
void POWER_INITIAL () 
{ 
	OSCCON = 0B01100001;	//WDT 32KHZ IRCF=110=8MHZ/2=4M,0.25US/T,SCS=1,ϵͳʱ��Ϊ�ڲ�����

	INTCON = 0;  			//�ݽ�ֹ�����ж�
	TRISA = 0B10011101;		//PA������� 0-��� 1-����
	PORTA = 0;

	TRISC = 0B00001011;		//PC������� 0-��� 1-����
							//PC0Ϊ���룬��ȥ��ص������
							//PC1Ϊ���룬�������Ƿ����
							//PC3Ϊ���룬������BISS0001 VC�ڵ�Ӱ��
							
	PORTC = 0;

	WPUA = 0B00011100;    	//PA�˿��������� 1-������ 0-������
	WPUC = 0;     			//PC�˿��������� 1-������ 0-������
	CHRG_PULL = 1;			//PC1����
//test��������
//	WPUC = 0B00010010;     	//PC�˿��������� 1-������ 0-������

	OPTION = 0B00001000;	//Bit3=1 WDT MODE,PS=000=1:1 WDT RATE	
							//Bit7(RAPU)=0 ENABLED PULL UP PA
					 		//Bit6=0 interrupt on falling edge of PC1
					 
	MSCKCON = 0B00000000;	//6B->0,��ֹPA4��PC5��ѹ���
					  		//5B->0,TIMER2ʱ��ΪFosc
					  		//4B->0,��ֹLVR       
	CMCON0 = 0B00000111; 	//�رձȽ�����CxINΪ����IO��


	g_checkStBits = 0;		//�������б�־λ
}

/*==================================================================
* Function	: ADC_INITIAL
* Description	: ADC��ʼ��
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark		��PA0(AN0)��PA1(AN1)��PA2(AN2)��PA3(AN3)��PC0(AN4)��PC1(AN5)��PC2(AN6)
				  ͨ��AN4(��ؼ��),AN6��̫���ܼ�⣩Ĭ��
==================================================================*/
void ADC_INITIAL () 
{	
	ANSEL = 0B00010001;   	//ʹ��AN0��AN4Ϊģ������	
	ADCON1 = 0B00000000; 	//DIVS=0,ʱ��ѡFOSC
					  	 	//ADCS[2:0]=000,��ƵFOSC/2(Fsys=16M����TAD=125ns)

	ADCON0 = 0B10000000;	//B7,ADFM=1,����Ҷ��� 					
							//B6:5,VCFG=00,�ο���ѹVDD
							//B4:2,CHS=000,ѡ��AN0ͨ��
							//B1,GO,AD =0 ���ڽ���
							//B0,ADON=0,ADC��ʹ��


	//GO_DONE = 1;			//ADC����ת��
	//ADON =	1;			//ʹ��ADC
}                      

/*==================================================================
* Function	: GET_ADC_DATA
* Description	: ��ȡͨ��ADCֵ
* Input Para	: AN_CH ͨ����ţ�0-6��6ΪĬ�ϣ�
* Output Para	: INT����ADֵ(���β������˲�)
* Return Value: 
==================================================================*/
uint16_t GET_ADC_DATA (uint8_t AN_CH) 
{ 
	uint8_t  AD_chBuff;
	uint16_t  ADC_DATA=0;

	if(AN_CH != 0)		//ͨ��ѡ��Ϊ��Ĭ��
	{
		AD_chBuff = ADCON0 & 0B11100011; 	//�������ͨ��

		AN_CH <<= 2;              
		AD_chBuff |=  AN_CH;   //(BIT4-BIT2)CHS=010,ѡ��AN2ͨ��      

		ADCON0 = AD_chBuff; //���¼���ͨ��ֵ
	}
	CLRWDT();
	
	GO_DONE = 1;             //����ADC 
	while( GO_DONE==1 );    //�ȴ�ADCת�����		����ι������
//	{
//		CLRWDT();
//	}

	ADC_DATA =  ADRESH;
	ADC_DATA <<= 8;
	ADC_DATA |= ADRESL;      //10Bit ADCֵ����

//	ADON = 0;				//�ر�ADC	
	return  ADC_DATA;
} 

/*==================================================================
* Function	: WDT_INITIAL
* Description	: ��ʼ�����ÿ��Ź�ʱ�临λ,��ʱʱ��=(16348*1)/32000=512ms
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark		��//��ؼĴ�����1��INTCON 2��OPTION 3��WDTCON
==================================================================*/
void WDT_INITIAL() 
{
  
	CLRWDT();  					//�忴�Ź�
	PSA = 0;     				//ʱ�ӷ�Ƶ�ָ�WDT
	WDTCON = 0B00010010;		//WDTPS=1001=1:16348,PS=000=1:1

	SWDTEN = 1;					//ʹ�ܿ��Ź�
}

/*==================================================================
* Function	: INT_INITIAL
* Description	:   �жϳ�ʼ������
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void INT_INITIAL()
{
	uint8_t ReadAPin;

	
//	ANSEL = 0B00000001;		//�ر��ж�����ģ�����빦��PA0(AN0)��PA1(AN1)��PA2(AN2)��PA3(AN3)��PC0(AN4)��PC1(AN5)��PC2(AN6)
	IOCA =  0B10011100;		//ʹ�� PA2 PA3 PA4   PA7 �˿�״̬�����ж�
	ReadAPin = PORTA;		//��PA��ƽ�仯�ж�
//INT��ʼ��
	INTEDG =0; 				//OPTION,INTEDG=0 Interrupt on falling edge of PC1 pin 
//	INTF =0;   				//�� PC1 INT�жϱ�־λ
//	INTE =1;   				//ʹ�� PC1 INT�ж�
//PA�仯��ʼ��
	PAIF = 0;				//��PA�ű仯�жϱ�־λ
	PAIE = 1;				//����PA�ű仯�ж�
	GIE =1;    			//ʹ��ȫ���ж�
}


/*==================================================================
* Function	    : eventEnterOFF
* Description	: ����offģʽǰ��׼��
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void eventEnterOFF()
{	
	uint8_t ReadAPin;


	CLRWDT();  
	SWDTEN = 0;					//���ܿ��Ź�
		
	IOCA &=	0B01111111; 	//����PA7 �˿�״̬�����ж�
	
	ReadAPin = PORTA;		//��PA��ƽ�仯�ж�
	PAIF = 0;
	
	INTF =0;   				//�� PC1 INT�жϱ�־λ
	INTE =1;   				//ʹ�� PC1 INT�ж�

	ALL_KEY_PULL;

}


/*==================================================================
* Function	    : eventExitOFF
* Description	: �˳�OFFģʽ��Ĳ���
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void eventExitOFF()
{	
	uint8_t ReadAPin;

	WDT_INITIAL();			//����ʹ�ܿ��Ź�
	IOCA |=	0B10000000; 	//ʹ��PA7 �˿�״̬�����ж�
	ReadAPin = PORTA;		//��PA��ƽ�仯�ж�
	PAIF = 0;

	INTF =0;   				//�� PC1 INT�жϱ�־λ
	INTE =0;   				//�� PC1 INT�ж�
	ALL_KEYD_DOWN;

}

/*==================================================================
* Function	: PWM_INITIAL
* Description	: 
* Input Para	: frz_t  ���Ƶ�� ��λHz����3�������Ϊ3Hz��,
				  div	 ռ�ձȣ�0-255; 
* Output Para	: 
* Return Value  : 
* Remark        : 
*����ص�TRISλ��1��ֹPWMx���ŵ������������
*װ��PWMxCR0�Ĵ���������PWMx���ڣ��жϲ�����ʽ�Լ�ѡ��ʱ��Դ��
*���ʵ���ֵװ��PWMxCR1�Ĵ�������ΪPWMģʽ�����ʵ�Ԥ��Ƶ�ȣ�
*װ��PRx�Ĵ�������PWMռ�ձȣ�
*���ò�����TIMERx��
	��PWMxCR1�Ĵ�����TMRXIF�жϱ�־λ����
	��PWMxCR1�Ĵ�����TMRxONλ��1����TIMERx
*���¿�ʼһ��PWM���ں�ʹ��PWM�����
	�ȴ�TIMERx�����PWMxCR1�Ĵ�����TMRxIFλ��1��
	����ص�TRISλ����ʹ��PWMx���ŵ����������
*PWM����=2^TMRXPS * 2^PXPER * [(T3CKDIV+1)/PWMʱ��Դ]

ע�⣺����T3CKDICΪ8bit���Ϊ255��������ֻ���䵽244Hz��Ƶ�ʼ�frz_t>244

==================================================================*/
void PWM_INITIAL(uint16_t frz_t,uint8_t div) 
{
  //-------------------------------
	PWM3Dir = 1; //PWM3���PIN��Ϊ����ģʽ
	//-------------------------------
	PWM3CR0 = 0B00110010; 	//	7	TMR3���ʱ�����ж�
							//	6:4	����λѡ��	011:8λ ��PXPER=8
							//	3:1	ʱ��ѡ��	001:�ڲ�RC��ʱ��/(T3CKDIV+1)
							//	0	PWM ���							
	PWM3CR1 = 0B10000000;
			                   //  7 =1��TMR3ΪPWM/BUZZERģʽ
				               //  6 =0��PWM3Ϊ�ߵ�ƽ��Ч
				               //  5:3(TMRXPS) =000��PWM3Ԥ��Ƶ������Ϊ1:1
				               //  2 =0,�ݹ�TMR3
				               //  1 =0,��ֹTMR3�ж�
				               //  0 =0��TMR3�жϱ�־λֻ��

	TMR3H=0;

	frz_t = 60000/frz_t;
	T3CKDIV = frz_t;
//	T3CKDIV = 300; 			//���� = 2^0*2^8*[(T3CKDIV+1)/16000000] =(T3CKDIV+1)*16us
//						  	// 31*16us = 0.496ms �� 2KHz

	PR3L = div;				//ռ�ձ�1/2

	TMR3ON=1;
	PWM3Dir = 0; //PWM3 PIN��Ϊ���ģʽ����PWM���
}


/*==================================================================
* Function	    : PWM_Disable
* Description	: �ر�PWM���������OFF��δ����ģʽ
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void PWM_Disable()
{
	PWM3Dir = 1; 	//PWM3���PIN��Ϊ����ģʽ
	TMR3ON=0;		//�ر�TMR3 �ȹر�
	PWM3Dir = 0; 	//PWM3 PIN��Ϊ���ģʽ����PWM���
}

/*==================================================================
* Function	    : Test_modeFuc
* Description	: ����ģʽ
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : ������ͻ�׼���ն��������ĵ�ѹ�������ĵ�ѹ�
				  �����浽eeprom�ĵ�ַ0x12����2bits����0x13����8bits����
==================================================================*/
void Test_modeFuc()
{
	uint16_t ad_v;
	uint8_t ad_vl,ad_vh;

	if(READ_BIT(g_checkStBits, TEST_EN_BIT))
	{
		
	//���̫���ܰ�AD���
		ad_v = GET_ADC_DATA (0);			//ad_v���ֵΪ1024����ӦVDD=3.3

		ad_vl = (uint8_t)(ad_v & 0x3f);
		ad_vh = (uint8_t)((ad_v>>8) & 0x03);

		EEPROMwrite(0x12, ad_vh);
		EEPROMwrite(0x13, ad_vl);

		CLEAR_BIT(g_checkStBits, TEST_EN_BIT);
	}
}

/*==================================================================
* Function	    : Mode_changeCheckFuc
* Description	: ģʽ�л�����
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : ���ݲ������ص�ֵ�趨��ǰ��ģʽ��λ�������жϺ����ͻ��Ѻ�����
==================================================================*/
void Mode_changeCheckFuc()
{

	ALL_KEY_PULL;			//���ǰ������key��io����λ����
 	DelayMs(1);				//��ʱ1ms

	if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI)
	{
		DelayMs(10);		//����
		if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI)
		{
//			g_checkMode_pre = g_checkMode;				//��¼֮ǰ��״̬�����ڿ��ػ�
			if(!Key_OFF2HI)	
			{
			//	OFF2HI_DOWN;			//��OFF2HI��λ���0��������������ɵĿպ�
				g_checkMode = OFF2HI_MODE;
			}	
			else if(!KEY_GLO)
			{
			//	GLO_DOWN;				//��GLO��λ���0��������������ɵĿպ�
				g_checkMode = GLO_MODE;
			}
			else if(!KEY_GLO2HI)
			{
			//	GLO2HI_DOWN;			//��GLO2HI��λ���0��������������ɵĿպ�
				g_checkMode = GLO2HI_MODE;
			}
		}

	}else
	if((PORTA & OFF_STATE_BIT) == OFF_STATE_BIT)
	{
		DelayMs(10);		//����
		if((PORTA & OFF_STATE_BIT) == OFF_STATE_BIT)
		{
		//	ALL_KEY_PULL;			//������key��io����λ����
			g_checkMode = OFF_MODE;
		}
	}

	ALL_KEYD_DOWN;			//�����ɺ������û����0

}


/*==================================================================
* Function	    : Event_checkFuc
* Description	: �¼�������
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void Event_checkFuc()
{
//	static uint8_t event_t = INITAL_MODE;
//	uint8_t event_i;

	if((g_checkMode != OFF_MODE) && (g_event_t == OFF_MODE))
		eventExitOFF();	

	switch(g_checkMode)
	{
		case OFF_MODE:
//			if(g_event_t != OFF_MODE)				//��ֹ����
//			{
//				BIS_SLEEP;					//BISS ��������״̬
//				g_event_t = OFF_MODE;
//				
//				//PWM_Disable();			//�ر�PWM������Ҫ��led
//				LEDOFF;
//				GLOOFF;
//				eventEnterOFF();
//
//			}

			
			BIS_SLEEP;					//BISS ��������״̬
			g_event_t = OFF_MODE;
			
			//PWM_Disable();			//�ر�PWM������Ҫ��led
			LEDOFF;
			GLO_TURNOFF;
			eventEnterOFF();
			break;
		case OFF2HI_MODE:
			GLO_TURNOFF;							//��ֹ����GLO ON ��ʱ���л�����
			
			g_event_t = OFF2HI_MODE;
			if(READ_BIT(g_checkStBits,SOLA_EN_BIT ))	//���CDS�Ƿ��������
			{
				BIS_WORK;								//BISS ���빤��״̬
				if(PIR_CTR)
				{
					LEDON;									//�˴���ʡif(READ_BIT(g_checkStBits, PIR_EN_BIT)
				
				//����ʱ�� 10000x2ms=20s
					g_ledkeep = LED_KEEPON_TIME;
					TIMER1_INTSTART();	
					OFF2HI_PULL;						//�ó�������
					while(1)
					{
						CLRWDT();
						DelayMs(2);
						if(PIR_CTR)
						{
							if(g_ledkeep < (LED_KEEPON_TIME-LED_WAIT_TIME))
								g_ledkeep = LED_KEEPON_TIME;
						}
						if(g_ledkeep == 0)					//20S��
							break;
						if(Key_OFF2HI)						//�������������˳�
						{
							DelayMs(10);
							if(Key_OFF2HI)
								break;
						}
					}
//					LEDOFF;									//�ر�	led	
					if(g_ledkeep == 0)		//��20Sʱ�䵽����˳�,����1.4S�ķ��ʱ��
					{
						g_ledkeep = LED_WAIT_OFF_TRIG;
						BIS_SLEEP;
						while(1)
						{
							CLRWDT();	
							DelayMs(2);
							if(g_ledkeep == 0)break;		//1.4S��
							if(Key_OFF2HI)						//�������������˳�
							{
								DelayMs(10);
								if(Key_OFF2HI)break;
							}
						}
						LEDOFF;									//�ر�	led	
					//���ʱ�� 700X2MS=1.4s
						g_ledkeep = LED_KEEPCLOSE_TIME;
						while(1)
						{
							CLRWDT();	
							DelayMs(2);
							if(g_ledkeep == 0)break;		//1.4S��
							if(Key_OFF2HI)						//�������������˳�
							{
								DelayMs(10);
								if(Key_OFF2HI)break;
							}
						}
						
						BIS_WORK;
					}
					else
					{

						LEDOFF;
					}
				
					OFF2HI_DOWN;						//�û����0
					TIMER1_INTSTOP();					//�ر�TIME1�ļ�ʱ�жϴ���
				}
			}
			//}
			break;
			
		case GLO2HI_MODE:

		LEDOFF;
		g_event_t = GLO2HI_MODE;
		if(READ_BIT(g_checkStBits,SOLA_EN_BIT ))	//���CDS�Ƿ��������
		{
			BIS_WORK;								//BISS ���빤��״̬
			if(PIR_CTR)
			{
				GLO_TURNOFF;
				LEDON;					
				g_ledkeep = LED_KEEPON_TIME;
				TIMER1_INTSTART();	
				GLO2HI_PULL;;						//�ó�������
				while(1)
				{
					CLRWDT();
					DelayMs(2);
					if(PIR_CTR)
					{
						if(g_ledkeep < (LED_KEEPON_TIME-LED_WAIT_TIME))
							g_ledkeep = LED_KEEPON_TIME;
					}
					if(g_ledkeep == 0)					//20S��
						break;
					if(KEY_GLO2HI)						//�������������˳�
					{
						DelayMs(10);
						if(KEY_GLO2HI)	
							break;
					}
				}
//				LEDOFF;									//�ر�	led	
//				GLOON;									//������GLO
				if(g_ledkeep == 0)		//��20Sʱ�䵽����˳�,����1.4S�ķ��ʱ��
				{
					g_ledkeep = LED_WAIT_OFF_TRIG;
					BIS_SLEEP;
					while(1)
					{
						CLRWDT();	
						DelayMs(2);
						if(g_ledkeep == 0)break;		//1.4S��
						if(Key_OFF2HI)						//�������������˳�
						{
							DelayMs(10);
							if(Key_OFF2HI)break;
						}
					}
					LEDOFF;									//�ر�	led	
					GLO_TURNON;	
//					BIS_WORK;
				//���ʱ�� 700X2MS=1.4s
					g_ledkeep = LED_KEEPCLOSE_TIME;
					while(1)
					{
						CLRWDT();	
						DelayMs(2);
						if(g_ledkeep == 0)break;		//1.4S��
						if(KEY_GLO2HI)							//�������������˳�
						{
							DelayMs(10);
							if(KEY_GLO2HI)break;
						}
					}	
					BIS_WORK;
				}
				else{
					LEDOFF;									//�ر�	led	
					GLO_TURNON;	
				}
				
				GLO2HI_DOWN;						//�û����0
				TIMER1_INTSTOP();					//�ر�TIME1�ļ�ʱ�жϴ���

			}else
			{
				GLO_TURNON;	
			}	
		}else
		{
			GLO_TURNOFF;
		}
			//}
			break;
		case GLO_MODE:
		//	if(g_checkMode_pre != GLO2HI_MODE)
		//	if(event_t != GLO_MODE)
			LEDOFF;
			g_event_t = GLO_MODE;
			BIS_SLEEP;								//BISS����
			if(READ_BIT(g_checkStBits,SOLA_EN_BIT ))	//���CDS�Ƿ��������
			{
				LEDOFF;
				GLO_TURNON;
			}else
			{
				GLO_TURNOFF;
			}
			break;

		default:
			break;
	}

}


/*==================================================================
* Function	    : Sola_baseCheck
* Description	: ̫����CDS����
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void Sola_baseCheck()
{
		static uint8_t sola_on=0;
		static uint8_t sola_off = 0;
		uint8_t i,j;
		uint16_t ad_v,ad_total[10],ad_sum;
	//���̫���ܰ�AD���
	
		ad_sum = 0;
		for(i = 0;i < 10;i++)
		{
			ad_total[i] = GET_ADC_DATA (0); 		//ad_v���ֵΪ1024����ӦVDD=3.3
			ad_sum += ad_total[i];
		}
		for(i = 1;i < 10;i++)						//����
		{
			for(j=0;j<10-i;j++)
			{
				if(ad_total[j]> ad_total[j+1])
				{
					ad_v = ad_total[j];
					ad_total[j]=ad_total[j+1];
					ad_total[j+1] = ad_v;
				}
			}
			CLRWDT();
		}
		ad_sum = ad_sum - ad_total[0] - ad_total[9];		//��ȥ�����Сֵ
		ad_sum >>= 3;										//��8ȡƽ����
	
		//��С����
//		i = ad_sum%10;		//ȡ��λ
//		j = ad_sum/10;		
//		j = j%10;			//ȡʮλ
//	
//		if(i > 4)	i=1;	//4��5��
//		else	i = 0;
//	
//		j += i; 			//��λ
//		if(j > 8)	j=1;	//����8ʱ ��λ
//		else	j = 0;
//	
//		ad_v = ad_sum/100 + j;



	Seg_Display(ad_sum);
	
	Seg_Display(ad_sum);
	
	Seg_Display(ad_sum);


}

/*==================================================================
* Function	    : chrg_ModeCheck
* Description	: 
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : ����OFFģʽ������ʾ���ã����Բ���Ҫ�������������
==================================================================*/
uint8_t  chrg_ModeCheck()
{
//	uint16_t ad_VL[4];
	uint8_t ch_i;
//	static uint8_t ch_tim = BATTERY_CHEK_TIME;

	if(!CHRG_PORT)		//USB����ģʽ
	{
		DelayMs(100);	//����
		if(!CHRG_PORT)
		{
		//	WDT_INITIAL();			//ʹ�ܿ��Ź��������� 	
			while(1)
			{
				Charg_Disp();
				
				for(ch_i = 10;ch_i--;)		//��1S
				{
					CLRWDT();		 //�忴�Ź�
					DelayMs(100);
					if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI || CHRG_PORT) 	//SLEEPʱ������
					{
						DelayMs(100);		//����
						if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI || CHRG_PORT) 
						{
							CLRWDT();  
							SWDTEN = 0;					//���ܿ��Ź�������OFF״̬�±�����
							if(CHRG_PORT)
							{
								return 1;				//�������߰γ�USB
							}
							else
							{
								return 2;				//�����л����˳�
							}
						}
					}	
				}
			}
		}
	}
	return 0;		//δ���
		
}


//void chrg_ModeCheck()
//{
//	uint16_t ad_VL[4];
//	uint8_t ch_i;
//	static uint8_t ch_tim;
//	
////	CHRG_PULL = 1;		//��λ����
//	ch_tim = BATTERY_CHEK_TIME;		//10S��λ
//	if(!CHRG_PORT)		//USB����ģʽ
//	{
//
//		DelayMs(100);
//		
//		if(CHRG_PORT)		//����
//			return;
//
//		GLOOFF;
//		LEDOFF;
//		BIS_SLEEP;
//		
//		
//		while(1)			//��������ģʽ
//		{
//			if(ch_tim == BATTERY_CHEK_TIME)
//			{
//				oneGLO();
//
//				if(CHRG_PORT)		
//				{
//					CLRWDT(); //�忴�Ź�
//					DelayMs(100);
//					if(CHRG_PORT)	
//					{
//						
////						CHRG_PULL = 0;		//����ʧЧ
//						return;		//���USB���γ�
//					}
//				}
//			}
//			ch_tim--;
//			if(ch_tim <1 )
//				ch_tim = BATTERY_CHEK_TIME;
//
//			if(CHRG_PORT)		
//			{
//				CLRWDT(); //�忴�Ź�
//				DelayMs(100);
//				if(CHRG_PORT)	
//				{
//					return;		//���USB���γ�
//				}
//			}
//			
//			CLRWDT(); //�忴�Ź�
//			SLEEP();			//���520ms
//
//		}
//		//�ѳ���
//	}
//
//
//}

/*==================================================================
* Function	    : Sola_checkFuc
* Description	: 
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : eeprom ��ַ0x11 aa������ڻ�׼ֵ��55����С�ڻ�׼ֵ��
				  ����ֵ��С��ȷ�ȣ���ȷ��0.322V  ��Ӧ��100,��ȷ����λ
				  ��������3�ˣ�����һ�²Ŵ�������ȡ��CDS
==================================================================*/
void Sola_checkFuc()
{
//	static uint8_t sola_on=0;
//	static uint8_t sola_off = 0;
	
//	uint8_t  sloar_en = 0;

	uint8_t i,j,z;
	uint16_t ad_v,ad_total[10],ad_sum;
	static uint16_t ad_vpre = 0;
//���̫���ܰ�AD���

	for(z = 10;z--;)
	{
		ad_sum = 0;
		for(i = 0;i < 10;i++)
		{
			ad_total[i] = GET_ADC_DATA (0);			//ad_v���ֵΪ1024����ӦVDD=3.3
			ad_sum += ad_total[i];
		}
		for(i = 1;i < 10;i++)						//����
		{
			for(j=0;j<10-i;j++)
			{
				if(ad_total[j]> ad_total[j+1])
				{
					ad_v = ad_total[j];
					ad_total[j]=ad_total[j+1];
					ad_total[j+1] = ad_v;
				}
				CLRWDT();
			}
			CLRWDT();
		}

		
		ad_sum = ad_sum - ad_total[0] - ad_total[9];		//��ȥ�����Сֵ
		ad_sum >>= 3;										//��8ȡƽ����



	//���´���ʱ���200us
		ad_v = FLITER_PRE * ad_sum + (FILTER_TOTAL - FLITER_PRE)*ad_vpre;
		ad_v = ad_v/FILTER_TOTAL;
		ad_vpre = ad_v;

	}

	
	if(g_adBaseValue == 0)return;

	if((g_gloCntTimer & 0x80) == 0x80)			//GLOģʽ��
	{
		if(ad_v <= g_adBaseValue)		//������û�з�����ģʽ
			g_gloEnvt_st = NORMAL_ENVT;
		else							//���������ܵ�������ģʽ
		{
			g_gloEnvt_st = BEYOND_ENVT;
		}
	}
	
	g_gloCurValue = ad_v;

}




/*==================================================================
* Function	    : GLO_cdsCheckFuc
* Description	: ̫���ܰ�����󣬽���CDS��ֵȷ�ϣ��Լ�CDS�����ļ��
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void GLO_cdsCheckFuc()
{
	uint8_t m_adpre;				//��¼cds�ٷֱ�
	static uint8_t av_check_lt = 0;
	static uint8_t av_check_dt = 0;

	//GLO��ʱ�����
	if(g_gloCntTimer > 0x80)
	{
		g_gloCntTimer--;
		if(g_gloCntTimer==0x80) 	//��ʱʱ�䵽����ʼ����ָ�ֵ  ��ʱGLO�Ѿ�����
		{
	
			if(g_gloEnvt_st == NORMAL_ENVT) 	//�Ƿ���������ģʽ
				g_gloRecValue = g_adBaseValue + g_cdsCmp;
			else
			if(g_gloEnvt_st == BEYOND_ENVT) 	//���з�����ģʽ
			{
		//		m_adpre = ((g_gloCurValue-g_adBaseValue)/g_gloCurValue)*100;
				m_adpre = g_adBaseValue*100/g_gloCurValue;
	
				if(m_adpre < CDS_COMP_MAX)		//�������ֵ
					g_gloRecValue = g_adBaseValue + g_cdsCmp;		//cds����Ԥ�����ֵ��ֱ�����
				else			//��3lux~n �����
				{
					g_gloRecValue =  g_gloCurValue + g_cdsCmp; 		//��CDS��ֵ���óɵ�ǰ�������ֵ
				}
			}
			
		}
		
	}


	if( g_gloCurValue > g_gloRecValue)
	{
		av_check_lt++;
		av_check_dt= 0;
	
		if(av_check_lt > 1)
		{
			av_check_lt = 0;
			CLEAR_BIT(g_checkStBits,SOLA_EN_BIT);
		}
		
	}else
	if( g_gloCurValue <= g_adBaseValue)
	{
		av_check_dt++;
		av_check_lt = 0;
			
		if(av_check_dt > 1)
		{
			av_check_dt = 0;
			SET_BIT(g_checkStBits,SOLA_EN_BIT); 		//cds��������
		}
	}


}
/*==================================================================
* Function	    : Solar_BaseDefine
* Description	: Solar define��write the value to the eeprom
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void Solar_BaseDefine()
{

	uint8_t define_t,i,j;
	uint16_t ad_v,ad_total[10],ad_sum;
	
	static uint16_t ad_vpre = 0;
//���̫���ܰ�AD���

//	oneGLO();	
	ADON = 1;
	DelayMs(100);

	for(define_t = 50;define_t--;)
	{
		
		CLRWDT();
		ad_sum = 0;
		for(i = 0;i < 10;i++)
		{
			ad_total[i] = GET_ADC_DATA (0);			//ad_v���ֵΪ1024����ӦVDD=3.3
			ad_sum += ad_total[i];
		}

		for(i = 1;i < 10;i++)						//����
		{
			for(j=0;j<10-i;j++)
			{
				if(ad_total[j]> ad_total[j+1])
				{
					ad_v = ad_total[j];
					ad_total[j]=ad_total[j+1];
					ad_total[j+1] = ad_v;
				}
				CLRWDT();
			}
			CLRWDT();
		}
		ad_sum = ad_sum - ad_total[0] - ad_total[9];		//��ȥ�����Сֵ
		ad_sum >>= 3;										//��8ȡƽ����
	
		ad_v = FLITER_PRE * ad_sum + (FILTER_TOTAL - FLITER_PRE)*ad_vpre;
		ad_v = ad_v/FILTER_TOTAL;
		ad_vpre = ad_v;
	}


	AD_baseWriteFuc(ad_v);

	ADON = 0;


	oneGLO();		//��˸������ʾУ�����
	CLRWDT();
	DelayMs(200);
	oneGLO();
	CLRWDT();
	DelayMs(200);
	oneGLO();
}
//******************************************** 
//�������ƣ�DelayUs
//���ܣ�    ����ʱ���� --16M-2T--��ſ�1%����.
//���������Time  ��ʱʱ�䳤��   ��ʱʱ��TimeUs
//���ز������˲������������������ã�����δ���� 
//********************************************
void DelayUs(uint8_t Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}

	
}                  
//******************************************** 
//�������ƣ�DelayMs
//���ܣ�    ����ʱ����
//���������Time  ��ʱʱ�䳤��   ��ʱʱ��Timems
//���ز������� 
//********************************************
void DelayMs(uint8_t Time)
{
	uint8_t a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(98); //��1%
		}
		CLRWDT();
	}
	CLRWDT();
}
//******************************************** 
//�������ƣ�DelayS
//���ܣ�    ����ʱ����
//���������Time  ��ʱʱ�䳤��   ��ʱʱ��TimeS
//���ز������� 
//********************************************
void DelayS(uint8_t Time)
{
	uint8_t a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<10;b++)
		{
		 	DelayMs(100); //
		 	CLRWDT();
		}
	}
}

/*==================================================================
* Function	    : EEPROMread
* Description	: ��EEPROM����
* Input Para	: EEAddr ���ȡ���ݵĵ�ַ
* Output Para	: ReEEPROMread  ��Ӧ��ַ����������
* Return Value  : 
* Remark        : 
==================================================================*/
uint8_t EEPROMread(uint8_t EEAddr)
{
	uint8_t ReEEPROMread;

	EEADR = EEAddr;    
	RD = 1;
	ReEEPROMread = EEDAT;     //EEPROM�Ķ����� ReEEPROMread = EEDATA;
	RD = 0;
	return ReEEPROMread;
}

/*==================================================================
* Function	    : EEPROMwrite
* Description	: д���ݵ�EEPROM
* Input Para	: EEAddr  ��Ҫд�����ݵĵ�ַ
				  Data    ��Ҫд�������
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void EEPROMwrite(uint8_t EEAddr,uint8_t Data)
{
	uint8_t gietag;

	gietag = GIE;
	GIE = 0;				//д���ݱ���ر��ж�
	while(GIE);			 	//�ȴ�GIEΪ0		����ι����500msδ��0��λ
//	{
//		CLRWDT();
//	}
	EEADR = EEAddr; 	 //EEPROM�ĵ�ַ
	EEDAT = Data;		 //EEPROM��д����  EEDATA = Data;
	EEIF = 0;
	EECON1 |= 0x34;		//��λWREN1,WREN2,WREN3��������.
	WR = 1;				//��λWR�������
	while(WR);      //�ȴ�EEд����� ,����ι����500msδ��0��λ
//	{
//		CLRWDT();
//	}
	GIE = gietag;
}




/*==================================================================
* Function	    : EEPROM_Init
* Description	: ��ʹ��EEPROM֮ǰ��Ҫ��δʹ��λ��д������0xAA
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void EEPROM_Init()
{
	uint8_t ep_t;

	EEPROMwrite(0x03, 0xAA);

	ep_t = EEPROMread(0X03);

	if(ep_t != 0xAA)
	{
		EEPROMwrite(0x03, 0xAA);
	}

	
	EEPROMwrite(0x03, 0xAA);

	ep_t = EEPROMread(0X03);

	if(ep_t != 0xAA)
	{
		EEPROMwrite(0x03, 0xAA);
	}
}


/*==================================================================
* Function	    : Version_Write
* Description	: д��汾��
* Input Para	: V_d���汾���ţ� D_d �汾��
* Output Para	: 
* Return Value  : 
* Remark        :MB22084�汾����Ϊ0x84,�汾��V1.0 д�� 0x10
==================================================================*/
void Version_Write()
{
	uint8_t V_d, D_d,V_rd, D_rd;



	EEPROMwrite(VERSION_TADD, VERSION_T);
	EEPROMwrite(VERSION_VADD, VERSION_V);
	
//�����Ƿ�д����ȷ
	V_d = EEPROMread(VERSION_TADD);
	D_d = EEPROMread(VERSION_VADD);

	if((V_d != VERSION_T) || (D_d != VERSION_V))
	{
		EEPROMwrite(VERSION_TADD, VERSION_T);
		EEPROMwrite(VERSION_VADD, VERSION_V);
	}

}


/*==================================================================
* Function	    : AD_baseGetFuc
* Description	: ��ȡ̫���ܰ�Ļ�׼��ѹ�ο�ֵ
* Input Para	: 
* Output Para	: 
* Return Value  : д��ɹ�����1��ʧ�ܷ���0
* Remark        : 
==================================================================*/
uint8_t AD_baseGetFuc()
{
	uint8_t ad_vl,ad_vh,ad_vl2,ad_vh2;

	ad_vh = EEPROMread(0x12);
	ad_vl = EEPROMread(0x13);

	ad_vh2 = EEPROMread(0x12);
	ad_vl2 = EEPROMread(0x13);

	if((ad_vh == ad_vh2) && (ad_vl == ad_vl2))
	{
		g_adBaseValue = (uint16_t)ad_vh;
//		g_adBaseValue = (g_adBaseValue<<8) & 0x0300;
		g_adBaseValue <<= 8;
		g_adBaseValue |= ad_vl;
		return 1;
	}else
		return 0;
}


/*==================================================================
* Function	    : AD_baseWriteFuc
* Description	: ����ȡ����ֵ���뵽eeprom��
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void AD_baseWriteFuc(uint16_t ad_vt)
{
	uint8_t ad_vl,ad_vh;
	uint8_t ad_cl,ad_ch;

	ad_vl = (uint8_t)ad_vt;

	ad_vh = (uint8_t)(ad_vt>>8)&0xff;


	EEPROMwrite(0x12, ad_vh);
	EEPROMwrite(0x13, ad_vl);

	ad_ch = EEPROMread(0x12);
	ad_cl = EEPROMread(0x13);

//�����Ƿ�д����ȷ,�粻��ȷ�ٴ�д��
	if((ad_cl != ad_vl ) || (ad_ch != ad_vh))
	{	
		EEPROMwrite(0x12, ad_vh);
		EEPROMwrite(0x13, ad_vl);
	}

}

/*==================================================================
* Function	    : VREG_INITIAL
* Description	: 
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void VREG_INITIAL() 
{
	VREG_OE = 0;
//	VCON1 = 0B00000000; 		//VREG = 2.4V
//		/*BIT[6:5] VREGM[1:0]-D��ѹ����ѹ(VREG)ѡ��λ 00-2.4V 01-3.6V 10-4.8V 11-5.3V
//		  BIT[4:0] VREGHB[4:0] PA4�����ѹ���� 
//				   VOUT = VREG*(VREGHB+1)/32	
//		*/
//	VCON2 = 0B00001111; //VOUT = 2.4*(15+1)/32 = 1.2V
//		/*
//		  BIT[4:0] VREGLB[4:0] PC5�����ѹ���� 
//				   VOUT = VREG*(VREGLB+1)/32	
//		*/	

	VCON1 = 0B00000000; 		//VREG = 3.6V
	VCON2 = 0B00001011; //VOUT = 3.6*(11+1)/32 = 1.35V

	
	VREG_OE = 1;//��ѹ�����ʹ��
}

//74HC595���
/*==================================================================
* Function	: Seg_Display
* Description	:  �������ʾ
* Input Para	: Ҫ��ʾ�����ݣ������ݱ���С��4096 ��С-99
* Output Para	: 
* Return Value: 
* Remark  : 
==================================================================*/
void Seg_Display(uint16_t date)
{
	uint8_t *led_table;          // ���ָ��
	uint8_t   ge_d,shi_d,bai_d,qian_d;
	ge_d = shi_d = bai_d = qian_d = 0;


	if(date < 4096)
	{

		if(date >= 0)
		{
//ǧλ��ʾ
			qian_d = date/1000;							
			date = date - qian_d * 1000;
			led_table = Seg_0F + qian_d;
			qian_d = *led_table;
			Seg_OUT(qian_d);			
			Seg_OUT(0x08);
			Seg_Lock();

//��λ��ʾ
			bai_d = date/100;							
			date = date - bai_d * 100;
			led_table = Seg_0F + bai_d;
			bai_d = *led_table;
			Seg_OUT(bai_d);			
			Seg_OUT(0x04);
			Seg_Lock();

		}else
		{
			date = 0-date;
//ǧλ
			qian_d = 0xff;
			Seg_OUT(qian_d);			
			Seg_OUT(0x08);
			Seg_Lock();

//��λ��ʾ

			bai_d = 0xbf;
			Seg_OUT(bai_d);			
			Seg_OUT(0x04);
			Seg_Lock();	

		}
	
	//ʮλ��ʾ
		shi_d = date/10;							
//		date = date - shi_d * 10;
		led_table = Seg_0F + shi_d;
		shi_d = *led_table;
		Seg_OUT(shi_d);			
		Seg_OUT(0x02);
		Seg_Lock();

	//��λ��ʾ
		ge_d = date%10;							
		led_table = Seg_0F + ge_d;
		ge_d = *led_table;
		Seg_OUT(ge_d);			
		Seg_OUT(0x01);
		Seg_Lock();

	}else
	{
		ge_d = 0x01;
		for(shi_d = 4;shi_d--;)
		{
			led_table = Seg_0F + 10;
			bai_d = *led_table;
			Seg_OUT(bai_d);			
			Seg_OUT(ge_d);
			Seg_Lock();
			ge_d <<= 1;
		}
	}
}

/*==================================================================
* Function	: Seg_OUT
* Description	: ����ܵ��ֽڴ�����λ����
* Input Para	: 
* Output Para	: 
* Return Value: 
* Remark  : 
==================================================================*/
void Seg_OUT(uint8_t X)
{
	uint8_t i;
	for(i=8;i>=1;i--)
	{
		if (X&0x80) DIO=1; else DIO=0;
		X<<=1;
		SCLK = 0;
		NOP();
		NOP();
		SCLK = 1;
	}
}


/*==================================================================
* Function	: Seg_Lock
* Description	: �������ݲ���ʾ
* Input Para	: 
* Output Para	: 
* Return Value: 
* Remark  : 
==================================================================*/
void Seg_Lock()
{
	RCLK = 0;
	NOP();
	NOP();
	RCLK = 1;

}

/*==================================================================
* Function	: SegDisplay_Init
* Description	: ��ʼ�������
* Input Para	: 
* Output Para	: 
* Return Value: 
* Remark  : 
==================================================================*/
void SegDisplay_Init()
{

	DIODir = 0;	
	RCLKDir	= 0;
	SCLKDir = 0; 	

	DIO = 0;  
	RCLK = 0;
	SCLK = 0; 	
}

//void EnterSleep_Fuc()
//{
//	SegDisplay_Init();
//	LEDOFF;
//	GLOOFF;
//
//}


/*==================================================================
* Function	    : TestFunc_Enable
* Description	: �������ģʽ
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TestFunc_Enable()
{
//����Ϊ����

//	TESTPORT1_DIR = 1;
//	TESTPORT2_DIR = 1;
	
//���ó�������
//	TESTPORT1_SCLPULL = 1;
//	TESTPORT2_SDAPULL = 1;

//	TESTPORT_ENDIR = 1;		//�ó�����ģʽ
//	TESTPORT_ENPULL = 1;	//������
	ALL_KEY_PULL;			//���ǰ������key��io����λ����

//	ADON = 1;	
	
}


/*==================================================================
* Function	    : TestFunc_Disable
* Description	: �˳�����ģʽ
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TestFunc_Disable()
{
//����Ϊ���
//	TESTPORT1_DIR = 0;
//	TESTPORT2_DIR = 0;
//
////���ó�������
//	TESTPORT1_SCLPULL = 0;
//	TESTPORT2_SDAPULL = 0;
//
//	Test_port1 = 0;
//	Test_port2 = 0;

	
//	TESTPORT_ENDIR = 0;		//�ó����ģʽ
//	TESTPORT_VALUE = 0;		//�����0
	ALL_KEYD_DOWN;

//	ADON = 0;	


}


/*==================================================================
* Function		: main
* Description	: ������
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : ����WDT���ڻ��Ѽ����ʵ�ֵ͹���
==================================================================*/
void main(void)
{		
	uint8_t main_i = 0;
	uint8_t main_j = 0;
//	static uint8_t ad_ch=0;			//ȷ��ÿ�λ���ֻ���һ��solar
//	uint8_t  sloar_en = 0;
	
	POWER_INITIAL(); 
//	PWM_INITIAL(3000,128);				//Ĭ��HIģʽ
	ADC_INITIAL();
	WDT_INITIAL();
	INT_INITIAL();
	EEPROM_Init();
	Version_Write();				//�汾д��





	LEDOFF;
	GLOOFF;
	BIS_SLEEP;

	DelayMs(250);			//�ȴ���ѹ�ȶ�ʱ��
	DelayMs(250);			//�ȴ���ѹ�ȶ�ʱ��
	DelayMs(250);			//�ȴ���ѹ�ȶ�ʱ��
	DelayMs(250);			//�ȴ���ѹ�ȶ�ʱ��
	
//�˴���Ӳ���ģ��
	TestFunc_Enable();
//����ģʽ������
	if(!Key_OFF2HI && !KEY_GLO && !KEY_GLO2HI)
	{
		DelayMs(100);
//		if(TESTPORT_VALUE == 0)
		if(!Key_OFF2HI && !KEY_GLO && !KEY_GLO2HI)
		{
		//	ADON = 1;
			//��Ӧ����1S
			DelayMs(250);
			DelayMs(250);
			DelayMs(250);
			DelayMs(250);

			Solar_BaseDefine();

		//	ADON = 0;
//			while(TESTPORT_VALUE == 0)
			while(1)			//�ȴ��ػ�����
				CLRWDT();
			
			
		}
	}
		
	TestFunc_Disable();

//�ϵ���ʾ
	GLOON;
	DelayMs(200);
	DelayMs(200);
	GLOOFF;
	DelayMs(200);
	DelayMs(200);
	DelayMs(200);
	GLOON;
	DelayMs(200);
	DelayMs(200);
	GLOOFF;

//PIR TEST
//	BIS_WORK;
//	while(1)
//	{
//		while(PIR_CTR)
//		{
//			GLOON;
//			CLRWDT(); 
//		}
//		GLOOFF;
//		CLRWDT(); 
//	}


//solar check
//	while(1)
//	{		
//		SegDisplay_Init();
//	
//		ADON = 1;				//ʹ��ADC
//		DelayMs(1);				//ʹADC�ȶ�
//		Sola_baseCheck();
//		CLRWDT();
//		ADON = 0;
//	}


//key test
//	TESTKEYDIR = 1;
//	WPUC |= 0B00001000; 
//	GIE = 1;
	
	if(AD_baseGetFuc() == 0)	//��ȡCDS��ֵ
		AD_baseGetFuc();		//�����ȡʧ�ܣ��ٴζ�ȡ	


//	g_adBaseValue = 100;
	g_gloRecValue = (g_adBaseValue * CDS_REVISE_PER)/10;	//��ʼ��ʱ �ָ�ֵ�����趨��CDSֵ+����ֵ
	g_cdsCmp = g_gloRecValue-g_adBaseValue;

//��ѭ��
//step1���CDS,step2 ��⿪��״̬��step3 ���PIR
	while(1)			//sleepǰ���72ms
    {
		CLRWDT(); //�忴�Ź�		
		if(g_checkMode == OFF_MODE)
		{
			main_i = chrg_ModeCheck();			//���USB���
		}
		
		if(main_i != 1)		//δ���򿪹ط�ʽ�˳������ʾ��		
		{			
		//AD����ʱ�䣨�����ɼ�11�Σ���ʱ12ms��			
			ADON = 1;				//ʹ��ADC
			DelayMs(1);				//ʹADC�ȶ�
	//		for(main_j = 10;main_j--;)
			Sola_checkFuc();		//CDS���
			ADON = 0;				//ʹ��ADC

			GLO_cdsCheckFuc();
			
			Mode_changeCheckFuc();						//����Ƿ��ǿ��ش���
			//֮ǰ��������13ms����
			Event_checkFuc();
		}
		main_i = 0;
		if((g_checkMode != OFF_MODE) ||  CHRG_PORT)	//��ֹ�ڷ�off״̬����USB����©��ʾ
		{
			CLRWDT(); //�忴�Ź�
			SLEEP();			//���520ms
		}

    }
}

