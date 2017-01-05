//
//  BBobjectProgress.m
//  BBFlowPlatform
//
//  Created by montnets on 16/5/23.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "BBobjectProgress.h"
#import <UIImage+GIF.h>



@interface BBobjectProgress ()

//背景view
@property (nonatomic,strong) UIView *backView;
//放置加载图片的UIImageView
@property (nonatomic,strong) UIImageView *imageOfWait;
//放置说明文字的label
@property (nonatomic,strong) UILabel *DetailLabel;

@end

@implementation BBobjectProgress

static BBobjectProgress *manager=nil;

//初始化单例
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat width=XMScreenW/2.0;
        CGFloat height=XMScreenH/2.0;
        _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 110, 110)];
//        NSLog(@"back====%@",_backView);
        _backView.center=CGPointMake(width, height);
        _backView.backgroundColor=[UIColor redColor];
        _backView.layer.cornerRadius=10.0f;
        _backView.alpha=1;
        _backView.layer.cornerRadius=3.0f;
        _imageOfWait=[[UIImageView alloc]initWithFrame:CGRectMake(14, 5,82,82)];
//        _imageOfWait.backgroundColor=[UIColor whiteColor];
        _imageOfWait.alpha=1;
        [_backView addSubview:_imageOfWait];
        
        _DetailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 88, _backView.frame.size.width, 20)];
        _DetailLabel.textAlignment=NSTextAlignmentCenter;
        _DetailLabel.font=[UIFont systemFontOfSize:12];
        _DetailLabel.textColor=[UIColor lightGrayColor];
        [_backView addSubview:_DetailLabel];
        
    }
    return self;
}

//防止多个线程创建多个对象
+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager =[[self alloc]init];
    });
    return manager;
}
/**
 *  传图片的名字过来
 *
 *  @param imageStr 传过来的图片
 */
-(void)userImage:(NSString *)imageStr{
    NSData *dataImage=[self getImageData:imageStr];
    _imageOfWait.image=[UIImage sd_animatedGIFWithData:dataImage];
}
/**
 *  给_DetailLabel复制
 *
 *  @param textStr 传过来的说明文字
 */
-(void)userText:(NSString *)textStr{
    _DetailLabel.text=textStr;
}
/**
 *  获取图片数据
 *
 *  @param imageName 本地图片名称
 *
 *  @return 图片数据
 */
-(NSData *)getImageData:(NSString *)imageName
{
    NSString *path = [[NSBundle mainBundle]pathForResource:imageName ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

- (UIView *)getView
{
    return _backView;
}

//显示加载的图片
-(void)showView{
    UIWindow *keyWindow=[UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:_backView];
}
//隐藏
-(void)hideView{
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_backView removeFromSuperview];
    //});
}


@end
