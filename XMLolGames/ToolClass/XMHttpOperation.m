//
//  XMHttpOperation.m
//  XMLolGames
//
//  Created by montnets on 2016/12/27.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMHttpOperation.h"
#import "XMHttpRequest.h"

#define HTTP_URL_REG @"http://localhost/project/frame.php"
#define HTTP_URL_LOGIN @"http://localhost/project/Login.php"

@implementation XMHttpOperation


+(void)RegisterWithUsername:(NSString *)username Password:(NSString *)password{
    NSString *user = [username stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableDictionary *ParamDic = [NSMutableDictionary dictionary];
    ParamDic[@"username"] = user;
    ParamDic[@"password"] = password;
    ParamDic[@"operationCode"] = @"30000";
    [[XMHttpRequest shareHttpRequest] BeginHttpRequestWithUrl:HTTP_URL_REG andParam:ParamDic];

}

+(void)LoginWithUsername:(NSString *)username Password:(NSString *)password{
    NSString *user = [username stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableDictionary *ParamDic = [NSMutableDictionary dictionary];
    ParamDic[@"username"] = user;
    ParamDic[@"password"] = password;
    ParamDic[@"operationCode"] = @"30002";
    [[XMHttpRequest shareHttpRequest] BeginHttpRequestWithUrl:HTTP_URL_REG andParam:ParamDic];
}



@end
