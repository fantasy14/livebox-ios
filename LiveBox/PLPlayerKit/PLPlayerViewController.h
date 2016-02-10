//
//  PLPlayerViewController.h
//  PLPlayerKitDemo
//
//  Created by 0dayZh on 15/10/19.
//  Copyright © 2015年 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLPlayerViewController : UIViewController

@property (nonatomic, strong) NSURL *url;

- (instancetype)initWithURL:(NSURL *)url;

@end
