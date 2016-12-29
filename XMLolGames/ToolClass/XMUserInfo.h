//
//  XMUserInfo.h
//  XMLolGames
//
//  Created by montnets on 2016/12/29.
//  Copyright © 2016年 montnets. All rights reserved.
/**
    保存数据到本地
 
 */

#import <Foundation/Foundation.h>

@interface XMUserInfo : NSObject



+(instancetype)shareManager;

/** 超时时间 */
@property (nonatomic,strong) NSDate *enterBackgroundTime;

@end
