#import "InfoCell.h"

@interface InfoCellWithMega : InfoCell {
}
@property(weak, nonatomic) IBOutlet UIButton *mega1;
@property(weak, nonatomic) IBOutlet UIButton *mega2;

- (void)setMegas:(NSArray *)array;

@property(nonatomic, strong) NSArray *megas;
@end