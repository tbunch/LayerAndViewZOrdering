//
//  LayeredView.m
//  NSVisualEffectViewZOrdering
//
//  Created by tom on 4/21/2015.
//  Copyright (c) 2015 Thomas Bunch. All rights reserved.
//

#import "LayeredView.h"

#import <QuartzCore/QuartzCore.h>

@implementation LayeredView

- (void)awakeFromNib;
{
    CGRect bounds = self.layer.bounds;
    
    CATextLayer *textLayer = [[CATextLayer alloc] init];
    textLayer.string = @"zPosition = 1";
    textLayer.zPosition = 1.0f;
    textLayer.bounds = CGRectMake(0, 0, CGRectGetWidth(bounds), 40.0f);
    textLayer.position = CGPointMake(CGRectGetMidX(bounds), CGRectGetMinY(bounds) + CGRectGetHeight(bounds) / 3.0f);
    textLayer.foregroundColor = CGColorGetConstantColor(kCGColorBlack);
    textLayer.backgroundColor = CGColorGetConstantColor(kCGColorWhite);
    textLayer.autoresizingMask = kCALayerWidthSizable;
    textLayer.borderColor = CGColorGetConstantColor(kCGColorBlack);
    textLayer.borderWidth = 2;
    textLayer.cornerRadius = 4;
    [self.layer addSublayer:textLayer];
    
    textLayer = [[CATextLayer alloc] init];
    textLayer.string = @"zPosition = -1";
    textLayer.zPosition = -1.0f;
    textLayer.bounds = CGRectMake(0, 0, CGRectGetWidth(bounds), 40.0f);
    textLayer.position = CGPointMake(CGRectGetMidX(bounds), CGRectGetMinY(bounds) + (floor(2.0f * CGRectGetHeight(bounds) / 3.0f)));
    textLayer.foregroundColor = CGColorGetConstantColor(kCGColorBlack);
    textLayer.backgroundColor = CGColorGetConstantColor(kCGColorWhite);
    textLayer.autoresizingMask = kCALayerWidthSizable;
    textLayer.alignmentMode = kCAAlignmentRight;
    textLayer.borderColor = CGColorGetConstantColor(kCGColorBlack);
    textLayer.borderWidth = 2;
    textLayer.cornerRadius = 4;

    [self.layer addSublayer:textLayer];
}

- (void)setLayer:(CALayer *)layer;
{
    [super setLayer:layer];
    
    if (layer) {
        layer.opaque = YES;
        
        CGColorRef bgColor = CGColorCreateGenericRGB(1.0f, 0.5f, 0.5f, 1.0f);
        layer.backgroundColor = bgColor;
        CGColorRelease(bgColor);
    }
}

@end
