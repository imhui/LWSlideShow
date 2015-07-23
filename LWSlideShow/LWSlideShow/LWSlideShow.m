//
//  LWSlideShow.m
//  LWSlideShow
//
//  Created by imhui on 15/7/23.
//  Copyright (c) 2015年 imhui. All rights reserved.
//

#import "LWSlideShow.h"
#import "LWSlideItemView.h"


static CGFloat kAutoSlideTimeinterval = 2.0;

@interface LWSlideShow () <UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    
    UIView *_captionView;
    UILabel *_captionLabel;
}

@end

@implementation LWSlideShow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        self.userInteractionEnabled = YES;
        
        _autoSlideEnable = YES;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        _captionView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) - 35,
                                                                CGRectGetWidth(frame), 35)];
        _captionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _captionView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self addSubview:_captionView];
        
        _captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(_captionView.bounds) - 20, 20)];
        _captionLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _captionLabel.textColor = [UIColor whiteColor];
        _captionLabel.font = [UIFont systemFontOfSize:12];
        [_captionView addSubview:_captionLabel];
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) - 20,
                                                                       CGRectGetWidth(frame), 20)];
        _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [_pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_pageControl];
        
        [self layoutSlideItems];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}


- (void)setSlideItems:(NSArray *)slideItems
{
    _slideItems = slideItems;
    [self layoutSlideItems];
}

- (void)layoutSlideItems
{
    for (UIView *v in _scrollView.subviews) {
        [v removeFromSuperview];
    }
    
    for (NSInteger i = 0; i < _slideItems.count; i++) {
        LWSlideItemView *itemView = [[LWSlideItemView alloc] initWithFrame:_scrollView.bounds];
        itemView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        itemView.center = CGPointMake(CGRectGetWidth(_scrollView.bounds) * i + CGRectGetMidX(_scrollView.bounds),
                                      CGRectGetMidY(_scrollView.bounds));
        [itemView setSlideItem:_slideItems[i] placeholder:nil];
        [_scrollView addSubview:itemView];
    }
    
    _pageControl.numberOfPages = _slideItems.count;
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.bounds) * _slideItems.count, 0);
    [self updateCaptionText];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(slideToNextPage) object:nil];
    [self performSelector:@selector(slideToNextPage) withObject:nil afterDelay:kAutoSlideTimeinterval];
}

#pragma mark - private methods
- (NSInteger)currentIndex
{
    if (_slideItems.count == 0) {
        return NSNotFound;
    }
    
    CGPoint contentOffset = _scrollView.contentOffset;
    NSInteger index = contentOffset.x / CGRectGetWidth(_scrollView.bounds);
    return index;
}

- (void)slideToNextPage
{
    if (!_autoSlideEnable) {
        return;
    }
    
    if (_slideItems.count == 0 || _slideItems.count == 1) {
        return;
    }
    
    NSInteger index = [self currentIndex];
    CGPoint offset = _scrollView.contentOffset;
    if (index == (_slideItems.count - 1)) {
        offset.x = 0;
    }
    else {
        offset.x += CGRectGetWidth(_scrollView.bounds);
    }
    [_scrollView setContentOffset:offset animated:YES];
    
    [self performSelector:@selector(slideToNextPage) withObject:nil afterDelay:kAutoSlideTimeinterval];
}

- (void)updatePageControlState
{
    _pageControl.currentPage = [self currentIndex];
}

- (void)updateCaptionText
{
    if (_slideItems.count == 0) {
        return;
    }
    LWSlideItem *item = _slideItems[_pageControl.currentPage];
    _captionLabel.text = item.caption;
}

#pragma mark - Gesture Action
- (void)singleTapAction:(UITapGestureRecognizer *)gesture
{
    if (_delegate && [_delegate respondsToSelector:@selector(slideShow:didSelectIndex:)]) {
        [_delegate slideShow:self didSelectIndex:[self currentIndex]];
    }
}

- (void)pageControlValueChanged:(id)sender
{
    NSInteger index = _pageControl.currentPage;
    CGPoint contentOffset = CGPointZero;
    contentOffset.x = index * CGRectGetWidth(_scrollView.bounds);
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(slideToNextPage) object:nil];
    [_scrollView setContentOffset:contentOffset animated:YES];
    [self performSelector:@selector(slideToNextPage) withObject:nil afterDelay:kAutoSlideTimeinterval];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updatePageControlState];
    [self updateCaptionText];
}


@end
