//
//  PlainButton.m
//  TestButton
//
//  Created by Isabela Toderici on 11/22/20.
//

#import "PlainButton.h"

@implementation PlainButton

#pragma mark - Initializer

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setExclusiveTouch:YES];
        
        UIColor *black = [UIColor blackColor];
        // Normal state
        [self setTitleColor:black forState:UIControlStateNormal];
        [self setTitleShadowColor:black forState:UIControlStateNormal];
        
        UIImage *image = [[self imageView] image];
        
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self setImage:image forState:UIControlStateNormal];
    }

    return self;
}

#pragma mark - Setters

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    [self updateButtonAppearance];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    [self updateButtonAppearance];
}

- (void)setLargeImage:(UIImage *)largeImage {
    if (_largeImage != largeImage) {
        _largeImage = largeImage;
        
        [self updateImage];
    }
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    [self updateButtonAppearance];
}

#pragma mark - Helper methods

- (void)updateImage {
    UIImage *image = [self largeImage];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self setImage:image forState:UIControlStateNormal];
//    [self setImage:image forState:UIControlStateHighlighted];
}

- (void)updateButtonAppearance {
    BOOL highlightedOrSelected = [self isHighlighted] || [self isSelected];
    UIColor *color = highlightedOrSelected ? [UIColor redColor] : [UIColor blackColor];
    [self setTintColor:color];
    [self setupHighlightedSelectedTitleColor:color titleShadowColor:color];
}

- (void)setupHighlightedSelectedTitleColor:(UIColor *)titleColor titleShadowColor:(UIColor *)titleShadowColor {
    [self setTitleColor:titleColor forState:UIControlStateHighlighted | UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateSelected | UIControlStateNormal];
    [self setTitleShadowColor:titleShadowColor forState:UIControlStateHighlighted | UIControlStateNormal];
    [self setTitleShadowColor:titleShadowColor forState:UIControlStateSelected | UIControlStateNormal];
}

@end
