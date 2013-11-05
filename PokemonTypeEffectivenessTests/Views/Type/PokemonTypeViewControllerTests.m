#import "PokemonTypeViewControllerTests.h"
#import "PokemonTypeViewController.h"
#import "PokemonStore.h"

@implementation PokemonTypeViewControllerTests

- (id)getControllerById:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:identifier];
    [controller loadView];
    [controller viewDidLoad];
    [controller viewWillAppear:YES];
    return controller;
}

@end