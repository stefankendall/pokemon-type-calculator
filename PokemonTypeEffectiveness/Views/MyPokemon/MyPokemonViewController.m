#import "MyPokemonViewController.h"
#import <ViewDeck/IIViewDeckController.h>

@implementation MyPokemonViewController

- (IBAction)revealSidebar:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end