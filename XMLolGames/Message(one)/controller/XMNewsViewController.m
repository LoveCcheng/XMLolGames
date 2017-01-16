//
//  XMNewsViewController.m
//  XMLolGames
//
//  Created by montnets on 2017/1/6.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMNewsViewController.h"
#import "XMCycleView.h"
#import "XMplayPicView.h"
#import "XMHttpOperation.h"
#import "XMNewsModel.h"
#import "XMNewsCell.h"

@interface XMNewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation XMNewsViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 45, XMScreenW, XMScreenH-45-49) style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource= self;
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [table registerNib:[UINib nibWithNibName:@"XMNewsCell" bundle:nil] forCellReuseIdentifier:@"XMNewsCell"];
        table.rowHeight = 100;
        _tableView = table;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.MessageType == XMmessageTypeNewest) {
        [self getDataformSevrceWithType:XMmessageTypeNewest];
    }else if (self.MessageType == XMmessageTypePlay){
        [self getDataformSevrceWithType:XMmessageTypePlay];
    }else if(self.MessageType == XMmessageTypeGame){
        [self getDataformSevrceWithType:XMmessageTypeGame];
    }else{
        [self getDataformSevrceWithType:XMmessageTypenews];
    }

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNewsFormServceSuccess:) name:XMNewsNotification object:nil];
    
}
/** 从服务器获取数据 */
-(void)getDataformSevrceWithType:(XMmessageType)type{
    [XMHttpOperation getNewsFormServce:type];
}
/** 获取数据成功 */
-(void)getNewsFormServceSuccess:(NSNotification *)noti{
    NSArray *arrData =noti.object[@"data"];
    for (int i=0; i<arrData.count; i++) {
        XMNewsModel *model = [XMNewsModel initWithDictionary:arrData[i]];
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    cell.textLabel.text = @"xumin";
//    return cell;
    XMNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XMNewsCell"];
    
    XMNewsModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}


//返回组头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"4.jpg"];
    NSArray *arrimage =@[image1,image2,image3,image4];
    XMCycleView *cycleViewArr = [XMCycleView cycleCollectionViewWithFrame:CGRectMake(0, 45, XMScreenW, 150) imageArray:arrimage PlaceholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    [cycleViewArr setClickPicHandle:^(NSInteger index) {
        XMLog(@"--%ld",index);
    }];
    return cycleViewArr;
}
/** 去掉tableview header的黏性   让section的header上面的view跟随整个tableview上下滚动 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        CGFloat sectionHeaderHeight = 150;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }else if (scrollView.contentOffset.y>=sectionHeaderHeight){
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }

}






















































-(void)CreateTopView{
    /*  这是网络图片
     XMCycleView *cycleView = [XMCycleView cycleCollectionViewWithFrame:CGRectMake(0, 45, XMScreenW, 100) WithPlaceHolderImage:[UIImage imageNamed:@"placeholderImage"]];
     [self.view addSubview:cycleView];
     //延迟模拟网络加载
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     NSMutableArray *arrTemp = [NSMutableArray array];
     [arrTemp addObject:@"http://pic2.cxtuku.com/00/01/30/b5898506ee44.jpg"];
     [arrTemp addObject:@"http://img4.duitang.com/uploads/blog/201306/08/20130608100514_HfKmk.thumb.600_0.jpeg"];
     [arrTemp addObject:@"http://my.isself.com/upimg/user/30/20131117/13846939809150.jpg"];
     [arrTemp addObject:@"http://img2.duitang.com/uploads/item/201208/07/20120807210311_ztEEM.thumb.600_0.jpeg"];
     
     cycleView.imageUrlArray = arrTemp;
     });
     */
    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"4.jpg"];
    NSArray *arrimage =@[image1,image2,image3,image4];
    XMCycleView *cycleViewArr = [XMCycleView cycleCollectionViewWithFrame:CGRectMake(0, 45, XMScreenW, 150) imageArray:arrimage PlaceholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    [cycleViewArr setClickPicHandle:^(NSInteger index) {
        XMLog(@"--%ld",index);
    }];
    [self.view addSubview:cycleViewArr];
}



@end
