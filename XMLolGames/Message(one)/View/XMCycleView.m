//
//  XMCycleView.m
//  XMLolGames
//
//  Created by montnets on 2017/1/11.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMCycleView.h"
#import "XMcycleCell.h"
#import <UIImageView+WebCache.h>

@interface XMCycleView ()


@end

@implementation XMCycleView

/** 初始化 */
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self setupCollectionView];
    }
    return self;
}


/** 加载网络图片 */
+(instancetype)cycleCollectionViewWithFrame:(CGRect)frame WithPlaceHolderImage:(UIImage *)PlaceholderImage{
    XMCycleView *cycleView = [[self alloc]initWithFrame:frame];
    cycleView.placeholderImage = PlaceholderImage;
    [cycleView.imageArray addObject:PlaceholderImage];
    
    return cycleView;
}


/**
 加载本地图片
 @param frame 图片轮播器frame
 @param imageArray 本地图片数组(数组里元素为imageView)
 @param PlaceholderImage 占位图
 @return 图片轮播器
 */
+(instancetype)cycleCollectionViewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray PlaceholderImage:(UIImage *)PlaceholderImage{
    XMCycleView *cycleView = [[self alloc]initWithFrame:frame];
    cycleView.placeholderImage = PlaceholderImage;
    if (imageArray.count == 0) {
        [cycleView.imageArray addObject:PlaceholderImage];
    }else{
        cycleView.imageArray = [NSMutableArray arrayWithArray:imageArray];
    }

    return cycleView;
}




/** 初始化 CollectionView*/
-(void)setupCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
    flowLayout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    collection.pagingEnabled = YES;
    collection.bounces = NO;
    collection.showsHorizontalScrollIndicator = NO;
    collection.delegate = self;
    collection.dataSource = self;
    
    [collection registerClass:[XMcycleCell class] forCellWithReuseIdentifier:@"XMcycleCell"];
    
    [self addSubview:collection];
    self.collectionView = collection;
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 120, 100, 30)];
    self.pageControl.centerX = self.centerX;
    self.pageControl.pageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.numberOfPages = 1;
    self.pageControl.currentPage = 0;
    [self addSubview:self.pageControl];

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.imageArray.count ==0 ) {
        return 1;//保证数组不为空
    }else{
        return self.imageArray.count * 3;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XMcycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XMcycleCell" forIndexPath:indexPath];
    if (self.imageArray.count == 0) {
        cell.imageView.image = self.placeholderImage;
    }else{
        if ([self.imageArray[indexPath.row % self.imageArray.count] isKindOfClass:[UIImage class]]) {
            //如果数组里面是image，说明是本地图片
            cell.imageView.image = self.imageArray[indexPath.row % self.imageArray.count];
        }else if([self.imageArray[indexPath.row % self.imageArray.count] isKindOfClass:[NSString class]]){
            //如果数组里面是字符串，说明是网络图片
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.imageArray[indexPath.row % self.imageArray.count]] placeholderImage:self.placeholderImage];
        }
    }
    return cell;
}

/** 点击item */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.imageArray.count == 0) {
        return;
    }
    if (self.ClickPicHandle) {
        self.ClickPicHandle(indexPath.row);
    }
}


/** 设置页码 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width) % self.imageArray.count;

}

/** 添加定时器 */
-(void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(AutochangeView) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/** 删除定时器 */
-(void)deleteTimer{
    [self.timer invalidate];
    self.timer = nil;
}

/** 定时器事件 */
-(void)AutochangeView{
    
    self.index ++;
    if (self.imageArray.count == 0) {
        return;
    }else{
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:self.index inSection:0];
        //让collectionView滚到indexpath指定的cell
        [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:0 animated:YES];
        
        if (indexpath.row == self.imageArray.count*2) {
            //如果要滚动的cell是图片数组的两倍，就让cell滚动到row等于数组长度的cell上去
            //加延时0.5秒是为了能有过度效果
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSIndexPath *indexpathxu = [NSIndexPath indexPathForItem:self.imageArray.count inSection:0];
                //这个动画记得一定不能有，要设置为NO，不然会有反弹的效果
                [self.collectionView scrollToItemAtIndexPath:indexpathxu atScrollPosition:0 animated:NO];
            });
        }
        self.pageControl.currentPage = self.index % self.imageArray.count;
    }

}
//手动滚动时删除定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self deleteTimer];
    if (self.imageArray.count == 0) {
        return;
    }else{
        if (self.index == self.imageArray.count-1) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.imageArray.count*2- 1 inSection:0] atScrollPosition:0 animated:NO];
        }
        if (self.index == self.imageArray.count*2) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.imageArray.count inSection:0]atScrollPosition:0 animated:NO];
        }
    }

}


#pragma mark - UIScrollViewDelegate
/** 停止滚动打开定时器 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    self.index = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);

}


/** 接受传过来的本地图片 */
-(void)setImageArray:(NSMutableArray *)imageArray{
    [_imageArray removeAllObjects];
    _imageArray = imageArray;
    
    [self.collectionView reloadData];
    
    self.pageControl.numberOfPages = imageArray.count;
    self.pageControl.currentPage = 0;
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:self.imageArray.count inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:0 animated:NO];
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        [self addTimer];
    }else{
        [self addTimer];
    }
}

/** 把传过来的图片地址放入数组中 */
-(void)setImageUrlArray:(NSMutableArray *)imageUrlArray{
    [_imageUrlArray removeAllObjects];
    
    _imageUrlArray = imageUrlArray;
    
    NSMutableArray *imageArrayTemp = [NSMutableArray array];
    
    for (int i=0; i<imageUrlArray.count; i++) {
        [imageArrayTemp addObject:imageUrlArray[i]];
    }
    
    [self.imageArray removeAllObjects];
    self.imageArray  = imageArrayTemp;


}


/** view要销毁时，释放timer */
-(void)removeFromSuperview{
    [super removeFromSuperview];
    [self.timer invalidate];
    self.timer = nil;
}














































@end
