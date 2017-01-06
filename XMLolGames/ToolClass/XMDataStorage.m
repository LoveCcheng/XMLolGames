//
//  XMDataStorage.m
//  XMLolGames
//
//  Created by montnets on 2017/1/4.
//  Copyright © 2017年 montnets. All rights reserved.
//

#import "XMDataStorage.h"

@implementation XMDataStorage


+(void)saveInfo:(NSString *)value forkey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //清空之前保存的
    [defaults removeObjectForKey:key];
    [defaults setObject:value forKey:key];
    
    [defaults synchronize];
}


+(NSString *)readinfoWithKey:(NSString *)key{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *strValue = [defaults stringForKey:key];
    
    return strValue;
}


+(void)saveUserAndPass:(NSDictionary *)dict{
    NSString *username = [dict objectForKey:@"username"];
    NSString *password = [dict objectForKey:@"password"];
    
    [XMDataStorage saveInfo:username forkey:@"username"];
    [XMDataStorage saveInfo:password forkey:@"password"];

}


+(NSDictionary *)readUserandPass{
   NSString *user = [XMDataStorage readinfoWithKey:@"username"];
    NSString *pass = [XMDataStorage readinfoWithKey:@"password"];
    
    NSMutableDictionary *dict =[NSMutableDictionary dictionary];
    dict[@"username"] = user;
    dict[@"password"] = pass;
    
    return dict;
}

+(UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return image;
}




































@end
