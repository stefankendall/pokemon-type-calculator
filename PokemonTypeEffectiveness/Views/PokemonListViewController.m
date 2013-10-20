#import "PokemonListViewController.h"
#import "PokemonStore.h"
#import "PokemonTypeViewController.h"

@interface PokemonListViewController ()

@property(nonatomic, strong) NSString *tappedPokemonName;
@end

@implementation PokemonListViewController

- (void)viewDidLoad {
    [self.searchBar setDelegate:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self pokemonNames] count];
}

- (NSArray *)pokemonNames {
    return [[PokemonStore instance] namesMatching:[self.searchBar text]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonListCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PokemonListCell"];
    }

    NSString *pokemonName = self.pokemonNames[(NSUInteger) [indexPath row]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [[cell textLabel] setText:pokemonName];

    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)text {
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar setText:@""];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tappedPokemonName = self.pokemonNames[(NSUInteger) [indexPath row]];
    [self performSegueWithIdentifier:@"showTypeMatchup" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PokemonTypeViewController *typeController = [segue destinationViewController];
    [typeController setPokemon: self.tappedPokemonName];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end