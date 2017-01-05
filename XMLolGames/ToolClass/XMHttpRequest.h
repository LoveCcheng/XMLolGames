//
//  XMHttpRequest.h
//  XMLolGames
//
//  Created by montnets on 2016/12/26.
//  Copyright © 2016年 montnets. All rights reserved.
/**
 
    数据请求---类
 */

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


@interface XMHttpRequest : NSObject

/** 初始化单利 */
+(XMHttpRequest *)shareHttpRequest;

/**  开始请求数据
 url : 请求地址
 param:请求参数
 */
-(void)BeginHttpRequestWithUrl:(NSString *)Url andParam:(NSString *)param;





@end
