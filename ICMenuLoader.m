//
//  ICMenuLoader.m
//  iChair
//
//  Created by Guru Senthil on 10/21/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import "ICMenuLoader.h"

@implementation ICMenuLoader

//done

- (void)awakeFromNib{
    
    statusItem = [[NSStatusBar systemStatusBar]statusItemWithLength:NSSquareStatusItemLength];
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    menuImage = [[NSImage alloc]initWithContentsOfFile:[bundle pathForResource:@"chair" ofType:@"png"]];
    menuAlternateImage = [[NSImage alloc]initWithContentsOfFile:[bundle pathForResource:@"chair-alt" ofType:@"png"]];
    
    [statusItem setImage:menuImage];
    [statusItem setAlternateImage:menuAlternateImage];
    [statusItem setMenu:statusMenu];
    [statusItem setToolTip:@"iChair"];
    [statusItem setHighlightMode:YES];
    
}

@end
