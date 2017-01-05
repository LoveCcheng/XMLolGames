//
//  BBobjectProgress.h
//  BBFlowPlatform
//
//  Created by montnets on 16/5/23.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBobjectProgress : NSObject

//初始化
+(instancetype)shareManager;
//传来的图片名字
-(void)userImage:(NSString *)imageStr;
//传过来说明问题(加载中...，登录中..)
-(void)userText:(NSString *)textStr;
//显示
-(void)showView;
//隐藏
-(void)hideView;

-(UIView *)getView;


@end
