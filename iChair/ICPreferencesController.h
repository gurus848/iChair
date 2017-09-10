//
//  ICPreferencesController.h
//  iChair
//
//  Created by Guru Senthil on 10/28/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICPreferencesController : NSObject{
    
    IBOutlet NSTextField *sText; //shoulder assingment label
    IBOutlet NSTextField *qText; //squinting assingnment label
    IBOutlet NSTextField *hText; //head assingment label
    IBOutlet NSTextField *uText; //upper body assingment label
    
    IBOutlet NSButton *speechBox; //speech check box
    IBOutlet NSButton *windowBox; //pop-up check box
    
    IBOutlet NSTextField *stepField;
    IBOutlet NSStepper *stepper;
    
    NSString *shText;
    NSString *quText;
    NSString *heText;
    NSString *upText;

}

- (IBAction)sEnable:(id)sender;
- (IBAction)qEnable:(id)sender;
- (IBAction)hEnable:(id)sender;
- (IBAction)uEnable:(id)sender;

- (IBAction)sDisable:(id)sender;
- (IBAction)qDisable:(id)sender;
- (IBAction)hDisable:(id)sender;
- (IBAction)uDisable:(id)sender;

- (IBAction)stepperChanged:(id)sender;

- (IBAction)sync:(id)sender;


@end
