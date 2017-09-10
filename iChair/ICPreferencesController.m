//
//  ICPreferencesController.m
//  iChair
//
//  Created by Guru Senthil on 10/28/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import "ICPreferencesController.h"

NSInteger val;

@implementation ICPreferencesController

//done

- (void)awakeFromNib{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    BOOL sh = [prefs boolForKey:@"shoulderED"];
    BOOL qu = [prefs boolForKey:@"squintED"];
    BOOL he = [prefs boolForKey:@"headED"];
    BOOL up = [prefs boolForKey:@"upED"];
    
    BOOL wind = [prefs floatForKey:@"windowBox"];
    BOOL speech = [prefs floatForKey:@"speechBox"];
    
    val = [prefs integerForKey:@"delayValue"];
    if (val == 0) {
        val = 1;
    }
    int value = val;
    
    NSString *string = [[NSString alloc]initWithFormat:@"%i seconds", value];
    [stepField setStringValue:string];
    
    [stepper setIntegerValue:val];
    
    
    if (wind == NO) {
        [windowBox setState:NSOffState];
    
    }else{
        [windowBox setState:NSOnState];
        
    }
    
    if (speech == NO) {
        [speechBox setState:NSOffState];
    
    }else{
        [speechBox setState:NSOnState];
        
    }
    
    
    
    if (sh == YES) {
        shText = @"Enabled";
    }else{
        shText = @"Disabled";
    }
    if (qu == YES) {
        quText = @"Enabled";
    }else{
        quText = @"Disabled";
    }
    if (he == YES) {
        heText = @"Enabled";
    }else{
        heText = @"Disabled";
    }
    if (up == YES) {
        upText = @"Enabled";
    }else{
        upText = @"Disabled";
    }
    
    
    
    if ([shText length] == 0) {
        shText = @"Enabled";
    }
    if ([quText length] == 0) {
        quText = @"Enabled";
    }
    if ([heText length] == 0) {
        heText = @"Enabled";
    }
    if ([upText length] == 0) {
        upText = @"Enabled";
    }
    
    
    [sText setStringValue:shText];
    [qText setStringValue:quText];
    [hText setStringValue:heText];
    [uText setStringValue:upText];
    
}




- (IBAction)sEnable:(id)sender{
    
    [sText setStringValue:@"Enabled"];
    shText = [sText stringValue];
}
- (IBAction)qEnable:(id)sender{
    
    [qText setStringValue:@"Enabled"];
    quText = [qText stringValue];
}
- (IBAction)hEnable:(id)sender{
    
    [hText setStringValue:@"Enabled"];
    heText = [hText stringValue];
}
- (IBAction)uEnable:(id)sender{
    
    [uText setStringValue:@"Enabled"];
    upText = [uText stringValue];
}

- (IBAction)sDisable:(id)sender{
    
    [sText setStringValue:@"Disabled"];
    shText = [sText stringValue];
}
- (IBAction)qDisable:(id)sender{
    
    [qText setStringValue:@"Disabled"];
    quText = [qText stringValue];
}
- (IBAction)hDisable:(id)sender{
    
    [hText setStringValue:@"Disabled"];
    heText = [hText stringValue];
}
- (IBAction)uDisable:(id)sender{
    
    [uText setStringValue:@"Disabled"];
    upText = [uText stringValue];
}

- (IBAction)stepperChanged:(id)sender{
    
    val = [stepper integerValue];
    int value = val;
    NSString *steep = [[NSString alloc]initWithFormat:@"%i seconds", value];
    [stepField setStringValue:steep];
    
}


- (IBAction)sync:(id)sender{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if (shText == @"Enabled") {
        [prefs setBool:YES forKey:@"shoulderED"];
    }else{
        [prefs setBool:NO forKey:@"shoulderED"];
    }
    if (quText == @"Enabled") {
        [prefs setBool:YES forKey:@"squintED"];
    }else{
        [prefs setBool:NO forKey:@"squintED"];
    }
    if (heText == @"Enabled") {
        [prefs setBool:YES forKey:@"headED"];
    }else{
        [prefs setBool:NO forKey:@"headED"];
    }
    if (upText == @"Enabled") {
        [prefs setBool:YES forKey:@"upED"];
    }else{
        [prefs setBool:NO forKey:@"upED"];
    }
    
    
    
    if ([speechBox state] == NSOnState) {
        [prefs setBool:YES forKey:@"speechBox"];
    }else{
        
        [prefs setBool:NO forKey:@"speechBox"];
    }
    
    if ([windowBox state] == NSOnState) {
        [prefs setBool:YES forKey:@"windowBox"];
    }else{
        
        [prefs setBool:NO forKey:@"windowBox"];
    }
    
    [prefs setInteger:val forKey:@"delayValue"];
}

@end
