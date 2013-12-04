#import "AdStore.h"

@implementation AdStore

- (id)init {
    self = [super init];
    if (self) {
        self.adsEnabled = NO;
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

@end