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

#define NEWS_URL @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?cattype=news&catid=10178&page=1&i_=puZOEyrLAT4p6n1yAlpL6mvWZSMe0PoZMVYKajNHupzauzHqJn%2BuC7oDAdcHI%2B2PcuK/ZFGdhZpon%2BTMtHfUXw==&t_=1482377243&p_=24074&v_=40090205&d_=ios&osv_=9.2.1&version=0&a_=lol&api=ItemsService.lists&game=lol&time=1482377243&secretVersion=v1.0&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&nonce=766673&secretSignature=zhO%2B05yTe0vqXbZTxaXivBmnf7A="

#define PLAY_URL @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?cattype=news&catid=10179&page=1&i_=puZOEyrLAT4p6n1yAlpL6mvWZSMe0PoZMVYKajNHupzauzHqJn%2BuC7oDAdcHI%2B2PcuK/ZFGdhZpon%2BTMtHfUXw==&t_=1482388730&p_=28535&v_=40090205&d_=ios&osv_=9.2.1&version=0&a_=lol&api=ItemsService.lists&game=lol&time=1482388731&secretVersion=v1.0&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&nonce=821674&secretSignature=j8HRF/nUsJ3fd6yHdsm1Z%2B77kvg="

#define GAME_URL @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?cattype=news&catid=10006&page=1&i_=puZOEyrLAT4p6n1yAlpL6mvWZSMe0PoZMVYKajNHupzauzHqJn%2BuC7oDAdcHI%2B2PcuK/ZFGdhZpon%2BTMtHfUXw==&t_=1482388729&p_=28532&v_=40090205&d_=ios&osv_=9.2.1&version=0&a_=lol&api=ItemsService.lists&game=lol&time=1482388730&secretVersion=v1.0&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&nonce=810637&secretSignature=yx%2BFmk7/loWgF/JU/IsqW%2B0Gv1s="

#define Mian_URL @"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?cattype=news&catid=10000&page=1&i_=puZOEyrLAT4p6n1yAlpL6mvWZSMe0PoZMVYKajNHupzauzHqJn%2BuC7oDAdcHI%2B2PcuK/ZFGdhZpon%2BTMtHfUXw==&t_=1482388729&p_=28532&v_=40090205&d_=ios&osv_=9.2.1&version=0&a_=lol&api=ItemsService.lists&game=lol&time=1482388730&secretVersion=v1.0&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&nonce=722772&secretSignature=BpPvtTfRSBfJW2BGy5WSIja7ngg="

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

+(void)getNewsFormServce:(XMmessageType)type{
    if (type == XMmessageTypeNewest) {
        [[XMHttpRequest shareHttpRequest] getDataWith:NEWS_URL];
    }else if (type == XMmessageTypePlay){
        [[XMHttpRequest shareHttpRequest] getDataWith:PLAY_URL];
    }else if (type == XMmessageTypeGame){
        [[XMHttpRequest shareHttpRequest] getDataWith:GAME_URL];
    }else{
        [[XMHttpRequest shareHttpRequest] getDataWith:Mian_URL];
    }
}


















@end
