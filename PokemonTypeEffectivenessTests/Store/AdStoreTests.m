#import <XCTest/XCTest.h>
#import "AdStoreTests.h"
#import "AdStore.h"

@implementation AdStoreTests

- (void)testAdsDefaultOn {
    [[AdStore instance] reset];
    XCTAssertTrue([[AdStore instance] adsEnabled]);
}

- (void)testDisablesAds {
    [[AdStore instance] reset];
    [[AdStore instance] disableAds];
    XCTAssertFalse([[AdStore instance] adsEnabled]);
}

- (void)testDisableAdsForever {
    [[AdStore instance] reset];
    [[AdStore instance] disableAdsForever];
    XCTAssertFalse([[AdStore instance] adsEnabled]);

}

@end