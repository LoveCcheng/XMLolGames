//
//  XMplayPicView.m
//  XMLolGames
//
//  Created by montnets on 2017/1/6.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMplayPicView.h"

@interface XMplayPicView ()<UIScrollViewDelegate>


@property (nonatomic,strong) UIPageControl *PageControl;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation XMplayPicView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}
-(void)initUI{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scroll.contentSize = CGSizeMake(self.frame.size.width*3, self.frame.size.height);
    scroll.pagingEnabled = YES;
    scroll.delegate =self;
    //隐藏水平滚动条
    scroll.showsHorizontalScrollIndicator = NO;
    [self addSubview:scroll];
    self.scrollView = scroll;
    
    //添加三哥子视图
    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
        imageView.tag = 1000+i;
        [imageView setBackgroundColor:[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0  blue:arc4random()%256/255.0  alpha:1.0]];
        
        [scroll addSubview:imageView];
        
    }
    
    
    UIImageView *imageWaiView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*3, 0, self.frame.size.width, self.frame.size.height)];
    imageWaiView.backgroundColor = [UIColor blackColor];
    [scroll addSubview:imageWaiView];
    
    
    
    UIPageControl *myPage = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 70, 100, 30)];
    myPage.centerX = self.centerX;
    myPage.numberOfPages = 3;
    myPage.currentPage = 1;
    [self addSubview:myPage];
    self.PageControl = myPage;

    //开启定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(chageView) userInfo:nil repeats:YES];
    
}

-(void)chageView{
    
    CGFloat offset_x = self.scrollView.contentOffset.x;
    
    offset_x = offset_x +self.frame.size.width;
    
    if (offset_x > self.frame.size.width*3) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
    
    if (offset_x == self.frame.size.width*3) {
        self.PageControl.currentPage = 0;
    }else{
        self.PageControl.currentPage = offset_x/self.frame.size.width;
    }
    
    CGPoint resultPoint = CGPointMake(offset_x, 0);
    
    if (offset_x>self.frame.size.width*3) {
        self.PageControl.currentPage = 1;
        [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];
        
    }else
    {
        [self.scrollView setContentOffset:resultPoint animated:YES];
    
    }
    
}



#pragma mark - UIScrollViewDelegate

//正在滑动中
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat offsetX = scrollView.contentOffset.x;
//    self.PageControl.currentPage = offsetX/self.frame.size.width;
//}

//开始拖拽视图，在这里暂停定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //设置定时器在将来的某一个时刻启动
    [self.timer setFireDate:[NSDate distantFuture]];
    
}
//视图静止时（没人拖动）。开启定时器，让视图自动轮播
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //视图静止之后，过3.0秒在开启定时器    返回值为从现在时刻开始 再过3.0秒的时刻。
    [self.timer setFireDate:[NSDate dateWithTimeInterval:3.0 sinceDate:[NSDate date]]];
}
































@end
