//
//  LWSlideItemView.m
//  LWSlideShow
//
//  Created by imhui on 15/7/23.
//  Copyright (c) 2015年 imhui. All rights reserved.
//

#import "LWSlideItemView.h"
#import <UIImageView+AFNetworking.h>

@interface LWSlideItemView ()
{
    UIImageView *_imageView;
    UILabel *_textLabel;
}

@end


@implementation LWSlideItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
    }
    return self;
}

- (void)setSlideItem:(LWSlideItem *)slideItem
{
    _slideItem = slideItem;
}

- (void)setSlideItem:(LWSlideItem *)slideItem placeholder:(UIImage *)placeholder
{
    self.slideItem = slideItem;
    [self loadItemImageWihtPlaceholder:placeholder];
}

- (void)loadItemImageWihtPlaceholder:(UIImage *)placebolder
{
    [_imageView setImageWithURL:[NSURL URLWithString:_slideItem.imageUrl]
               placeholderImage:placebolder];
}


- (void)setLabel:(NSString *)label
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_textLabel];
    }
    _textLabel.text = label;
}


@end
