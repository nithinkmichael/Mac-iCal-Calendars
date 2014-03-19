//
//  Calendar.m
//  iCal Birthday Shifter
//
//  Created by Matt Gemmell on 24/08/2005.
//  Copyright 2005 Magic Aubergine. All rights reserved.
//

#import "Calendar.h"


@implementation Calendar

- (id)initWithKey:(NSString *)theKey sourceKey:(NSString *)theSourceKey title:(NSString *)theTitle notes:(NSString *)theNotes color:(NSColor *)theColor
{
    if (self = [super init]) {
        [self setKey:theKey];
        [self setSourceKey:theSourceKey];
        [self setTitle:theTitle];
        [self setNotes:theNotes];
        [self setColor:theColor];
        
        return self;
    }
    
    return nil;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@\rDescription: %@\rColor: %@", [self title], [self notes], [self color]];
}

- (void)dealloc
{
    [key release];
    [sourceKey release];
    [title release];
    [notes release];
    [color release];
    
    [super dealloc];
}

- (NSString *)key {
    return [[key retain] autorelease];
}

- (void)setKey:(NSString *)value {
    if (key != value) {
        [key release];
        key = [value copy];
    }
}

- (NSString *)sourceKey {
    return [[sourceKey retain] autorelease];
}

- (void)setSourceKey:(NSString *)value {
    if (sourceKey != value) {
        [sourceKey release];
        sourceKey = [value copy];
    }
}

- (NSString *)title {
    return [[title retain] autorelease];
}

- (void)setTitle:(NSString *)value {
    if (title != value) {
        [title release];
        title = [value copy];
    }
}

- (NSString *)notes {
    return [[notes retain] autorelease];
}

- (void)setNotes:(NSString *)value {
    if (notes != value) {
        [notes release];
        notes = [value copy];
    }
}

- (NSColor *)color {
    return [[color retain] autorelease];
}

- (void)setColor:(NSColor *)value {
    if (color != value) {
        [color release];
        color = [value copy];
    }
}

@end
