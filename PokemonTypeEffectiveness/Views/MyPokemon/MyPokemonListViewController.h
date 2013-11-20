#import "CompareProtocol.h"

@interface MyPokemonListViewController : UITableViewController

@property(nonatomic, strong) NSObject <CompareProtocol> *comparer;
@end