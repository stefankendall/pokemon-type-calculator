#import "CompareProtocol.h"
#import "CompareViewController.h"
#import "MyPokemonListViewController.h"

@implementation CompareViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.comparer compareTo:self.pokemonNames[(NSUInteger) [indexPath row]]];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MyPokemonListViewController *controller = [segue destinationViewController];
    controller.comparer = self.comparer;
}

@end