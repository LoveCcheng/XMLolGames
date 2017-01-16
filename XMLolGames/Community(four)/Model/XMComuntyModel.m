//
//  XMComuntyModel.m
//  XMLolGames
//
//  Created by montnets on 2017/1/12.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMComuntyModel.h"

#define space 10

@interface XMComuntyModel ()
{
    //写在这里的是私有属性
    CGFloat _cellHeigth;
    
}

@end

@implementation XMComuntyModel

+(instancetype)initwithDictionary:(NSDictionary *)dict{
    XMComuntyModel *model = [[XMComuntyModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
//    for (NSString *str in dict[@"imagecount"]) {
//        [model.imagecount addObject:str];
//    }
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


-(CGFloat)CellHeight{
    
        CGFloat heightSum = space;
        //15是左右两边的距离
        CGSize maxSize = CGSizeMake(XMScreenW-2*15, MAXFLOAT);
        
        //计算文字的高度
        CGFloat textHeight = [self.content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
        //30是名字的高度
        heightSum = heightSum + 30 +space + textHeight +space;
    
    
    return heightSum;
}


























-(NSString *)description{
    return [NSString stringWithFormat:@"volume---%@,code----%@,%f",self.name,self.imagecount,self.CellHeight];
}




@end
