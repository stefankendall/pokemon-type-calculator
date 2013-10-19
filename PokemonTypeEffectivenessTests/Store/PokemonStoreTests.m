#import "PokemonStoreTests.h"
#import "PokemonStore.h"

@implementation PokemonStoreTests

-(void) testLoadsPokemonDataFromFile {
    [[PokemonStore instance] load];
    NSDictionary *data = [[PokemonStore instance] pokemonTypeMap];
    XCTAssertEqual([data count], 649U);
}

@end