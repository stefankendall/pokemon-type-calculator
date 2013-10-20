#import "PokemonTypeViewControllerTests.h"
#import "PokemonTypeViewController.h"
#import "PokemonStore.h"

@implementation PokemonTypeViewControllerTests

- (void)setup {
    [[PokemonStore instance] load];
}

- (void)testHasSuperEffectiveAndNotEffectiveSections {
    PokemonTypeViewController *controller = [self getControllerById:@"matchups"];
    XCTAssertEqual([controller numberOfSectionsInTableView:controller.tableView], (NSInteger) 3);
}

- (void)testSuperEffectiveTypes {
    PokemonTypeViewController *controller = [self getControllerById:@"matchups"];
    [controller setPokemon:@"Scizor"];
    NSArray *expected = @[@"fire"];
    XCTAssertEqualObjects([controller superEffectiveTypes], expected);
}

- (void)testNotEffectiveTypes {
    PokemonTypeViewController *controller = [self getControllerById:@"matchups"];
    [controller setPokemon:@"Scizor"];
    NSArray *expected = @[
            @"bug",
            @"dragon",
            @"fairy",
            @"grass",
            @"ice",
            @"normal",
            @"poison",
            @"psychic",
            @"steel",
    ];
    XCTAssertEqualObjects([controller notEffectiveTypes], expected);
}

- (void)testCreatesTypeCellsForPokemon {
    PokemonTypeViewController *controller = [self getControllerById:@"matchups"];
    [controller setPokemon:@"Scizor"];

    XCTAssertEqual([controller tableView:controller.tableView numberOfRowsInSection:SUPER_EFFECTIVE_SECTION], 1);
    XCTAssertEqual([controller tableView:controller.tableView numberOfRowsInSection:NOT_EFFECTIVE_SECTION], 9);
}

- (id)getControllerById:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:identifier];
    [controller loadView];
    [controller viewDidLoad];
    [controller viewWillAppear:YES];
    return controller;
}

@end