@class PokemonTypeViewController;
@protocol MegaTransitionDelegate;

@interface TypesDatasource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSString *pokemon;

@property(nonatomic, strong) NSObject <MegaTransitionDelegate> *megaTransitionDelegate;

- (NSInteger)superEffectiveSection;

- (NSInteger)immuneSection;

- (NSInteger)notEffectiveSection;

- (NSArray *)superEffectiveTypes;

- (NSArray *)notEffectiveTypes;

- (NSArray *)immuneTypes;
@end