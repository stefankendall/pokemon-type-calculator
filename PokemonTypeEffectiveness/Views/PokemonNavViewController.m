#import <ViewDeck/IIViewDeckController.h>
#import "PokemonNavViewController.h"

@implementation PokemonNavViewController

- (void)viewDidLoad {
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

    NSString *storyboardId = rowMapping[[NSNumber numberWithInt:[indexPath row]]];
    [self.viewDeckController setCenterController:[storyboard instantiateViewControllerWithIdentifier:storyboardId]];
    [self.viewDeckController closeLeftViewAnimated:YES];
}

@end