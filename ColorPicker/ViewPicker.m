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
int blink=0;
UIColor *color;
NSString *hex;
@interface ViewPicker ()

@end

@implementation ViewPicker

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void setColor(int rcol,int gcol,int bcol, float bk){
    rcolor=rcol;
    gcolor=gcol;
    bcolor=bcol;
    blink=bk;
    color=[UIColor colorWithRed:rcolor/255.0
                          green:gcolor/255.0
                           blue:bcolor/255.0
                          alpha:bk];
    
}

-(void) refreshColor{
    //Asi se llama a un action
    //[self changeGreen:nil];
    gcolor=self.slGreen.value;
    self.lbGreen.text=[@(gcolor) stringValue];
    
    bcolor=self.slBlue.value;
    self.lbBlue.text=[@(bcolor) stringValue];
    
    blink=self.slBlink.value;
    self.lbBlink.text=[@(blink) stringValue];
    
    rcolor=self.slRed.value;
    self.lbRed.text=[@(rcolor) stringValue];
    setColor(rcolor, gcolor, bcolor, blink);
    
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
-(NSString*) formatHex:(NSString*)hex{
    int len = [hex length];
    if(len==1){
        hex = [NSString stringWithFormat:@"%@%@",@"0",hex ];
    }
    return hex;
}

- (IBAction)changeGreen:(id)sender {
    [self refreshColor];
}

- (IBAction)changeBlue:(id)sender {
    [self refreshColor];
}

- (IBAction)changeBlink:(id)sender {
    [self refreshColor];
}

- (IBAction)changeRed:(id)sender {
   [self refreshColor];
}
@end
