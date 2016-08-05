//
//  LcmTableViewCell.h
//  自定义cell上面的按钮的实现方式
//
//  Created by CM on 16/1/15.
//  Copyright © 2016年 CM. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 D1.在 .h文件中 设置代理，添加代理方法
 **/
@protocol CmCellDelegate <NSObject>

-(void)btnClick:(id)sender;

@end


@interface LcmTableViewCell : UITableViewCell

/**
 D2.在.h文件中声明一个遵循代理的属性
 **/
@property (nonatomic,assign)id<CmCellDelegate>delegate;

- (IBAction)buttonAction:(id)sender;

/**
 B1:创建block的属性
 **/
@property (nonatomic,copy)void (^btnClickedBlock)(id sender);



@end
