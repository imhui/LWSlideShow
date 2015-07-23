//
//  LWSlideItemView.h
//  LWSlideShow
//
//  Created by imhui on 15/7/23.
//  Copyright (c) 2015年 imhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWSlideItem.h"

@interface LWSlideItemView : UIView

@property (nonatomic, strong) LWSlideItem *slideItem;
@property (nonatomic, assign) NSString *label;

- (void)setSlideItem:(LWSlideItem *)slideItem placeholder:(UIImage *)placeholder;

@end
