//
//  XMEnDecode.m
//  XMLolGames
//
//  Created by montnets on 2016/12/30.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMEnDecode.h"
#import <GTMBase64.h>
//引入IOS自带密码库
#include <CommonCrypto/CommonCryptor.h>

@implementation XMEnDecode

static int bufferLen = 1024*500;

/*
 * 加密，
 *Paramtext：要加密的内容
 *key:加密对应的key
 */
+(NSString *)EncodeWithBase64:(NSString *)Paramtext andKey:(NSString *)key{
    NSData *paramData = [Paramtext dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    unsigned char buffer[bufferLen];
    memset(buffer, 0, sizeof(char));
    size_t numByteEbcode = 0;
    
    NSData *keyData = [GTMBase64 decodeString:key];
    
    
    CCCryptorStatus cryStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                        kCCOptionPKCS7Padding | kCCOptionECBMode,
                                        [keyData bytes], kCCBlockSizeDES,
                                        NULL,
                                        [paramData bytes], [paramData length],
                                        buffer, bufferLen,
                                        &numByteEbcode);
    
    NSString *plainText = nil;
    if (cryStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:numByteEbcode];
        plainText = [GTMBase64 stringByEncodingData:dataTemp];
    }else{
        XMLog(@"加密失败");
    }
    return plainText;
}

/*
 * 解密，
 *Paramtext：要解密的内容
 *key:解密对应的key
 */
+(NSString *)DecodeWithBase64:(NSString *)Paramtext andKey:(NSString *)key{
    NSData *paramData = [GTMBase64 decodeString:Paramtext];
    
    NSData *keyData = [GTMBase64 decodeString:key];
    
    unsigned char buffer[bufferLen];
    memset(buffer, 0, sizeof(char));
    size_t numByteEbcode = 0;
    
    CCCryptorStatus cryStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                        kCCOptionPKCS7Padding | kCCOptionECBMode,
                                        [keyData bytes], kCCBlockSizeDES,
                                        NULL,
                                        [paramData bytes], [paramData length],
                                        buffer, bufferLen,
                                        &numByteEbcode);
    
    
    NSString *plaintext = nil;
    if (cryStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:numByteEbcode];
        plaintext = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        XMLog(@"解密失败");
    }
    return plaintext;
}




+(NSString *)encodebase64:(NSString *)param{
    NSData *data = [param dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *base64Encode = [data base64EncodedStringWithOptions:0];
    
    return base64Encode;

}

+(NSString *)decodebase64:(NSString *)param{
    NSData *decodeData = [[NSData alloc]initWithBase64EncodedString:param options:0];
    
    NSError *error;
    
    
    NSString *decodeString = [[NSString alloc]initWithData:decodeData encoding:NSUTF8StringEncoding];
    
    
    NSData *respData = [decodeString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:respData options:NSJSONReadingMutableLeaves error:&error];
    
    
    XMLog(@"----%@",dict);
    




    return @"";
}



@end






























