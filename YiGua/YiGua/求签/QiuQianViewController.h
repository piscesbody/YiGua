//
//  QiuQianViewController.h
//  YiGua
//
//  Created by 陈宁 on 2017/4/22.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QiuQianViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@property (weak, nonatomic) IBOutlet UIButton *qiuQian;
- (IBAction)qiuQianClick:(id)sender;
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieQian;

@end
