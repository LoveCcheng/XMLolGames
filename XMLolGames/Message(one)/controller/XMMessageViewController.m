//
//  XMMessageViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMessageViewController.h"

@interface XMMessageViewController ()

@end

@implementation XMMessageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
