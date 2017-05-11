//
//  AlertController.h
//  QRCode
//
//  Created by shenzhenshihua on 2017/1/18.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AlertController : NSObject


+ (void)alertControllerWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle cancelAction:(void(^)())cancelAction otherAction:(void(^)())otherAction;

@end
