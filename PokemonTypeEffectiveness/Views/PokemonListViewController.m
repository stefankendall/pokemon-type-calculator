#import "PokemonListViewController.h"
#import "PokemonStore.h"

@implementation PokemonListViewController

- (void)viewDidLoad {
    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight;
    [self.searchBar setDelegate:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[PokemonStore instance] namesMatching:[self.searchBar text]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonListCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PokemonListCell"];
    }

    NSString *pokemonName = [[PokemonStore instance] namesMatching:[self.searchBar text]][(NSUInteger) [indexPath row]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [[cell textLabel] setText:pokemonName];

    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)text {
    [self.tableView reloadData];
}

@end