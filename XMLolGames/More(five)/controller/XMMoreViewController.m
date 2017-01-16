//
//  XMMoreViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMoreViewController.h"
#import "XMSquarButton.h"

@interface XMMoreViewController ()

@end

@implementation XMMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self automaticallyAdjustsScrollViewInsets];
    [self setNavigation];
    [self createbutton];
}

-(void)createbutton{
    NSArray *arrStr = @[@"张三",@"李四",@"王五",@"猪六",@"王二麻子",@"张三",@"李四",@"王五",@"猪六",@"王二麻子",@"张三",@"李四",@"王五",@"猪六",@"王二麻子",@"张三",@"李四",@"王五",@"猪六",@"王二麻子",@"张三",@"李四",@"王五"];
    //一行最多5个
    int maxcols = 5;
    
    CGFloat buttonW = XMScreenW/maxcols;
    CGFloat buttonH = buttonW;
    
    for (int i= 0; i<arrStr.count; i++) {
        XMSquarButton *button = [[XMSquarButton alloc]init];
        button.titleButton = arrStr[i];
        [self.view addSubview:button];
        
        
        int col = i%maxcols;//列号
        int row = i/maxcols;//行号
        
        button.X = col*buttonW;
        button.Y = row*buttonH;
        button.height = buttonH;
        button.width = buttonW;
    }
}

//设置导航栏
-(void)setNavigation{
    self.navigationItem.title = @"更多";
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
