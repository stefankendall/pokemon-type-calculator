#import <iAd/iAd.h>
#import "MegaTransitionDelegate.h"

@class PokemonListViewController;

@interface PokemonTypeViewController : UITableViewController <ADBannerViewDelegate>
@property(nonatomic, copy) NSString *pokemon;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *statsButton;
@property(nonatomic, strong) PokemonListViewController *listViewController;

@property(nonatomic) BOOL hidesMega;

@property(nonatomic) BOOL showingAds;

- (NSInteger)superEffectiveSection;

- (NSInteger)immuneSection;

- (NSInteger)notEffectiveSection;

- (NSArray *)superEffectiveTypes;

- (NSArray *)notEffectiveTypes;

- (NSArray *)immuneTypes;
@end