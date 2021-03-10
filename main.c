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
软件流程：WDT 512ms唤醒一次检测电池和太阳能板的电压 此处涉及到 WDT和AD
		  软件实时处于休眠状态，并通过WDT溢出、INT唤醒（PIR_CTR、Test_port2、Key_OFF2HI、Test_port1、KEY_GLO、KEY_GLO2HI）
		  
20200702	由于拨动开关可能切换很快导致中断无法处理，将中断只起到唤醒sleep作用，在Mode_changeCheckFuc中处理电平变换识别
20200704	弱上拉电阻过小，导致接地后功耗很大，改为开关打到位后输出0，之后再置位输出，再led点亮期间检测置为输入检测是否有开关拨动
20200729	减小太阳能采样的整体时间，引入亮暗的趋势检测
20200817	solar check由PC2改成PA0,TestPort3由PA0改成PC0
2020024		添加版本烧录
20200904	根据其他厂家的BISS特性，添加了对于非BISS检测（OFF、GLO）时BISS的休眠和需要用到BISS（OFF2HI,GLO2HI）时BISS工作的模式切换
20200909	调整LED亮灯的持续方式，由连续检测PIR输出口，改为有PIR信号后持续亮20S（用中断实现），硬件上做了相应的调整（一次触发68ms，封闭时间1.4S）
			对应硬件版本KLV_MB22084_Ver1.0202000909_PIR68MS
20200919	由于增加了灵敏度，导致LED灯灭时会有恒定的误触发，将硬件的抑制时间改为2S，为配合此功能，在亮灯结束前2S将BIS关闭，然后在软件抑制时间结束
			后将BIS重新打开来规避2S的硬件抑制时间

20201021	去掉了USB端的测试定标模式，改为检测开关全拉低定标
20201103	新增充电提示和插入usb自动不工作，以INT为唤醒源
20201126	充电检测口去掉PC4的检测
20201216    将Hi_LED port 改为PC5
20201218    以呼吸灯为充电模式的提醒方式，注意charge口在退出时  开关的端口是否需要上拉

20201229	1、修改GLOON 和GLODFF的实现
			2、添加GLO点亮后的两种环境光模式，NORMAL_ENVT，BEYOND_ENVT
			3、将函数Sola_checkFuc拆解成函数Sola_checkFuc和GLO_cdsCheckFuc

20210104	1、修改了普通状GLO模式下的阀值，以防止人靠近后会闪烁
			2、修改了一个BUD，beyond模式下。超过最大阀值应是'<' 而不是'>'

20210105	将CDS_COMP替换成一个根据定标值动态设定的g_cdsCmp
****************************************************************************************/
#include <syscfg.h>
#include "PF462XXX.h"
/***********************宏定义*****************************/
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

//开关输入上拉设置
#define OFF2HI_PULL		do{TRISA2=1;WPUA2=1;}while(0);
#define GLO2HI_PULL		do{TRISA3=1;WPUA3=1;}while(0);
#define GLO_PULL		do{TRISA4=1;WPUA4=1;}while(0);
#define ALL_KEY_PULL	do{TRISA |= 0B00011100;WPUA |= 0B00011100;}while(0);

//#define KEY_CHECK_OFF2HI	(PORTA | 0B00011000)!= 0B00011000  
//#define KEY_CHECK_GLO2HI	(PORTA | 0B00010100)!= 0B00010100
//#define KEY_CHECK_GLO		(PORTA | 0B00001100)!= 0B00001100

//开关输出0设置
#define OFF2HI_DOWN		do{TRISA2=0;PA2=0;}while(0); 
#define GLO2HI_DOWN		do{TRISA3=0;PA3=0;}while(0); 
#define GLO_DOWN		do{TRISA4=0;PA4=0;}while(0); 
#define ALL_KEYD_DOWN	do{TRISA &= 0B11100011;PORTA &= 0B11100011;}while(0);

#define  PWM3Dir  		TRISC4

#define SOLA_EN_BIT		BIT1
//#define PIR_EN_BIT		BIT2
#define KEY_EN_BIT		BIT3
#define TEST_EN_BIT		BIT4

#define OFF_STATE_BIT	0B00011100		//三个引脚都被置高则为off状态

//led点亮和封闭时间控制
//#define LED_KEEPON_TIME 10000			//点亮时间 10000x2ms=20s
#define LED_KEEPON_TIME 9000			//点亮时间 9000x2ms=18s + 2S 防灯灭触发时间
#define LED_WAIT_OFF_TRIG	1000		//灯灭前重启BISS
#define LED_WAIT_TIME	1000			//点亮后的等待时间，该时间内触发无效
#define	LED_KEEPCLOSE_TIME	700			//封闭时间 700x2ms=1.4s

//#define AV_BASE_VLAU	403				//对应1.3V
//#define AV_BASE_VLAU	294				
//#define AV_BASE_VL	3
#define AV_LEVE_CHECK	93				//0.3V
//#define AV_BASE_VL	297
//#define AV_LIGHT_VL(x)  	(x + (AV_LEVE_CHECK<<1))	//从暗到亮的基值 +0.6V
#define AV_LIGHT_VL(x)  	(x + AV_LEVE_CHECK)	//从暗到亮的基值 +0.3V
#define AV_DACK_VL(x)		(x - AV_LEVE_CHECK)		//从亮到暗的基值 -0.3V
#define SOLAR_CHECK_TIME	2			//太阳能板连续采样次数
#define SOLAR_LOOP_TIME	2

//#define SOLAR_DEFINE_UP_LEVE	7

//#define SOLAR_DEFINE_DOWN_LEVE	12

//#define CDS_COMP	35
#define CDS_COMP_MAX	40		//40%
#define CDS_REVISE_PER	13		//1.3

#define BATERY_VOLTAGE	646		//4.16V
//#define BATTERY_CHEK_TIME	20		//20X520MS ≈10S
#define BATTERY_CHEK_TIME	3		//2X520MS ≈1S


//版本号写入相关
#define VERSION_TADD	0x01
#define VERSION_VADD	0x02

#define VERSION_T	0x84
#define VERSION_V	0x10

#define DIO  	PA1				//串行数据输入
#define RCLK  	PC3				//时钟脉冲信号——上升沿有效
#define SCLK  	PC5				//打入信号————上升沿有效

#define DIODir 		TRISA1
#define RCLKDir		TRISC3
#define SCLKDir  	TRISC5

#define LEDON	HI_PORT = 1
#define LEDOFF	HI_PORT = 0
#define GLOON	GLO_PORT = 1
#define GLOOFF	GLO_PORT = 0




#define GLO_TIMEON	do{		\
			g_gloCntTimer = 0;\
			g_gloCntTimer |= 0x82;}while(0);			//0B10000010 BIT7为使能位，后面7位为计时位


#define GLO_TIMEOFF	do{		\
			g_gloCntTimer = 0;}while(0);			//BIT7清0 除能定时器，后7位清零初始化定时器

#define GLO_TURNON	do{if(!GLO_PORT){	\
										GLOON; \
										GLO_TIMEON;}\
									}while(0);
			
			
#define GLO_TURNOFF	do{if(GLO_PORT){	\
										GLOOFF;	\
										GLO_TIMEOFF;}\
									}while(0);


#define CHRG_PORT		PC1		//USB 检测口,插入时被拉低，拔出后拉高（需要上拉）
//#define CHRG_PULL		WPUC4	//pc4上拉设置
#define CHRG_PULL		WPUC1	//pc4上拉设置

//test 使用
#define BEEP  			PA1			//蜂鸣器端口
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


#define BIS_SLEEP		do{TRISC3 = 0;PC3=0;}while(0);		//BISS的AC=0
#define BIS_WORK		TRISC3 = 1				//拉高AC


//定义5种工作模式，其中INITAL_MODE为上电无状态模式
typedef enum{
	OFF_MODE,
	OFF2HI_MODE,
	GLO2HI_MODE,
	GLO_MODE,
	INITAL_MODE
}checkMode_type;

typedef enum{
	SUM2MOON,		//天亮状态
	MOON2SUN		//黑夜状态
}LIGHT_STATUS;

typedef enum{
	INITAL_ENVT,
	NORMAL_ENVT,		//非反射光的正常模式
	BEYOND_ENVT			//有反射光的使用条件
}GLO_ENVT_STATUS;

//typedef enum{
//
//	USB_NOIUSE_ST,		//USB未插入
//	USB_CHRG_NOTFULL,	//usb插入但未充满
//	USB_CHRG_FULL		//USB插入，但充满
//}CHRG_MODE_STATUS;


#define FILTER_TOTAL	10
#define FLITER_PRE		2


/***********************全局变量声明*****************************/
volatile checkMode_type g_checkMode=INITAL_MODE;

volatile uint16_t g_adBaseValue = 0;
volatile GLO_ENVT_STATUS g_gloEnvt_st = INITAL_ENVT;
volatile uint8_t g_gloCntTimer = 0;				//GLO光检测定时器，BIT7为使能位，Bit0~Bit6为计时位，WDT 0.5S一次，计时1S
volatile uint16_t g_gloRecValue = 0;				//GLO光检测门槛值
volatile uint16_t g_gloCurValue = 0;				//GLO光检测模式当前值
//volatile checkMode_type g_checkMode_pre=INITAL_MODE;


volatile uint8_t g_checkStBits = 0;			//bit0:sola check,bit1:Pir check,bit2: 拨动开关检测，bit3:测试模式检测

//volatile uint8_t g_piren = 0;				//=0 PIR未触发，=1 PIR触发

volatile LIGHT_STATUS g_light_stvalue = SUM2MOON;

volatile uint16_t g_ledkeep = 0;
//volatile uint8_t g_ch_tim = BATTERY_CHEK_TIME;
volatile uint8_t g_event_t = INITAL_MODE;

volatile uint8_t g_cdsCmp = 0;
//volatile CHRG_MODE_STATUS g_chrgmod_t;
/***********************函数声明*****************************/
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

//74HC595驱动相关
void Seg_Display(uint16_t date);			// 数码管显示
void SegDisplay_Init(void);					//数码管初始化
void Seg_OUT(uint8_t X);					// 数码管单字节串行移位函数
void Seg_Lock(void);
void Event_checkFuc(void);
void Sola_baseCheck(void);
void oneBeep(void);							//一声蜂鸣
void oneGLO(void);

void TIMER1_INTSTART(void);
void TIMER1_INTSTOP(void);

uint8_t chrg_ModeCheck(void);
void GLO_cdsCheckFuc(void);


//数码管字模表
// 0	 1	  2	   3	4	 5	  6	   7	8	 9	  A	   b	C    d	  E    F    -     .
//0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E,0xbf,0xef
uint8_t Seg_0F[] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E,0xbf,0xef};


/***********************函数定义*****************************/
void interrupt ISR(void)//PIC_HI-TECH使用
{ 
	uint8_t ReadAPin;

 //PC1外部中断处理**********************
	if(INTE && INTF)//
	{
		INTF = 0;  //清PC1 INT 标志位
		INTE = 1;  //暂先禁止PC1中断
	//	SET_BIT(g_checkStBits, TEST_EN_BIT);		//测试模式置位
	
//		WDT_INITIAL();			//重新使能看门狗
//		g_checkStBits |= TEST_EN_BIT;

	}else
//PA电平变化中断**********************
	if(PAIE && PAIF)//
    {
		ReadAPin = PORTA; //读取PORTA数据清PAIF标志
		PAIF = 0;  //清PAIF标志位
		PAIE = 1;  //暂先禁止PA0中断
	//	IOCA2 =0;  //禁止PA0电平变化中断

//		if(PIR_CTR)	SET_BIT(g_checkStBits, PIR_EN_BIT);//PIR触发

//		SET_BIT(g_checkStBits, KEY_EN_BIT);			//拨动开关有触发

//	if(PIR_CTR) g_checkStBits |= PIR_EN_BIT;			//PIR触发
//	else
//	  g_checkStBits |= KEY_EN_BIT; 						//拨动开关有触发

	//	oneGLO();

    }

	  //定时器1的中断处理  2MS处理一次
	 if(TMR1IF)//
	{
		TMR1IF = 0;
		//TMR1L = 0XC0;  //定时1MS=>TMR1=4000*0.125US=500US
		//初值=65536-4000=61536=>0XF060
		//TMR1H = 0XE0;  //赋初值=>TMR1H=0XE0;TMR1L=0XC0

		TMR1L = 0XC0;	//定时500US=>TMR1=8000*0.25US=2ms
		//初值=65536-8000=57536=>0XE0C0
		TMR1H = 0XE0;	//赋初值=>TMR1H=0XC1;TMR1L=0X80	  
		 
//		GLO_PORT = ~GLO_PORT; //翻转电平			
		if(g_ledkeep > 0)g_ledkeep--;
	} 
} 

void oneBeep()
{
	BEEP = 1;//蜂鸣提示
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
		CLRWDT();		 //清看门狗
		GLOON;
		DelayMs(3);
		GLOOFF;
		DelayMs(7);
	}
	
	
}

/*==================================================================
* Function	    : TIMER1_INTSTART
* Description	: TIMER1定时器中断开启函数
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TIMER1_INTSTART()
{
	//需要在中断里重新赋初始值
	T1CON = 0B00000000; //B[5:4]=00,T1时钟分频 1:1
					 //B1=0,T1时钟源选择内部时钟
					 //T1SYNC=8M/2T=4M=0.25US
	TMR1L = 0XC0;	//定时500US=>TMR1=8000*0.25US=2ms
	//初值=65536-8000=57536=>0XE0C0
	TMR1H = 0XE0;	//赋初值=>TMR1H=0XC1;TMR1L=0X80	  
	
	TMR1IE = 1;//使能TMER1的中断
	TMR1ON = 1;//使能TMER1启动
	PEIE=1;    //使能外设中断
	GIE = 1;   //使能全局中断

}
/*==================================================================
* Function	    : TIMER1_INTSTOP
* Description	: TIMER1定时器中断关闭函数
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TIMER1_INTSTOP()
{
	TMR1IE = 0;//使能TMER1的中断
	TMR1ON = 0;//使能TMER1启动
	PEIE=0;    //使能外设中断
}


/*==================================================================
* Function	: POWER_INITIAL
* Description	: 系统初始化
* Input Para	: 
* Output Para	: 
* Return Value: 
==================================================================*/
void POWER_INITIAL () 
{ 
	OSCCON = 0B01100001;	//WDT 32KHZ IRCF=110=8MHZ/2=4M,0.25US/T,SCS=1,系统时钟为内部振荡器

	INTCON = 0;  			//暂禁止所有中断
	TRISA = 0B10011101;		//PA输入输出 0-输出 1-输入
	PORTA = 0;

	TRISC = 0B00001011;		//PC输入输出 0-输出 1-输入
							//PC0为输入，用去电池电量检测
							//PC1为输入，检测充电口是否插入
							//PC3为输入，消除对BISS0001 VC口的影响
							
	PORTC = 0;

	WPUA = 0B00011100;    	//PA端口上拉控制 1-开上拉 0-关上拉
	WPUC = 0;     			//PC端口上拉控制 1-开上拉 0-关上拉
	CHRG_PULL = 1;			//PC1上拉
//test中置如下
//	WPUC = 0B00010010;     	//PC端口上拉控制 1-开上拉 0-关上拉

	OPTION = 0B00001000;	//Bit3=1 WDT MODE,PS=000=1:1 WDT RATE	
							//Bit7(RAPU)=0 ENABLED PULL UP PA
					 		//Bit6=0 interrupt on falling edge of PC1
					 
	MSCKCON = 0B00000000;	//6B->0,禁止PA4，PC5稳压输出
					  		//5B->0,TIMER2时钟为Fosc
					  		//4B->0,禁止LVR       
	CMCON0 = 0B00000111; 	//关闭比较器，CxIN为数字IO口


	g_checkStBits = 0;		//清理所有标志位
}

/*==================================================================
* Function	: ADC_INITIAL
* Description	: ADC初始化
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark		：PA0(AN0)、PA1(AN1)、PA2(AN2)、PA3(AN3)、PC0(AN4)、PC1(AN5)、PC2(AN6)
				  通道AN4(电池检测),AN6（太阳能检测）默认
==================================================================*/
void ADC_INITIAL () 
{	
	ANSEL = 0B00010001;   	//使能AN0，AN4为模拟输入	
	ADCON1 = 0B00000000; 	//DIVS=0,时钟选FOSC
					  	 	//ADCS[2:0]=000,分频FOSC/2(Fsys=16M，则TAD=125ns)

	ADCON0 = 0B10000000;	//B7,ADFM=1,结果右对齐 					
							//B6:5,VCFG=00,参考电压VDD
							//B4:2,CHS=000,选择AN0通道
							//B1,GO,AD =0 不在进行
							//B0,ADON=0,ADC不使能


	//GO_DONE = 1;			//ADC正在转化
	//ADON =	1;			//使能ADC
}                      

/*==================================================================
* Function	: GET_ADC_DATA
* Description	: 读取通道ADC值
* Input Para	: AN_CH 通道序号（0-6，6为默认）
* Output Para	: INT类型AD值(单次采样无滤波)
* Return Value: 
==================================================================*/
uint16_t GET_ADC_DATA (uint8_t AN_CH) 
{ 
	uint8_t  AD_chBuff;
	uint16_t  ADC_DATA=0;

	if(AN_CH != 0)		//通道选择为非默认
	{
		AD_chBuff = ADCON0 & 0B11100011; 	//清空现有通道

		AN_CH <<= 2;              
		AD_chBuff |=  AN_CH;   //(BIT4-BIT2)CHS=010,选择AN2通道      

		ADCON0 = AD_chBuff; //重新加载通道值
	}
	CLRWDT();
	
	GO_DONE = 1;             //启动ADC 
	while( GO_DONE==1 );    //等待ADC转换完成		不加喂狗程序
//	{
//		CLRWDT();
//	}

	ADC_DATA =  ADRESH;
	ADC_DATA <<= 8;
	ADC_DATA |= ADRESL;      //10Bit ADC值整合

//	ADON = 0;				//关闭ADC	
	return  ADC_DATA;
} 

/*==================================================================
* Function	: WDT_INITIAL
* Description	: 初始化设置看门狗时间复位,定时时间=(16348*1)/32000=512ms
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark		：//相关寄存器：1、INTCON 2、OPTION 3、WDTCON
==================================================================*/
void WDT_INITIAL() 
{
  
	CLRWDT();  					//清看门狗
	PSA = 0;     				//时钟分频分给WDT
	WDTCON = 0B00010010;		//WDTPS=1001=1:16348,PS=000=1:1

	SWDTEN = 1;					//使能看门狗
}

/*==================================================================
* Function	: INT_INITIAL
* Description	:   中断初始化函数
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void INT_INITIAL()
{
	uint8_t ReadAPin;

	
//	ANSEL = 0B00000001;		//关闭中断引脚模拟输入功能PA0(AN0)、PA1(AN1)、PA2(AN2)、PA3(AN3)、PC0(AN4)、PC1(AN5)、PC2(AN6)
	IOCA =  0B10011100;		//使能 PA2 PA3 PA4   PA7 端口状态触发中断
	ReadAPin = PORTA;		//清PA电平变化中断
//INT初始化
	INTEDG =0; 				//OPTION,INTEDG=0 Interrupt on falling edge of PC1 pin 
//	INTF =0;   				//清 PC1 INT中断标志位
//	INTE =1;   				//使能 PC1 INT中断
//PA变化初始化
	PAIF = 0;				//清PA脚变化中断标志位
	PAIE = 1;				//是能PA脚变化中断
	GIE =1;    			//使能全局中断
}


/*==================================================================
* Function	    : eventEnterOFF
* Description	: 进入off模式前的准备
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void eventEnterOFF()
{	
	uint8_t ReadAPin;


	CLRWDT();  
	SWDTEN = 0;					//除能看门狗
		
	IOCA &=	0B01111111; 	//除能PA7 端口状态触发中断
	
	ReadAPin = PORTA;		//清PA电平变化中断
	PAIF = 0;
	
	INTF =0;   				//清 PC1 INT中断标志位
	INTE =1;   				//使能 PC1 INT中断

	ALL_KEY_PULL;

}


/*==================================================================
* Function	    : eventExitOFF
* Description	: 退出OFF模式后的操作
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void eventExitOFF()
{	
	uint8_t ReadAPin;

	WDT_INITIAL();			//重新使能看门狗
	IOCA |=	0B10000000; 	//使能PA7 端口状态触发中断
	ReadAPin = PORTA;		//清PA电平变化中断
	PAIF = 0;

	INTF =0;   				//清 PC1 INT中断标志位
	INTE =0;   				//关 PC1 INT中断
	ALL_KEYD_DOWN;

}

/*==================================================================
* Function	: PWM_INITIAL
* Description	: 
* Input Para	: frz_t  输出频率 单位Hz（如3，则输出为3Hz）,
				  div	 占空比，0-255; 
* Output Para	: 
* Return Value  : 
* Remark        : 
*将相关的TRIS位置1禁止PWMx引脚的输出驱动器；
*装裁PWMxCR0寄存器以设置PWMx周期，中断产生方式以及选择时钟源；
*用适当的值装载PWMxCR1寄存器配置为PWM模式，合适的预分频比；
*装载PRx寄存器设置PWM占空比；
*配置并启动TIMERx：
	将PWMxCR1寄存器的TMRXIF中断标志位清零
	将PWMxCR1寄存器的TMRxON位置1启动TIMERx
*重新开始一个PWM周期后，使能PWM输出：
	等待TIMERx溢出（PWMxCR1寄存器的TMRxIF位置1）
	将相关的TRIS位清零使能PWMx引脚的输出驱动器
*PWM周期=2^TMRXPS * 2^PXPER * [(T3CKDIV+1)/PWM时钟源]

注意：由于T3CKDIC为8bit最多为255，因此最低只能射到244Hz的频率既frz_t>244

==================================================================*/
void PWM_INITIAL(uint16_t frz_t,uint8_t div) 
{
  //-------------------------------
	PWM3Dir = 1; //PWM3输出PIN暂为输入模式
	//-------------------------------
	PWM3CR0 = 0B00110010; 	//	7	TMR3溢出时产生中断
							//	6:4	周期位选择	011:8位 既PXPER=8
							//	3:1	时钟选择	001:内部RC快时钟/(T3CKDIV+1)
							//	0	PWM 输出							
	PWM3CR1 = 0B10000000;
			                   //  7 =1，TMR3为PWM/BUZZER模式
				               //  6 =0，PWM3为高电平有效
				               //  5:3(TMRXPS) =000，PWM3预分频比设置为1:1
				               //  2 =0,暂关TMR3
				               //  1 =0,禁止TMR3中断
				               //  0 =0，TMR3中断标志位只读

	TMR3H=0;

	frz_t = 60000/frz_t;
	T3CKDIV = frz_t;
//	T3CKDIV = 300; 			//周期 = 2^0*2^8*[(T3CKDIV+1)/16000000] =(T3CKDIV+1)*16us
//						  	// 31*16us = 0.496ms ≈ 2KHz

	PR3L = div;				//占空比1/2

	TMR3ON=1;
	PWM3Dir = 0; //PWM3 PIN设为输出模式允许PWM输出
}


/*==================================================================
* Function	    : PWM_Disable
* Description	: 关闭PWM输出，用于OFF和未触发模式
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void PWM_Disable()
{
	PWM3Dir = 1; 	//PWM3输出PIN暂为输入模式
	TMR3ON=0;		//关闭TMR3 既关闭
	PWM3Dir = 0; 	//PWM3 PIN设为输出模式允许PWM输出
}

/*==================================================================
* Function	    : Test_modeFuc
* Description	: 测试模式
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 计算出和基准的照度所产生的电压所产生的电压差，
				  并保存到eeprom的地址0x12（高2bits），0x13（低8bits）中
==================================================================*/
void Test_modeFuc()
{
	uint16_t ad_v;
	uint8_t ad_vl,ad_vh;

	if(READ_BIT(g_checkStBits, TEST_EN_BIT))
	{
		
	//完成太阳能板AD检测
		ad_v = GET_ADC_DATA (0);			//ad_v最大值为1024，对应VDD=3.3

		ad_vl = (uint8_t)(ad_v & 0x3f);
		ad_vh = (uint8_t)((ad_v>>8) & 0x03);

		EEPROMwrite(0x12, ad_vh);
		EEPROMwrite(0x13, ad_vl);

		CLEAR_BIT(g_checkStBits, TEST_EN_BIT);
	}
}

/*==================================================================
* Function	    : Mode_changeCheckFuc
* Description	: 模式切换函数
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 根据拨动开关的值设定当前的模式挡位，用于中断函数和唤醒函数中
==================================================================*/
void Mode_changeCheckFuc()
{

	ALL_KEY_PULL;			//检测前将所有key的io都置位输入
 	DelayMs(1);				//延时1ms

	if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI)
	{
		DelayMs(10);		//防抖
		if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI)
		{
//			g_checkMode_pre = g_checkMode;				//记录之前的状态，用于开关机
			if(!Key_OFF2HI)	
			{
			//	OFF2HI_DOWN;			//将OFF2HI置位输出0，降低弱上拉造成的空耗
				g_checkMode = OFF2HI_MODE;
			}	
			else if(!KEY_GLO)
			{
			//	GLO_DOWN;				//将GLO置位输出0，降低弱上拉造成的空耗
				g_checkMode = GLO_MODE;
			}
			else if(!KEY_GLO2HI)
			{
			//	GLO2HI_DOWN;			//将GLO2HI置位输出0，降低弱上拉造成的空耗
				g_checkMode = GLO2HI_MODE;
			}
		}

	}else
	if((PORTA & OFF_STATE_BIT) == OFF_STATE_BIT)
	{
		DelayMs(10);		//防抖
		if((PORTA & OFF_STATE_BIT) == OFF_STATE_BIT)
		{
		//	ALL_KEY_PULL;			//将所有key的io都置位输入
			g_checkMode = OFF_MODE;
		}
	}

	ALL_KEYD_DOWN;			//检测完成后重新置回输出0

}


/*==================================================================
* Function	    : Event_checkFuc
* Description	: 事件处理函数
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
//			if(g_event_t != OFF_MODE)				//防止重入
//			{
//				BIS_SLEEP;					//BISS 进入休眠状态
//				g_event_t = OFF_MODE;
//				
//				//PWM_Disable();			//关闭PWM，不需要点led
//				LEDOFF;
//				GLOOFF;
//				eventEnterOFF();
//
//			}

			
			BIS_SLEEP;					//BISS 进入休眠状态
			g_event_t = OFF_MODE;
			
			//PWM_Disable();			//关闭PWM，不需要点led
			LEDOFF;
			GLO_TURNOFF;
			eventEnterOFF();
			break;
		case OFF2HI_MODE:
			GLO_TURNOFF;							//防止是在GLO ON 的时候切换过来
			
			g_event_t = OFF2HI_MODE;
			if(READ_BIT(g_checkStBits,SOLA_EN_BIT ))	//检测CDS是否符合条件
			{
				BIS_WORK;								//BISS 进入工作状态
				if(PIR_CTR)
				{
					LEDON;									//此处暂省if(READ_BIT(g_checkStBits, PIR_EN_BIT)
				
				//点亮时间 10000x2ms=20s
					g_ledkeep = LED_KEEPON_TIME;
					TIMER1_INTSTART();	
					OFF2HI_PULL;						//置成输入检测
					while(1)
					{
						CLRWDT();
						DelayMs(2);
						if(PIR_CTR)
						{
							if(g_ledkeep < (LED_KEEPON_TIME-LED_WAIT_TIME))
								g_ledkeep = LED_KEEPON_TIME;
						}
						if(g_ledkeep == 0)					//20S到
							break;
						if(Key_OFF2HI)						//按键拨动导致退出
						{
							DelayMs(10);
							if(Key_OFF2HI)
								break;
						}
					}
//					LEDOFF;									//关闭	led	
					if(g_ledkeep == 0)		//是20S时间到后的退出,继续1.4S的封闭时间
					{
						g_ledkeep = LED_WAIT_OFF_TRIG;
						BIS_SLEEP;
						while(1)
						{
							CLRWDT();	
							DelayMs(2);
							if(g_ledkeep == 0)break;		//1.4S到
							if(Key_OFF2HI)						//按键拨动导致退出
							{
								DelayMs(10);
								if(Key_OFF2HI)break;
							}
						}
						LEDOFF;									//关闭	led	
					//封闭时间 700X2MS=1.4s
						g_ledkeep = LED_KEEPCLOSE_TIME;
						while(1)
						{
							CLRWDT();	
							DelayMs(2);
							if(g_ledkeep == 0)break;		//1.4S到
							if(Key_OFF2HI)						//按键拨动导致退出
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
				
					OFF2HI_DOWN;						//置回输出0
					TIMER1_INTSTOP();					//关闭TIME1的计时中断处理
				}
			}
			//}
			break;
			
		case GLO2HI_MODE:

		LEDOFF;
		g_event_t = GLO2HI_MODE;
		if(READ_BIT(g_checkStBits,SOLA_EN_BIT ))	//检测CDS是否符合条件
		{
			BIS_WORK;								//BISS 进入工作状态
			if(PIR_CTR)
			{
				GLO_TURNOFF;
				LEDON;					
				g_ledkeep = LED_KEEPON_TIME;
				TIMER1_INTSTART();	
				GLO2HI_PULL;;						//置成输入检测
				while(1)
				{
					CLRWDT();
					DelayMs(2);
					if(PIR_CTR)
					{
						if(g_ledkeep < (LED_KEEPON_TIME-LED_WAIT_TIME))
							g_ledkeep = LED_KEEPON_TIME;
					}
					if(g_ledkeep == 0)					//20S到
						break;
					if(KEY_GLO2HI)						//按键拨动导致退出
					{
						DelayMs(10);
						if(KEY_GLO2HI)	
							break;
					}
				}
//				LEDOFF;									//关闭	led	
//				GLOON;									//继续打开GLO
				if(g_ledkeep == 0)		//是20S时间到后的退出,继续1.4S的封闭时间
				{
					g_ledkeep = LED_WAIT_OFF_TRIG;
					BIS_SLEEP;
					while(1)
					{
						CLRWDT();	
						DelayMs(2);
						if(g_ledkeep == 0)break;		//1.4S到
						if(Key_OFF2HI)						//按键拨动导致退出
						{
							DelayMs(10);
							if(Key_OFF2HI)break;
						}
					}
					LEDOFF;									//关闭	led	
					GLO_TURNON;	
//					BIS_WORK;
				//封闭时间 700X2MS=1.4s
					g_ledkeep = LED_KEEPCLOSE_TIME;
					while(1)
					{
						CLRWDT();	
						DelayMs(2);
						if(g_ledkeep == 0)break;		//1.4S到
						if(KEY_GLO2HI)							//按键拨动导致退出
						{
							DelayMs(10);
							if(KEY_GLO2HI)break;
						}
					}	
					BIS_WORK;
				}
				else{
					LEDOFF;									//关闭	led	
					GLO_TURNON;	
				}
				
				GLO2HI_DOWN;						//置回输出0
				TIMER1_INTSTOP();					//关闭TIME1的计时中断处理

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
			BIS_SLEEP;								//BISS休眠
			if(READ_BIT(g_checkStBits,SOLA_EN_BIT ))	//检测CDS是否符合条件
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
* Description	: 太像能CDS定标
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
	//完成太阳能板AD检测
	
		ad_sum = 0;
		for(i = 0;i < 10;i++)
		{
			ad_total[i] = GET_ADC_DATA (0); 		//ad_v最大值为1024，对应VDD=3.3
			ad_sum += ad_total[i];
		}
		for(i = 1;i < 10;i++)						//排序
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
		ad_sum = ad_sum - ad_total[0] - ad_total[9];		//减去最大最小值
		ad_sum >>= 3;										//除8取平均数
	
		//减小精度
//		i = ad_sum%10;		//取个位
//		j = ad_sum/10;		
//		j = j%10;			//取十位
//	
//		if(i > 4)	i=1;	//4舍5入
//		else	i = 0;
//	
//		j += i; 			//进位
//		if(j > 8)	j=1;	//大于8时 进位
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
* Remark        : 仅在OFF模式下起显示作用，所以不需要额外的上拉操作
==================================================================*/
uint8_t  chrg_ModeCheck()
{
//	uint16_t ad_VL[4];
	uint8_t ch_i;
//	static uint8_t ch_tim = BATTERY_CHEK_TIME;

	if(!CHRG_PORT)		//USB插入模式
	{
		DelayMs(100);	//防抖
		if(!CHRG_PORT)
		{
		//	WDT_INITIAL();			//使能看门狗，防卡死 	
			while(1)
			{
				Charg_Disp();
				
				for(ch_i = 10;ch_i--;)		//灭1S
				{
					CLRWDT();		 //清看门狗
					DelayMs(100);
					if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI || CHRG_PORT) 	//SLEEP时已上拉
					{
						DelayMs(100);		//防抖
						if(!Key_OFF2HI || !KEY_GLO || !KEY_GLO2HI || CHRG_PORT) 
						{
							CLRWDT();  
							SWDTEN = 0;					//除能看门狗，避免OFF状态下被唤醒
							if(CHRG_PORT)
							{
								return 1;				//充满或者拔出USB
							}
							else
							{
								return 2;				//开关切换而退出
							}
						}
					}	
				}
			}
		}
	}
	return 0;		//未充电
		
}


//void chrg_ModeCheck()
//{
//	uint16_t ad_VL[4];
//	uint8_t ch_i;
//	static uint8_t ch_tim;
//	
////	CHRG_PULL = 1;		//置位上拉
//	ch_tim = BATTERY_CHEK_TIME;		//10S复位
//	if(!CHRG_PORT)		//USB插入模式
//	{
//
//		DelayMs(100);
//		
//		if(CHRG_PORT)		//防抖
//			return;
//
//		GLOOFF;
//		LEDOFF;
//		BIS_SLEEP;
//		
//		
//		while(1)			//进入充电检测模式
//		{
//			if(ch_tim == BATTERY_CHEK_TIME)
//			{
//				oneGLO();
//
//				if(CHRG_PORT)		
//				{
//					CLRWDT(); //清看门狗
//					DelayMs(100);
//					if(CHRG_PORT)	
//					{
//						
////						CHRG_PULL = 0;		//上拉失效
//						return;		//充电USB被拔出
//					}
//				}
//			}
//			ch_tim--;
//			if(ch_tim <1 )
//				ch_tim = BATTERY_CHEK_TIME;
//
//			if(CHRG_PORT)		
//			{
//				CLRWDT(); //清看门狗
//				DelayMs(100);
//				if(CHRG_PORT)	
//				{
//					return;		//充电USB被拔出
//				}
//			}
//			
//			CLRWDT(); //清看门狗
//			SLEEP();			//大概520ms
//
//		}
//		//已充满
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
* Remark        : eeprom 地址0x11 aa代表大于基准值，55代表小于基准值。
				  采样值减小精确度，精确到0.322V  对应与100,精确到百位
				  连续采样3此，趋势一致才触发或者取消CDS
==================================================================*/
void Sola_checkFuc()
{
//	static uint8_t sola_on=0;
//	static uint8_t sola_off = 0;
	
//	uint8_t  sloar_en = 0;

	uint8_t i,j,z;
	uint16_t ad_v,ad_total[10],ad_sum;
	static uint16_t ad_vpre = 0;
//完成太阳能板AD检测

	for(z = 10;z--;)
	{
		ad_sum = 0;
		for(i = 0;i < 10;i++)
		{
			ad_total[i] = GET_ADC_DATA (0);			//ad_v最大值为1024，对应VDD=3.3
			ad_sum += ad_total[i];
		}
		for(i = 1;i < 10;i++)						//排序
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

		
		ad_sum = ad_sum - ad_total[0] - ad_total[9];		//减去最大最小值
		ad_sum >>= 3;										//除8取平均数



	//以下处理时间紧200us
		ad_v = FLITER_PRE * ad_sum + (FILTER_TOTAL - FLITER_PRE)*ad_vpre;
		ad_v = ad_v/FILTER_TOTAL;
		ad_vpre = ad_v;

	}

	
	if(g_adBaseValue == 0)return;

	if((g_gloCntTimer & 0x80) == 0x80)			//GLO模式下
	{
		if(ad_v <= g_adBaseValue)		//正常的没有反射光的模式
			g_gloEnvt_st = NORMAL_ENVT;
		else							//非正常感受到反射光的模式
		{
			g_gloEnvt_st = BEYOND_ENVT;
		}
	}
	
	g_gloCurValue = ad_v;

}




/*==================================================================
* Function	    : GLO_cdsCheckFuc
* Description	: 太阳能板检测完后，进行CDS阀值确认，以及CDS触发的检测
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void GLO_cdsCheckFuc()
{
	uint8_t m_adpre;				//记录cds百分比
	static uint8_t av_check_lt = 0;
	static uint8_t av_check_dt = 0;

	//GLO定时器检测
	if(g_gloCntTimer > 0x80)
	{
		g_gloCntTimer--;
		if(g_gloCntTimer==0x80) 	//定时时间到，开始定义恢复值  此时GLO已经点亮
		{
	
			if(g_gloEnvt_st == NORMAL_ENVT) 	//非反射光的正常模式
				g_gloRecValue = g_adBaseValue + g_cdsCmp;
			else
			if(g_gloEnvt_st == BEYOND_ENVT) 	//带有反射光的模式
			{
		//		m_adpre = ((g_gloCurValue-g_adBaseValue)/g_gloCurValue)*100;
				m_adpre = g_adBaseValue*100/g_gloCurValue;
	
				if(m_adpre < CDS_COMP_MAX)		//超出最大值
					g_gloRecValue = g_adBaseValue + g_cdsCmp;		//cds超出预设最大值，直接灭灯
				else			//既3lux~n 的情况
				{
					g_gloRecValue =  g_gloCurValue + g_cdsCmp; 		//将CDS阀值设置成当前环境光的值
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
			SET_BIT(g_checkStBits,SOLA_EN_BIT); 		//cds符合条件
		}
	}


}
/*==================================================================
* Function	    : Solar_BaseDefine
* Description	: Solar define，write the value to the eeprom
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
//完成太阳能板AD检测

//	oneGLO();	
	ADON = 1;
	DelayMs(100);

	for(define_t = 50;define_t--;)
	{
		
		CLRWDT();
		ad_sum = 0;
		for(i = 0;i < 10;i++)
		{
			ad_total[i] = GET_ADC_DATA (0);			//ad_v最大值为1024，对应VDD=3.3
			ad_sum += ad_total[i];
		}

		for(i = 1;i < 10;i++)						//排序
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
		ad_sum = ad_sum - ad_total[0] - ad_total[9];		//减去最大最小值
		ad_sum >>= 3;										//除8取平均数
	
		ad_v = FLITER_PRE * ad_sum + (FILTER_TOTAL - FLITER_PRE)*ad_vpre;
		ad_v = ad_v/FILTER_TOTAL;
		ad_vpre = ad_v;
	}


	AD_baseWriteFuc(ad_v);

	ADON = 0;


	oneGLO();		//闪烁两次提示校验完成
	CLRWDT();
	DelayMs(200);
	oneGLO();
	CLRWDT();
	DelayMs(200);
	oneGLO();
}
//******************************************** 
//函数名称：DelayUs
//功能：    短延时函数 --16M-2T--大概快1%左右.
//输入参数：Time  延时时间长度   延时时长TimeUs
//返回参数：此参数仅供其他函数调用，本身未满足 
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
//函数名称：DelayMs
//功能：    短延时函数
//输入参数：Time  延时时间长度   延时时长Timems
//返回参数：无 
//********************************************
void DelayMs(uint8_t Time)
{
	uint8_t a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(98); //快1%
		}
		CLRWDT();
	}
	CLRWDT();
}
//******************************************** 
//函数名称：DelayS
//功能：    短延时函数
//输入参数：Time  延时时间长度   延时时长TimeS
//返回参数：无 
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
* Description	: 读EEPROM数据
* Input Para	: EEAddr 需读取数据的地址
* Output Para	: ReEEPROMread  对应地址读出的数据
* Return Value  : 
* Remark        : 
==================================================================*/
uint8_t EEPROMread(uint8_t EEAddr)
{
	uint8_t ReEEPROMread;

	EEADR = EEAddr;    
	RD = 1;
	ReEEPROMread = EEDAT;     //EEPROM的读数据 ReEEPROMread = EEDATA;
	RD = 0;
	return ReEEPROMread;
}

/*==================================================================
* Function	    : EEPROMwrite
* Description	: 写数据到EEPROM
* Input Para	: EEAddr  需要写入数据的地址
				  Data    需要写入的数据
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void EEPROMwrite(uint8_t EEAddr,uint8_t Data)
{
	uint8_t gietag;

	gietag = GIE;
	GIE = 0;				//写数据必须关闭中断
	while(GIE);			 	//等待GIE为0		不加喂狗，500ms未置0复位
//	{
//		CLRWDT();
//	}
	EEADR = EEAddr; 	 //EEPROM的地址
	EEDAT = Data;		 //EEPROM的写数据  EEDATA = Data;
	EEIF = 0;
	EECON1 |= 0x34;		//置位WREN1,WREN2,WREN3三个变量.
	WR = 1;				//置位WR启动编程
	while(WR);      //等待EE写入完成 ,不加喂狗，500ms未置0复位
//	{
//		CLRWDT();
//	}
	GIE = gietag;
}




/*==================================================================
* Function	    : EEPROM_Init
* Description	: 在使用EEPROM之前需要在未使用位置写入两次0xAA
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
* Description	: 写入版本号
* Input Para	: V_d：版本代号， D_d 版本号
* Output Para	: 
* Return Value  : 
* Remark        :MB22084版本代号为0x84,版本号V1.0 写成 0x10
==================================================================*/
void Version_Write()
{
	uint8_t V_d, D_d,V_rd, D_rd;



	EEPROMwrite(VERSION_TADD, VERSION_T);
	EEPROMwrite(VERSION_VADD, VERSION_V);
	
//检验是否写入正确
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
* Description	: 获取太阳能板的基准电压参考值
* Input Para	: 
* Output Para	: 
* Return Value  : 写入成功返回1，失败返回0
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
* Description	: 将获取到的值放入到eeprom中
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

//检验是否写入正确,如不正确再次写入
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
//		/*BIT[6:5] VREGM[1:0]-D稳压器电压(VREG)选择位 00-2.4V 01-3.6V 10-4.8V 11-5.3V
//		  BIT[4:0] VREGHB[4:0] PA4输出电压设置 
//				   VOUT = VREG*(VREGHB+1)/32	
//		*/
//	VCON2 = 0B00001111; //VOUT = 2.4*(15+1)/32 = 1.2V
//		/*
//		  BIT[4:0] VREGLB[4:0] PC5输出电压设置 
//				   VOUT = VREG*(VREGLB+1)/32	
//		*/	

	VCON1 = 0B00000000; 		//VREG = 3.6V
	VCON2 = 0B00001011; //VOUT = 3.6*(11+1)/32 = 1.35V

	
	VREG_OE = 1;//稳压器输出使能
}

//74HC595相关
/*==================================================================
* Function	: Seg_Display
* Description	:  数码管显示
* Input Para	: 要显示的数据，该数据必须小于4096 最小-99
* Output Para	: 
* Return Value: 
* Remark  : 
==================================================================*/
void Seg_Display(uint16_t date)
{
	uint8_t *led_table;          // 查表指针
	uint8_t   ge_d,shi_d,bai_d,qian_d;
	ge_d = shi_d = bai_d = qian_d = 0;


	if(date < 4096)
	{

		if(date >= 0)
		{
//千位显示
			qian_d = date/1000;							
			date = date - qian_d * 1000;
			led_table = Seg_0F + qian_d;
			qian_d = *led_table;
			Seg_OUT(qian_d);			
			Seg_OUT(0x08);
			Seg_Lock();

//百位显示
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
//千位
			qian_d = 0xff;
			Seg_OUT(qian_d);			
			Seg_OUT(0x08);
			Seg_Lock();

//百位显示

			bai_d = 0xbf;
			Seg_OUT(bai_d);			
			Seg_OUT(0x04);
			Seg_Lock();	

		}
	
	//十位显示
		shi_d = date/10;							
//		date = date - shi_d * 10;
		led_table = Seg_0F + shi_d;
		shi_d = *led_table;
		Seg_OUT(shi_d);			
		Seg_OUT(0x02);
		Seg_Lock();

	//个位显示
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
* Description	: 数码管单字节串行移位函数
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
* Description	: 锁存数据并显示
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
* Description	: 初始化数码管
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
* Description	: 进入测试模式
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TestFunc_Enable()
{
//设置为输入

//	TESTPORT1_DIR = 1;
//	TESTPORT2_DIR = 1;
	
//设置成弱上拉
//	TESTPORT1_SCLPULL = 1;
//	TESTPORT2_SDAPULL = 1;

//	TESTPORT_ENDIR = 1;		//置成输入模式
//	TESTPORT_ENPULL = 1;	//弱上拉
	ALL_KEY_PULL;			//检测前将所有key的io都置位输入

//	ADON = 1;	
	
}


/*==================================================================
* Function	    : TestFunc_Disable
* Description	: 退出测试模式
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 
==================================================================*/
void TestFunc_Disable()
{
//设置为输出
//	TESTPORT1_DIR = 0;
//	TESTPORT2_DIR = 0;
//
////设置成弱上拉
//	TESTPORT1_SCLPULL = 0;
//	TESTPORT2_SDAPULL = 0;
//
//	Test_port1 = 0;
//	Test_port2 = 0;

	
//	TESTPORT_ENDIR = 0;		//置成输出模式
//	TESTPORT_VALUE = 0;		//输出置0
	ALL_KEYD_DOWN;

//	ADON = 0;	


}


/*==================================================================
* Function		: main
* Description	: 主函数
* Input Para	: 
* Output Para	: 
* Return Value  : 
* Remark        : 采用WDT定期唤醒检测来实现低功耗
==================================================================*/
void main(void)
{		
	uint8_t main_i = 0;
	uint8_t main_j = 0;
//	static uint8_t ad_ch=0;			//确保每次唤醒只检测一次solar
//	uint8_t  sloar_en = 0;
	
	POWER_INITIAL(); 
//	PWM_INITIAL(3000,128);				//默认HI模式
	ADC_INITIAL();
	WDT_INITIAL();
	INT_INITIAL();
	EEPROM_Init();
	Version_Write();				//版本写入





	LEDOFF;
	GLOOFF;
	BIS_SLEEP;

	DelayMs(250);			//等待电压稳定时间
	DelayMs(250);			//等待电压稳定时间
	DelayMs(250);			//等待电压稳定时间
	DelayMs(250);			//等待电压稳定时间
	
//此处添加测试模块
	TestFunc_Enable();
//定标模式被触发
	if(!Key_OFF2HI && !KEY_GLO && !KEY_GLO2HI)
	{
		DelayMs(100);
//		if(TESTPORT_VALUE == 0)
		if(!Key_OFF2HI && !KEY_GLO && !KEY_GLO2HI)
		{
		//	ADON = 1;
			//适应环境1S
			DelayMs(250);
			DelayMs(250);
			DelayMs(250);
			DelayMs(250);

			Solar_BaseDefine();

		//	ADON = 0;
//			while(TESTPORT_VALUE == 0)
			while(1)			//等待关机重置
				CLRWDT();
			
			
		}
	}
		
	TestFunc_Disable();

//上电提示
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
//		ADON = 1;				//使能ADC
//		DelayMs(1);				//使ADC稳定
//		Sola_baseCheck();
//		CLRWDT();
//		ADON = 0;
//	}


//key test
//	TESTKEYDIR = 1;
//	WPUC |= 0B00001000; 
//	GIE = 1;
	
	if(AD_baseGetFuc() == 0)	//获取CDS基值
		AD_baseGetFuc();		//如果读取失败，再次读取	


//	g_adBaseValue = 100;
	g_gloRecValue = (g_adBaseValue * CDS_REVISE_PER)/10;	//初始化时 恢复值就是设定的CDS值+补偿值
	g_cdsCmp = g_gloRecValue-g_adBaseValue;

//主循环
//step1检测CDS,step2 检测开关状态，step3 检测PIR
	while(1)			//sleep前大概72ms
    {
		CLRWDT(); //清看门狗		
		if(g_checkMode == OFF_MODE)
		{
			main_i = chrg_ModeCheck();			//充电USB检测
		}
		
		if(main_i != 1)		//未充电或开关方式退出充电显示的		
		{			
		//AD运行时间（连续采集11次，用时12ms）			
			ADON = 1;				//使能ADC
			DelayMs(1);				//使ADC稳定
	//		for(main_j = 10;main_j--;)
			Sola_checkFuc();		//CDS检测
			ADON = 0;				//使能ADC

			GLO_cdsCheckFuc();
			
			Mode_changeCheckFuc();						//检测是否是开关触发
			//之前部分运行13ms上下
			Event_checkFuc();
		}
		main_i = 0;
		if((g_checkMode != OFF_MODE) ||  CHRG_PORT)	//防止在非off状态插入USB而遗漏显示
		{
			CLRWDT(); //清看门狗
			SLEEP();			//大概520ms
		}

    }
}

