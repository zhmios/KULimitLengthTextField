//
//  KULimitLengthTextField.m
//  KOOUP_TEACHER
//
//  Created by zhm on 2018/1/24.
//  Copyright © 2018年 DFUB.COM. All rights reserved.
//

#import "KULimitLengthTextField.h"
#import "Masonry.h"


@implementation KULimitLengthTextField


- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self initTextField];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initTextField];
    }
    return self;
}


- (void)initTextField{
    
    self.textField = [[KUPasteTextField alloc]init];
    self.textField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidChangeTextField:) name:UITextFieldTextDidChangeNotification object:self.textField];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self);
        
    }];
    
}

- (void)setDisableTextFieldEditMenu:(BOOL)disableTextFieldEditMenu{
    
    _disableTextFieldEditMenu = disableTextFieldEditMenu;
   
    self.textField.disableTextFieldEditMenu = disableTextFieldEditMenu;
}

- (void)userDidChangeTextField:(NSNotification *)not{
   
    if (self.textField.text == nil) {
        
        return;
    }
      NSString *currentText = [NSString stringWithString:self.textField.text];
    if (self.isFilterWhiteSpace) {
        NSCharacterSet *whitespace =[NSCharacterSet  whitespaceAndNewlineCharacterSet];
         currentText =[currentText  stringByTrimmingCharactersInSet:whitespace];
    }
    
    if (self.filterSpecialCharacterString != nil) {
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:self.filterSpecialCharacterString];
        currentText =[currentText  stringByTrimmingCharactersInSet:set];
    }
    
    if (self.inputMaxLength != 0) {
        UITextRange *textRange = self.textField.markedTextRange;
        if (textRange ==  nil) {
          
            if (currentText.length > self.inputMaxLength) {
                self.textField.text = [currentText substringToIndex:self.inputMaxLength];
                [self.textField.undoManager removeAllActions];
            }else{
                self.textField.text = currentText;
            }

        }
    }
    
    if ([_delegate respondsToSelector:@selector(textFieldDidChangeText:)]) {
        [_delegate textFieldDidChangeText:self.textField.text];
    }

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([_delegate respondsToSelector:@selector(kuTextField:shouldChangeCharactersInRange:replacementString:)]) {
        BOOL appropriate = [_delegate kuTextField:textField shouldChangeCharactersInRange:range replacementString:string];
        return appropriate;
    }
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(kuTextFieldShouldReturn:)]) {
        return [self.delegate kuTextFieldShouldReturn:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if ([self.delegate respondsToSelector:@selector(kuTextFieldBeginEdit)]) {
        [self.delegate kuTextFieldBeginEdit];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(kuTextFieldEndEdit)]) {
        [self.delegate kuTextFieldEndEdit];
    }
    
}

#pragma mark ---设置---

- (void)setFount:(UIFont *)fount{
    _fount = fount;
    self.textField.font = fount;
    
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.textField.textColor = textColor;
}

- (void)setPlaceholderString:(NSString *)placeholderString{
    _placeholderString = placeholderString;
    self.textField.placeholder = placeholderString;
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self.textField setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
    
}


- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:self.textField];
    
}





@end
