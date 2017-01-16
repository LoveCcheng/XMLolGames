//
//  XMSquarButton.m
//  XMLolGames
//
//  Created by montnets on 2017/1/16.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMSquarButton.h"

@implementation XMSquarButton

//XIB创建
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUP];
}

//代码创建
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUP];
    }
    return self;
}


-(void)setUP{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
}

//重新调整按钮结构
-(void)layoutSubviews{
    [super layoutSubviews];

    self.imageView.Y = self.height*0.15;
    self.imageView.width = self.width*0.5;
    self.imageView.height = self.imageView.width;
    self.imageView.centerX = self.width*0.5;
    
    
    self.titleLabel.X = 0;
    self.titleLabel.Y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.Y;
}


-(void)setTitleButton:(NSString *)titleButton{
    _titleButton = titleButton;
    
    [self setTitle:titleButton forState:UIControlStateNormal];
    
    [self setImage:[UIImage imageNamed:@"photoha"] forState:UIControlStateNormal];

    [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick:(XMSquarButton *)button{
    XMLogFun;
}

































@end
