//
//  ICMonitor.h
//  iChair
//
//  Created by Guru Senthil on 10/22/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICMonitor : NSObject <NSSpeechSynthesizerDelegate>{
    
    IBOutlet NSMenuItem *monitorItem;
    IBOutlet NSMenuItem *connectItem;
    
    IBOutlet NSTextField *label;
    
}

- (IBAction)monitorStartPause:(id)sender;
- (void)monitor;

@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, strong)NSTimer *invalidateTimer;
@property (nonatomic, strong)NSWindowController *alertController;

@end
