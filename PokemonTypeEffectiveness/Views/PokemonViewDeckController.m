#import "PokemonViewDeckController.h"

@implementation PokemonViewDeckController

- (id)initWithCoder:(NSCoder *)aDecoder {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    self = [super initWithCenterViewController:[storyboard instantiateViewControllerWithIdentifier:@"listNav"]
                            leftViewController:[storyboard instantiateViewControllerWithIdentifier:@"nav"]];
    if (self) {
        self.panningCancelsTouchesInView = NO;
        self.enabled = NO;
        self.leftSize = 60;
    }
    return self;
}

@end