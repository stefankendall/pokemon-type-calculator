#import "CompareProtocol.h"
#import "PKTableViewController.h"

@interface MyPokemonViewController : PKTableViewController {}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteButton;
@property(nonatomic, copy) NSString *tappedPokemonName;
@end