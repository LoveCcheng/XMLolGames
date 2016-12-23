//
//  XMTabbarController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMTabbarController.h"

#import "XMMessageViewController.h"
#import "XMVideoViewController.h"
#import "XMHeroViewController.h"
#import "XMCommunityViewController.h"
#import "XMMoreViewController.h"
#import "XMNavViewController.h"


@interface XMTabbarController ()

@end

@implementation XMTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SetTabbarBack];
    
    [self AddChildController];
}
/** 设置tabbar的背景颜色 */
-(void)SetTabbarBack{
    self.tabBar.barTintColor = [UIColor blackColor];
}

/** 添加子控制器 */
-(void)AddChildController{
    
    UITabBarItem *itemAppearance = [UITabBarItem appearance];
    [itemAppearance setTitleTextAttributes:[self setTabbarItemAttributes] forState:UIControlStateNormal];
    [itemAppearance setTitleTextAttributes:[self setTabbarItemSelecetAttributes] forState:UIControlStateSelected];
    
    
    XMMessageViewController *messageVC = [[XMMessageViewController alloc]init];
    [self addOneViewController:messageVC AndTitle:@"资讯" andImage:[UIImage imageNamed:@"tab_infomation_normal"] andSelectImage:[UIImage imageNamed:@"tab_infomation_selected"]];
    
    
    XMVideoViewController *videoVC = [[XMVideoViewController alloc]init];
    [self addOneViewController:videoVC AndTitle:@"视频" andImage:[UIImage imageNamed:@"tab_video_normal"] andSelectImage:[UIImage imageNamed:@"tab_video_selected"]];
    
    XMHeroViewController *heroVC = [[XMHeroViewController alloc]init];
    [self addOneViewController:heroVC AndTitle:@"英雄" andImage:[UIImage imageNamed:@"tab_heros_normal"] andSelectImage:[UIImage imageNamed:@"tab_heros_selected"]];
    
    
    XMCommunityViewController *ComVC = [[XMCommunityViewController alloc]init];
    [self addOneViewController:ComVC AndTitle:@"社区" andImage:[UIImage imageNamed:@"tab_community_normal"] andSelectImage:[UIImage imageNamed:@"tab_community_selected"]];
    
    
    XMMoreViewController *moreVC = [[XMMoreViewController alloc]init];
    [self addOneViewController:moreVC AndTitle:@"更多" andImage:[UIImage imageNamed:@"tab_more_normal"] andSelectImage:[UIImage imageNamed:@"tab_more_selected"]];
    
}

/** 设置tabbar内容 */
-(void)addOneViewController:(UIViewController *)Controller AndTitle:(NSString *)title andImage:(UIImage *)image andSelectImage:(UIImage *)selectImage{
    //设置item的样式
    Controller.tabBarItem.title = title;
    Controller.tabBarItem.image = image;
    Controller.tabBarItem.selectedImage = [self setImageDispalayMode:selectImage];
    
    XMNavViewController *nav = [[XMNavViewController alloc]initWithRootViewController:Controller];
    
    [self addChildViewController:nav];
}

/** 设置底部选中图片默认不渲染  */
-(UIImage *)setImageDispalayMode:(UIImage *)image{
    UIImage *imageModel = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return imageModel;
}


//设置item的默认属性
-(NSDictionary *)setTabbarItemAttributes{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];
    return dict;
}
//选中属性
-(NSDictionary *)setTabbarItemSelecetAttributes{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setObject:[UIColor darkGrayColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];
    return dict;
}













@end
