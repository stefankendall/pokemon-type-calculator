#import "AddPokemonViewController.h"

@implementation AddPokemonViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController popViewControllerAnimated:NO];
}

@end