//
//  XMRegiViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/23.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMRegiViewController.h"
#import "XMHttpOperation.h"

@interface XMRegiViewController ()

@property (weak, nonatomic) IBOutlet UITextField *Username;

@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation XMRegiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"注册";
    self.navigationController.navigationBar.titleTextAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)RegisterClick:(UIButton *)sender {
    if (self.Username.text.length!=0 && self.password.text.length != 0) {
        XMLog(@"--用户名%@,--密码%@",self.Username.text,self.password.text);
        
        [XMHttpOperation RegisterWithUsername:self.Username.text Password:self.password.text];
    }else{
        XMLog(@" --- 请输入用户名或密码");
    }
}








@end
