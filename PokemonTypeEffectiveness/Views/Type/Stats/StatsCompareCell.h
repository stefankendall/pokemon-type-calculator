#import "CTCustomTableViewCell/CTCustomTableViewCell.h"

@interface StatsCompareCell : CTCustomTableViewCell {}
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *value1;
@property (weak, nonatomic) IBOutlet UILabel *value2;

@end