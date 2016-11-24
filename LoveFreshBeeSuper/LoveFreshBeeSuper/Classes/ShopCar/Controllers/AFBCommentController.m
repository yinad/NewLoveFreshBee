//
//  AFBCommentController.m
//  LoveFreshBeeSuper
//
//  Created by gao2015 on 2016/11/21.
//  Copyright © 2016年 gao2015. All rights reserved.
//

#import "AFBCommentController.h"
#import "AFBCommentTopListCell.h"
#import "AFBShopCarController.h"
static NSString *cellID = @"cell_id";
static NSString *footID = @"foot_id";

@interface AFBCommentController ()<UITextViewDelegate,AFBCommentTopListCellDelegate>

@property(nonatomic,weak) UITextView *textViewV;
@property(nonatomic,weak) UILabel *placehoder;
@property(nonatomic,weak) UIButton *commitBtn;
@property(nonatomic,strong) NSMutableArray <NSString *> *arrayM;
@property(nonatomic,copy) NSString *string;
@end

@implementation AFBCommentController{
    
    
}
- (NSMutableArray<NSString *> *)arrayM{
    if (!_arrayM) {
        _arrayM = [NSMutableArray array];
    }
    return _arrayM;
}

- (void)noti:(NSNotification *) noti{
    NSLog(@"%@",noti);
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单备注";
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(noti:) name:@"回传订单通知" object:nil];
    //tableView设置
    [self.tableView registerClass:[AFBCommentTopListCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"AFBCommentTopListCell"bundle:nil] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:footID];
    self.tableView.rowHeight = 100;
    UITableViewHeaderFooterView *footView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    self.tableView.tableFooterView = footView;
    
    //textview
    UITextView *textview = [[UITextView alloc] init];
    [footView addSubview:textview];
    self.textViewV = textview;
    textview.keyboardType = UIKeyboardTypeDefault;
    textview.layer.borderWidth = 0.5;
    textview.layer.borderColor = [UIColor blackColor].CGColor;
    textview.font = [UIFont fontWithName:@"Arial" size:16];
    textview.delegate = self;
    
    //textView上的左上的UILabel
    UILabel *placehoderL = [[UILabel alloc] init];
    placehoderL.numberOfLines = 0;
    self.placehoder = placehoderL;
    [textview addSubview:placehoderL];
    placehoderL.textColor = [UIColor lightGrayColor];
    placehoderL.font = [UIFont systemFontOfSize:13];
    placehoderL.text = @"给商家留言,可输入对商家的需求(可不填)";
    //textView上的右下的UILabel
    UILabel *rightBtmL = [[UILabel alloc] init];
    placehoderL.numberOfLines = 0;
    [textview addSubview:rightBtmL];
    rightBtmL.text = @"300字以内";
    rightBtmL.font = [UIFont systemFontOfSize:13];
    rightBtmL.textColor = [UIColor lightGrayColor];
    
    //完成按钮
    UIButton *completeBtn = [[UIButton alloc] init];
    self.commitBtn = completeBtn;
    [footView addSubview:completeBtn];
    //默认状态的按钮
    [completeBtn setTitle:@"完成" forState:UIControlStateDisabled];
    [completeBtn setBackgroundImage:[UIImage imageNamed:@"shenhui"] forState:UIControlStateDisabled];
    [completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    //输入文字后的按钮
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn setBackgroundImage:[UIImage imageNamed:@"juhuang"] forState:UIControlStateNormal];
    [completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    completeBtn.enabled = NO;
    [completeBtn addTarget:self action:@selector(clickComplete) forControlEvents:UIControlEventTouchUpInside];
    //    [completeBtn addTarget:self action:@selector(clickComplete) forControlEvents:UIControlEventTouchUpInside];
    
    //布局
    [textview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 200));
        make.left.top.right.equalTo(footView);
    }];
    [placehoderL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(8);
        make.top.mas_offset(12);
    }];
    [rightBtmL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(textview.mas_right).offset(-8);
        make.bottom.equalTo(textview.mas_bottom).offset(-12);
    }];
    
    [completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footView);
        make.top.equalTo(textview.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width - 100, 50));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AFBCommentTopListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
//这个方法是将cell页面的控件button传递过来,拿到title的值赋值给textView中字符串
//1.通过点击cell中的btn给textView赋值
//2.通过在textView输入框中 输入赋值
//3.注意:点击cell中的btn给textView赋值默认不会调用textViewDidChange方法
- (void)AFBCommentTopListCellWithButton:(UIButton *)btn{
    
    NSString *btnTitleStr = [btn currentTitle];
    //    btn.selected = btn.selected;
    if (!btn.selected) {
        btn.selected = YES;
        if (![self.arrayM containsObject:btnTitleStr]) {
            if (_string == nil) {
                _string = btnTitleStr;
                self.textViewV.text = _string;
                [self.arrayM addObject:btnTitleStr];
                [self textViewDidChange:self.textViewV];
                
            }else{
                _string = [_string stringByAppendingString:[NSString stringWithFormat:@" %@",btnTitleStr]];
                self.textViewV.text = _string;
                //                [self.arrayM addObject:btnTitleStr];
            }
            //注意顺序
        }
    }
    //将传递过来的title赋值显示
    //调用这个方法的目的是,textViewDidChange在这个方法中不会主动调用,需要手动调用
}


- (void)clickComplete{
    //    NSLog(@"点击了完成,别忘了回传哦");
    //回传数据
    NSDictionary *dic = @{@"str":_string};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"回传订单详情" object:nil userInfo:dic];
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)textViewDidChange:(UITextView *)textView{
    //隐藏self.placehoder.hidden = YES;
    //
    //根据填入的textView的值来判断
    //    _string = [_string stringByAppendingString:[NSString stringWithFormat:@"%@",textView.text]];
    
    //    NSLog(@"%@",textView.text);
    
    if (![self.arrayM containsObject:textView.text]) {
        if (_string == nil) {
            _string = textView.text;
        }else{
            _string = [_string stringByAppendingString:[NSString stringWithFormat:@" %@",textView.text]];
        }
    }
    [self.arrayM addObject:textView.text];
    if (self.textViewV.text.length == 0) {
        //长度为0的时候,占位符不隐藏;
        self.placehoder.hidden = NO;
        self.commitBtn.enabled = NO;
        
    }else{
        //         self.commitBtn.userInteractionEnabled = YES;
        self.placehoder.hidden = YES;
        self.commitBtn.enabled = YES;
    }
    if (textView.text.length >= 300) {
        NSLog(@"输入的文字数量大于300");
    }
}
//- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:@"回传订单详情"];
//}

@end
