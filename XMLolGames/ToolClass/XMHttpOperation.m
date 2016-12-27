//
//  XMHttpOperation.m
//  XMLolGames
//
//  Created by montnets on 2016/12/27.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMHttpOperation.h"
#import "XMHttpRequest.h"

#define HTTP_URL @"http://localhost/project/frame.php"

@implementation XMHttpOperation


+(void)RegisterWithUsername:(NSString *)username Password:(NSString *)password{
    NSString *user = [username stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableDictionary *ParamDic = [NSMutableDictionary dictionary];
    ParamDic[@"username"] = user;
    ParamDic[@"password"] = password;
    ParamDic[@"operationCode"] = @"30000";
    [[XMHttpRequest shareHttpRequest] BeginHttpRequestWithUrl:HTTP_URL andParam:ParamDic];

}





@end
