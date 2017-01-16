//
//  XMNewsCell.m
//  XMLolGames
//
//  Created by montnets on 2017/1/16.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMNewsCell.h"
#import "XMNewsModel.h"
#import <UIImageView+WebCache.h>


@interface XMNewsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageIconImage;


@property (weak, nonatomic) IBOutlet UILabel *titleLa;

@property (weak, nonatomic) IBOutlet UILabel *timela;

@property (weak, nonatomic) IBOutlet UILabel *commentNum;


@end


@implementation XMNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}


-(void)setModel:(XMNewsModel *)model{
    
    [self.imageIconImage sd_setImageWithURL:[NSURL URLWithString:model.pic_url] placeholderImage:[UIImage imageNamed:@""]];
    
    self.titleLa.text = model.title;
    
    self.commentNum.text = model.comment;
    
    self.timela.text =@"12:45";

}


































@end
