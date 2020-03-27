//
//  FHXOrderCollectionCell.h
//  FinancerApp
//
//  Created by xjc on 2019/2/21.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHXTrendModel.h"
#import "FHXSmallMessageView.h"

@protocol FHXOrderCollectionCellDelegate <NSObject>
@optional
-(void)selectOldOrderAction:(UIButton *)btn;
-(void)selectNewOrderAction:(UIButton *)btn;
@end

NS_ASSUME_NONNULL_BEGIN

@interface FHXOrderCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *firstLineView;
@property (weak, nonatomic) IBOutlet UIImageView *secondLineView;
@property (weak, nonatomic) IBOutlet UIImageView *thirdLineView;
@property (weak, nonatomic) IBOutlet UIImageView *fourthLineView;
@property (weak, nonatomic) IBOutlet UIImageView *fifthLineView;
@property (weak, nonatomic) IBOutlet UIImageView *sixLineView;
@property (weak, nonatomic) IBOutlet UIImageView *sevenLineView;
@property (weak, nonatomic) IBOutlet UIImageView *eightLineView;


@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property(nonatomic,strong)FHXTrendModel * trendModel;

@property(nonatomic,assign)NSInteger maxValue;

@property(nonatomic,weak)id<FHXOrderCollectionCellDelegate>delegate;

//点击展示数据
@property(nonatomic,strong)UIButton * showOldBtn;
@property(nonatomic,strong)UIButton * showNewBtn;

@property(nonatomic,strong)FHXSmallMessageView * messageView;
@end

NS_ASSUME_NONNULL_END
