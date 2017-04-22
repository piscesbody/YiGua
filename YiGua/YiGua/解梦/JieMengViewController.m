//
//  JieMengViewController.m
//  YiGua
//
//  Created by 陈宁 on 2017/4/22.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "JieMengViewController.h"

@interface JieMengViewController ()
{
    NSArray *_kindArray;
    NSArray *_bigArray;
    NSTimer *_timer;
}

@end

@implementation JieMengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _scrollView.contentSize = CGSizeMake(720, 60);

    for (int i = 0; i <12 ; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*60, 0, 60, 60)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sx%d",i]];
        [_scrollView addSubview:imageView];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(move) userInfo:nil repeats:YES];
    _textField.userInteractionEnabled = NO;
    _textField.text = @"海贼王:路飞";
    
    _kindArray = @[@"海贼王",@"火影忍者",@"黑子的篮球",@"网球王子"];
    NSArray *hzw=@[@"路飞",@"索隆",@"乔巴",@"娜美",@"罗宾"];
    NSArray *hyrz=@[@"鸣人",@"佐助",@"小樱",@"雏田"];
    NSArray *hzdlq=@[@"黑子",@"火神",@"青辉",@"赤司"];
    NSArray *wqwz=@[@"越前龙马",@"不二周助",@"国光"];
    _bigArray = @[hzw,hyrz,hzdlq,wqwz];
    
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 220, 414, 120)];
    picker.backgroundColor = [UIColor whiteColor];
    picker.alpha = 0.8;
    picker.tag = 20;
    [self.view addSubview:picker];
    picker.delegate = self;
    picker.dataSource = self;
}

-(void)move
{
    static int a = 0;
    if (_scrollView.contentOffset.x <= 0) {
        a = 10;
    }
    if (_scrollView.contentOffset.x >= 306) {
        a = -10;
    }
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x+a, 0) animated:YES];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _kindArray.count;
    }else{
        int long index = [pickerView selectedRowInComponent:0];
        NSArray *array = _bigArray[index];
        return array.count;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        
        NSString *str1 = _kindArray[row];
        NSArray *array = _bigArray[row];
        NSString *str2 = array[0];
        NSString *str3 = [NSString stringWithFormat:@"%@,%@",str1,str2];
        _textField.text = str3;
    }else{
        int long index = [pickerView selectedRowInComponent:0];
        NSString *str1 = _kindArray[index];
        NSArray *array = _bigArray[index];
        NSString *str2 = array[row];
        NSString *str3 = [NSString stringWithFormat:@"%@,%@",str1,str2];
        _textField.text = str3;
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return _kindArray[row];
    }else{
        int long index = [pickerView selectedRowInComponent:0];
        NSArray *array = _bigArray[index];
        return array[row];
    }
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

- (IBAction)back:(id)sender {
    [_timer invalidate];
    _timer = nil;
    _textField.userInteractionEnabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_textField endEditing:YES];
    UIPickerView *picker = (UIPickerView *)[self.view viewWithTag:20];
    picker.hidden = NO;
    _textField.userInteractionEnabled = NO;
}

- (IBAction)mengOther:(id)sender {
    _textField.text = nil;
    _textField.userInteractionEnabled = YES;
    [_textField becomeFirstResponder];
    UIPickerView *picker = (UIPickerView *)[self.view viewWithTag:20];
    picker.hidden = YES;
    
}
@end
