#import "CompareProtocol.h"

@interface StatsViewController : UITableViewController<CompareProtocol>
@property(nonatomic, copy) NSString *pokemon;
@property(nonatomic, copy) NSString *comparingPokemon;
@end