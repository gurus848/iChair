//
//  ICBluetoothConnector.m
//  iChair
//
//  Created by Guru Senthil on 10/21/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import "ICBluetoothConnector.h"

@implementation ICBluetoothConnector

@synthesize serialPort;
@synthesize logController;
@synthesize connectionController;
@synthesize preferencesController;
@synthesize log;

//done
#pragma - Connection

- (IBAction)connectOrDisconnect:(id)sender{
    
    serialPort = [ORSSerialPort serialPortWithPath:@"/dev/tty.BP"];
    serialPort.baudRate = [NSNumber numberWithInteger:9600];
    serialPort.delegate = self;
    
    NSSpeechSynthesizer *synth = [[NSSpeechSynthesizer alloc]initWithVoice:nil];
    
    if (connect.tag == 7) {
        [serialPort open];
        if (serialPort.isOpen) {
            
            NSLog(@"Connection Successful");
            [connect setTag:8];
            [connect setTitle:@"Disconnect from Chair"];
            
            connectionController = [[NSWindowController alloc]initWithWindowNibName:@"ConnectionSuccessful"];
            [NSApp activateIgnoringOtherApps:YES];
            [connectionController.window makeKeyAndOrderFront:self];
            [connectionController.window makeMainWindow];
            [connectionController showWindow:self];
            
            [synth startSpeakingString:@"Connection created."];
            
        }else{
            
            NSLog(@"Connection Failed");
            
            connectionController = [[NSWindowController alloc]initWithWindowNibName:@"ConnectionFailed"];
            [NSApp activateIgnoringOtherApps:YES];
            [connectionController.window makeKeyAndOrderFront:self];
            [connectionController.window makeMainWindow];
            [connectionController showWindow:self];
            
            [synth startSpeakingString:@"Unable to connect."];
        }
    }
    else if (connect.tag == 8) {
        [serialPort close];
        [connect setTag:7];
        [connect setTitle:@"Connect to Chair"];
        NSLog(@"Disconnected");
        [BCOutlet setTitle:@"Start Monitor"];
        [BCOutlet setTag:5];
        
        [synth startSpeakingString:@"Disconnected from port."];
    }

}

#pragma - Log Functions

- (IBAction)logOpen:(id)sender{
    
    logController = [[NSWindowController alloc]initWithWindowNibName:@"Log"];
    [NSApp activateIgnoringOtherApps:YES];
    [logController.window makeKeyAndOrderFront:self];
    [logController showWindow:self];
    
    
}

- (IBAction)logClose:(id)sender{
    
    [logController.window close];
    [logController close];
    
}

- (IBAction)preferencesOpen:(id)sender{
    
    preferencesController = [[NSWindowController alloc]initWithWindowNibName:@"Preferences"];
    [preferencesController.window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
    [logController showWindow:self];
    
}

#pragma - ORSerialPort Delegate Methods

- (void)serialPort:(ORSSerialPort *)serialPort didReceiveData:(NSData *)data{
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	if ([string length] == 0) return;
    //show in log, not working, fix later.
    [self.log.textStorage.mutableString appendString:string];
    [self.log setNeedsDisplay:YES];
    //Save in User Defaults.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:string forKey:@"receivedText"];
    int new = [string characterAtIndex:0];
    NSLog(@"%d", new);

    
}

- (void)serialPortWasRemovedFromSystem:(ORSSerialPort *)serialPort{
    
    NSLog(@"Port Removed From System");
    [connect setTitle:@"Connect to Chair"];
    [connect setTag:7];
    [BCOutlet setTitle:@"Start Monitor"];
    [BCOutlet setTag:5];
    
    NSSpeechSynthesizer *synth = [[NSSpeechSynthesizer alloc]initWithVoice:nil];
    [synth startSpeakingString:@"Port removed from system."];
}

@end
