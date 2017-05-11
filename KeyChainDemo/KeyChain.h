//
//  KeyChain.h
//  KeyChainDemo
//
//  Created by shenzhenshihua on 2017/5/9.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChain : NSObject

+ (void)save:(NSString *)service data:(id)data;

+ (id)readForKey:(NSString *)key;

+ (void)deleteWithService:(NSString *)service;

+ (void)addKeychainData:(id)data forKey:(NSString *)key;

+ (void)addShareKeyChainData:(id)data forKey:(NSString *)key;

+ (void)updateKeychainData:(id)data forKey:(NSString *)key;


@end
