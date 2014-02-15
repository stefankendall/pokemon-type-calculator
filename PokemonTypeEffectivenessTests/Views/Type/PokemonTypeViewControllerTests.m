#import "PokemonTypeViewControllerTests.h"
#import "PokemonStore.h"
#import "PokemonTypeViewController.h"
#import "InfoCellWithMega.h"
#import "TestHelper.h"

@implementation PokemonTypeViewControllerTests

- (void)setUp {
    [[PokemonStore instance] load];
}

- (void)testHasSectionsForSuperNotEffectiveAndImmune {
    PokemonTypeViewController *datasource = (PokemonTypeViewController *) [TestHelper controllerForId: @"matchups"];
    [datasource setPokemon:@"Charizard"];
    XCTAssertEqual([datasource numberOfSectionsInTableView:nil], (NSInteger) 4);
    XCTAssertEqualObjects([datasource tableView:nil titleForHeaderInSection:1], @"Super Effective");
    XCTAssertEqualObjects([datasource tableView:nil titleForHeaderInSection:2], @"Immune");
    XCTAssertEqualObjects([datasource tableView:nil titleForHeaderInSection:3], @"Not Effective");

    [datasource setPokemon:@"Ditto"];
    XCTAssertEqual([datasource numberOfSectionsInTableView:nil], (NSInteger) 3);
    XCTAssertEqualObjects([datasource tableView:nil titleForHeaderInSection:1], @"Super Effective");
    XCTAssertEqualObjects([datasource tableView:nil titleForHeaderInSection:2], @"Immune");
}

- (void)testSuperEffectiveTypes {
    PokemonTypeViewController *datasource = (PokemonTypeViewController *) [TestHelper controllerForId: @"matchups"];
    [datasource setPokemon:@"Scizor"];
    NSArray *expected = @[@"fire"];
    XCTAssertEqualObjects([datasource superEffectiveTypes], expected);
}

- (void)testNotEffectiveTypes {
    PokemonTypeViewController *datasource = (PokemonTypeViewController *) [TestHelper controllerForId: @"matchups"];
    [datasource setPokemon:@"Scizor"];
    NSArray *expected = @[
            @"bug",
            @"dragon",
            @"fairy",
            @"grass",
            @"ice",
            @"normal",
            @"psychic",
            @"steel",
    ];
    XCTAssertEqualObjects([datasource notEffectiveTypes], expected);
}

- (void)testImmuneTypes {
    PokemonTypeViewController *datasource = (PokemonTypeViewController *) [TestHelper controllerForId: @"matchups"];
    [datasource setPokemon:@"Scizor"];
    NSArray *expected = @[
            @"poison"
    ];
    XCTAssertEqualObjects([datasource immuneTypes], expected);
}

- (void)testCreatesTypeCellsForPokemon {
    PokemonTypeViewController *datasource = (PokemonTypeViewController *) [TestHelper controllerForId: @"matchups"];
    [datasource setPokemon:@"Scizor"];

    NSInteger superEffectiveSection = [datasource superEffectiveSection];
    XCTAssertEqual([datasource tableView:nil numberOfRowsInSection:superEffectiveSection], 1);
    NSInteger immuneSection = [datasource immuneSection];
    XCTAssertEqual([datasource tableView:nil numberOfRowsInSection:immuneSection], 1);
    NSInteger notEffectiveSection = [datasource notEffectiveSection];
    XCTAssertEqual([datasource tableView:nil numberOfRowsInSection:notEffectiveSection], 8);
}

- (void)testHasMegaCellForPokemonWithMega {
    PokemonTypeViewController *datasource = (PokemonTypeViewController *) [TestHelper controllerForId: @"matchups"];
    [datasource setPokemon:@"Bidoof"];
    UITableViewCell *cell = [datasource tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertFalse([cell isKindOfClass:InfoCellWithMega.class]);

    [datasource setPokemon:@"Charizard"];
    cell = [datasource tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertTrue([cell isKindOfClass:InfoCellWithMega.class]);
}

@end