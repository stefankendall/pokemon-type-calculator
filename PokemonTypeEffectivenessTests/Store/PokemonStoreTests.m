#import "PokemonStoreTests.h"
#import "PokemonStore.h"

@implementation PokemonStoreTests

-(void) testLoadsPokemonDataFromFile {
    [[PokemonStore instance] load];
    NSDictionary *data = [PokemonStore instance].pokemonTypeMap;
    XCTAssertEqual([data count], (NSUInteger)649);

    NSArray *types = @[@"fire", @"flying"];
    XCTAssertEqualObjects(types, [[PokemonStore instance] typesFor: @"Charizard"]);
    XCTAssertEqualObjects([[PokemonStore instance] pokemonNames][0], @"Abomasnow");
}

@end