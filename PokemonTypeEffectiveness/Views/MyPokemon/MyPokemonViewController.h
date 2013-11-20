#import "CompareProtocol.h"

@interface MyPokemonViewController : UITableViewController {}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteButton;
@property(nonatomic, copy) NSString *tappedPokemonName;
@end