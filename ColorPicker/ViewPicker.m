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
float blink=0;
UIColor *color;
@interface ViewPicker ()

@end

@implementation ViewPicker

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    setColor(0,0,0,1);
    self.lbColor.backgroundColor=color;
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

void refreshColor(){
    
}

- (IBAction)changeGreen:(id)sender {
    gcolor=self.slGreen.value;
    self.lbGreen.text=[@(gcolor) stringValue];
}

- (IBAction)changeBlue:(id)sender {
    bcolor=self.slBlue.value;
    self.lbBlue.text=[@(bcolor) stringValue];
}

- (IBAction)changeBlink:(id)sender {
    blink=self.slBlink.value;
    self.lbBlink.text=[@(blink) stringValue];
}

- (IBAction)changeRed:(id)sender {
    rcolor=self.slRed.value;
    self.lbRed.text=[@(rcolor) stringValue];
}
@end
