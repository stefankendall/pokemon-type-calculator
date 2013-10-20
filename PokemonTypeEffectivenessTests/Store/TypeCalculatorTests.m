#import "TypeCalculatorTests.h"
#import "PokemonStore.h"
#import "TypeCalculator.h"

@implementation TypeCalculatorTests

- (void)setup {
    [[PokemonStore instance] load];
}

- (void)testReturnsTypeEffectivenessForTypes {
    NSDictionary *effectiveness = [[TypeCalculator new] effectivenessAgainst:@[@"bug", @"grass"]];
    XCTAssertEqual([[effectiveness allKeys] count], (NSUInteger) 18);
    XCTAssertEqualObjects(effectiveness[@"flying"], N(4));
}

@end