#import "CompareProtocol.h"
#import "PKTableViewController.h"

@interface MyPokemonListViewController : PKTableViewController

@property(nonatomic, strong) NSObject <CompareProtocol> *comparer;
@end