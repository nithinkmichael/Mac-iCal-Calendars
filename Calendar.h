//
//  Calendar.h
//  iCal Birthday Shifter
//
//  Created by Matt Gemmell on 24/08/2005.
//  Copyright 2005 Magic Aubergine. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Calendar : NSObject {
    NSString *key;
    NSString *sourceKey;
    NSString *title;
    NSString *notes;
    NSColor *color;
}

- (id)initWithKey:(NSString *)theKey sourceKey:(NSString *)theSourceKey title:(NSString *)theTitle notes:(NSString *)theNotes color:(NSColor *)theColor;

- (NSString *)key;
- (void)setKey:(NSString *)value;

- (NSString *)sourceKey;
- (void)setSourceKey:(NSString *)value;

- (NSString *)title;
- (void)setTitle:(NSString *)value;

- (NSString *)notes;
- (void)setNotes:(NSString *)value;

- (NSColor *)color;
- (void)setColor:(NSColor *)value;

@end
