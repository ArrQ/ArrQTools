//
//  showSearchViewController.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/16.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "showSearchViewController.h"
#define UIScreenHeight  [[UIScreen mainScreen]bounds].size.height
#define UIScreenWidth   [[UIScreen mainScreen]bounds].size.width
#define isIOS(a) [[[UIDevice currentDevice]systemVersion] floatValue] == a
#define aboveIOS(a) [[[UIDevice currentDevice]systemVersion] floatValue] >= a
#import "UIImage+Category.h"


#import "showSearchMoreViewController.h"

#import "UISearchBar+FMAdd.h"


@interface showSearchViewController ()<UISearchBarDelegate,UITextFieldDelegate>

// 搜索UISearchBar
@property(nonatomic,strong)UISearchBar *firstSearchBar;

@property(nonatomic,strong)UISearchBar *secondSearchBar;

@property(nonatomic,strong)UISearchBar *thirdSearchBar;

@property(nonatomic,strong)UISearchBar *forthSearchBar;

@property(nonatomic,strong)UISearchBar *fifthSearchBar;


@end

@implementation showSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过画色来修改UISearchBar的背景色
    [self setUpFistSearchBar];
    
    // 通过添加背景图片来修改UISearchBar的背景色
    [self setUpSecondSearchBar];
    
    // 设置圆角和边框颜色
    [self setUpThirdSearchBar];
    
    // 设置按钮（取消按钮）的文字和文字颜色
    [self setUpForthSearchBar];
    
    // 如何设置搜索图标
    [self setUpFifthSearchBar];
    
    
    
    [self customUI];
    
    
    
}


# pragma mark --- 获取 UI

- (void)customUI{
    
    
    UIButton *button_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    button_btn.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT-200, 44, 44);
    [button_btn setTitle:@"加入" forState:UIControlStateNormal];
    button_btn.titleLabel.font = [UIFont systemFontOfSize:14];
    button_btn.layer.masksToBounds = YES;
    button_btn.layer.cornerRadius = 5;
    
    button_btn.layer.borderWidth = 1.f;
    button_btn.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_btn setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    button_btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button_btn];
    
    [button_btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

- (void)clickBtn:(UIButton *)sender{
    
    showSearchMoreViewController *showVC = [[showSearchMoreViewController alloc]init];

    [self.navigationController pushViewController:showVC animated:YES];
    
    
    
}


// 通过画色来修改UISearchBar的背景色
- (void)setUpFistSearchBar {
    
    self.firstSearchBar = [[UISearchBar alloc] init];
    self.firstSearchBar.frame = CGRectMake(0, 50, UIScreenWidth, 44);
    self.firstSearchBar.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.firstSearchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor] size:self.firstSearchBar.bounds.size];
    self.firstSearchBar.delegate = self;
    self.firstSearchBar.placeholder = @"请输入搜索的内容";
    [self.view addSubview:self.firstSearchBar];
    
    
    UITextField *searchField = [self.firstSearchBar valueForKey:@"searchField"];

   
    UIButton *buttonyuyin = [UIButton buttonWithType:UIButtonTypeCustom];
  
    [buttonyuyin setImage:[UIImage imageNamed:@"Voice_button_icon"] forState:UIControlStateNormal];

    [searchField addSubview:buttonyuyin];
    
    [buttonyuyin mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(searchField.mas_right).offset(-15);
        make.centerY.equalTo(searchField.mas_centerY);
        
    }];
    
    
    

    
    
}

// 通过添加背景图片来修改UISearchBar的背景色
- (void)setUpSecondSearchBar {
    
    self.secondSearchBar = [[UISearchBar alloc] init];
    self.secondSearchBar.frame = CGRectMake(0, 120, UIScreenWidth, 44);
    self.secondSearchBar.delegate = self;
    self.secondSearchBar.placeholder = @"请输入搜索的内容";
    self.secondSearchBar.backgroundImage = [UIImage imageNamed:@"nav_bar_ios7"];
    [self.view addSubview:self.secondSearchBar];
    
    
    UITextField *searchField = [self.secondSearchBar valueForKey:@"searchField"];
    
    if (searchField) {
        
        [searchField setBackgroundColor:[UIColor whiteColor]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
    }
    
    
    if (@available(iOS 11.0, *)) {
        
        [self.secondSearchBar setPositionAdjustment:UIOffsetMake(searchField.frame.size.width/4, 0) forSearchBarIcon:UISearchBarIconSearch];
        
    }
    
    
    
  
    
}

// 设置圆角和边框颜色
- (void)setUpThirdSearchBar {
    
    self.thirdSearchBar = [[UISearchBar alloc] init];
    self.thirdSearchBar.frame = CGRectMake(0, 190, UIScreenWidth, 44);
    self.thirdSearchBar.backgroundImage = [[UIImage alloc] init];
    self.thirdSearchBar.delegate = self;
    self.thirdSearchBar.placeholder = @"请输入搜索的内容";
    [self.view addSubview:self.thirdSearchBar];
    
    
    UITextField *searchField = [self.thirdSearchBar valueForKey:@"searchField"];
    
    if (searchField) {
        
        [searchField setBackgroundColor:[UIColor whiteColor]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
    }
    
}

// 设置按钮（取消按钮）的文字和文字颜色
- (void)setUpForthSearchBar {
    
    self.forthSearchBar = [[UISearchBar alloc] init];
    self.forthSearchBar.frame = CGRectMake(0, 260, UIScreenWidth, 44);
    self.forthSearchBar.backgroundImage = [[UIImage alloc] init];
    self.forthSearchBar.delegate = self;
    self.forthSearchBar.placeholder = @"请输入搜索的内容";
    [self getCancelButtonTitle:@"取消" andFont:[UIFont systemFontOfSize:14]];

    
    self.forthSearchBar.tintColor = [UIColor colorWithRed:86/255.0 green:179/255.0 blue:11/255.0 alpha:1];
    
    
    
    [self.view addSubview:self.forthSearchBar];
    
    
    UITextField *searchField = [self.forthSearchBar valueForKey:@"searchField"];
    
    if (searchField) {
        //修正光标颜色
        [searchField setTintColor:[UIColor redColor]];
        [searchField setBackgroundColor:[UIColor whiteColor]];
        
        searchField.layer.masksToBounds = YES;
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        
        
    }
    
    
    
    
    
    
}


# pragma mark --- 设置 searchBar 取消 标题
- (void)getCancelButtonTitle:(NSString *)title andFont:(UIFont *)font{
    
    NSDictionary *textAttr = @{NSFontAttributeName : font};
   
    if (@available(iOS 9.0, *)) {
    
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:title];
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:textAttr forState:UIControlStateNormal];

    }else{
        
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:title];
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:textAttr forState:UIControlStateNormal];

    }

    
   
}


// 如何设置搜索图标
- (void)setUpFifthSearchBar {
    
    self.fifthSearchBar = [[UISearchBar alloc] init];
    self.fifthSearchBar.frame = CGRectMake(0, 330, UIScreenWidth, 44);
    self.fifthSearchBar.backgroundImage = [[UIImage alloc] init];
    self.fifthSearchBar.delegate = self;
    self.fifthSearchBar.placeholder = @"请输入搜索的内容";
    
    [self.fifthSearchBar setImage:[UIImage imageNamed:@"share"]
                 forSearchBarIcon:UISearchBarIconSearch
                            state:UIControlStateNormal];
    
    [self.view addSubview:self.fifthSearchBar];
    
    
    UITextField *searchField = [self.fifthSearchBar valueForKey:@"searchField"];
    
    if (searchField) {
        
        [searchField setBackgroundColor:[UIColor whiteColor]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
        
    }
    
    
    
    
    
}

#pragma mark -UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"111111");
    
    if (self.forthSearchBar == searchBar) {
        
        searchBar.showsCancelButton = YES;
        
    }
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"111111");
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
        NSLog(@"textDidChange");
    
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    if (self.forthSearchBar == searchBar) {
        
        searchBar.showsCancelButton = NO;
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [self.forthSearchBar resignFirstResponder];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    [self.firstSearchBar resignFirstResponder];
    
    [self.secondSearchBar resignFirstResponder];
    
    [self.thirdSearchBar  resignFirstResponder];
    
    [self.forthSearchBar resignFirstResponder];
    
    [self.fifthSearchBar resignFirstResponder];
    
}

// 结束编辑的时候设置为居中
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    
    // 继续传递代理方法
    if ([self.secondSearchBar.delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]) {
        [self.secondSearchBar.delegate searchBarShouldBeginEditing:self.secondSearchBar];
    }
    
    
    if (@available(iOS 11.0, *)) {
        [self.secondSearchBar setPositionAdjustment:UIOffsetMake(textField.frame.size.width/4, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
    
    return YES;
}





@end
