//
//  FHXCollectionReusableView.h
//  FinancerApp
//
//  Created by xjc on 2019/2/21.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FHXCollectionReusableView : UICollectionReusableView

@property(nonatomic,assign)NSInteger maxData;//最大值


@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthLabel;
@property (weak, nonatomic) IBOutlet UILabel *fifthLabel;
@property (weak, nonatomic) IBOutlet UILabel *sixLabel;
@property (weak, nonatomic) IBOutlet UILabel *sevenLabel;
@property (weak, nonatomic) IBOutlet UILabel *eighthLabel;

@end

NS_ASSUME_NONNULL_END
