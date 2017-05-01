//
//  MCAlertViewController.m
//  MCAlert
//
//  Created by 杨雪剑 on 2017/5/1.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

#import "MCAlertViewController.h"
#import <objc/runtime.h>


#pragma mark -- View
/*=============================View======================================================*/
@interface MCAlertTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) NSMutableArray *content1ContrainsArray;
@property (nonatomic, strong) NSMutableArray *content2ContrainsArray;

@property (nonatomic, strong) NSMutableArray *titleContrainsArray;
@property (nonatomic, strong) NSMutableArray *messageContrainsArray;



@end

#pragma mark -- Model
/*============================Model=======================================================*/

@interface MCAlertAction ()

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *message;

@property (nonatomic, assign) MCAlertActionStyle style;


@property (nonatomic, copy) Complete complete;

@end

#pragma mark -- Controller
/*==============================Controller================================================*/

@interface MCAlertViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSString *alertTitle;

@property (nonatomic, strong) NSString *message;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *defaultActionArray;

@property (nonatomic, strong) MCAlertAction *cancalAction;

@property (nonatomic, assign) CGFloat tableViewHeight;

@property (nonatomic, strong) UIButton *cancalButton;

@property (nonatomic, strong) UIView *backView;


@end

#pragma mark -- 实现方法
@implementation MCAlertAction

+(MCAlertAction *)actionWithTitle:(NSString *)title message:(NSString *)message style:(MCAlertActionStyle)style complete:(Complete)complete {
    
    return [[MCAlertAction alloc] initWithTitle:title message:message style:style complete:complete];
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message style:(MCAlertActionStyle)style complete:(Complete)complete {
    
    self = [super init];
    
    if (self) {
        
        self.title = title;
        self.message = message;
        self.style = style;
        self.complete = complete;
    }
    
    return self;
}


@end
@implementation MCAlertTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.messageLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    
    [self makeTitleLabelContraints];
    
    if (self.messageLabel.superview) {
        
        [self makeMessageLabelContrains];
        
    }
}

- (void)makeTitleLabelContraints {
    
    [self.titleLabel removeConstraints:self.titleContrainsArray];
    [self.contentView removeConstraints:self.content1ContrainsArray];
    
    if (self.messageLabel.superview) {
        
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
        [self.contentView addConstraint:top];
        
    }else {
        
        NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        [self.contentView addConstraint:centerY];
        
    }
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:[UIScreen mainScreen].bounds.size.width];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:18];
    
    
    
    [self.contentView addConstraint:centerX];
    
    [self.titleLabel addConstraint:width];
    [self.titleLabel addConstraint:height];
    
    [self.content1ContrainsArray addObject:centerX];
    
    [self.titleContrainsArray addObject:width];
    [self.titleContrainsArray addObject:height];
}

- (void)makeMessageLabelContrains {
    
    [self.contentView removeConstraints:self.content2ContrainsArray];
    [self.messageLabel removeConstraints:self.messageContrainsArray];
    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:5];
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:[UIScreen mainScreen].bounds.size.width];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.messageLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:14];
    
    [self.contentView addConstraint:top];
    [self.contentView addConstraint:centerX];
    [self.content2ContrainsArray addObject:top];
    [self.content2ContrainsArray addObject:centerX];
    
    [self.messageLabel addConstraint:width];
    [self.messageLabel addConstraint:height];
    
    [self.messageContrainsArray addObject:width];
    [self.messageContrainsArray addObject:height];
    
}

- (void)passAction:(MCAlertAction *)action {
    
    self.titleLabel.text = action.title;
    self.messageLabel.text = action.message;
    
    if (!action.message) {
        
        [self.messageLabel removeFromSuperview];
    }
    
}



- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.backgroundColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    
    if (!_messageLabel) {
        
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    }
    
    return _messageLabel;
}

- (NSMutableArray *)content1ContrainsArray {
    
    if (!_content1ContrainsArray) {
        
        _content1ContrainsArray = [NSMutableArray array];
    }
    
    return _content1ContrainsArray;
}

- (NSMutableArray *)content2ContrainsArray {
    
    if (!_content2ContrainsArray) {
        
        _content2ContrainsArray = [NSMutableArray array];
    }
    
    return _content2ContrainsArray;
}


- (NSMutableArray *)titleContrainsArray {
    
    if (!_titleContrainsArray) {
        
        _titleContrainsArray = [NSMutableArray array];
    }
    
    return _titleContrainsArray;
}

- (NSMutableArray *)messageContrainsArray {
    
    if (!_messageContrainsArray) {
        
        _messageContrainsArray = [NSMutableArray array];
    }
    
    return _messageContrainsArray;
}

@end
@implementation MCAlertViewController

+(MCAlertViewController *)alertWithTitle:(NSString *)title message:(NSString *)message {
    
    
    return [[MCAlertViewController alloc] initWithTitle:title message:message];
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    
    self = [super init];
    
    if (self) {
        
        self.alertTitle = title;
        self.message = message;
        
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backView];
    [self.backView addSubview:self.tableView];
    
    if (self.cancalAction) {
        
        [self.backView addSubview:self.cancalButton];
        self.cancalButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self makeCancalButtonContrains];

    }
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    
    [self maketableViewContrains];
    
}


/**
 出现动画
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.backView.frame = self.view.bounds;
        
    } completion:nil];
    
}

/*取消按钮的布局*/
- (void)makeCancalButtonContrains {
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.cancalButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.cancalButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.cancalButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.cancalButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:48];
    
    [self.cancalButton addConstraint:heightConstraint];
    [self.backView addConstraint:left];
    [self.backView addConstraint:right];
    [self.backView addConstraint:bottom];

    
}

/**
 * tableview的代码布局
 */
- (void)maketableViewContrains {
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.backView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.cancalAction ? self.cancalButton : self.backView attribute:self.cancalAction ? NSLayoutAttributeTop : NSLayoutAttributeBottom multiplier:1.0 constant:self.cancalAction? -5 : 0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:self.tableViewHeight];
    
    [self.tableView addConstraint:heightConstraint];
    [self.backView addConstraint:left];
    [self.backView addConstraint:right];
    [self.backView addConstraint:bottom];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- tableView dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MCAlertAction *action = self.defaultActionArray[indexPath.row];
    
    
    return action.message ? 57 : 48;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MCAlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_pool"];
    
    [cell passAction:self.defaultActionArray[indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.defaultActionArray.count;
}

#pragma mark -- tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MCAlertAction *action = self.defaultActionArray[indexPath.row];
    
    if (action.complete) {
        
        action.complete(action);
    }
    
    [self dismissController];
}

#pragma mark -- custom method
/*添加动作*/
- (void)addAction:(MCAlertAction *)action {
    
    if (action.style == MCAlertActionStyleDefault) {
        
        [self.defaultActionArray addObject:action];
        self.tableViewHeight += action.message ? 57 : 48;
        
    }else {
        
        self.cancalAction = action;
    }
    
}

#pragma mark -- animation

/*消失动画*/
- (void)dismissController {
    
    CGRect frame = self.backView.frame;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.alpha = 0;
        self.backView.frame = CGRectMake(frame.origin.x, frame.size.height, frame.size.width, frame.size.height);
        
        
    } completion:^(BOOL finished) {
       
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        
    }];
    
}


#pragma mark -- touch action
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissController];
}

- (UIView *)backView {
    
    if (!_backView) {
        
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
        _backView.backgroundColor = [UIColor clearColor];
    }
    
    return _backView;
}

#pragma mark -- setter Or getter method
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
        [_tableView registerClass:[MCAlertTableViewCell class] forCellReuseIdentifier:@"cell_pool"];
        _tableView.rowHeight = 57;
        _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
        _tableView.bounces = NO;
    }
    
    return _tableView;
}

- (UIButton *)cancalButton {
    
    if (!_cancalButton) {
        
        _cancalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancalButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancalButton.backgroundColor = [UIColor whiteColor];
        
        [_cancalButton addTarget:self action:@selector(touchesEnded:withEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancalButton;
}

- (NSMutableArray *)defaultActionArray {
    
    if (!_defaultActionArray) {
        
        _defaultActionArray  = [NSMutableArray array];
    }
    
    return _defaultActionArray;
}

@end

@implementation UIViewController (MCAlert)

+(void)load {
    
    Method method1 = class_getInstanceMethod([self class], @selector(presentViewController:animated:completion:));
    Method method2 = class_getInstanceMethod([self class], @selector(mc_presentViewController:animated:completion:));
    
    method_exchangeImplementations(method1, method2);
    
}

- (void)mc_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if ([viewControllerToPresent isKindOfClass:[MCAlertViewController class]]) {
        
        [self.view addSubview:viewControllerToPresent.view];
        [self addChildViewController:viewControllerToPresent];
        
    }else {
        
        [self mc_presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
    
}




@end


