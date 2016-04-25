//
//  UIView+WLYCategory.h
//  WLYAutoScrollView
//
//  Created by Afluy on 16/4/25.
//  Copyright © 2016年 helios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WLYCategory)

// cgrect related
@property (nonatomic, assign) CGFloat wly_x;
@property (nonatomic, assign) CGFloat wly_y;
@property (nonatomic, assign) CGFloat wly_width;
@property (nonatomic, assign) CGFloat wly_height;
@property (nonatomic, assign) CGSize wly_size;

// center related
@property (nonatomic, assign) CGFloat wly_centerX;
@property (nonatomic, assign) CGFloat wly_centerY;

// edges related
@property (nonatomic, assign) CGFloat wly_top;
@property (nonatomic, assign) CGFloat wly_bottom;
@property (nonatomic, assign) CGFloat wly_left;
@property (nonatomic, assign) CGFloat wly_right;

@end
