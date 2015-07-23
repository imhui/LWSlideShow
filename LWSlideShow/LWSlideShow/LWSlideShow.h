//
//  LWSlideShow.h
//  LWSlideShow
//
//  Created by imhui on 15/7/23.
//  Copyright (c) 2015年 imhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWSlideItem.h"

@class LWSlideShow;
@protocol LWSlideShowDelegate <NSObject>

@optional
- (void)slideShow:(LWSlideShow *)slideShow didSelectIndex:(NSInteger)index;

@end

@interface LWSlideShow : UIView

@property (nonatomic, strong) NSArray *slideItems;
@property (nonatomic, assign) BOOL autoSlideEnable; // default is YES
@property (nonatomic, assign) id<LWSlideShowDelegate> delegate;



@end
