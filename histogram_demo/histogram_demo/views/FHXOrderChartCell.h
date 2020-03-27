//
//  FHXOrderChartCell.h
//  FinancerApp
//
//  Created by xjc on 2019/2/20.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHXChartNoDataView.h"

@protocol FHXOrderChartCellDelegate <NSObject>
@optional
-(void)selectDataTypeAction;
@end

NS_ASSUME_NONNULL_BEGIN

@interface FHXOrderChartCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (weak, nonatomic) IBOutlet UIButton *titleButton;


@property (weak, nonatomic) IBOutlet UIView *bgView;
@property(nonatomic,weak)id<FHXOrderChartCellDelegate>delegate;

@property(nonatomic,strong)NSMutableArray * columnarDataArray;

@property(nonatomic,strong)FHXChartNoDataView * noDataView;
@end

NS_ASSUME_NONNULL_END
