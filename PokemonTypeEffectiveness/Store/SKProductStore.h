#import <objc/NSObject.h>
@class SKProduct;

@interface SKProductStore : NSObject

+ (instancetype)instance;

- (SKProduct *)productById:(NSString *)productId;

- (void)loadProducts:(void (^)())callback;

- (NSString *)priceOf:(NSString *)productId;

@property(nonatomic, strong) NSArray *products;

- (BOOL)isLoaded;

@property(nonatomic, strong) NSArray *allPurchaseIds;

@end