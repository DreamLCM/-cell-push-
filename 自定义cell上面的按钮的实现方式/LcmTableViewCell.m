//
//  LcmTableViewCell.m
//  自定义cell上面的按钮的实现方式
//
//  Created by CM on 16/1/15.
//  Copyright © 2016年 CM. All rights reserved.
//

#import "LcmTableViewCell.h"

@implementation LcmTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/**
 T1.在按钮的点击实现方法中发送消息给通知中心（通知中心，使用单例设计，每个应用程序都会有一个默认的通知中心，所以即使是其他页面也能接收得到）
 */
- (IBAction)buttonAction:(id)sender {
    
    // 1.在按钮点击的方法中发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LcmCellBtnClick" object:nil userInfo:@{@"btn":sender}];
   
    /**
     D3:在按钮的点击事件中使用代理执行方法
     **/
//    [self.delegate btnClick:sender];
    
    /**
     B2:在button点击方法中创建block,传button对象过去
     **/
    
    if (self.btnClickedBlock != nil) {
        self.btnClickedBlock(sender);
    }
    
    
    
    
}
@end
