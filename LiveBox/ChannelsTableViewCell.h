#import <UIKit/UIKit.h>
#import "JSON.h"

@interface ChannelsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *developer;
@property (weak, nonatomic) IBOutlet UILabel *insight;
@property (weak, nonatomic) IBOutlet UILabel *streamurl;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) JSON *app;
@end
