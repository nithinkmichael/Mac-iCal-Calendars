//
//  AppController.h
//  iCal Calendars
//
//  Created by Matt Gemmell on 29/08/2005.
//  Copyright 2005 Magic Aubergine. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {

}

- (NSDictionary *)getCalendars;
- (NSColor *)colorFromRGBAHex:(NSString *)webHex;
- (NSDictionary *)getNodes:(NSArray *)theList;

@end
