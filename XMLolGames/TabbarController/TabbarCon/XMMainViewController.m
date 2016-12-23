//
//  XMMainViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMainViewController.h"
#import "XMRegiViewController.h"

@interface XMMainViewController ()

@end

@implementation XMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavigation];
}
/*
-(void)setUI{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XMScreenW, 64)];
    topView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topView];

    UIButton *leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBut.frame = CGRectMake(15, 30, 50, 30);
    [leftBut setTitle:@"取消" forState:UIControlStateNormal];
    [leftBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [topView addSubview:leftBut];

    UILabel *midlabel = [[UILabel alloc]init];
    midlabel.frame = CGRectMake(0, 20, XMScreenW, 40);
    midlabel.text = @"登录";
    midlabel.textColor = [UIColor whiteColor];
    midlabel.textAlignment=NSTextAlignmentCenter;
    midlabel.backgroundColor = [UIColor clearColor];
    
    midlabel.font = [UIFont systemFontOfSize:18];
    [topView addSubview:midlabel];
}
*/

//设置导航栏
-(void)setNavigation{
    self.navigationItem.title = @"登录";
    //字体大小和颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    //左边的按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(LeftitemClick)];
    //设置取消文字颜色和大小
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    //右边的按钮
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(RightitemClick)];
    //设置注册文字颜色和大小
    [itemRight setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    
    
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.rightBarButtonItem=itemRight;
    
}
-(void)LeftitemClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)RightitemClick{
    XMRegiViewController *regiVC = [[XMRegiViewController alloc]init];
    [self.navigationController pushViewController:regiVC animated:YES];
}


















@end
