//
//  XMNewsModel.m
//  XMLolGames
//
//  Created by montnets on 2017/1/16.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMNewsModel.h"

@implementation XMNewsModel


+(instancetype)initWithDictionary:(NSDictionary *)dict{
    XMNewsModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(NSString *)description{
    return [NSString stringWithFormat:@"title---%@,pic_url----%@,%@",self.title,self.pic_url,self.comment];
}


@end
