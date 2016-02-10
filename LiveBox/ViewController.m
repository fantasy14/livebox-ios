#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "ChannelsTableViewCell.h"
#import "ChannelInfoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "ProgressHUD.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@import AVKit;
@import AVFoundation;
@interface ViewController : UITableViewController
    @property (nonatomic, strong, readwrite) NSArray *applicationsArray;
    @property (nonatomic) AFHTTPRequestOperationManager *manager;
    //@property (nonatomic, assign) BOOL forceRotate;
@property(nonatomic) BOOL allowsAirPlay;

@end
@implementation ViewController : UITableViewController
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {

//    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    [super viewWillAppear:animated];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                
                // -- Reachable -- //
                
                [ProgressHUD dismiss];
                
                
                break;
                
            }
            case AFNetworkReachabilityStatusNotReachable:
            default:
                // -- Not reachable -- //
                
                [ProgressHUD show:@"Live Box needs an internet connection. Please connect to the internet and return to the app!" Interaction:NO];
                
                
                break;
        }
        
        
        
    }];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // changing the unselected image color, you should change the selected image
    // color if you want them to be different
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"Featured_selectedImage"]
                                     imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.image = [[UIImage imageNamed:@"Featured"]
                             imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}




-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://api.liveboxtv.gq/free.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *mainOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    mainOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [mainOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.applicationsArray = (NSArray *)responseObject;
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    [mainOperation start];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.applicationsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChannelsTableViewCell *cell = (ChannelsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"appCell" forIndexPath:indexPath];
    cell.name.text = self.applicationsArray[(unsigned int)indexPath.row][@"name"];
    
    return cell;
}

-(IBAction)donate {
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=D9X7Y6LJZPZR8"]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    NSURL *url = [NSURL URLWithString: self.applicationsArray[(unsigned int)indexPath.row][@"streamurl"]];
    NSString *webcheck = self.applicationsArray[(unsigned int)indexPath.row][@"webcheck"];
    if([webcheck  isEqual: @"true"]) {
    [[UIApplication sharedApplication] openURL:url];
    } else {
    
    
  AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self presentViewController:playerViewController animated:YES completion:nil];
    player.play;
        [player setAllowsExternalPlayback:YES];
        [player setUsesExternalPlaybackWhileExternalScreenIsActive: YES];
        [player setUsesAirPlayVideoWhileAirPlayScreenIsActive:YES];
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        MPVolumeView *volumeView = [ [MPVolumeView alloc] init] ;
        [volumeView setShowsVolumeSlider:NO];
        [volumeView sizeToFit];
        
        //  is where you'll be displaying the AirPlay icon/picker
        //[volumeView addSubview:volumeView];

    }
}
/*- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    switch (event.subtype) {
        case UIEventSubtypeRemoteControlTogglePlayPause:
            if([_player rate] == 0){
                [player play];
            } else {
                [player pause];
            }
            break;
        case UIEventSubtypeRemoteControlPlay:
            [player play];
            break;
        case UIEventSubtypeRemoteControlPause:
            [player pause];
            break;
        default:
            break;
    }
}
 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.00f;
    
}

@end