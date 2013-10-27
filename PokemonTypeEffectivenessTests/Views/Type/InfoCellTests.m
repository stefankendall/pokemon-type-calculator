#import "InfoCellTests.h"
#import "InfoCell.h"

@implementation InfoCellTests

- (void) testSetsLabels {
    InfoCell *cell = [InfoCell create];
    [cell setPokemonTypes:@[@"ice", @"flying"]];
    XCTAssertEqualObjects([cell.types text], @"ice | flying");
}

@end