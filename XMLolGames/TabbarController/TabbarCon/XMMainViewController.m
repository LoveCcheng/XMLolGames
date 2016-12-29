//
//  XMMainViewController.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMainViewController.h"
#import "XMRegiViewController.h"
#import "XMHttpOperation.h"


@interface XMMainViewController ()
/** 用户名*/
@property (nonatomic,weak) UITextField *username;
/** 密码 */
@property (nonatomic,weak) UITextField *password;

@end

@implementation XMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavigation];
    [self setMainUI];
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:XMLoginSuccessNotification object:nil];
}

-(void)loginSuccess:(NSNotification *)noti{
    XMLog(@"%@",noti.object);
    NSString *code = noti.object[@"code"];
    if ([code isEqualToString:@"200"]) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"message:@"登录成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
        
        [self LeftitemClick];
    }
}

//设置导航栏
-(void)setNavigation{
    self.navigationItem.title = @"登录";
    //字体大小和颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]};
    //左边的按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(LeftitemClick)];
    //设置取消文字颜色和大小
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    //右边的按钮
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(RightitemClick)];
    //设置注册文字颜色和大小
    [itemRight setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.rightBarButtonItem=itemRight;
    
}
-(void)LeftitemClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)RightitemClick{
    XMRegiViewController *regiVC = [[XMRegiViewController alloc]init];
    [self.navigationController pushViewController:regiVC animated:YES];
}
/** 住界面UI */
-(void)setMainUI{
    UITextField *userText = [[UITextField alloc]initWithFrame:CGRectMake(100, 220, XMScreenW-200, 40)];
    userText.placeholder=@"请输入用户名";
    userText.backgroundColor= [UIColor grayColor];
    [self.view addSubview:userText];
    self.username = userText;
    
    
    UITextField *passText = [[UITextField alloc]initWithFrame:CGRectMake(100, 280, XMScreenW-200, 40)];
    passText.placeholder=@"请输入密码";
    passText.backgroundColor=[UIColor grayColor];
    [self.view addSubview:passText];
    self.password = passText;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(120, 340, XMScreenW-240, 40);
    button.backgroundColor=[UIColor redColor];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(LgoinButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
/** 点击事件 */
-(void)LgoinButtonClick{
//    XMLog(@"%@,%@",self.username.text,self.password.text);
    if (self.username.text.length==0||self.password.text.length==0) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"message:@"用户名和密码不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
    }

    [XMHttpOperation LoginWithUsername:self.username.text Password:self.password.text];    
}
















@end
