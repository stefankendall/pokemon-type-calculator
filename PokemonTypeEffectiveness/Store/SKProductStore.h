#import <objc/NSObject.h>
@class SKProduct;

@interface SKProductStore : NSObject

+ (instancetype)instance;

- (SKProduct *)productById:(NSString *)productId;

- (void)loadProducts:(void (^)())callback;

@property(nonatomic, strong) NSArray *products;
@property(nonatomic, strong) NSArray *allPurchaseIds;

@end