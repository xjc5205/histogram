//
//  FHXOrderCollectionCell.m
//  FinancerApp
//
//  Created by xjc on 2019/2/21.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import "FHXOrderCollectionCell.h"
#import "Helper.h"
#import "Masonry.h"

#define kwidth 25.0f
#define kheight 194



@implementation FHXOrderCollectionCell{
    
    
    UIButton * oldUserBtn;
    UIButton * newUserBtn;
}

-(void)setMaxValue:(NSInteger)maxValue{
    
    _maxValue = maxValue;
}

-(void)setTrendModel:(FHXTrendModel *)trendModel{
    
    _trendModel = trendModel;
    //计算老用户占比
    CGFloat originY0 = [_trendModel.y0 floatValue];
    CGFloat maxMun = (CGFloat)(_maxValue);
    CGFloat positionY0 = kheight*(1 - originY0/maxMun);
    oldUserBtn.frame = CGRectMake((55-kwidth)/2.0, positionY0 + 6, kwidth, kheight*originY0/maxMun);
    
    //计算新用户占比
    CGFloat originY1 = [_trendModel.y1 floatValue];
    CGFloat positionY1 = positionY0 - (originY1/maxMun)*kheight;
    newUserBtn.frame = CGRectMake((55-kwidth)/2.0, positionY1 + 6, kwidth, kheight*originY1/maxMun);
    
    //button上半部分圆角
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:newUserBtn.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = newUserBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    newUserBtn.layer.mask = maskLayer;
    
    //显示view的位置
    self.messageView.firstLabel.text = [Helper notRounding:_trendModel.y1 afterPoint:2];
    self.messageView.secondLabel.text = [Helper notRounding:_trendModel.y0 afterPoint:2];
    
    //根据y0+y1的值判断显示view位置
    CGFloat currentY = _trendModel.y0.floatValue + _trendModel.y1.floatValue;
    if (currentY > _maxValue*(5/7.0)) {
        self.messageView.type = 0;
        [self.messageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(newUserBtn.mas_top).offset(65);
            make.centerX.equalTo(newUserBtn);
            make.width.equalTo(@60.0f);
            make.height.equalTo(@60.0f);
        }];
    }else{
        self.messageView.type = 1;
        [self.messageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(newUserBtn.mas_top).offset(-5);
            make.centerX.equalTo(newUserBtn);
            make.width.equalTo(@60.0f);
            make.height.equalTo(@60.0f);
        }];
    }
    
    self.firstLineView.backgroundColor = HXRGB(226, 235, 242);
    self.secondLineView.backgroundColor = HXRGB(226, 235, 242);
    self.thirdLineView.backgroundColor = HXRGB(226, 235, 242);
    self.fourthLineView.backgroundColor = HXRGB(226, 235, 242);
    self.fifthLineView.backgroundColor = HXRGB(226, 235, 242);
    self.sixLineView.backgroundColor = HXRGB(226, 235, 242);
    self.sevenLineView.backgroundColor = HXRGB(226, 235, 242);
    self.eightLineView.backgroundColor = HXRGB(226, 235, 242);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 40);
    transform = CGAffineTransformTranslate(transform, 0, -3.5);
    self.dateLabel.layer.affineTransform = transform;
    
    //老用户
    oldUserBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [oldUserBtn setBackgroundColor:HXRGB(65, 109, 251)];
    oldUserBtn.userInteractionEnabled = NO;
    
    [self.contentView addSubview:oldUserBtn];
    [oldUserBtn addTarget:self action:@selector(clickOldBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    
    //新用户
    newUserBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    newUserBtn.backgroundColor = HXRGB(255, 206, 102);
    newUserBtn.userInteractionEnabled = NO;
    [self.contentView addSubview:newUserBtn];
    [newUserBtn addTarget:self action:@selector(clickNewBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //点击展示数据
    self.messageView =  [[NSBundle mainBundle]loadNibNamed:@"FHXSmallMessageView" owner:self options:nil][0];
    self.messageView.backgroundColor = [UIColor clearColor];
    self.messageView.frame = CGRectMake(0, 0, 100, 60);
    self.messageView.hidden = YES;
    [self.contentView addSubview:self.messageView];
    
    // Initialization code
}

-(void)clickOldBtnAction:(id)sender{
    
    if ([self.delegate respondsToSelector:@selector(selectOldOrderAction:)]) {
        
        [self.delegate selectOldOrderAction:sender];
    }
}

-(void)clickNewBtnAction:(id)sender{
    
    if ([self.delegate respondsToSelector:@selector(selectNewOrderAction:)]) {
        
        [self.delegate selectNewOrderAction:sender];
    }
    
}
-(void)layoutSubviews{

    [super layoutSubviews];

}

@end
