//
//  XMHttpOperation.m
//  XMLolGames
//
//  Created by montnets on 2016/12/27.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMHttpOperation.h"
#import "XMHttpRequest.h"

/** 真机 */
#define HTTP_REG_Iphone @"http://10.10.202.39/project/frame.php"
/** 模拟器 */
#define HTTP_REG_SML @"http://localhost/project/frame.php"

@implementation XMHttpOperation


+(void)RegisterWithUsername:(NSString *)username Password:(NSString *)password{
    NSString *user = [username stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableDictionary *ParamDic = [NSMutableDictionary dictionary];
    ParamDic[@"username"] = user;
    ParamDic[@"password"] = password;
//    [[XMHttpRequest shareHttpRequest] BeginHttpRequestWithUrl:HTTP_URL_REG andParam:ParamDic];

}

+(void)LoginWithUsername:(NSString *)username Password:(NSString *)password{
    NSString *user = [username stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSMutableDictionary *ParamDic = [NSMutableDictionary dictionary];
    ParamDic[@"username"] = user;
    ParamDic[@"password"] = password;
    //时间格式转换
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    ParamDic[@"date"] = date;
//    XMLog(@"%@",ParamDic);
    
    NSString *param = [XMHttpOperation toJsonString:ParamDic];
    [[XMHttpRequest shareHttpRequest] BeginHttpRequestWithUrl:HTTP_REG_SML andParam:param];
}



+(NSString *)toJsonString:(NSDictionary *)dict{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return jsonStr;
}


+(void)ShowMessage:(NSString *)Message{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIView *showView = [[UIView alloc]init];
    showView.backgroundColor=[UIColor blackColor];
    showView.alpha=1.0f;
    showView.width = 120;
    showView.height=60;
    showView.layer.cornerRadius = 5.0;
    showView.layer.masksToBounds=YES;
    showView.center = CGPointMake(XMScreenW*0.5, XMScreenH*0.5);
    
    //放在最上面，保证能显示
    [window insertSubview:showView atIndex:9999];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 10, 100, 40);
    label.text = Message;
    label.backgroundColor = [UIColor clearColor];
    label.textColor=[UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment=NSTextAlignmentCenter;
    [showView addSubview:label];
    
    [UIView animateWithDuration:3.0 animations:^{
        //透明度变成0
        showView.alpha=0;
    }completion:^(BOOL finished) {
        //从俯视图上移除
        [showView removeFromSuperview];
    }];




}






















@end
