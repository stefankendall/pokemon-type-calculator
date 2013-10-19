#import "PokemonStoreTests.h"
#import "PokemonStore.h"

@implementation PokemonStoreTests

- (void)testLoadsPokemonDataFromFile {
    [[PokemonStore instance] load];
    NSDictionary *data = [PokemonStore instance].pokemonTypeMap;
    XCTAssertEqual([data count], (NSUInteger) 649);

    NSArray *types = @[@"fire", @"flying"];
    XCTAssertEqualObjects(types, [[PokemonStore instance] typesFor:@"Charizard"]);
    XCTAssertEqualObjects([[PokemonStore instance] names][0], @"Abomasnow");
}

- (void)testFiltersPokemonNames {
    [[PokemonStore instance] load];
    NSArray *filteredList = [[PokemonStore instance] namesMatching:@"Mime"];
    NSArray *expected = @[@"Mime Jr", @"Mr Mime"];
    XCTAssertEqualObjects(filteredList, expected);
    XCTAssertEqual([[[PokemonStore instance] namesMatching:@""] count], (NSUInteger) 649);
}

@end