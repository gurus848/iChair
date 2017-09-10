//
//  ICMonitor.m
//  iChair
//
//  Created by Guru Senthil on 10/22/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import "ICMonitor.h"

NSString *rtext;
NSSpeechSynthesizer *synth;

@implementation ICMonitor

@synthesize timer;
@synthesize invalidateTimer;
@synthesize alertController;

//done.

- (IBAction)monitorStartPause:(id)sender{
    
    if (monitorItem.tag == 5 && connectItem.tag == 8) {
        //if monitoring is started.
        monitorItem.tag = 6;
        [monitorItem setTitle:@"Pause Monitor"];
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSInteger integer = [prefs integerForKey:@"delayValue"];
        NSTimeInterval interval = integer;
        
        timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(monitor) userInfo:nil repeats:YES];
        invalidateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerInvalidate) userInfo:nil repeats:YES];
        
        synth = [[NSSpeechSynthesizer alloc]initWithVoice:nil];
        [synth startSpeakingString:@"Monitoring Started."];
        synth.delegate = self;
        
        [prefs setInteger:0 forKey:@"synthOn"];
    
    }else{
        //if monitoring is paused.
        monitorItem.tag = 5;
        [monitorItem setTitle:@"Start Monitor"];
        [timer invalidate];
        
        [synth startSpeakingString:@"Monitoring Paused."];
    }
    
}


- (void)monitor{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    rtext = [prefs stringForKey:@"receivedText"];
    int ascii = [rtext characterAtIndex:0];
    
    BOOL speech = [prefs boolForKey:@"speechBox"];
    BOOL window = [prefs boolForKey:@"windowBox"];
    
    BOOL head = [prefs boolForKey:@"headED"];
    BOOL squint = [prefs boolForKey:@"squintED"];
    BOOL shoulder = [prefs boolForKey:@"shoulderED"];
    BOOL upper = [prefs boolForKey:@"upED"];
    
    
    if (ascii == 48) {
        NSLog(@"None Pressed");
    }
    if (ascii == 63) {
        if (speech == YES) {
            if (![synth isSpeaking]) {
                [synth startSpeakingString:@"Huh, Impossible!"];
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert63"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
        }
    }
    if (ascii == 64) {
        if (squint == YES) {
            if (speech == YES) {
                if (![synth isSpeaking]) {
                    [synth startSpeakingString:@"You are leaning forward, please correct your posture."];
                }
            }
            if (window == YES) {
                    
                    alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert64"];
                    [NSApp activateIgnoringOtherApps:YES];
                    [alertController.window makeKeyAndOrderFront:self];
                    [alertController showWindow:self];
                    
            }
        }
    }
    if (ascii == 65) {
        if (speech == YES) {
            if (![synth isSpeaking]) {
                [synth startSpeakingString:@"I don't think that position is possible, please correct it!"];
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert65"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
                
        }
    }
    if (ascii == 70) {
        if (speech == YES) {
            if (![synth isSpeaking]) {
                [synth startSpeakingString:@"Please rest your head and correct your back."];
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert70"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
                
        }
    }
    if (ascii == 71) {
        if (speech == YES) {
            if (![synth isSpeaking]) {
                [synth startSpeakingString:@"Yawning, huh? After you are done, please sit back down."];
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert71"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
                
        }
    }
    if (ascii == 72) {
        if (upper == YES) {
            if (speech == YES) {
                if (![synth isSpeaking]){
                    [synth startSpeakingString:@"Please lean back."];
                    
                }
            }
            if (window == YES) {
                    
                    alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert72"];
                    [NSApp activateIgnoringOtherApps:YES];
                    [alertController.window makeKeyAndOrderFront:self];
                    [alertController showWindow:self];
                    
            }
        }
    }
    if (ascii == 73) {
        if (shoulder == YES) {
            if (speech == YES) {
                if (![synth isSpeaking]){
                    [synth startSpeakingString:@"Please lean your shoulder back."];
                    
                }
            }
            if (window == YES) {
                    
                    alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert73"];
                    [NSApp activateIgnoringOtherApps:YES];
                    [alertController.window makeKeyAndOrderFront:self];
                    [alertController showWindow:self];
                    
            }
        }
    }
    if (ascii == 74) {
        if (speech == YES) {
            if (![synth isSpeaking]){
                [synth startSpeakingString:@"Please correct your head and right shoulder."];
                
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert74"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
                
        }
    }
    if (ascii == 75) {
        if (speech == YES) {
            if (![synth isSpeaking]){
                [synth startSpeakingString:@"Please correct your right shoulder."];
                
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert75"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
                
        }
    }
    if (ascii == 76) {
        if (speech == YES) {
            if (![synth isSpeaking]){
                [synth startSpeakingString:@"Please correct your head and left shoulder."];
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert76"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
                
        }
    }
    if (ascii == 77) {
        if (speech == YES) {
            if (![synth isSpeaking]){
                [synth startSpeakingString:@"Please correct your left shoulder."];
            }
        }
        if (window == YES) {
                
                alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert77"];
                [NSApp activateIgnoringOtherApps:YES];
                [alertController.window makeKeyAndOrderFront:self];
                [alertController showWindow:self];
                
        }
    }
    if (ascii == 78) {
        if (head == YES) {
            if (speech == YES) {
                if ([synth isSpeaking] == NO){
                    [synth startSpeakingString:@"Please rest your head on your chair to avoid hurting it."];
                    
                }
            }
            if (window == YES) {
                    
                    alertController = [[NSWindowController alloc]initWithWindowNibName:@"Alert78"];
                    [NSApp activateIgnoringOtherApps:YES];
                    [alertController.window makeKeyAndOrderFront:self];
                    [alertController showWindow:self];
                    
            }
        }
    }
    
    if (ascii == 79){
        NSLog(@"Correct Posture Detected");
    }

}




- (void)timerInvalidate{
    
    if (connectItem.tag == 7) {
        [timer invalidate];
        [invalidateTimer invalidate];
    }
}
- (NSInteger)value{
    
    NSUserDefaults *hjf = [NSUserDefaults standardUserDefaults];
    int rec = [[hjf stringForKey:@"receivedText"] characterAtIndex:0];
    
    return rec;
    
}

@end
