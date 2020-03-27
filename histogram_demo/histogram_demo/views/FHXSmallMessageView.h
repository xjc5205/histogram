//
//  FHXSmallMessageView.h
//  FinancerApp
//
//  Created by xjc on 2019/3/13.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FHXSmallMessageView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distanceToTop;

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;

@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@property(nonatomic,assign)NSUInteger type;//0:在底部 1:在顶部
@end

NS_ASSUME_NONNULL_END
