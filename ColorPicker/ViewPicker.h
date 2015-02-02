//
//  ViewController.h
//  ColorPicker
//
//  Created by SantiagoDls on 02/02/15.
//  Copyright (c) 2015 ConstruApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPicker : UIViewController

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UILabel *lbColor;
@property (strong, nonatomic) IBOutlet UILabel *lbRed;
@property (strong, nonatomic) IBOutlet UILabel *lbGreen;
@property (strong, nonatomic) IBOutlet UILabel *lbBlue;
@property (strong, nonatomic) IBOutlet UILabel *lbAlpha;
@property (strong, nonatomic) IBOutlet UILabel *lbBlink;

@property (strong, nonatomic) IBOutlet UITextField *txtColor;

@property (strong, nonatomic) IBOutlet UISlider *slRed;
@property (strong, nonatomic) IBOutlet UISlider *slGreen;
@property (strong, nonatomic) IBOutlet UISlider *slBlue;
@property (strong, nonatomic) IBOutlet UISlider *slAlpha;
@property (strong, nonatomic) IBOutlet UIButton *cmdBlink;




@property (strong, nonatomic) IBOutlet UIStepper *stBlink;

- (IBAction)changeGreen:(id)sender;
- (IBAction)changeBlue:(id)sender;
- (IBAction)changeRed:(id)sender;
- (IBAction)changeAlpha:(id)sender;

- (IBAction)clicBlink:(id)sender;



@end

