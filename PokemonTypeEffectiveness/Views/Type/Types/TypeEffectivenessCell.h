#import "CTCustomTableViewCell.h"

@interface TypeEffectivenessCell : CTCustomTableViewCell {}
@property (weak, nonatomic) IBOutlet UILabel *multiplier;
@property (weak, nonatomic) IBOutlet UILabel *type;

- (void)setType:(NSString *)type withMultipler:(NSDecimalNumber *)multipler;
@end