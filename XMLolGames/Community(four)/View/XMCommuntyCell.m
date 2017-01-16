//
//  XMCommuntyCell.m
//  XMLolGames
//
//  Created by montnets on 2017/1/12.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMCommuntyCell.h"
#import "XMComuntyModel.h"
#import "Masonry.h"

@interface XMCommuntyCell ()

/** 名字 */
@property (nonatomic,strong) UILabel *labelName;
/** 时间 */
@property (nonatomic,strong) UILabel *labelTime;
/** 内容 */
@property (nonatomic,strong) UILabel *labelContent;


@end

@implementation XMCommuntyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

/** 初始化UI */
-(void)setupUI{
    self.labelName = [[UILabel alloc]init];
    self.labelName.textAlignment=NSTextAlignmentLeft;
    self.labelName.font = [UIFont systemFontOfSize:18];
    self.labelName.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.labelName];
    
    
    self.labelTime = [[UILabel alloc]init];
    self.labelTime.textAlignment=NSTextAlignmentRight;
    self.labelTime.font = [UIFont systemFontOfSize:15];
    self.labelTime.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:self.labelTime];
    
    
    self.labelContent = [[UILabel alloc]init];
    self.labelContent.textAlignment=NSTextAlignmentLeft;
    self.labelContent.font = [UIFont systemFontOfSize:15];
    self.labelContent.textColor = [UIColor grayColor];
    self.labelContent.numberOfLines=0;
    
    [self.contentView addSubview:self.labelContent];
    
}

-(void)setComModel:(XMComuntyModel *)comModel{
    _comModel = comModel;

    self.labelName.text = comModel.name;
    
    self.labelTime.text = comModel.time;
    
    self.labelContent.text = comModel.content;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    __weak typeof(self) weakself = self;
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.contentView).offset(15);
        make.top.equalTo(weakself.contentView).offset(10);
    }];
    
    [self.labelTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.contentView).offset(-15);
        make.top.equalTo(weakself.contentView).offset(10);
    }];
    
    
    [self.labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.contentView).offset(-15);
        make.left.equalTo(weakself.contentView).offset(15);
        make.top.equalTo(weakself.labelName).offset(10);
        make.bottom.equalTo(weakself.contentView).offset(10);
    }];
    
    

}






@end
