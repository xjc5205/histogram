//
//  FHXCollectionReusableView.m
//  FinancerApp
//
//  Created by xjc on 2019/2/21.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import "FHXCollectionReusableView.h"

@implementation FHXCollectionReusableView{
    
    NSInteger currentMax;//整除化处理过的最大值
    NSMutableArray * labelArray;
}

-(void)setMaxData:(NSInteger)maxData{
    
    _maxData = maxData;
    currentMax = _maxData;
    //纵坐标间隔
    NSInteger interDiscount = currentMax/7.0f;
    for (int i = 0; i<labelArray.count; i++) {
        UILabel * label = labelArray[i];
        label.text = [NSString stringWithFormat:@"%ld",i * interDiscount];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    labelArray = [NSMutableArray arrayWithCapacity:0];
    [labelArray addObject:self.firstLabel];
    [labelArray addObject:self.secondLabel];
    [labelArray addObject:self.thirdLabel];
    [labelArray addObject:self.fourthLabel];
    [labelArray addObject:self.fifthLabel];
    [labelArray addObject:self.sixLabel];
    [labelArray addObject:self.sevenLabel];
    [labelArray addObject:self.eighthLabel];
    
    // Initialization code
}

@end
