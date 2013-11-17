#import "CompareViewController.h"
#import "CompareProtocol.h"

@implementation CompareViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.comparer compareTo: self.pokemonNames[(NSUInteger) [indexPath row]]];
    [self.navigationController popViewControllerAnimated:NO];
}

@end