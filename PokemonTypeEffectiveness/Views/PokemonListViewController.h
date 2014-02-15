#import "MegaTransitionDelegate.h"

@interface PokemonListViewController : UITableViewController <UISearchBarDelegate, MegaTransitionDelegate> {
}
@property(weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(nonatomic, strong) NSString *mega;

- (NSArray *)pokemonNames;
@end