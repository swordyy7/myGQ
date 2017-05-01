//
//  ViewController.m
//  MCAlert
//
//  Created by 杨雪剑 on 2017/5/1.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

#import "ViewController.h"
#import "MCAlertViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (IBAction)tappedAction:(id)sender {
    
    MCAlertViewController *alert = [[MCAlertViewController alloc] init];
    
    MCAlertAction *action = [MCAlertAction actionWithTitle:@"test1" message:@"test1" style:0 complete:^(id action) {
        
        NSLog(@"点击了action1");
        
    }];
    
    MCAlertAction *action2 = [MCAlertAction actionWithTitle:@"test2" message:nil style:0 complete:^(id action) {
        
        NSLog(@"点击了Action2");
        
    }];
    MCAlertAction *action3 = [MCAlertAction actionWithTitle:@"取消" message:nil style:1 complete:nil];
    
    [alert addAction:action];
    [alert addAction:action2];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
