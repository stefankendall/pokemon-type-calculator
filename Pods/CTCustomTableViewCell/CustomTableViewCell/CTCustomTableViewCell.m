#import "CTCustomTableViewCell.h"

@implementation CTCustomTableViewCell
+ (instancetype)create {
    NSString *cellClassName = NSStringFromClass([self class]);

    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:cellClassName owner:self options:nil];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    UITableViewCell *cell = nil;
    NSObject *nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[self class]]) {
            cell = (UITableViewCell *) nibItem;
            if ([cell.reuseIdentifier isEqualToString:cellClassName])
                break;
            else
                cell = nil;
        }
    }
    return (CTCustomTableViewCell *) cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self moveConstraintsForIos6AutoLayout];
}

- (void)moveConstraintsForIos6AutoLayout {
    for (NSLayoutConstraint *cellConstraint in self.constraints) {
        [self removeConstraint:cellConstraint];
        id firstItem = cellConstraint.firstItem == self ? self.contentView : cellConstraint.firstItem;
        id seccondItem = cellConstraint.secondItem == self ? self.contentView : cellConstraint.secondItem;
        NSLayoutConstraint *contentViewConstraint =
                [NSLayoutConstraint constraintWithItem:firstItem
                                             attribute:cellConstraint.firstAttribute
                                             relatedBy:cellConstraint.relation
                                                toItem:seccondItem
                                             attribute:cellConstraint.secondAttribute
                                            multiplier:cellConstraint.multiplier
                                              constant:cellConstraint.constant];
        [self.contentView addConstraint:contentViewConstraint];
    }
}
@end