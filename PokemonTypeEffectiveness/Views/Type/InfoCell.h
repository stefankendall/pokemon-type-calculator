#import "CTCustomTableViewCell.h"

@interface InfoCell : CTCustomTableViewCell {
}
@property(weak, nonatomic) IBOutlet UILabel *name;
@property(weak, nonatomic) IBOutlet UILabel *types;

- (void)setPokemon:(NSString *)name withTypes: (NSArray *) types;

@end