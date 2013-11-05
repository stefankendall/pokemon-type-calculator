extern int const INFO_SECTION;
extern int const SUPER_EFFECTIVE_SECTION;
extern int const NOT_EFFECTIVE_SECTION;

@interface PokemonTypeViewController : UITableViewController
@property(nonatomic, copy) NSString *pokemon;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *statsButton;
- (IBAction)statsButtonTapped:(id)sender;

- (NSArray *)superEffectiveTypes;

- (NSArray *)notEffectiveTypes;
@end