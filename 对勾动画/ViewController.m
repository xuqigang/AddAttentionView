//
//  ViewController.m
//  对勾动画
//
//  Created by Hanxiaojie on 2017/12/20.
//  Copyright © 2017年 凤凰新媒体. All rights reserved.
//

#import "ViewController.h"
#import "ISVAddAttentionView.h"

@interface ViewController ()<ISVAddAttentionViewDelegate>
@property (strong, nonatomic) ISVAddAttentionView *addView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.addView];
}

- (ISVAddAttentionView*)addView{
    if (!_addView) {
        _addView = [[ISVAddAttentionView alloc] initWithFrame:CGRectMake(100, 200, 20, 20)];
        _addView.delegate = self;
    }
    return _addView;
}
#pragma mark - ISVAddAttentionViewDelegate

- (void)addAttentionViewDidClicked:(ISVAddAttentionView*)addAttentionView
{
//    [addAttentionView resetAnimitaion];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.addView resetAnimitaion];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
