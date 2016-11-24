//
//  AFBEditAddressCell.m
//  AFBMineAddress
//
//  Created by drfgh on 16/11/21.
//  Copyright © 2016年 drfgh. All rights reserved.
//

#import "AFBEditAddressCell.h"
#import "Masonry.h"

@interface AFBEditAddressCell()

@end
@implementation AFBEditAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

//- (UITableViewCell *)initWithRemoveCell{
//
//
//}

- (void)setModel:(AFBEditAddressModel *)model{
    
    _model = model;
    
    _tf_name.text = model.name;
    _tf_area.text = model.area;
    _tf_city.text = model.city;
    _tf_phone.text = model.phone;
    _tf_address.text = model.address;
}

- (void)setupUI{
    
    //联系人
    UILabel *lb_name = [[UILabel alloc]init];
    lb_name.text = @"联系人";
    lb_name.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lb_name];
    
    UITextField *tf_name = [[UITextField alloc]init];
    self.tf_name = tf_name;
    [tf_name setText:@"小胖子高智佳"];
    tf_name.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:tf_name];
    
    //手机号码
    UILabel *lb_phone = [[UILabel alloc]init];
    lb_phone.text = @"手机号码";
    lb_phone.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lb_phone];
    
    UITextField *tf_phone = [[UITextField alloc]init];
    [tf_phone setText:@"1234567890"];
    tf_phone.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:tf_phone];
    
    //所在城市
    UILabel *lb_city = [[UILabel alloc]init];
    lb_city.text = @"所在城市";
    lb_city.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lb_city];
    
    UITextField *tf_city = [[UITextField alloc]init];
    self.tf_city = tf_city;
    [tf_city setText:@"脑残市"];
    tf_city.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:tf_city];
    
    //所在地区
    UILabel *lb_area = [[UILabel alloc]init];
    lb_area.text = @"所在地区";
    lb_area.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lb_area];
    
    UITextField *tf_area = [[UITextField alloc]init];
    self.tf_area = tf_area;
    [tf_area setText:@"智县镇二傻镇向阳屯"];
    tf_area.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:tf_area];
    
    //详细地址
    UILabel *lb_address = [[UILabel alloc]init];
    lb_address.text = @"详细地址";
    lb_address.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lb_address];
    
    UITextField *tf_address = [[UITextField alloc]init];
    self.tf_address = tf_address;
    [tf_address setText:@"5438250号"];
    tf_address.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:tf_address];
    
    //性别
    UIButton *btn_manPic = [[UIButton alloc]init];
    self.btn_manPic = btn_manPic;
    [btn_manPic setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    [btn_manPic setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    btn_manPic.selected = YES;
    _btn_man.selected = YES;
    [self.contentView addSubview:btn_manPic];
    UIButton *btn_man = [[UIButton alloc]init];
    self.btn_man = btn_man;
    [btn_man setTitle:@"帅哥" forState:UIControlStateNormal];
    [btn_man setTitle:@"帅哥" forState:UIControlStateSelected];
    [btn_man setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn_man.titleLabel.font = [UIFont systemFontOfSize:15];
    //    [btn_man setTitle:@"帅哥" forState:UIControlStateSelected];
    [self.contentView addSubview:btn_man];
    
    UIButton *btn_womanPic = [[UIButton alloc]init];
    self.btn_womanPic = btn_womanPic;
    [btn_womanPic setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
    [btn_womanPic setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
    
    [self.contentView addSubview:btn_womanPic];
    UIButton *btn_woman = [[UIButton alloc]init];
    self.btn_woman = btn_woman;
    [btn_woman setTitle:@"美女" forState:UIControlStateNormal];
    [btn_woman setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn_woman.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:btn_woman];
    //    NSLog(@"%zd",btn_man.state);
    //  btn的选性别点击事件
    [btn_manPic addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    [btn_man addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    [btn_womanPic addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    [btn_woman addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *img_oneLines = [[UIImageView alloc]init];
    img_oneLines.image = [UIImage imageNamed:@"bj"];
    //    img_oneLines.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:img_oneLines];
    
    UIImageView *img_twoLines = [[UIImageView alloc]init];
    img_twoLines.image = [UIImage imageNamed:@"bj"];
    //    img_twoLines.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:img_twoLines];
    
    UIImageView *img_threeLines = [[UIImageView alloc]init];
    img_threeLines.image = [UIImage imageNamed:@"bj"];
    //    img_threeLines.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:img_threeLines];
    
    UIImageView *img_fourLines = [[UIImageView alloc]init];
    img_fourLines.image = [UIImage imageNamed:@"bj"];
    //    img_fourLines.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:img_fourLines];
    
    UIImageView *img_fiveLines = [[UIImageView alloc]init];
    img_fiveLines.image = [UIImage imageNamed:@"bj"];
    //    img_fiveLines.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:img_fiveLines];
    
    
    
    
    //    设置约束
    //    联系人
    [lb_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
    }];
    [tf_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.top.equalTo(lb_name);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    //    第一条灰色分割线
    [img_oneLines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lb_name);
        make.right.equalTo(self.contentView);
        make.top.equalTo(lb_name.mas_bottom).offset(10);
        make.height.mas_equalTo(1);
    }];
    
    //性别
    [btn_manPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(img_oneLines.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(60);
    }];
    [btn_man mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(img_oneLines.mas_bottom).offset(7);
        make.left.equalTo(btn_manPic.mas_right).offset(7);
    }];
    
    [btn_womanPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(img_oneLines.mas_bottom).offset(10);
        make.left.equalTo(btn_man.mas_right).offset(60);
    }];
    [btn_woman mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(img_oneLines.mas_bottom).offset(7);
        make.left.equalTo(btn_womanPic.mas_right).offset(7);
    }];
    
    //    第二条灰色分割线
    [img_twoLines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(img_oneLines);
        make.top.equalTo(btn_manPic.mas_bottom).offset(10);
        make.height.mas_equalTo(1);
    }];
    
    //手机号码
    [lb_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(img_twoLines.mas_bottom).offset(10);
    }];
    [tf_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.top.equalTo(lb_phone);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    //    第三条灰色分割线
    [img_threeLines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(img_oneLines);
        make.top.equalTo(lb_phone.mas_bottom).offset(10);
        make.height.mas_equalTo(1);
    }];
    
    //所在城市
    [lb_city mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(img_threeLines.mas_bottom).offset(10);
    }];
    [tf_city mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.top.equalTo(lb_city);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    //    第四条灰色分割线
    [img_fourLines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(img_oneLines);
        make.top.equalTo(lb_city.mas_bottom).offset(10);
        make.height.mas_equalTo(1);
    }];
    
    //所在地区
    [lb_area mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(img_fourLines.mas_bottom).offset(10);
    }];
    [tf_area mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.top.equalTo(lb_area);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    //    第五条灰色分割线
    [img_fiveLines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(img_oneLines);
        make.top.equalTo(lb_area.mas_bottom).offset(10);
        make.height.mas_equalTo(1);
    }];
    
    //详细地址
    [lb_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(img_fiveLines.mas_bottom).offset(10);
    }];
    [tf_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.top.equalTo(lb_address);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
}
//  btn的选性别点击事件
- (void)select:(UIButton *)sender{

    if (sender == self.btn_man) {
        self.btn_manPic.selected = !self.btn_manPic.selected;
        self.btn_womanPic.selected = !self.btn_womanPic.selected;
    }
    else if(sender == self.btn_woman){
        self.btn_womanPic.selected = !self.btn_womanPic.selected;
        self.btn_manPic.selected = !self.btn_manPic.selected;
    }
    
    
    
    
    
    
    
    
//    if (sender == self.btn_man) {
//        self.btn_manPic.selected = !self.btn_manPic.selected;
//        self.btn_man.selected = !self.btn_man.selected;
//        if (self.btn_womanPic.selected == YES ){//|| self.btn_woman.selected == YES) {
//            self.btn_womanPic.selected = !self.btn_womanPic.selected;
////            self.btn_woman.selected = !self.btn_woman.selected;
//        }
//    }
//    if (sender == self.btn_womanPic) {
//        self.btn_womanPic.selected = !self.btn_womanPic.selected;
//        self.btn_woman.selected = !self.btn_womanPic.selected;
//        if (self.btn_manPic.selected == YES ){//|| self.btn_man.selected == YES) {
//            self.btn_manPic.selected = !self.btn_manPic.selected;
////            self.btn_man.selected = !self.btn_man.selected;
//        }
//    }
    
//    if (sender == self.btn_woman || sender == self.btn_womanPic) {
//
////        if (self.btn_man.selected == YES) {
////            self.btn_man.selected = !self.btn_man.selected;
////            return;
////        }
//        self.btn_man.selected = !self.btn_man.selected;
//        self.btn_manPic.selected = !self.btn_manPic.selected;
//    }
//    else if (sender == self.btn_man || sender == self.btn_manPic){
//        self.btn_man.selected = !self.btn_man.selected;
//        self.btn_manPic.selected = !self.btn_manPic.selected;
////        if (self.btn_woman.selected == YES) {
////            self.btn_woman.selected = !self.btn_woman.selected;
////        }
//    }
}

//if (sender == self.btn_man || sender == self.btn_manPic) {
//    self.btn_man.selected = !self.btn_man.selected;
//    self.btn_manPic.selected = !self.btn_manPic.selected;
//    if (self.btn_woman.selected == YES) {
//        self.btn_woman.selected = !self.btn_woman.selected;
//        self.btn_womanPic.selected = !self.btn_womanPic.selected;
//    }
//    return;
//}
//else if (sender == self.btn_woman || sender == self.btn_womanPic){
//    self.btn_woman.selected = !self.btn_woman.selected;
//    self.btn_womanPic.selected = !self.btn_womanPic.selected;
//    if (self.btn_man.selected == YES) {
//        self.btn_man.selected = !self.btn_man.selected;
//        self.btn_manPic.selected = !self.btn_manPic.selected;
//    }
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


























////
////  AFBEditAddressCell.m
////  AFBMineAddress
////
////  Created by drfgh on 16/11/21.
////  Copyright © 2016年 drfgh. All rights reserved.
////
//
//#import "AFBEditAddressCell.h"
//#import "Masonry.h"
//
//@interface AFBEditAddressCell()
//
//@end
//@implementation AFBEditAddressCell
//
//- (void)awakeFromNib {
//    [super awakeFromNib];
//}
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self setupUI];
//    }
//    return self;
//}
//
//- (void)setModel:(AFBEditAddressModel *)model{
//    
//    self.model = model;
//}
//
//- (void)setupUI{
//    
//    //联系人
//    UILabel *lb_name = [[UILabel alloc]init];
//    lb_name.text = @"联系人";
//    [self.contentView addSubview:lb_name];
//    
//    UITextField *tf_name = [[UITextField alloc]init];
//    self.tf_name = tf_name;
//    tf_name.placeholder = @"收货人姓名";
//    [self.contentView addSubview:tf_name];
//    
//    //手机号码
//    UILabel *lb_phone = [[UILabel alloc]init];
//    lb_phone.text = @"手机号码";
//    [self.contentView addSubview:lb_phone];
//    
//    UITextField *tf_phone = [[UITextField alloc]init];
//    tf_phone.placeholder = @"鲜蜂侠联系您的电话";
//    [self.contentView addSubview:tf_phone];
//    
//    //所在城市
//    UILabel *lb_city = [[UILabel alloc]init];
//    lb_city.text = @"所在城市";
//    [self.contentView addSubview:lb_city];
//    
//    UITextField *tf_city = [[UITextField alloc]init];
//    self.tf_city = tf_city;
//    tf_city.placeholder = @"请选择城市";
//    [self.contentView addSubview:tf_city];
//    
//    //所在地区
//    UILabel *lb_area = [[UILabel alloc]init];
//    lb_area.text = @"所在地区";
//    [self.contentView addSubview:lb_area];
//    
//    UITextField *tf_area = [[UITextField alloc]init];
//    self.tf_area = tf_area;
//    tf_area.placeholder = @"请选择你的住宅,大厦或学校";
//    [self.contentView addSubview:tf_area];
//    
//    //详细地址
//    UILabel *lb_address = [[UILabel alloc]init];
//    lb_address.text = @"详细地址";
//    [self.contentView addSubview:lb_address];
//    
//    UITextField *tf_address = [[UITextField alloc]init];
//    self.tf_address = tf_address;
//    tf_address.placeholder = @"请输入楼号门牌号等详细信息";
//    [self.contentView addSubview:tf_address];
//    
//    //性别
//    UIButton *btn_man = [[UIButton alloc]init];
//    self.btn_man = btn_man;
//    [btn_man setImage:[UIImage imageNamed:@"noselected"] forState:UIControlStateNormal];
////    [btn_man setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateHighlighted];
//    [btn_man setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
//    [self.contentView addSubview:btn_man];
//    UILabel *lb_man = [[UILabel alloc]init];
//    lb_man.text = @"先生";
//    [self.contentView addSubview:lb_man];
//    
//    UIButton *btn_woman = [[UIButton alloc]init];
//    self.btn_woman = btn_woman;
//    [btn_woman setImage:[UIImage imageNamed:@"noselected"] forState:UIControlStateNormal];
////    [btn_woman setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateHighlighted];
//    [btn_woman setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
//    [self.contentView addSubview:btn_woman];
//    UILabel *lb_woman = [[UILabel alloc]init];
//    lb_woman.text = @"女士";
//    [self.contentView addSubview:lb_woman];
////    NSLog(@"%zd",btn_man.state);
////  btn的选性别点击事件
//    [btn_man addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [btn_woman addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
//    
////    btn_woman.selected = NO;
////    btn_man.selected = YES;
////    设置约束
////    联系人
////    [lb_name mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.top.mas_equalTo(10);
////    }];
////    [tf_name mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.mas_equalTo(80);
////        make.top.equalTo(lb_name);
////        make.right.equalTo(self.contentView).offset(-10);
////    }];
////    
////    //手机号码
////    [lb_phone mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.top.mas_equalTo(10);
////    }];
////    [tf_phone mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.mas_equalTo(80);
////        make.top.equalTo(lb_phone);
////        make.right.equalTo(self.contentView).offset(-10);
////    }];
////    
////    //所在城市
////    [lb_city mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.top.mas_equalTo(10);
////    }];
////    [tf_city mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.mas_equalTo(80);
////        make.top.equalTo(lb_city);
////        make.right.equalTo(self.contentView).offset(-10);
////    }];
////    
////    //所在地区
////    [lb_area mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.top.mas_equalTo(10);
////    }];
////    [tf_area mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.mas_equalTo(80);
////        make.top.equalTo(lb_area);
////        make.right.equalTo(self.contentView).offset(-10);
////    }];
////    
////    //详细地址
////    [lb_address mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.top.mas_equalTo(10);
////    }];
////    [tf_address mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.mas_equalTo(80);
////        make.top.equalTo(lb_address);
////        make.right.equalTo(self.contentView).offset(-10);
////    }];
//    
//    //性别
//    [btn_man mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
////        make.top.equalTo(self.contentView).offset(10);
//        make.left.equalTo(self.contentView).offset(60);
//    }];
//    [lb_man mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
////        make.top.equalTo(self.contentView).offset(10);
//        make.left.equalTo(btn_man.mas_right).offset(10);
//    }];
//    
//    [btn_woman mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
//        make.left.equalTo(lb_man.mas_right).offset(60);
//    }];
//    [lb_woman mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
//        make.left.equalTo(btn_woman.mas_right).offset(10);
//    }];
//}
////  btn的选性别点击事件
//- (void)select:(UIButton *)sender{
//    if (sender == self.btn_man) {
//        self.btn_man.selected = !self.btn_man.selected;
//        if (self.btn_woman.selected == YES) {
//            self.btn_woman.selected = !self.btn_woman.selected;
//        }
//        return;
//    }
//    else if (sender == self.btn_woman){
//        self.btn_woman.selected = !self.btn_woman.selected;
//        if (self.btn_man.selected == YES) {
//            self.btn_man.selected = !self.btn_man.selected;
//        }
//    }
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
