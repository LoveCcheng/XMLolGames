//
//  XMMessageViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMessageViewController.h"
#import "XMHttpOperation.h"
#import "XMDataStorage.h"
#import "BBobjectProgress.h"
#import "XMProgressView.h"

@interface XMMessageViewController ()

@end

@implementation XMMessageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
    [self autoLogin];
}

-(void)autoLogin{
    NSDictionary *dict = [XMDataStorage readUserandPass];
    NSString *user = dict[@"username"];
    NSString *pass = dict[@"password"];
    
    if (user.length==0 || pass.length==0) {
        return;
    }
    XMProgressView *proview = [XMProgressView shareManager];
    [proview showProgressView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        
        [XMHttpOperation LoginWithUsername:user Password:pass];
    });
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(successLogin) name:XMLoginSuccessNotification object:nil];
}

-(void)successLogin{
        XMProgressView *proview = [XMProgressView shareManager];
        [proview hideView];
        [XMHttpOperation ShowMessage:@"登录成功"];
}
//设置导航栏
-(void)setNavigation{
    self.navigationItem.title = @"资讯";
    //字体大小和颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    //左边的按钮
    UIBarButtonItem *item = [self barButtonWithImage:[UIImage imageNamed:@"leftUserBTN"] HightImage:[UIImage imageNamed:@"leftUserBTN"] target:self action:@selector(itemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)itemClick{
    XMLogFun;

}
/** 设置导航栏按钮 */
-(UIBarButtonItem *)barButtonWithImage:(UIImage *)image  HightImage:(UIImage *)hightImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    [but setBackgroundImage:image forState:UIControlStateNormal];
    [but setBackgroundImage:hightImage forState:UIControlStateHighlighted];
    [but sizeToFit];
    [but addTarget:target action:action forControlEvents:controlEvents];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:but];
    
    return item;
}

@end
