//
//  ViewController.m
//  histogram_demo
//
//  Created by xjc on 2020/3/26.
//  Copyright © 2020 xjc. All rights reserved.
//

#import "ViewController.h"
#import "FHXOrderChartCell.h"
#import "FHXTrendModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,FHXOrderChartCellDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * orderArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.orderArray = [NSMutableArray arrayWithCapacity:0];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];

    //创建数据
    [self creatData];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        FHXOrderChartCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FHXOrderChartCell"];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"FHXOrderChartCell" owner:self options:nil] lastObject];
        }
        cell.delegate = self;
        cell.columnarDataArray = self.orderArray;
        cell.unitLabel.text = @"单";
        [cell.titleButton setTitle:@"订单数" forState:UIControlStateNormal];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 376;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * bgView = [[UIView alloc]init];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    titleLabel.text = @"自定义直方图";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [bgView addSubview:titleLabel];
    bgView.backgroundColor = [UIColor clearColor];
    return bgView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01)];
    return bgView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


#pragma mark -- 创建数据
-(void)creatData{
    
    //模拟20条数据
    for (int i = 0; i < 20; i++) {
        
        FHXTrendModel * model = [[FHXTrendModel alloc]init];
        if (i < 9) {
            model.x = [NSString stringWithFormat:@"2020010%d",i + 1];
        }else{
            model.x = [NSString stringWithFormat:@"202001%d",i + 1];
        }
        
        model.y0 = [NSString stringWithFormat:@"%d",(arc4random() % 200) + 100];
        model.y1 = [NSString stringWithFormat:@"%d",(arc4random() % 200) + 100];
        
        [self.orderArray addObject:model];
    }
    [self.tableView reloadData];
}

@end
