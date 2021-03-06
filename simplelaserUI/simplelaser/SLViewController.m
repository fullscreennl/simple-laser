//
//  SLViewController.m
//  simplelaser
//
//  Created by johan ten broeke on 12/17/13.
//  Copyright (c) 2013 johan ten broeke. All rights reserved.
//

#import "SLViewController.h"
#import "GCDAsyncSocket.h"


@interface SLViewController ()

@end

@implementation SLViewController{

    GCDAsyncSocket *asyncSocket;
    IBOutlet UIButton *connectButton;

}

-(void)connect{
    
    NSError *error = nil;
    NSString *ipAddress = [[NSUserDefaults standardUserDefaults] stringForKey:@"raspberryPi"];
    if (![asyncSocket connectToHost:ipAddress onPort:20001 withTimeout:3.0 error:&error])
    {
        NSLog(@"ERROR %@",error);
        [asyncSocket disconnect];
    }else{
        NSLog(@"OK trying to connect @ %@",ipAddress);
    }
    
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    //[asyncSocket disconnect];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    [self applyConnectButtonState];
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    [self applyConnectButtonState];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
	asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    [self connect];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)jogXUp:(id)sender{
    [self command:@"xup"];
}

-(IBAction)jogXDown:(id)sender{
    [self command:@"xdown"];
}

-(IBAction)jogYUp:(id)sender{
    [self command:@"yup"];
}

-(IBAction)jogYDown:(id)sender{
    [self command:@"ydown"];
}

-(IBAction)jogZUp:(id)sender{
    [self command:@"zup"];
}

-(IBAction)jogZDown:(id)sender{
    [self command:@"zdown"];
}

-(IBAction)laser:(id)sender{
    [self command:@"laser"];
}

-(IBAction)startJob:(id)sender{
    [self command:@"startjob"];
}

-(IBAction)stopAction:(id)sender{
    [self command:@"stop"];
}

-(IBAction)connect:(id)sender{
    [self connect];
}

-(void)applyConnectButtonState{
    [connectButton setEnabled:!asyncSocket.isConnected];
    if(connectButton.isEnabled){
        connectButton.titleLabel.text = @"CONNECT";
    }else{
        connectButton.titleLabel.text = @"";
    }
}

-(void)command:(NSString*)cmd{
    [self applyConnectButtonState];
    NSString *cmd_str = [NSString stringWithFormat:@"{\"action\":\"%@\"}\0",cmd];
    NSData* command = [cmd_str dataUsingEncoding:[NSString defaultCStringEncoding]];
    [asyncSocket writeData:command withTimeout:-1 tag:1];
}

@end
