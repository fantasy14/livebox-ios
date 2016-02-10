//
//  ViewController.h
//  LiveBox
//
//  Created by Joshua Collishaw on 29/11/2015.
//  Copyright © 2015 Live Box. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking/AFHTTPRequestOperationManager.h"

@interface ViewController : UITableViewController

@property (strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *appSize;
@property (strong, nonatomic) NSString *downloadURL;
@property (strong, nonatomic) NSString *url;
@property (nonatomic, strong) IBOutlet UIView *movieView;
@property (weak, nonatomic) IBOutlet UIButton *install;
@property (nonatomic, strong, readwrite) NSArray *applicationsArray;
@property (nonatomic) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIWindow *window;
@end
