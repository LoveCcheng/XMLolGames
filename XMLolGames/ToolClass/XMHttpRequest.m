//
//  XMHttpRequest.m
//  XMLolGames
//
//  Created by montnets on 2016/12/26.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMHttpRequest.h"
#import "XMEnDecode.h"

#define Endecode @"Endecode"

@interface XMHttpRequest ()
{
    AFHTTPSessionManager *_manager;
}

@end


@implementation XMHttpRequest

-(instancetype)init{
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
    }
    return  self;
}
/** 初始化 */
+(XMHttpRequest *)shareHttpRequest{
    static XMHttpRequest *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

/** 
 开始请求数据
 url : 请求地址
 param:请求参数
 */
-(void)BeginHttpRequestWithUrl:(NSString *)Url andParam:(NSString *)param{
    NSString *enParam =[XMEnDecode encodebase64:param];
//    XMLog(@"加密字符串--%@",enParam);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"param"] = enParam;
    dict[@"operationCode"] = @"30002";
    
//    XMLog(@"---dict = %@",dict);
    
    [self Get:Url AndParameter:dict];
    
}

-(void)getDataWith:(NSString *)url{
    [self Get:url AndParameter:nil];
}


/** get请求 */
-(void)Get:(NSString *)UrlString AndParameter:(NSDictionary *)dict{
    
    _manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    [_manager GET:UrlString parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([dict[@"operationCode"] isEqualToString:@"30000"]) {//注册
            [[NSNotificationCenter defaultCenter] postNotificationName:XMRegisterSuccessNotification object:responseObject];
        }else if ([dict[@"operationCode"] isEqualToString:@"30002"]) {//登录
            [[NSNotificationCenter defaultCenter] postNotificationName:XMLoginSuccessNotification object:responseObject];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:XMNewsNotification object:responseObject];
//            XMLog(@"----%@",responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XMLog(@"---%@",error);
    }];
}












































@end
