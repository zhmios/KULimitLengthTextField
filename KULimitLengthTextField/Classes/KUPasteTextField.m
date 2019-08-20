//
//  KUPasteTextField.m
//  KULimitLengthTextField
//
//  Created by zhm on 2019/8/20.
//

#import "KUPasteTextField.h"

@implementation KUPasteTextField

//建议整体禁用（复制、粘贴、全选等都被禁用了）
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = self.disableTextFieldEditMenu;
    }
    return self.disableTextFieldEditMenu;
}




@end
