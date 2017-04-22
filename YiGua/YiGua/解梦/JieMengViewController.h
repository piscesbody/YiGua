//
//  JieMengViewController.h
//  YiGua
//
//  Created by 陈宁 on 2017/4/22.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JieMengViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
- (IBAction)back:(id)sender;
- (IBAction)mengOther:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
