#import "InfoCell.h"

@implementation InfoCell

- (void)setPokemonTypes:(NSArray *)types {
    [self.types setText:[types componentsJoinedByString:@" | "]];
}

@end