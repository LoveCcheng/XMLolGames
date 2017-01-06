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
#import "XMNewsViewController.h"


@interface XMMessageViewController ()<UIScrollViewDelegate>

/** 装button的view  */
@property (nonatomic,strong) UIView *titleVIew;
/** 中间的scrollView */
@property (nonatomic,strong) UIScrollView *contentView;
/** 下面指示器的view  */
@property (nonatomic,strong)UIView *indiView;


@end

@implementation XMMessageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
    [self CreateTopButton];
    [self setUpViewController];
    [self setMidContentView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(autoLogin) name:XMautoLoginNotification object:nil];
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

-(void)CreateTopButton{
    //背景view
    UIView *titleView=[[UIView alloc]init];
    titleView.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.8];
    titleView.frame=CGRectMake(0, 64, self.view.frame.size.width, 40);
    [self.view addSubview:titleView];
    self.titleVIew=titleView;
    
    //指示器view
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor blueColor];
    indicatorView.height = 5;
    indicatorView.tag = 1000;
    indicatorView.Y = titleView.Y+titleView.height;
    self.indiView = indicatorView;
    
    [self.view addSubview:self.indiView];
    
    NSArray *arrBtn = @[@"最新",@"新闻",@"赛事",@"娱乐"];
    
    CGFloat butWidth = XMScreenW/4;
    CGFloat butHeight = 40;
    
    self.indiView.width = butWidth+2;
    
    for (int i=0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(butWidth*i, 0, butWidth+2, butHeight);
        button.tag =i+100;
        [button setTitle:arrBtn[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        
        [button setBackgroundImage:[XMDataStorage imageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[XMDataStorage imageWithColor:[UIColor blackColor]] forState:UIControlStateSelected];
        //默认选中的按钮
        if (button.tag==100) {
            button.selected=YES;
            self.indiView.centerX = button.centerX;
        }
        
        [titleView addSubview:button];
        
        [button addTarget:self action:@selector(buttonNewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)buttonNewClick:(UIButton *)but{
//    XMLog(@"%ld",but.tag);
    for (int i=0; i<4; i++) {
        UIButton *CliakBut = [self.view viewWithTag:i+100];
        CliakBut.selected = NO;
    }
    but.selected =YES;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.indiView.centerX = but.centerX;
    }];
    
    //滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = (but.tag-100)*self.contentView.width;
    
    [self.contentView setContentOffset:offset animated:YES];
    
    
}


-(void)setUpViewController{
    //最新
    XMNewsViewController *newsVC = [[XMNewsViewController alloc]init];
    newsVC.MessageType = XMmessageTypeNewest;
    [self addChildViewController:newsVC];
    
    //新闻
    XMNewsViewController *twoVC = [[XMNewsViewController alloc]init];
    twoVC.MessageType = XMmessageTypenews;
    [self addChildViewController:twoVC];
    
    //赛事
    XMNewsViewController *PlayVC = [[XMNewsViewController alloc]init];
    PlayVC.MessageType = XMmessageTypePlay;
    [self addChildViewController:PlayVC];
    
    //娱乐
    XMNewsViewController *gameVC = [[XMNewsViewController alloc]init];
    gameVC.MessageType = XMmessageTypeGame;
    [self addChildViewController:gameVC];
}


-(void)setMidContentView{

    //不要自动调整
    //self.automaticallyAdjustsScrollViewInsets=NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.frame = self.view.bounds;
    contentView.delegate =self;
    
    contentView.pagingEnabled =YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width*self.childViewControllers.count, 0);

    self.contentView = contentView;
    
    //添加第一个=控制器的view
    [self scrollViewDidEndScrollingAnimation:self.contentView];

}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //当前的索引
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    
    XMNewsViewController *tbVC = self.childViewControllers[index];
    tbVC.view.X = scrollView.contentOffset.x;
    tbVC.view.Y = 0;
    tbVC.view.height = scrollView.height;
    
    [scrollView addSubview:tbVC.view];
    
    

}

//停止减速
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    
    [self buttonNewClick:self.titleVIew.subviews[index]];
}


















































@end
