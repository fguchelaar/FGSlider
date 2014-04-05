//
//  FGSlider.m
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014 Frank Guchelaar
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "FGSlider.h"

@interface FGSlider ()

@property(nonatomic) CGRect minimumValueImageRect;
@property(nonatomic) CGRect maximumValueImageRect;

@property(nonatomic) BOOL touchesBeganInMinimumValueImageRect;
@property(nonatomic) BOOL touchesBeganInMaximumValueImageRect;

@end

@implementation FGSlider

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    UITouch *touch = [touches anyObject];

    CGPoint location = [touch locationInView:self];
    if (CGRectContainsPoint(self.minimumValueImageRect, location)) {
        self.touchesBeganInMinimumValueImageRect = YES;
    }
    else if (CGRectContainsPoint(self.maximumValueImageRect, location)) {
        self.touchesBeganInMaximumValueImageRect = YES;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];

    UITouch *touch = [touches anyObject];

    CGPoint location = [touch locationInView:self];
    if (self.touchesBeganInMinimumValueImageRect && CGRectContainsPoint(self.minimumValueImageRect, location)) {
        [self setValue:self.minimumValue animated:YES];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    else if (self.touchesBeganInMaximumValueImageRect && CGRectContainsPoint(self.maximumValueImageRect, location)) {
        [self setValue:self.maximumValue animated:YES];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }

    // reset state
    self.touchesBeganInMinimumValueImageRect = NO;
    self.touchesBeganInMinimumValueImageRect = NO;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds {
    self.minimumValueImageRect = [super minimumValueImageRectForBounds:bounds];
    return self.minimumValueImageRect;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds {
    self.maximumValueImageRect = [super maximumValueImageRectForBounds:bounds];
    return self.maximumValueImageRect;
}

@end
