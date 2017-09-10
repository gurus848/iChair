//
//  ICBluetoothConnector.h
//  iChair
//
//  Created by Guru Senthil on 10/21/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ORSSerialPort.h"
#import "ORSSerialPortManager.h"

@interface ICBluetoothConnector : NSObject <ORSSerialPortDelegate> {
    
    IBOutlet NSMenuItem *connect;
    IBOutlet NSMenuItem *BCOutlet;
    
}

- (IBAction)connectOrDisconnect:(id)sender;
- (IBAction)logOpen:(id)sender;
- (IBAction)preferencesOpen:(id)sender;
- (IBAction)logClose:(id)sender;

@property (nonatomic, strong)ORSSerialPort *serialPort;
@property (strong, nonatomic)NSWindowController *logController;
@property (strong, nonatomic)NSWindowController *connectionController;
@property (strong, nonatomic)NSWindowController *preferencesController;
@property (unsafe_unretained)IBOutlet NSTextView *log;

@end
