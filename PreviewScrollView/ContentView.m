//
//  ContentView.m
//  PreviewScrollView
//
//  Created by Andreas Ettisberger on 21.04.13.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark Events
- (UIView *) hitTest:(CGPoint) point withEvent:(UIEvent *)event
{
    return ([self pointInside:point withEvent:event]) ? scrollView : nil;
}

@end
