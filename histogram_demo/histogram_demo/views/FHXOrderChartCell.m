//
//  FHXOrderChartCell.m
//  FinancerApp
//
//  Created by xjc on 2019/2/20.
//  Copyright © 2019年 xjc. All rights reserved.
//

#import "FHXOrderChartCell.h"
#import "FHXOrderCollectionCell.h"
#import "Masonry.h"
#import "FHXTrendModel.h"
#import "FHXCollectionReusableView.h"

@implementation FHXOrderChartCell{
    
    UICollectionView * hxCollectionView;
    NSMutableArray * arrayX;//横坐标
    NSMutableArray * arrayY0;//纵坐标
    NSMutableArray * arrayY1;//纵坐标
    NSMutableArray * resultArray;//y0+y1
    NSInteger maxValue;//y0+y1最大值
    NSIndexPath * selIndex;//记录当前选中cell
}

-(void)setColumnarDataArray:(NSMutableArray *)columnarDataArray{
    
    //暂无数据处理
    if (columnarDataArray.count == 0) {
        self.noDataView.hidden = NO;
        return;
    }else{
        self.noDataView.hidden = YES;
    }
    
    //分离数据
    _columnarDataArray = columnarDataArray;
    for (FHXTrendModel * model in _columnarDataArray) {
        
        [arrayX addObject:model.x];
        [arrayY0 addObject:model.y0];
        [arrayY1 addObject:model.y1];
        CGFloat result = ([model.y0 floatValue] + [model.y1 floatValue]);
        [resultArray addObject:[NSString stringWithFormat:@"%.2f",result]];
    }
    //取出y0+y1的最大值
    CGFloat maxMun = [[resultArray valueForKeyPath:@"@max.floatValue"] floatValue];
    if (maxMun == 0) {
        self.noDataView.hidden = NO;
        return;
    }else{
        self.noDataView.hidden = YES;
    }
    maxValue = (NSInteger)(maxMun) + 1;
    //对7取余数
    int remainder = maxValue%7;
    //确保maxValue能被7整除
    maxValue = maxValue + (7 - remainder);
    [hxCollectionView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
   
    arrayX = [NSMutableArray arrayWithCapacity:0];
    arrayY1 = [NSMutableArray arrayWithCapacity:0];
    arrayY0 = [NSMutableArray arrayWithCapacity:0];
    resultArray = [NSMutableArray arrayWithCapacity:0];
    
    [self setBgViewShadow];
    
    [self initBgCollectionView];
}

-(void)initBgCollectionView{
    
    //初始化UICollectionView，并设置好cell的大小，已经collectionView的sectionHeader
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(55, 250);
    layout.sectionHeadersPinToVisibleBounds = YES;
    
    layout.headerReferenceSize = CGSizeMake(40, 250);
    layout.footerReferenceSize = CGSizeMake(40, 250);
    hxCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:layout];
    hxCollectionView.backgroundColor = [UIColor whiteColor];
    hxCollectionView.showsHorizontalScrollIndicator = NO;
    hxCollectionView.delegate = self;
    hxCollectionView.dataSource = self;
    [hxCollectionView registerNib:[UINib nibWithNibName:@"FHXCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FHXCollectionReusableView"];
    [hxCollectionView registerNib:[UINib nibWithNibName:@"HXCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HXCollectionReusableView"];
    hxCollectionView.bounces = NO;
    //hxCollectionView.contentOffset = CGPointMake(SCREEN_WIDTH/2.0f, 0);
    [self.bgView addSubview:hxCollectionView];
    
    [hxCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.bgView.mas_left).with.offset(0.0);
        make.right.equalTo(self.bgView.mas_right).with.offset(0.0);
        make.top.equalTo(self.bgView.mas_top).with.offset(50.0f);
        make.height.equalTo(@250.0f);
    }];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UINib *nib = [UINib nibWithNibName:@"FHXOrderCollectionCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"FHXOrderCollectionCell"];
    FHXOrderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FHXOrderCollectionCell" forIndexPath:indexPath];
    if (arrayX.count > 0 && maxValue - 1 > 0) {
      
        cell.dateLabel.text = arrayX[indexPath.row];
    }
    if (_columnarDataArray.count > 0 && maxValue - 1 > 0) {
        
        cell.maxValue = maxValue;
        cell.trendModel = _columnarDataArray[indexPath.row];
    }
    if (selIndex == indexPath) {
        cell.messageView.hidden = NO;
    }else{
        cell.messageView.hidden = YES;
    }
    cell.backgroundColor = [UIColor whiteColor];
        return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (arrayX.count > 0) {

        [hxCollectionView setContentOffset:CGPointMake((arrayX.count)*55 - (CGRectGetWidth(self.bounds) - 100),0) animated:NO];
    }
    return arrayX.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

        FHXCollectionReusableView *  view = [hxCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FHXCollectionReusableView" forIndexPath:indexPath];
        view.backgroundColor = [UIColor whiteColor];
        if (resultArray.count > 0 && maxValue - 1 > 0) {
            
            view.maxData = maxValue;
        }
        return view;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView* view = [hxCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HXCollectionReusableView" forIndexPath:indexPath];
        return view;
    }else{
        return nil;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (selIndex) {
        FHXOrderCollectionCell * celled = (FHXOrderCollectionCell *)[collectionView cellForItemAtIndexPath:selIndex];
        celled.messageView.hidden = YES;
    }
    selIndex = indexPath;
    
    FHXOrderCollectionCell * cell = (FHXOrderCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.messageView.hidden = NO;
}

//筛选类型
- (IBAction)switchDataTypeAction:(id)sender {

    if ([self.delegate respondsToSelector:@selector(selectDataTypeAction)]) {
        [self.delegate selectDataTypeAction];
    }
    
}

- (void)setBgViewShadow{
    
    self.bgView.layer.masksToBounds = NO;
    self.bgView.layer.cornerRadius = 6;
    self.bgView.layer.shadowColor = HXRGB(225, 225, 234).CGColor;//阴影颜色
    self.bgView.layer.shadowOpacity = 1.0;//阴影透明度
    self.bgView.layer.shadowOffset = CGSizeMake(0, 0);//阴影偏移量
    self.bgView.layer.shadowRadius = 5;//阴影半径
    self.bgView.layer.shouldRasterize = NO;
    CGRect  roundRect = CGRectMake(0, 0, SCREEN_WIDTH - 30, 360);
    self.bgView.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:roundRect cornerRadius:5] CGPath];
}

-(FHXChartNoDataView *)noDataView{
    
    if (!_noDataView) {
        
        _noDataView = [[NSBundle mainBundle]loadNibNamed:@"FHXChartNoDataView" owner:self options:nil][0];
        _noDataView.frame = CGRectMake(0, 0, 128, 128);
        [self.bgView addSubview:_noDataView];
        _noDataView.hidden = YES;
        [_noDataView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.bgView);
            make.centerY.equalTo(self.bgView);
            make.width.equalTo(@128.0f);
            make.height.equalTo(@128.0f);
        }];
        
    }
    return _noDataView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
