#import "AddPokemonViewController.h"
#import "MyPokemonStore.h"

@implementation AddPokemonViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *pokemon = self.pokemonNames[(NSUInteger) [indexPath row]];
    [[MyPokemonStore instance] add: pokemon];
    [self.navigationController popViewControllerAnimated:NO];
}

@end