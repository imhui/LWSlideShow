# LWSlideShow

![screenshot1](https://github.com/imhui/LWSlideShow/blob/master/sample.png?raw=true)

## usage

```

	NSMutableArray *array = [@[] mutableCopy];
    LWSlideItem *item = [LWSlideItem itemWithCaption:@"1" imageUrl:@"http://img2.3lian.com/2014/f4/102/d/86.jpg"];
    [array addObject:item];
    item = [LWSlideItem itemWithCaption:@"2" imageUrl:@"http://image5.tuku.cn/wallpaper/Photography%20Wallpapers/11286_2560x1600.jpg"];
    [array addObject:item];
    item = [LWSlideItem itemWithCaption:@"3" imageUrl:@"http://img2.3lian.com/2014/f2/150/d/44.jpg"];
    [array addObject:item];
    item = [LWSlideItem itemWithCaption:@"4" imageUrl:@"http://img2.3lian.com/2014/f2/150/d/45.jpg"];
    [array addObject:item];
    item = [LWSlideItem itemWithCaption:@"5" imageUrl:@"http://img2.3lian.com/2014/f2/150/d/46.jpg"];
    [array addObject:item]; 
    
    LWSlideShow *slideShow = [[LWSlideShow alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), 160)];
    slideShow.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    slideShow.delegate = self;
    slideShow.slideItems = array;


```