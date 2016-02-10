
/*
#import "ChannelInfoViewController.h"
#import "ChannelsTableViewCell.h"
#import "ResizableTextCell.h"
#import "UIImageView+XLProgressIndicator.h"
#import <AFNetworking.h>
#import "ViewController.h"


@implementation ChannelInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.app[@"name"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 4;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ChannelsTableViewCell *cell = (ChannelsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ChannelsTableViewCell"];
            cell.appName.text = self.app[@"name"];
            cell.appCategory.text = self.app[@"category"];
            
            
            return cell;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            ResizableTextCell *cell = (ResizableTextCell *)[tableView dequeueReusableCellWithIdentifier:@"resizabeCell"];
            cell.text.text = self.app[@"about"];
            [cell.text setFont:[UIFont systemFontOfSize:16]];
            cell.text.scrollEnabled = false;
        
            
            return cell;
        }




-(CGFloat)heightForText:(NSString *)text
{
    NSInteger MAX_HEIGHT = 2000;
    UITextView * textView = [[UITextView alloc] initWithFrame: CGRectMake(0, 0, 320, MAX_HEIGHT)];
    textView.text = text;
    textView.font = [UIFont boldSystemFontOfSize:16];
    [textView sizeToFit];
    return textView.frame.size.height;
}

-(IBAction)watch:(id)sender {
    
    NSString *url = [NSString stringWithFormat:self.app[@"itmslink"]];

}
        
        
        
@end
*/