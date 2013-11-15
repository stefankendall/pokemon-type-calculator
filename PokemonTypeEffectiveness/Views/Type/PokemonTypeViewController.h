extern int const INFO_SECTION;

@interface PokemonTypeViewController : UITableViewController
@property(nonatomic, copy) NSString *pokemon;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *statsButton;
- (IBAction)statsButtonTapped:(id)sender;
@end