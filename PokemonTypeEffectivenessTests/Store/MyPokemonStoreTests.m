#import <XCTest/XCTest.h>
#import "MyPokemonStoreTests.h"
#import "MyPokemonStore.h"

@implementation MyPokemonStoreTests

- (void)setUp {
    [[MyPokemonStore instance] load];
    [[MyPokemonStore instance] empty];
}

- (void)testCanAdd {
    NSString *pokemon = @"Charizard";
    [[MyPokemonStore instance] add:pokemon];
    XCTAssertEqualObjects( [[MyPokemonStore instance] pokemon], @[@"Charizard"]);
}

- (void)testDoesNotAddDuplicates {
    [[MyPokemonStore instance] add:@"Charizard"];
    [[MyPokemonStore instance] add:@"Charizard"];
    XCTAssertEqualObjects( [[MyPokemonStore instance] pokemon], @[@"Charizard"]);
}

- (void)testCanRemove {
    [[MyPokemonStore instance] add:@"Charizard X"];
    [[MyPokemonStore instance] add:@"Charizard Y"];
    [[MyPokemonStore instance] add:@"Charizard Z"];
    [[MyPokemonStore instance] remove:@"Charizard Z"];
    NSArray *expected = @[@"Charizard X", @"Charizard Y"];
    XCTAssertEqualObjects( [[MyPokemonStore instance] pokemon], expected);
}

@end