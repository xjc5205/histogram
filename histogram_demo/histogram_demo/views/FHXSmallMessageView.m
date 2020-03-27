//
//  FHXSmallMessageView.m
//  FinancerApp
//
//  Created by xjc on 2019/3/13.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import "FHXSmallMessageView.h"

@implementation FHXSmallMessageView

-(void)setType:(NSUInteger)type{
    
    _type = type;
    if (type == 0) {
        
        self.distanceToTop.constant = 23;
        [self.bgImgView setImage:[UIImage imageNamed:@"icon_message_small_bottom"]];
    }
    
    if (type == 1) {
        
        self.distanceToTop.constant = 15;
        [self.bgImgView setImage:[UIImage imageNamed:@"icon_message_small_top"]];
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
