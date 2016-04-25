//
//  UIView+WLYCategory.m
//  WLYAutoScrollView
//
//  Created by Afluy on 16/4/25.
//  Copyright © 2016年 helios. All rights reserved.
//

#import "UIView+WLYCategory.h"

@implementation UIView (WLYCategory)

@dynamic wly_x, wly_y, wly_width, wly_height;
@dynamic wly_centerX, wly_centerY;
@dynamic wly_top, wly_bottom, wly_left, wly_right;
@dynamic wly_size;

// cgrect related

- (CGFloat)wly_x {
    return self.frame.origin.x;
}

- (void)setwly_x:(CGFloat)wly_x {
    CGRect frame = self.frame;
    frame.origin.x = wly_x;
    self.frame = frame;
}

- (CGFloat)wly_y {
    return self.frame.origin.y;
}

- (void)setwly_y:(CGFloat)wly_y {
    CGRect frame = self.frame;
    frame.origin.y = wly_y;
    self.frame = frame;
}

- (CGFloat)wly_width {
    return self.frame.size.width;
}

- (void)setwly_width:(CGFloat)wly_width {
    CGRect frame = self.frame;
    frame.size.width = wly_width;
    self.frame = frame;
}

- (CGFloat)wly_height {
    return self.frame.size.height;
}

- (void)setwly_height:(CGFloat)wly_height {
    CGRect frame = self.frame;
    frame.size.height = wly_height;
    self.frame = frame;
}

- (void)setwly_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


// center related

- (CGFloat)wly_centerX {
    return self.center.x;
}

- (void)setwly_centerX:(CGFloat)wly_centerX {
    CGPoint center = self.center;
    center.x = wly_centerX;
    self.center = center;
}

- (CGFloat)wly_centerY {
    return self.center.y;
}

- (void)setwly_centerY:(CGFloat)wly_centerY {
    CGPoint center = self.center;
    center.y = wly_centerY;
    self.center = center;
}


// edges related

- (CGFloat)wly_top {
    return self.wly_y;
}

- (void)setwly_top:(CGFloat)wly_top {
    self.wly_y = wly_top;
}

- (CGFloat)wly_bottom {
    return self.wly_y + self.wly_height;
}

- (void)setwly_bottom:(CGFloat)wly_bottom {
    self.wly_y = wly_bottom - self.wly_height;
}

- (CGFloat)wly_left {
    return self.wly_x;
}

- (void)setwly_left:(CGFloat)wly_left {
    self.wly_x = wly_left;
}

- (CGFloat)wly_right {
    return self.wly_x + self.wly_width;
}

- (void)setwly_right:(CGFloat)wly_right {
    self.wly_x = wly_right - self.wly_width;
}

@end
