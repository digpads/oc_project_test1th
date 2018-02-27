//
//  discoverViewController.m
//  myproject
//
//  Created by 何明礼 on 2018/2/17.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "discoverViewController.h"
#import "AFNetworking.h"

#import "Masonry.h"

@interface discoverViewController ()
@property (nonatomic,strong) UIButton *txtbtn;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,copy) NSString *textcont;

@end

@implementation discoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    
    UISwitch *switchView = [[UISwitch alloc] init ];
    [self.view addSubview:switchView];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(10);
    }];
    [switchView addTarget:self action:@selector(cmdSwitchChangeMethod:) forControlEvents:UIControlEventValueChanged];
    
    _txtbtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, 120, 50)];
    [_txtbtn setTitle:@"click" forState:UIControlStateNormal];
    [_txtbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:_txtbtn];
    [_txtbtn addTarget:self action:@selector(getcont:) forControlEvents:UIControlEventTouchUpInside];
    
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    _textLabel.layer.borderWidth = 1;
    _textLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textLabel.layer.cornerRadius = 3;
    _textLabel.text = _textcont;
    _textLabel.textColor = [UIColor grayColor];
    [self.view addSubview:_textLabel];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(170, 100, 100, 25)];
    _textField.placeholder = @"请输入";
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.font = [UIFont fontWithName:@"Bodoni 72" size:12];
    _textField.textColor = [UIColor grayColor];
    _textField.layer.cornerRadius = 5;
    _textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textField.layer.borderWidth = 1;
    [self.view addSubview:_textField];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 170, 200, 100)];
    textView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:textView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if([UIApplication sharedApplication].statusBarStyle!=0){
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    NSLog(@"discover状态栏：%d",[UIApplication sharedApplication].statusBarStyle);
}

- (void)cmdSwitchChangeMethod:(UISwitch *)sender {
    if (sender.isOn) {
        NSLog(@"on");
    } else {
        NSLog(@"off");
    }
}

#pragma mark - click点击打印
- (void)getcont:(id)sender{
    _textcont = _textField.text;
    _textLabel.text = _textcont;
    NSLog(@"点击获取内容get:%@",_textcont);
    [_textField resignFirstResponder];
}

- (void)textFieldTextDidChange:(NSNotification *)sender {
    UITextField *textField = sender.object;
    NSLog(@"textField: %@", textField.text);
}

- (void)textViewTextDidChange:(NSNotification *)sender {
    UITextView *textView = sender.object;
    NSLog(@"textView: %@", textView.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
