//
//  WLYDemoViewController.m
//  WLYAutoScrollView
//
//  Created by Afluy on 16/4/25.
//  Copyright © 2016年 helios. All rights reserved.
//

#import "WLYDemoViewController.h"
#import "WLYAutoScrollView.h"

@interface WLYDemoViewController()

@property (nonatomic, strong) NSMutableArray<NSURL *> *imageArray;

@property (nonatomic, strong) WLYAutoScrollView *scrollView;

@end

@implementation WLYDemoViewController

- (void)viewDidLoad {
    [self loadData];
    [self setupView];
}

- (void)loadData {
    NSString *urlString = @"http://192.168.0.2:8080/%d.jpg";
    
    _imageArray = [[NSMutableArray alloc] initWithCapacity:5];
    for (int index = 0; index < 2; index++) {
        NSURL *imgURL = [NSURL URLWithString:[NSString stringWithFormat:urlString, index]];
        [_imageArray addObject:imgURL];
    }
}

- (void)setupView {
    _scrollView = [[WLYAutoScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    [self.view addSubview:_scrollView];
    _scrollView.imageURLs = [self.imageArray copy];
}

@end
