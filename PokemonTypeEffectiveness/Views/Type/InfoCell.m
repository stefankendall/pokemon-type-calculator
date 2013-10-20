#import "InfoCell.h"

@implementation InfoCell

- (void)setPokemon:(NSString *)name withTypes:(NSArray *)types {
    [self.name setText:name];
    [self.types setText:[types componentsJoinedByString:@" | "]];
}

@end