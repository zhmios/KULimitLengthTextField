//
//  HMViewController.m
//  KULimitLengthTextField
//
//  Created by zhmios on 08/09/2019.
//  Copyright (c) 2019 zhmios. All rights reserved.
//

#import "HMViewController.h"
#import "KULimitLengthTextField.h"

@interface HMViewController ()
@property (weak, nonatomic) IBOutlet KULimitLengthTextField *textField;

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textField.inputMaxLength = 10;
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
