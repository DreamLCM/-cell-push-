//
//  ViewController.m
//  自定义cell上面的按钮的实现方式
//
//  Created by CM on 16/1/15.
//  Copyright © 2016年 CM. All rights reserved.
//

#import "ViewController.h"
#import "LcmTableViewCell.h"
#import "Vc2.h"
#import "Vc3.h"
#import "Vc4.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,CmCellDelegate>
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LcmTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 100;
   
    
/**
  1.这个类是一个通知中心，使用单例设计，每个应用程序都会有一个默认的通知中心。用于调度通知的发送的接受。
  2.此处的name与button传过来的消息名必须一致，否则不响应
  3.selector为当前视图执行方法
 
  addObserver:观察者，即在什么地方接收通知;
  selector:收到通知后调用何种方法，即回调函数;
  name:通知的名字，也是通知的唯一标示，编译器就通过这个找到通知的。
  发送通知:调用观察者处的方法。
  [[NSNotificationCenter defaultCenter] postNotificationName:@" postData "　object:searchFriendArray];
**/
    
    // 2.在vc里面添加一个通知，执行通知到来的方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CmCellBtnClick:) name:@"LcmCellBtnClick" object:nil];
    
}

#pragma mark    1.使用通知方式
-(void)CmCellBtnClick:(NSNotification *)notify{

    NSDictionary * dict = [notify userInfo];
    UIButton * button = dict[@"btn"];
    long i  = button.tag;
    NSLog(@"%ld",i);
    
    if (button.tag == 1) {
        Vc2 * vc2 = [[Vc2 alloc]init];
       
        [self.navigationController pushViewController:vc2 animated:YES];

    }else if (button.tag == 2){
    
        Vc3 * vc3 = [[Vc3 alloc]init];
        [self.navigationController pushViewController:vc3 animated:YES];
        
    }else if (button.tag == 3){
    
        Vc4 * vc4 = [[Vc4 alloc]init];
        [self.navigationController pushViewController:vc4 animated:YES];
        
    }
    
}

#pragma mark 2.使用代理方式








-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LcmTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    /**
     D4:千万不能忘记给代理赋值，不然它是一个空对象
     **/
//    cell.delegate = self;
    
    /**
     B3.在block中实现跳转
     **/
    cell.btnClickedBlock = ^(id sender){
    
        Vc2 * vc2 = [[Vc2 alloc]init];
        [self.navigationController pushViewController:vc2 animated:YES];
        NSLog(@"%ld",[sender tag]);
        
    };
    
    return cell;
    
}

/**
 D5:当前页面遵循代理的协议之后，即能执行代理里面的方法
 **/
-(void)btnClick:(id)sender{
  
    [sender tag];
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
