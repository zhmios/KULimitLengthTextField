//
//  KULimitLengthTextField.h
//  KOOUP_TEACHER
//
//  Created by zhm on 2018/1/24.
//  Copyright © 2018年 DFUB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUPasteTextField.h"

@protocol kuLimitLengthTextFieldDelegate<NSObject>

@optional
-(void)textFieldDidChangeText:(NSString *)text;

- (BOOL)kuTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (BOOL)kuTextFieldShouldReturn:(UITextField *)textField;
- (void)kuTextFieldBeginEdit;
- (void)kuTextFieldEndEdit;
@end

@interface KULimitLengthTextField : UIView<UITextFieldDelegate>

@property(nonatomic,strong)KUPasteTextField *textField;
@property(nonatomic,strong)UIFont *fount;
@property(nonatomic,strong)UIColor *textColor;
@property(nonatomic,strong)NSString *placeholderString;
@property(nonatomic,strong)UIColor *placeholderColor;
@property(nonatomic,assign)NSInteger inputMaxLength;
@property(nonatomic,assign)BOOL isFilterWhiteSpace;
//e.g. @"@／：；（）￥「」＂、[]{}#%-*+=_\\|~＜＞$€^·'@#$%^&*()_+'""
@property(nonatomic,strong)NSString *filterSpecialCharacterString;

@property(nonatomic,weak)id<kuLimitLengthTextFieldDelegate>delegate;
/**
 禁用粘贴复制的menu
 */
@property(nonatomic,assign)BOOL disableTextFieldEditMenu;

@end
