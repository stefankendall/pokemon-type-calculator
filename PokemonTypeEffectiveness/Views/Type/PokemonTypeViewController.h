#import "MegaTransitionDelegate.h"

@class PokemonListViewController;

extern int const INFO_SECTION;

@interface PokemonTypeViewController : UITableViewController<MegaTransitionDelegate>
@property(nonatomic, copy) NSString *pokemon;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *statsButton;
@property(nonatomic, strong) PokemonListViewController *listViewController;

- (IBAction)statsButtonTapped:(id)sender;
@end