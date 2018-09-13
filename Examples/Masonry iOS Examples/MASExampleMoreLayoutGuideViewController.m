//
//  MASExampleMoreLayoutGuideViewController.m
//  Masonry iOS Examples
//
//  Created by liupeng on 2018/9/9.
//  Copyright © 2018年 Jonas Budelmann. All rights reserved.
//

#import "MASExampleMoreLayoutGuideViewController.h"

@interface MASExampleMoreLayoutGuideViewController ()

@end

@implementation MASExampleMoreLayoutGuideViewController

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.title = @"More Layout Guide";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = UIView.new;
    topView.backgroundColor = UIColor.greenColor;
    topView.layer.borderColor = UIColor.blackColor.CGColor;
    topView.layer.borderWidth = 2;
    [self.view addSubview:topView];
    
    
    UIView *bottomView = UIView.new;
    bottomView.backgroundColor = UIColor.redColor;
    bottomView.layer.borderColor = UIColor.blackColor.CGColor;
    bottomView.layer.borderWidth = 2;
    [self.view addSubview:bottomView];
    
    UILayoutGuide *layoutGuide1 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:layoutGuide1];
    UILayoutGuide *layoutGuide2 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:layoutGuide2];
    UILayoutGuide *layoutGuide3 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:layoutGuide3];

    [layoutGuide1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@5);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.centerX.equalTo(self.view);
    }];

    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(layoutGuide1.mas_bottom);
        make.width.and.height.equalTo(@100);
        make.centerX.equalTo(layoutGuide1);
    }];

    [layoutGuide2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(layoutGuide1);
        make.top.equalTo(topView.mas_bottom);
        make.centerX.equalTo(layoutGuide1);
    }];

    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@200);
        make.centerX.equalTo(topView);
        make.top.equalTo(layoutGuide2.mas_bottom);
    }];

    [layoutGuide3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(layoutGuide1).multipliedBy(2.0);
        make.top.equalTo(bottomView.mas_bottom);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.centerX.equalTo(layoutGuide1);
    }];
}


@end
