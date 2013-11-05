#import "CTCustomTableViewCell.h"

@interface InfoCell : CTCustomTableViewCell {
}
@property(weak, nonatomic) IBOutlet UILabel *types;

- (void)setPokemonTypes: (NSArray *) types;

@end