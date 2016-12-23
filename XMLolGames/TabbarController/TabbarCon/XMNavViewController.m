//
//  XMNavViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/23.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMNavViewController.h"

@interface XMNavViewController ()

@end

@implementation XMNavViewController

//第一次使用这个类的时候会调用一次
+(void)initialize{
    //所有的navgation上面的item都会被设置
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor blackColor],NSFontAttributeName : [UIFont systemFontOfSize:17]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor lightGrayColor],NSFontAttributeName : [UIFont systemFontOfSize:17]} forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏背景颜色
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBarTintColor:[UIColor blackColor]];
    
    //设置文字大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:20]}];

}


/**
 *  可以在这个方法中拦截所有push的控制器
 *
 *  @param viewController viewController
 *  @param animated       animated
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //设置非跟控制器的导航条内容---就是被push的控制器
    if (self.viewControllers.count != 0) {
        UIButton  *but = [UIButton buttonWithType:UIButtonTypeCustom];
        [but setTitle:@"返回" forState:UIControlStateNormal];
        [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [but setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [but setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        //        [but sizeToFit];  和下面作用一样
        //按钮的内容靠左，整体大小不变
        but.frame=CGRectMake(0, 0, 80, 50);
        but.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        //往左边靠10px--按钮和边距缩小
        but.contentEdgeInsets=UIEdgeInsetsMake(0, -10, 0, 0);
        
        [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:but];
        
        
        //隐藏tabbar
        viewController.hidesBottomBarWhenPushed=YES;
    }

    //后调用可以在自己的控制器里修改特殊的样式--可以覆盖上面设置的控制器
    [super pushViewController:viewController animated:animated];

}

-(void)butClick{
    [self popViewControllerAnimated:YES];
}
























@end
