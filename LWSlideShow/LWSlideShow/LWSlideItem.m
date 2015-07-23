//
//  LWSlideItem.m
//  LWSlideShow
//
//  Created by imhui on 15/7/23.
//  Copyright (c) 2015年 imhui. All rights reserved.
//

#import "LWSlideItem.h"

@implementation LWSlideItem

+ (instancetype)itemWithCaption:(NSString *)caption imageUrl:(NSString *)imageUrl
{
    return [[self alloc] initWithCaption:caption imageUrl:imageUrl];
}

- (instancetype)initWithCaption:(NSString *)caption imageUrl:(NSString *)imageUrl
{
    self = [super init];
    if (self) {
        self.caption = caption;
        self.imageUrl = imageUrl;
    }
    return self;
}




@end
