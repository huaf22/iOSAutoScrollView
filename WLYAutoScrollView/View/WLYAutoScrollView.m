//
//  WLYAutoScrollView.m
//  WLYAutoScrollView
//
//  Created by Afluy on 16/4/25.
//  Copyright © 2016年 helios. All rights reserved.
//

#import "WLYAutoScrollView.h"
#import "UIView+WLYCategory.h"
#import "UIImageView+WebCache.h"

static NSInteger const BaseTag = 10000;
static CGFloat const AnimationDuration = 0.35f;
static NSTimeInterval const AutoScrollTimeInterval = 3;

@interface WLYAutoScrollView() <UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *imageViewArrray;
@property (nonatomic, strong) NSTimer *autoScrollTimer;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation WLYAutoScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
}

- (void)initScrollViewContent {
    NSInteger count = self.imageURLs.count > 1 ? 3 : 1;
    self.scrollView.contentSize = CGSizeMake(self.wly_width * count, self.wly_height);
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.imageViewArrray removeAllObjects];
    
    for (int index = 0; index < count; ++index) {
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.frame = CGRectMake(self.wly_width * index, 0, self.wly_width, self.wly_height);
        imageview.tag = BaseTag + index;
        [self.imageViewArrray addObject:imageview];
        [self.scrollView addSubview:imageview];
    }
    [self updateScrollViewContent];
    [self startAutoScrollTimer];
}

#pragma mark - setter & getter

- (void)setImageURLs:(NSArray *)pImageURLs {
    _imageURLs = pImageURLs;
    
    [self initScrollViewContent];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"--->BeginDragging");
    [self stopAutoScrollTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"<----Decelerating");
    [self updateScrollViewContent];
    [self startAutoScrollTimer];
}

- (void)updateScrollViewContent {
    if (self.imageURLs.count <= 1) {
        [[self.scrollView viewWithTag:BaseTag] sd_setImageWithURL:[self.imageURLs firstObject]];
        [self.scrollView setContentOffset:CGPointZero animated:NO];
        return;
    }
    
    self.currentIndex = [self calculateCurrentIndex];
    NSInteger leftImageIndex = [self calculateLeftIndex];
    NSInteger rightImageIndex = [self calculateRightIndex];

    [[self.scrollView viewWithTag:BaseTag] sd_setImageWithURL:self.imageURLs[leftImageIndex]];
    [[self.scrollView viewWithTag:(BaseTag + 1)] sd_setImageWithURL:self.imageURLs[self.currentIndex]];
    [[self.scrollView viewWithTag:(BaseTag + 2)] sd_setImageWithURL:self.imageURLs[rightImageIndex]];
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.wly_width, 0) animated:NO];
}

- (NSInteger)calculateLeftIndex {
    NSInteger totalCount = self.imageURLs.count;
    NSInteger leftImageIndex = (self.currentIndex + totalCount - 1) % totalCount;
    return leftImageIndex;
}

- (NSInteger)calculateRightIndex {
    NSInteger totalCount = self.imageURLs.count;
    return (self.currentIndex + 1) % totalCount;
}

- (NSInteger)calculateCurrentIndex {
    CGPoint offset = [self.scrollView contentOffset];
    NSInteger totalCount = self.imageURLs.count;
    NSInteger index;
    
    if (offset.x > self.scrollView.wly_width) {
        index = (self.currentIndex + 1) % totalCount;
    } else if (offset.x < _scrollView.wly_width) {
        index = (self.currentIndex + totalCount - 1) % totalCount;
    }
    if (index >= totalCount) {
        index = 0;
    }
    NSLog(@"index:%ld", index);
    return index;
}

#pragma mark - Timer

- (void)startAutoScrollTimer {
    if (self.imageURLs.count <= 1 || [self.autoScrollTimer isValid]) {
        [self stopAutoScrollTimer];
        return;
    }
    self.autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:AutoScrollTimeInterval
                                                            target:self
                                                          selector:@selector(scrollToNextPage)
                                                          userInfo:nil
                                                           repeats:YES];
}

- (void)stopAutoScrollTimer {
    if ([self.autoScrollTimer isValid]) {
        [self.autoScrollTimer invalidate];
        self.autoScrollTimer = nil;
    }
}

#pragma mark - Actions

- (void)scrollToNextPage {
    [UIView animateWithDuration:AnimationDuration animations:^{
        [self.scrollView setContentOffset:CGPointMake(_scrollView.wly_width * 2, 0)];
    } completion:^(BOOL finished) {
        [self updateScrollViewContent];
    }];
}

@end
