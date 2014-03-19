//
//  AppController.m
//  iCal Calendars
//
//  Created by Matt Gemmell on 29/08/2005.
//  Copyright 2005 Magic Aubergine. All rights reserved.
//

#import "AppController.h"
#import "Calendar.h"

@implementation AppController

- (id)init
{
    if (self = [super init]) {
        
        NSDictionary *calendars = [self getCalendars];
        NSLog(@"%@", calendars);
        
        return self;
    }
    
    return nil;
}


- (NSDictionary *)getCalendars
{
    // Parse nodes.plist file
    NSDictionary *nodesFile = [NSDictionary dictionaryWithContentsOfFile:
        [@"~/Library/Application Support/iCal/nodes.plist" stringByExpandingTildeInPath]];
    
    NSDictionary *calendarNodes = [self getNodes:[nodesFile objectForKey:@"List"]];
    
    return calendarNodes;
}


- (NSColor *)colorFromRGBAHex:(NSString *)webHex
{
    NSString *colorStr;
    const char *hex;
    
    colorStr = [webHex substringWithRange:NSMakeRange(1,2)];
    hex = [[@"0x" stringByAppendingString:colorStr] lossyCString];
    float red = ((float)(strtol(hex, NULL, 16))) / 255.0;
    
    colorStr = [webHex substringWithRange:NSMakeRange(3,2)];
    hex = [[@"0x" stringByAppendingString:colorStr] lossyCString];
    float green = ((float)(strtol(hex, NULL, 16))) / 255.0;
    
    colorStr = [webHex substringWithRange:NSMakeRange(5,2)];
    hex = [[@"0x" stringByAppendingString:colorStr] lossyCString];
    float blue = ((float)(strtol(hex, NULL, 16))) / 255.0;
    
    colorStr = [webHex substringWithRange:NSMakeRange(7,2)];
    hex = [[@"0x" stringByAppendingString:colorStr] lossyCString];
    float alpha = ((float)(strtol(hex, NULL, 16))) / 255.0;
    
    return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
}


- (NSDictionary *)getNodes:(NSArray *)theList
{
    NSMutableDictionary *tempCalendars = [NSMutableDictionary dictionary];
    NSEnumerator *calNodes = [theList objectEnumerator];
    NSDictionary *node;
    while (node = [calNodes nextObject]) {
        if ([((NSString *)[node objectForKey:@"Type"]) isEqualToString:@"CALSourceNode"]) {
            NSString *sourceKey = [node objectForKey:@"SourceKey"];
            NSColor *calColor = [self colorFromRGBAHex:(NSString *)[node objectForKey:@"ThemeColor"]];
            
            // Read relevant calendar directory
            NSDictionary *info = [NSDictionary dictionaryWithContentsOfFile:
                [[NSString stringWithFormat:@"~/Library/Application Support/iCal/Sources/%@.calendar/Info.plist", sourceKey] stringByExpandingTildeInPath]];
            NSString *title = [info objectForKey:@"Title"];
            
            // Add a new Calendar object to tempCalendars
            Calendar *newCalendar = [[Calendar alloc] initWithKey:[info objectForKey:@"Key"]
                                                        sourceKey:sourceKey 
                                                            title:title 
                                                            notes:[info objectForKey:@"Notes"] 
                                                            color:calColor];
            [tempCalendars setObject:newCalendar forKey:title];
            [newCalendar release];
            
        } else if ([((NSString *)[node objectForKey:@"Type"]) isEqualToString:@"CALNamedGroupNode"]) {
            // Recursively add all nodes from node.Subnodes to tempCalendars
            [tempCalendars addEntriesFromDictionary:[self getNodes:((NSArray *)[node objectForKey:@"Subnodes"])]];
        }
    }
    return tempCalendars;
}


@end
