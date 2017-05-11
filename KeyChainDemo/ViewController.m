//
//  ViewController.m
//  KeyChainDemo
//
//  Created by shenzhenshihua on 2017/5/9.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

#import "ViewController.h"
#import <Security/Security.h>
#import "KeyChain.h"
#import "AlertController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myUser;
@property (weak, nonatomic) IBOutlet UITextField *myPassword;
@property (weak, nonatomic) IBOutlet UITextField *mykey;

@end

NSString * const KEY_USERNAME_PASSWORD = @"com.company.app.usernamepassword";
NSString * const KEY_USERNAME = @"com.company.app.username";
NSString * const KEY_PASSWORD = @"com.company.app.password";


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
//    [userNamePasswordKVPairs setObject:@"userName" forKey:KEY_USERNAME];
//    [userNamePasswordKVPairs setObject:@"password" forKey:KEY_PASSWORD];
//    
//    
//    
//    // A、将用户名和密码写入keychain
//    [KeyChain save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    
//    // B、从keychain中读取用户名和密码
//    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[KeyChain load:KEY_USERNAME_PASSWORD];
//    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
//    NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
//    NSLog(@"username = %@", userName);
//    NSLog(@"password = %@", password);
    
    // C、将用户名和密码从keychain中删除
//    [KeyChain delete:KEY_USERNAME_PASSWORD];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)writeAction:(id)sender {
    
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:self.myUser.text forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:self.myPassword.text forKey:KEY_PASSWORD];
    
    // A、将用户名和密码写入keychain
//    [KeyChain save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    
    if (self.mykey.text.length) {
        [KeyChain addKeychainData:userNamePasswordKVPairs forKey:self.mykey.text];
    }else{
        [AlertController alertControllerWithController:self title:@"提示" message:@"请填入key值" cancelButtonTitle:@"确定" otherButtonTitle:nil cancelAction:nil otherAction:nil];
    }

    
}

- (IBAction)readAction:(id)sender {
    // B、从keychain中读取用户名和密码
    if (self.mykey.text.length) {
        NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[KeyChain readForKey:self.mykey.text];
        NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
        NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
        self.myUser.text = userName;
        self.myPassword.text = password;
        NSLog(@"username = %@", userName);
        NSLog(@"password = %@", password);
    }else{
     [AlertController alertControllerWithController:self title:@"提示" message:@"请填入key值" cancelButtonTitle:@"确定" otherButtonTitle:nil cancelAction:nil otherAction:nil];
    }
    
  
    
}

- (IBAction)deleteAction:(id)sender {
    // C、将用户名和密码从keychain中删除
    if (self.mykey.text.length) {
        [KeyChain deleteWithService:self.mykey.text];
    }else{
       [AlertController alertControllerWithController:self title:@"提示" message:@"请填入key值" cancelButtonTitle:@"确定" otherButtonTitle:nil cancelAction:nil otherAction:nil];
    }
    
}

- (IBAction)writeSahreAction:(id)sender {
    
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:self.myUser.text forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:self.myPassword.text forKey:KEY_PASSWORD];
    
    // A、将用户名和密码写入keychain
    //    [KeyChain save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    
    if (self.mykey.text.length) {
        [KeyChain addShareKeyChainData:userNamePasswordKVPairs forKey:self.mykey.text];
    }else{
        [AlertController alertControllerWithController:self title:@"提示" message:@"请填入key值" cancelButtonTitle:@"确定" otherButtonTitle:nil cancelAction:nil otherAction:nil];
    }

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
