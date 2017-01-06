//
//  XMNewsViewController.m
//  XMLolGames
//
//  Created by montnets on 2017/1/6.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMNewsViewController.h"

@interface XMNewsViewController ()

@end

@implementation XMNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateTopView];
}

-(void)CreateTopView{
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, 45, XMScreenW, 100)];
    topview.backgroundColor = [UIColor redColor];
    [self.view addSubview:topview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
