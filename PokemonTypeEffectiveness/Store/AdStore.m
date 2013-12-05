#import "AdStore.h"

@implementation AdStore

- (void)reset {
    [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:@"adsDisabled"];
    [self init];
}

- (id)init {
    self = [super init];
    if (self) {
        self.adsEnabled = ![[NSUbiquitousKeyValueStore defaultStore] boolForKey:@"adsDisabled"];
    }

    return self;
}

+ (instancetype)instance {
    static AdStore *store = nil;
    static dispatch_once_t onceToken = 0;

    dispatch_once(&onceToken, ^{
        store = [AdStore new];
    });

    return store;
}

- (void)disableAds {
    self.adsEnabled = NO;
}

- (void)disableAdsForever {
    [[NSUbiquitousKeyValueStore defaultStore] setBool:YES forKey:@"adsDisabled"];
    [self init];
}

@end