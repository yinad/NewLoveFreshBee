//
//  AFBAllSelCell.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBAllSelCell.h"
#import "AFBCommonGoodsModel.h"

@interface AFBAllSelCell ()

@property(nonatomic, weak) UILabel * priceLable;

@property(nonatomic, weak) UIButton * sureBut;

@end

@implementation AFBAllSelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setPriceL:(CGFloat)priceL{
    _priceL = priceL;
    self.priceLable.text = [NSString stringWithFormat:@"¥%.2f",priceL];
    
    self.sureBut.backgroundColor = kBaseColor;
    [self.sureBut setTitle:@"选好了" forState:UIControlStateNormal];
    [self.sureBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (priceL == 0){
        [self.sureBut setTitle:@"还差0.0元" forState:UIControlStateNormal];
        [self.sureBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.sureBut.backgroundColor = [UIColor grayColor];
    }
}

//布局
- (void)setupUI{
    
    UIButton *selbtn = [[UIButton alloc] init];
    self.selectBut = selbtn;
    [selbtn setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    [selbtn setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    
    [selbtn addTarget:self action:@selector(selectAll) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:selbtn];
    
    UILabel *textL = [[UILabel alloc] init];
    textL.text = @"全选";
    textL.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:textL];
    
    UILabel *tPriceL = [[UILabel alloc] init];
    self.priceLable = tPriceL;
    
    tPriceL.textColor = [UIColor redColor];
    tPriceL.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:tPriceL];
    
    UIButton * yellowSelBtn = [UIButton ay_textButton:@"选好了" fontSize:15 normalColor:[UIColor blackColor] selectedColor:[UIColor blackColor]];
    
    self.sureBut = yellowSelBtn;
    
    [self.contentView addSubview:yellowSelBtn];
    //布局
    [selbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(13);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [textL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(selbtn);
        make.left.equalTo(selbtn.mas_right).offset(13);
    }];
    
    [tPriceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(textL);
        make.left.equalTo(textL.mas_right).offset(13);
    }];
    
    [yellowSelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(100);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)clickToJudge{
    
}

- (void)selectAll{
    self.selectBut.selected = !self.selectBut.selected;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"allSel" object:self.selectBut];
    
    if (!self.selectBut.selected) {
        self.priceL = 0.00;
    }else{
        self.priceL = _ShopCarGoodsPrice;
    }
    
}



@end
