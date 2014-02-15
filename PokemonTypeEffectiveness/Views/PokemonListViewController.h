#import "MegaTransitionDelegate.h"
#import "PKTableViewController.h"

@interface PokemonListViewController : PKTableViewController <UISearchBarDelegate, MegaTransitionDelegate> {
}
@property(weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(nonatomic, strong) NSString *mega;

- (NSArray *)pokemonNames;
@end