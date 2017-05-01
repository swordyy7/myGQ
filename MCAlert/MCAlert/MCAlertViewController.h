//
//  MCAlertViewController.h
//  MCAlert
//
//  Created by 杨雪剑 on 2017/5/1.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Complete) (id action);


typedef NS_ENUM(NSUInteger, MCAlertActionStyle) {
    MCAlertActionStyleDefault,
    MCAlertActionStyleCancal
};

@interface MCAlertAction : NSObject


+(MCAlertAction *)actionWithTitle:(NSString *)title message:(NSString *)message style:(MCAlertActionStyle)style complete:(Complete)complete;


@end


@interface MCAlertViewController : UIViewController

+(MCAlertViewController *)alertWithTitle:(NSString *)title message:(NSString *)message;

- (void)addAction:(MCAlertAction *)action;

@end
