@interface AdStore : NSObject

@property(nonatomic) BOOL adsEnabled;

- (void)reset;

+ (instancetype)instance;

- (void)disableAds;

- (void)disableAdsForever;
@end