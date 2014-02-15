#import "CompareProtocol.h"
#import "PKTableViewController.h"

@interface StatsViewController : PKTableViewController<CompareProtocol>
@property(nonatomic, copy) NSString *pokemon;
@property(nonatomic, copy) NSString *comparingPokemon;
@property(nonatomic, strong) NSDictionary *statLabels;
@property(nonatomic, strong) NSArray *statOrder;
@end