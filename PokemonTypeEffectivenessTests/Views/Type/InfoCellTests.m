#import "InfoCellTests.h"
#import "InfoCell.h"

@implementation InfoCellTests

- (void) testSetsLabels {
    InfoCell *cell = [InfoCell create];
    [cell setPokemon:@"Articuno" withTypes:@[@"ice", @"flying"]];
    XCTAssertEqualObjects([cell.name text], @"Articuno");
    XCTAssertEqualObjects([cell.types text], @"ice | flying");
}

@end