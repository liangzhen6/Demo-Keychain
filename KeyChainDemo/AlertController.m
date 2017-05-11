//
//  AlertController.m
//  QRCode
//
//  Created by shenzhenshihua on 2017/1/18.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

#import "AlertController.h"

@implementation AlertController

+ (void)alertControllerWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle cancelAction:(void(^)())cancelAction otherAction:(void(^)())otherAction {

    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancelButtonTitle.length) {
        UIAlertAction * cancle = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelAction) {
                cancelAction();
            }
        }];
        [alertController addAction:cancle];
    }
    
    if (otherButtonTitle.length && otherAction) {
        UIAlertAction * other = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (otherAction) {
                otherAction();
            }
        }];
        [alertController addAction:other];
    }
    
    [controller presentViewController:alertController animated:YES completion:nil];

}


@end
