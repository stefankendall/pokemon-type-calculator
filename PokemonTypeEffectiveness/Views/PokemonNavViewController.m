#import <ViewDeck/IIViewDeckController.h>
#import "PokemonNavViewController.h"
#import "Mailer.h"

@implementation PokemonNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        [self.tableView setContentInset:UIEdgeInsetsMake(20,
                self.tableView.contentInset.left,
                self.tableView.contentInset.bottom,
                self.tableView.contentInset.right)];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSDictionary *rowMapping = @{
            @0 : @"listNav",
            @1 : @"myPokemonNav"
    };

    if (indexPath.row == 2) {
        [self presentFeedbackEmail];
    }
    else {
        NSString *storyboardId = rowMapping[[NSNumber numberWithInt:[indexPath row]]];
        [self.viewDeckController setCenterController:[storyboard instantiateViewControllerWithIdentifier:storyboardId]];
        [self.viewDeckController closeLeftViewAnimated:YES];
    }
}

- (void)presentFeedbackEmail {
    [[[Mailer alloc] initWithSender:self] presentFeedback];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end