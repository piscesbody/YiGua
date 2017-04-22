//
//  MainViewController.m
//  YiGua
//
//  Created by 陈宁 on 2017/4/22.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "MainViewController.h"
#import "HuiYouViewController.h"
#import "JieMengViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView1.image = [UIImage imageNamed:@"fo"];
    [self.view addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView2.image = [UIImage imageNamed:@"baguantu.jpg"];
    [self.view addSubview:imageView2];
    
    [UIView animateWithDuration:2 animations:^{
        imageView2.alpha = 0;
    } completion:^(BOOL finished) {
        [imageView2 removeFromSuperview];
        [imageView1 removeFromSuperview];
        [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
    }];
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

- (IBAction)btnClick:(UIButton *)sender {
    switch (sender.tag) {
            
        case 5:
            [self.navigationController pushViewController:[[JieMengViewController alloc]init] animated:YES];
//            NSLog(@"%ld",sender.tag);
            break;
            
        case 6:
            [self.navigationController pushViewController:[[HuiYouViewController alloc]init] animated:YES];
            break;
        
        default:
            break;
    }
    
}
@end
