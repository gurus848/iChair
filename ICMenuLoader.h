//
//  ICMenuLoader.h
//  iChair
//
//  Created by Guru Senthil on 10/21/12.
//  Copyright (c) 2012 Guru Senthil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICMenuLoader : NSObject{
    IBOutlet NSMenu *statusMenu;
    
    NSImage *menuImage;
    NSImage *menuAlternateImage;
    NSStatusItem *statusItem;
    
}

@end
