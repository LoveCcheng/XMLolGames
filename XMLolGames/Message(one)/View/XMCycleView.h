//
//  XMCycleView.h
//  XMLolGames
//
//  Created by montnets on 2017/1/11.
//  Copyright © 2017年 montnets. All rights reserved.
//

//无限循环轮播图

#import <UIKit/UIKit.h>

@interface XMCycleView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,weak) UICollectionView *collectionView;

@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,weak) NSTimer *timer;

@property (nonatomic,assign) NSInteger index;
/** 占位图片 */
@property (nonatomic,strong) UIImage *placeholderImage;

/** 图片数组 */
@property (nonatomic,strong) NSMutableArray *imageArray;

/** 图片url数组 */
@property (nonatomic, strong) NSMutableArray *imageUrlArray;

/** 点击图片，返回点击的index */
@property (nonatomic,copy) void (^ClickPicHandle)(NSInteger index);

/** 加载网络图片 */
+(instancetype)cycleCollectionViewWithFrame:(CGRect)frame WithPlaceHolderImage:(UIImage *)PlaceholderImage;

/** 加载本地图片 */
+(instancetype)cycleCollectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray PlaceholderImage:(UIImage *)PlaceholderImage;




@end
