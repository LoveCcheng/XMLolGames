//
//  XMLeftViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMLeftViewController.h"
#import "XMMainViewController.h"
#import "XMNavViewController.h"


@interface XMLeftViewController ()

@end

@implementation XMLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    [self SetUI];
}

-(void)SetUI{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, XMScreenW-100, 100)];
    //topView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:topView];

    
    UIImageView *iconImage = [[UIImageView alloc]init];
    iconImage.backgroundColor = [UIColor grayColor];
    iconImage.image = [UIImage imageNamed:@"myindiana"];
    iconImage.frame = CGRectMake(20, 20, 66, 66);
    iconImage.layer.cornerRadius = 66*0.5;
    iconImage.layer.masksToBounds = YES;
    [topView addSubview:iconImage];
    
    
    UIImageView *denglu = [[UIImageView alloc]init];
    denglu.image = [UIImage imageNamed:@"clickHeadLogin"];
    denglu.frame = CGRectMake(100, 30,150, 40);
    
    [topView addSubview:denglu];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapGestureHandle)];
    iconImage.userInteractionEnabled = YES;
    [iconImage addGestureRecognizer:tap];
}

//跳转到登录界面
-(void)TapGestureHandle{
    
    
    XMMainViewController *mainVC = [[XMMainViewController alloc]init];
    
    XMNavViewController *nav = [[XMNavViewController alloc]initWithRootViewController:mainVC];
    
    [self presentViewController:nav animated:YES completion:nil];
}






















@end
