//
//  QiuQianViewController.m
//  YiGua
//
//  Created by 陈宁 on 2017/4/22.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "QiuQianViewController.h"
#import "JieQianViewController.h"

@interface QiuQianViewController ()
{
    NSMutableArray *_smallQianArray;
    NSTimer *_timer;
}

@end

@implementation QiuQianViewController

-(void)viewWillAppear:(BOOL)animated
{
    _contentLabel.hidden = NO;
    _qiuQian.hidden = NO;
    _jieQian.hidden = YES;
    for (UIImageView *qian in _smallQianArray) {
        qian.hidden = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _jieQian.hidden = YES;
    
    _smallQianArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i <12 ; i++) {
        UIImageView *qian = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"qiuqian0"]];
        qian.center = CGPointMake(160+120*cos(i*30*M_PI/180), 200-50*sin(i*30*M_PI/180));
        qian.bounds = CGRectMake(0, 0, 20, 30);
        [self.view addSubview:qian];
        [_smallQianArray addObject:qian];
        qian.hidden = YES;
        
        if (qian.center.y <280) {
            [self.view sendSubviewToBack:qian];
            [self.view sendSubviewToBack:_backGroundImage];
        }else{
            [self.view bringSubviewToFront:qian];
        }
    }
    
    for (int i = 1;i<=6 ; i++) {
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:i];
        imageView.animationDuration = 0.5;
        imageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"qiuqian0"],[UIImage imageNamed:@"qiuqian1"],[UIImage imageNamed:@"qiuqian2"], nil];
        if (i==6) {
            imageView.animationRepeatCount = 4;
        }
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

- (IBAction)qiuQianClick:(id)sender {
    _contentLabel.hidden = YES;
    _qiuQian.hidden = YES;
    UIImageView *bigQian = (UIImageView *)[self.view viewWithTag:6];
    [bigQian startAnimating];
    [self performSelector:@selector(xianshi) withObject:nil afterDelay:2];
}
-(void)xianshi
{
    for (UIImageView *qian in _smallQianArray) {
        qian.hidden = NO;
    }
    _jieQian.hidden = NO;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(move) userInfo:nil repeats:YES];
}
-(void)move
{
    static int angle = 0;
    angle++;
    for (int i = 0; i<12; i++) {
        UIImageView *qian = _smallQianArray[i];
        qian.center = CGPointMake(160+120*cos(angle*M_PI/180), 200-50*sin(angle*M_PI/180));
        angle+=30;
        if (qian.center.y<200) {
            [self.view sendSubviewToBack:qian];
            [self.view sendSubviewToBack:_backGroundImage];
        }else{
            [self.view bringSubviewToFront:qian];
        }
    }
    
    static int count = 0;
    count++;
    
    if (count == 300) {
        count = 0;
    }
    switch (count/100) {
        case 0:
            _jieQian.text = @"解签中....";
            break;
        case 1:
            _jieQian.text = @"解签中....";
            break;
        case 2:
            _jieQian.text = @"解签中....";
            break;
        default:
            break;
    }
    
    static int a = 0;
    a++;
    switch (a) {
        case 100:
        {
            UIImageView *smallqian = (UIImageView *)[self.view viewWithTag:1];
            [smallqian startAnimating];
        }
            break;
        case 200:
        {
            UIImageView *smallqian = (UIImageView *)[self.view viewWithTag:2];
            [smallqian startAnimating];
        }
            break;
        case 300:
        {
            UIImageView *smallqian = (UIImageView *)[self.view viewWithTag:3];
            [smallqian startAnimating];
        }
            break;
        case 400:
        {
            UIImageView *smallqian = (UIImageView *)[self.view viewWithTag:4];
            [smallqian startAnimating];
        }
            break;
        case 500:
        {
            UIImageView *smallqian = (UIImageView *)[self.view viewWithTag:5];
            [smallqian startAnimating];
        }
            break;
        case 600:
        {
            [_timer invalidate];
            _timer = nil;
            for (int i = 1; i<6; i++) {
                UIImageView *smallqian = (UIImageView *)[self.view viewWithTag:i];
                [smallqian stopAnimating];
            }
            [self.navigationController pushViewController:[[JieQianViewController alloc]init] animated:YES];
            a=0;
        }
            break;
        default:
            break;
    }
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
