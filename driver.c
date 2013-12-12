#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <sys/mman.h>
#include <bcm2835.h>
#include <native/task.h>
#include <native/timer.h>

RT_TASK laser_task;

#define RIGHT_CLOCK RPI_V2_GPIO_P1_11
#define RIGHT_DIR RPI_V2_GPIO_P1_12
#define LEFT_CLOCK RPI_V2_GPIO_P1_13
#define LEFT_DIR RPI_V2_GPIO_P1_15

#define POWER_CLOCK RPI_V2_GPIO_P1_18
#define POWER_1 RPI_V2_GPIO_P1_21
#define POWER_2 RPI_V2_GPIO_P1_22
#define POWER_3 RPI_V2_GPIO_P1_23
#define POWER_4 RPI_V2_GPIO_P1_24

#define LASER RPI_V2_GPIO_P1_16

char motiondata[21];

//scp driver.c rpi@192.168.0.105:/home/rpi/simplelaser
//scp laserjob.bin rpi@192.168.0.105:/home/rpi/simplelaser
//gcc -I/usr/xenomai/include -Ibcm2835-1.25 bcm2835-1.25/bcm2835.c driver.c -L/usr/xenomai/lib -lnative -lxenomai -o driver
//export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/xenomai/lib

void doLaserJob(void *arg)
{
    /*
     * Arguments: &task (NULL=self),
     *            start time,
     *            period (here: 1 s)
     */
    
    
    int delaytimes[500] = {
    //linear mode
    1299468,1296944,1294420,1291896,1289372,1286848,1284324,1281800,1279276,1276752,1274228,1271704,1269180,1266656,1264132,1261608,1259084,1256560,1254036,1251512,1248988,1246464,1243940,1241416,1238892,1236368,1233844,1231320,1228796,1226272,1223748,1221224,1218701,1216177,1213653,1211129,1208605,1206081,1203557,1201033,1198509,1195985,1193461,1190937,1188413,1185889,1183365,1180841,1178317,1175793,1173269,1170745,1168221,1165697,1163173,1160649,1158125,1155601,1153077,1150553,1148029,1145505,1142981,1140457,1137933,1135409,1132885,1130361,1127837,1125313,1122789,1120265,1117741,1115217,1112693,1110169,1107645,1105121,1102597,1100073,1097549,1095025,1092501,1089977,1087453,1084929,1082405,1079881,1077357,1074833,1072309,1069785,1067261,1064737,1062214,1059690,1057166,1054642,1052118,1049594,1047070,1044546,1042022,1039498,1036974,1034450,1031926,1029402,1026878,1024354,1021830,1019306,1016782,1014258,1011734,1009210,1006686,1004162,1001638,999114,996590,994066,991542,989018,986494,983970,981446,978922,976398,973874,971350,968826,966302,963778,961254,958730,956206,953682,951158,948634,946110,943586,941062,938538,936014,933490,930966,928442,925918,923394,920870,918346,915822,913298,910774,908250,905727,903203,900679,898155,895631,893107,890583,888059,885535,883011,880487,877963,875439,872915,870391,867867,865343,862819,860295,857771,855247,852723,850199,847675,845151,842627,840103,837579,835055,832531,830007,827483,824959,822435,819911,817387,814863,812339,809815,807291,804767,802243,799719,797195,794671,792147,789623,787099,784575,782051,779527,777003,774479,771955,769431,766907,764383,761859,759335,756811,754287,751763,749239,746716,744192,741668,739144,736620,734096,731572,729048,726524,724000,721476,718952,716428,713904,711380,708856,706332,703808,701284,698760,696236,693712,691188,688664,686140,683616,681092,678568,676044,673520,670996,668472,665948,663424,660900,658376,655852,653328,650804,648280,645756,643232,640708,638184,635660,633136,630612,628088,625564,623040,620516,617992,615468,612944,610420,607896,605372,602848,600324,597800,595276,592752,590229,587705,585181,582657,580133,577609,575085,572561,570037,567513,564989,562465,559941,557417,554893,552369,549845,547321,544797,542273,539749,537225,534701,532177,529653,527129,524605,522081,519557,517033,514509,511985,509461,506937,504413,501889,499365,496841,494317,491793,489269,486745,484221,481697,479173,476649,474125,471601,469077,466553,464029,461505,458981,456457,453933,451409,448885,446361,443837,441313,438789,436265,433741,431218,428694,426170,423646,421122,418598,416074,413550,411026,408502,405978,403454,400930,398406,395882,393358,390834,388310,385786,383262,380738,378214,375690,373166,370642,368118,365594,363070,360546,358022,355498,352974,350450,347926,345402,342878,340354,337830,335306,332782,330258,327734,325210,322686,320162,317638,315114,312590,310066,307542,305018,302494,299970,297446,294922,292398,289874,287350,284826,282302,279778,277254,274731,272207,269683,267159,264635,262111,259587,257063,254539,252015,249491,246967,244443,241919,239395,236871,234347,231823,229299,226775,224251,221727,219203,216679,214155,211631,209107,206583,204059,201535,199011,196487,193963,191439,188915,186391,183867,181343,178819,176295,173771,171247,168723,166199,163675,161151,158627,156103,153579,151055,148531,146007,143483,140959,138435,135911,133387,130863,128339,125815,123291,120767,118244,115720,113196,110672,108148,105624,103100,100576,98052,95528,93004,90480,87956,85432,82908,80384,77860,75336,72812,70288,67764,65240,62716,60192,57668,55144,52620,50096,47572,45048,42524,40000};

    rt_task_set_periodic(NULL, TM_NOW, delaytimes[0]);
    
    //////////////////////////
    // read the motion data //
    //////////////////////////

    FILE *source;
    
    long numbytes;
    long num_records;
    int recordLength = 4;
    
    unsigned long *data;

    source = fopen(motiondata, "rb");
    if (source == NULL) {
        printf("ERROR: could not open motiondata.\n");
        exit(1);
    }
    fseek(source, 0L, SEEK_END);
    numbytes = ftell(source);
    fseek(source, 0L, SEEK_SET);
    data = (long*)calloc(numbytes/recordLength, recordLength);
    if(data == NULL){
        printf("mem error\n");
    }
    fread(data, recordLength, numbytes, source);
    fclose(source);

    //start
    int currentdelay = delaytimes[0];
    int xdir = 1;
    int ydir = 1;
    int linecounter = 0;
    
    num_records = numbytes / recordLength;
    
    int xstep = 0;
    int ystep = 0;
    int laser = 0;
    int power = 0;
    int speed = 0;
    
    // mask  393216   0b1100000000000000000
    // power_mask  7680   0b1111000000000
    // speed_mask  511   0b111111111

    int mask = 393216;
    int power_mask = 7680;
    int speed_mask = 511; 
    
    long i;
    unsigned long record;
    unsigned long counter = 1;

    for(i=0;i<num_records;i+=4){
        
        rt_task_wait_period(NULL);

        record = data[i];
        
        xstep = (record & mask) >> 17;
        ystep = (record & mask >> 2) >> 15;
        laser = (record & mask >> 4) >> 13;
        power = (record & power_mask) >> 9;
        speed = (record & speed_mask);

        printf( "record: %i %i %i %i %i \n",xstep,ystep,laser,power,speed);

        if(xstep != xdir){
            if(xstep < 1){
                bcm2835_gpio_write(LEFT_DIR, HIGH);
            }else if(xstep > 1){
                bcm2835_gpio_write(LEFT_DIR, LOW);
            }
            
            xdir = xstep;
            
        }
        
        if(ystep != ydir){
            if(ystep < 1){
                bcm2835_gpio_write(RIGHT_DIR, HIGH);
            }else if(ystep > 1){
                bcm2835_gpio_write(RIGHT_DIR, LOW);
            }
            
            ydir = ystep;
            
        }
        
        currentdelay = delaytimes[speed];
 
        // sync the stepper steps //
        if (xstep != 1) {
            bcm2835_gpio_write(LEFT_CLOCK, HIGH);
        }
        if (ystep != 1) {
            bcm2835_gpio_write(RIGHT_CLOCK, HIGH);
        }
        
        rt_task_sleep(100);
        //rt_task_set_periodic(NULL, TM_NOW, currentdelay);
        
        if (xstep != 1) {
            bcm2835_gpio_write(LEFT_CLOCK, LOW);
        }
        if (ystep != 1) {
            bcm2835_gpio_write(RIGHT_CLOCK, LOW);
        }
        
        rt_task_set_periodic(NULL, TM_NOW, currentdelay);

        counter ++;
        
    }
    
    free(data);

    alarm(1);
    
}

void catch_signal(int sig)
{
}

int main(int argc, char* argv[])
{

    if ( argc != 2 ){  
        printf( "usage: %s: please supply motiondata source.\n", argv[0] );
        return -1;
    }else{
        strcpy(motiondata, argv[1]);    
    }

    signal(SIGTERM, catch_signal);
    signal(SIGINT, catch_signal);
    signal(SIGALRM, catch_signal);
    
    /* Avoids memory swapping for this program */
    mlockall(MCL_CURRENT|MCL_FUTURE);

    if (!bcm2835_init()){
        printf("error\n");
        //return 1;
    }
    
    bcm2835_gpio_fsel(RIGHT_CLOCK, BCM2835_GPIO_FSEL_OUTP);
    bcm2835_gpio_fsel(RIGHT_DIR, BCM2835_GPIO_FSEL_OUTP);
    bcm2835_gpio_fsel(LEFT_CLOCK, BCM2835_GPIO_FSEL_OUTP);
    bcm2835_gpio_fsel(LEFT_DIR, BCM2835_GPIO_FSEL_OUTP);
    
    /*
     * Arguments: &task,
     *            name,
     *            stack size (0=default),
     *            priority,
     *            mode (FPU, start suspended, ...)
     */
    rt_task_create(&laser_task, "simple-laser", 0, 99, 0);
    /*
     * Arguments: &task,
     *            task function,
     *            function argument
     */
    rt_task_start(&laser_task, &doLaserJob, NULL);

    pause();

    rt_task_delete(&laser_task);

    return 0;
    
}
