#import "StatsViewControllerTests.h"
#import "StatsViewController.h"
#import "StatsCell.h"
#import "TestHelper.h"
#import "StatsCompareCell.h"

@implementation StatsViewControllerTests

- (void)testSetsStatsForPokemon {
    StatsViewController *datasource = (StatsViewController *) [TestHelper controllerForId:@"stats"];
    datasource.pokemon = @"Charizard";

    StatsCell *hp = (StatsCell *) [datasource tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    StatsCell *attack = (StatsCell *) [datasource tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];

    XCTAssertEqualObjects(hp.label.text, @"HP");
    XCTAssertEqualObjects(hp.value.text, @"78");
    XCTAssertEqualObjects(attack.label.text, @"Attack");
    XCTAssertEqualObjects(attack.value.text, @"84");
}

- (void)testUsesCompareCellsWhenComparing {
    StatsViewController *controller = (StatsViewController *) [TestHelper controllerForId:@"stats"];
    [controller setPokemon:@"Scizor"];
    [controller setComparingPokemon:@"Aegislash"];
    StatsCompareCell *cell = (StatsCompareCell *) [controller tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertTrue([cell isKindOfClass:StatsCompareCell.class]);
    XCTAssertEqualObjects([[cell label] text], @"HP");
    XCTAssertEqualObjects([[cell value1] text], @"70");
    XCTAssertEqualObjects([[cell value2] text], @"60");
}

@end