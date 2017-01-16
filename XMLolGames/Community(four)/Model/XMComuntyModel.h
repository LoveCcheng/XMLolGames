//
//  XMComuntyModel.h
//  XMLolGames
//
//  Created by montnets on 2017/1/12.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMComuntyModel : NSObject

/** 名字 */
@property (nonatomic,copy) NSString *name;
/** 内容*/
@property (nonatomic,copy) NSString *content;
/** 时间 */
@property (nonatomic,copy) NSString *time;
/** 图片数组 */
@property (nonatomic,strong) NSMutableArray *imagecount;


/** 返回cell的高度 */
@property (nonatomic,assign) CGFloat CellHeight;




+(instancetype)initwithDictionary:(NSDictionary *)dict;

@end
