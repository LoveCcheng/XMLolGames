//
//  XMNewsModel.h
//  XMLolGames
//
//  Created by montnets on 2017/1/16.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMNewsModel : NSObject

/** 图片地址 */
@property (nonatomic,copy) NSString *pic_url;

/** 标题 */
@property (nonatomic,copy) NSString *title;

/** 评论数 */
@property (nonatomic,copy) NSString *comment;

+(instancetype)initWithDictionary:(NSDictionary *)dict;

@end
