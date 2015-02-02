//
//  ViewController.m
//  ColorPicker
//
//  Created by SantiagoDls on 02/02/15.
//  Copyright (c) 2015 ConstruApps. All rights reserved.
//

#import "ViewPicker.h"
int rcolor=0;
int gcolor=0;
int bcolor=0;
float alpha=1;

int blink=1;
int tiempo=0;
int segundo=0;

UIColor *color;
NSString *hex;
@interface ViewPicker ()

@end

@implementation ViewPicker

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshColor];
    self.lbBlink.text=[@(blink) stringValue];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void setColor(int rcol,int gcol,int bcol, float al){
    rcolor=rcol;
    gcolor=gcol;
    bcolor=bcol;
    alpha=al;
    color=[UIColor colorWithRed:rcolor/255.0
                          green:gcolor/255.0
                           blue:bcolor/255.0
                          alpha:al];
    
}

-(void) refreshColor{
    //Asi se llama a un action
    //[self changeGreen:nil];
    
    alpha=self.slAlpha.value;
    alpha=(double)alpha/100;
    self.lbAlpha.text=[NSString stringWithFormat:@"%.2f", alpha];
    
    gcolor=self.slGreen.value;
    self.lbGreen.text=[@(gcolor) stringValue];
    
    bcolor=self.slBlue.value;
    self.lbBlue.text=[@(bcolor) stringValue];
    
    rcolor=self.slRed.value;
    self.lbRed.text=[@(rcolor) stringValue];
    setColor(rcolor, gcolor, bcolor, alpha);
    
    
    self.lbColor.backgroundColor=color;
    
    NSString *hexred=@"";
    hexred = [NSString stringWithFormat:@"%lX",
            (unsigned long)[[@(rcolor) stringValue] integerValue]];
    
    NSString *hexgreen=@"";
    hexgreen = [NSString stringWithFormat:@"%lX",
              (unsigned long)[[@(gcolor) stringValue] integerValue]];
    
    NSString *hexblue=@"";
    hexblue = [NSString stringWithFormat:@"%lX",
              (unsigned long)[[@(bcolor) stringValue] integerValue]];
    
    NSString *hex;
    
    hexred=[self formatHex:hexred];
    hexgreen=[self formatHex:hexgreen];
    hexblue=[self formatHex:hexblue];
    hex = [NSString stringWithFormat:@"%@%@%@",hexred,hexgreen,hexblue ];
    self.txtColor.text=hex;
    
}

- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3f
                                                  target:self
                                                selector:@selector(initBlink:)
                                                userInfo:nil
                                                 repeats:YES];
    
}

- (void)initBlink:(NSTimer *)timer {
    segundo++;
    if (segundo>tiempo){
        [self.timer invalidate];
        self.timer = nil;
        setColor(rcolor, gcolor, bcolor, alpha);
        segundo=0;
        tiempo=0;
        self.cmdBlink.enabled=true;
        [self refreshColor];
    }else{
        if((segundo % 2) == 0){
            NSLog(@"%d %@",segundo,@"par");
            self.lbColor.backgroundColor=[UIColor whiteColor];
        }else{
            setColor(rcolor, gcolor, bcolor, alpha);
            [self refreshColor];
        }
    }    
}

-(NSString*) formatHex:(NSString*)hex{
    int len = [hex length];
    if(len==1){
        hex = [NSString stringWithFormat:@"%@%@",@"0",hex ];
    }
    return hex;
}

- (IBAction)changeRed:(id)sender {
    [self refreshColor];
}

- (IBAction)changeAlpha:(id)sender {
    [self refreshColor];
}


- (IBAction)changeGreen:(id)sender {
    [self refreshColor];
}

- (IBAction)changeBlue:(id)sender {
    [self refreshColor];
}

- (IBAction)clicBlink:(id)sender {
    self.lbBlink.text=[NSString stringWithFormat:@"%d",(int)self.stBlink.value];
    blink=self.stBlink.value;
}

- (IBAction)testBlink:(id)sender {
    self.cmdBlink.enabled=false;
    tiempo=blink*2;
    [self startTimer];
}





@end
