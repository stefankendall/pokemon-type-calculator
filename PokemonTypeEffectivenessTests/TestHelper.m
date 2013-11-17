#import "TestHelper.h"

@implementation TestHelper

+ (UIViewController *)controllerForId:(NSString *) identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:identifier];
    [controller loadView];
    [controller viewDidLoad];
    [controller viewWillAppear:YES];
    return controller;
}

@end