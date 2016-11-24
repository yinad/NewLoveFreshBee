//
//  SystemMessageCell.m
//  LoveFreshBeeSuper
//
//  Created by xlx on 16/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "SystemMessageCell.h"
#import "AFBMineMyMessage.h"

@interface SystemMessageCell()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *detailsLbl;

@end

@implementation SystemMessageCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
        
        
        //1. 创建子控件
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.font = [UIFont boldSystemFontOfSize:15];
        [backView addSubview:_titleLbl];
        
        _moreButton = [[UIButton alloc] init];
        [_moreButton setTitle:@"显示全部" forState:UIControlStateNormal];
        [_moreButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [_moreButton addTarget:self action:@selector(moreContent:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:_moreButton];
        
        
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor grayColor];
        [backView addSubview:_line];
        
        _detailsLbl = [[UILabel alloc] init];
        _detailsLbl.numberOfLines = 0;
        _detailsLbl.font = [UIFont systemFontOfSize:12];
        _detailsLbl.textColor = [UIColor darkGrayColor];
        [backView addSubview:_detailsLbl];
        
        
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-8);
        }];
        
        
        [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backView).offset(10);
            make.top.equalTo(backView).offset(8);
            make.size.mas_equalTo(CGSizeMake(200, 25));
        }];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(40);
            //            make.centerY.equalTo(backView);
            make.left.equalTo(backView);
            make.size.mas_equalTo(CGSizeMake(kScreenWidth, 0.5));
        }];
        
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLbl);
            make.right.equalTo(backView).offset(-5);
            make.size.mas_equalTo(CGSizeMake(80, 25));
        }];
        
        [_detailsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_line.mas_bottom).offset(6);
            make.left.equalTo(_line).offset(10);
            make.right.equalTo(backView).offset(-10);
            //            make.height.mas_equalTo(100);
            //            make.height.mas_equalTo(40);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
        
    }
    
    return self;
}

- (void)moreContent:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"显示全部"])
    {
        [btn setTitle:@"收起" forState:UIControlStateNormal];
        
    }
    else
    {
        [btn setTitle:@"显示全部" forState:UIControlStateNormal];
        
    }
    
    
}

- (void)setModel:(AFBMineMyMessage *)model {
    
    _model = model;
    
    _titleLbl.text = model.title;
    _moreButton.titleLabel.text = @"查看全部";
    _detailsLbl.text = model.content;
    
    
}

@end
