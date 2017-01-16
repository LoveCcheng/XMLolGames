//
//  XMCommunityViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMCommunityViewController.h"
#import "XMCommuntyCell.h"
#import "XMComuntyModel.h"


@interface XMCommunityViewController ()

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation XMCommunityViewController

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setNavigation];
    
    [self setTableviewPro];
    
    [self getDataFormPlist];
}
/** 设置tableview */
-(void)setTableviewPro{
    [self.tableView registerClass:[XMCommuntyCell class] forCellReuseIdentifier:@"XMCommuntyCell"];

}
/** 从plist文件获取数据 */
-(void)getDataFormPlist{
    NSString *plistpath = [[NSBundle mainBundle] pathForResource:@"founddata" ofType:@"plist"];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithContentsOfFile:plistpath];
    NSArray *arr = dict[@"info"];
    
    for (int i=0; i<arr.count; i++) {
        XMComuntyModel *model = [XMComuntyModel initwithDictionary:arr[i]];
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}

//设置导航栏
-(void)setNavigation{
    self.navigationItem.title = @"社区";
    //字体大小和颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    //左边的按钮
    UIBarButtonItem *item = [self barButtonWithImage:[UIImage imageNamed:@"leftUserBTN"] HightImage:[UIImage imageNamed:@"leftUserBTN"] target:self action:@selector(itemClickLeft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = item;
    UIBarButtonItem *itemRight = [self barButtonWithImage:[UIImage imageNamed:@"photoha"] HightImage:[UIImage imageNamed:@"photoha"] target:self action:@selector(itemClickRight) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = itemRight;
    
}
-(void)itemClickLeft{
    XMLogFun;
}

-(void)itemClickRight{
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XMCommuntyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XMCommuntyCell" forIndexPath:indexPath];
    
    XMComuntyModel *model = self.dataArray[indexPath.row];
    
    cell.comModel = model;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XMComuntyModel *model = self.dataArray[indexPath.row];
    
    return model.CellHeight;
}








































@end
