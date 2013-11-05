#import "StatsDatasourceTests.h"
#import "StatsDatasource.h"
#import "StatsCell.h"

@implementation StatsDatasourceTests

- (void)testSetsStatsForPokemon {
    StatsDatasource *datasource = [StatsDatasource new];
    datasource.pokemon = @"Charizard";

    StatsCell *hp = (StatsCell *) [datasource tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    StatsCell *attack = (StatsCell *) [datasource tableView:nil cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];

    XCTAssertEqualObjects(hp.label.text, @"HP");
    XCTAssertEqualObjects(hp.value.text, @"78");
    XCTAssertEqualObjects(attack.label.text, @"Attack");
    XCTAssertEqualObjects(attack.value.text, @"84");
}

@end