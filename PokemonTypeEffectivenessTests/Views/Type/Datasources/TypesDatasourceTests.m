#import "TypesDatasourceTests.h"
#import "PokemonTypeViewController.h"
#import "PokemonStore.h"
#import "TypesDatasource.h"

@implementation TypesDatasourceTests

- (void)setup {
    [[PokemonStore instance] load];
}

- (void)testHasSuperEffectiveAndNotEffectiveSections {
    TypesDatasource *datasource = [TypesDatasource new];
    XCTAssertEqual([datasource numberOfSectionsInTableView:nil], (NSInteger) 3);
}

- (void)testSuperEffectiveTypes {
    TypesDatasource *datasource = [TypesDatasource new];
    [datasource setPokemon:@"Scizor"];
    NSArray *expected = @[@"fire"];
    XCTAssertEqualObjects([datasource superEffectiveTypes], expected);
}

- (void)testNotEffectiveTypes {
    TypesDatasource *datasource = [TypesDatasource new];
    [datasource setPokemon:@"Scizor"];
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
    XCTAssertEqualObjects([datasource notEffectiveTypes], expected);
}

- (void)testCreatesTypeCellsForPokemon {
    TypesDatasource *datasource = [TypesDatasource new];
    [datasource setPokemon:@"Scizor"];

    XCTAssertEqual([datasource tableView:nil numberOfRowsInSection:SUPER_EFFECTIVE_SECTION], 1);
    XCTAssertEqual([datasource tableView:nil numberOfRowsInSection:NOT_EFFECTIVE_SECTION], 9);
}

@end