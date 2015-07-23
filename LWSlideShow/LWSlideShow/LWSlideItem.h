//
//  LWSlideItem.h
//  LWSlideShow
//
//  Created by imhui on 15/7/23.
//  Copyright (c) 2015年 imhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LWSlideItem : NSObject

@property (nonatomic, copy) NSString *caption;
@property (nonatomic, copy) NSString *imageUrl;

+ (instancetype)itemWithCaption:(NSString *)caption imageUrl:(NSString *)imageUrl;

@end
