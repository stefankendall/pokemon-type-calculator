#import <iAd/iAd.h>
#import "MegaTransitionDelegate.h"

@class ADBannerView;

@interface PokemonListViewController : UITableViewController <UISearchBarDelegate, MegaTransitionDelegate, ADBannerViewDelegate> {
}
@property(weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(nonatomic, strong) NSString *mega;

- (NSArray *)pokemonNames;
@end