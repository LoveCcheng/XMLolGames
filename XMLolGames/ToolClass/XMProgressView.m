//
//  XMProgressView.m
//  XMLolGames
//
//  Created by montnets on 2017/1/5.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMProgressView.h"
#import <UIImage+GIF.h>

@interface XMProgressView ()

//背景view
@property (nonatomic,strong) UIView *backView;
//放置加载图片的UIImageView
@property (nonatomic,strong) UIImageView *imageOfWait;
//放置说明文字的label
@property (nonatomic,strong) UILabel *DetailLabel;

@end

@implementation XMProgressView


+(instancetype)shareManager{
    static XMProgressView *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager= [[self alloc]init];
    });
    
    return manager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        CGFloat width=XMScreenW/2.0;
        CGFloat height=XMScreenH/2.0;
        _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 110, 110)];
        //        NSLog(@"back====%@",_backView);
        _backView.center=CGPointMake(width, height);
        _backView.backgroundColor=[UIColor clearColor];
        _backView.layer.cornerRadius=10.0f;
        _backView.alpha=1;
        _backView.layer.cornerRadius=3.0f;
        _imageOfWait=[[UIImageView alloc]initWithFrame:CGRectMake(14, 5,82,82)];
        _imageOfWait.alpha=1;
        [_backView addSubview:_imageOfWait];
        [self setImageVIew:@"load_cont_icon"];
        
        _DetailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 88, _backView.frame.size.width, 20)];
        _DetailLabel.textAlignment=NSTextAlignmentCenter;
        _DetailLabel.text=@"正在登录中...";
        _DetailLabel.font=[UIFont systemFontOfSize:12];
        _DetailLabel.textColor=[UIColor lightGrayColor];
        [_backView addSubview:_DetailLabel];
    }
    return self;
}

-(void)setImageVIew:(NSString *)imageStr{
    NSData *data = [self getImageData:imageStr];
    _imageOfWait.image = [UIImage sd_animatedGIFWithData:data];
}

-(NSData *)getImageData:(NSString *)imageName{
    NSString *path = [[NSBundle mainBundle]pathForResource:imageName ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
    
    
-(void)showProgressView{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_backView];

}
    

-(void)hideView{
    [_backView removeFromSuperview];
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    














@end
