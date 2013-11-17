#import "CompareProtocol.h"

@interface StatsViewController : UITableViewController<CompareProtocol>
@property(nonatomic, copy) NSString *pokemon;
@property(nonatomic, copy) NSString *comparingPokemon;
@property(nonatomic, strong) NSDictionary *statLabels;
@property(nonatomic, strong) NSArray *statOrder;
@end