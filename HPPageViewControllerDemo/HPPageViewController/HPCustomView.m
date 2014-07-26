//
//  CustomView.m
//  ScrollViewTest
//
//  Created by Zixuan Li on 7/25/14.
//  Copyright (c) 2014 Mallocu. All rights reserved.
//

#import "HPCustomView.h"

@implementation HPCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if ([self pointInside:point withEvent:event]) {
		if ([self.subviews count] == 0) return nil;
        else return [self.subviews lastObject];
	}
	return nil;
    
}

@end
