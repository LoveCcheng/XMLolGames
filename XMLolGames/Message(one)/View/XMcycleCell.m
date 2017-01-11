//
//  XMcycleCell.m
//  XMLolGames
//
//  Created by montnets on 2017/1/11.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMcycleCell.h"

@implementation XMcycleCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = self.bounds;
        [self addSubview:_imageView];
    }
    return _imageView;
}




@end
