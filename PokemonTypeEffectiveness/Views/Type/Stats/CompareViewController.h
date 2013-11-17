#import "PokemonListViewController.h"

@protocol CompareProtocol;

@interface CompareViewController : PokemonListViewController

@property(nonatomic, strong) NSObject <CompareProtocol> *comparer;
@end