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

@interface XMNewsViewController ()


@end

@implementation XMNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateTopView];
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
    
    XMCycleView *cycleViewArr = [XMCycleView cycleCollectionViewWithFrame:CGRectMake(0, 45, XMScreenW, 100) imageArray:arrimage PlaceholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    [cycleViewArr setClickPicHandle:^(NSInteger index) {
        XMLog(@"--%ld",index);
    }];
    
    [self.view addSubview:cycleViewArr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
