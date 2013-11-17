#import "MegaTransitionDelegate.h"

@class PokemonListViewController;

extern int const INFO_SECTION;

@interface PokemonTypeViewController : UITableViewController
@property(nonatomic, copy) NSString *pokemon;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *statsButton;
@property(nonatomic, strong) PokemonListViewController *listViewController;

- (NSInteger)superEffectiveSection;

- (NSInteger)immuneSection;

- (NSInteger)notEffectiveSection;

- (NSArray *)superEffectiveTypes;

- (NSArray *)notEffectiveTypes;

- (NSArray *)immuneTypes;
@end