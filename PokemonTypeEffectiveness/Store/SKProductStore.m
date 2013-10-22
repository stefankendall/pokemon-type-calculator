#import <StoreKit/StoreKit.h>
#import "SKProductStore.h"
#import "IAPManager.h"
#import "NSArray+Enumerable.h"

@implementation SKProductStore

+ (instancetype)instance {
    static SKProductStore *store = nil;
    static dispatch_once_t onceToken = 0;

    dispatch_once(&onceToken, ^{
        store = [SKProductStore new];
        store.allPurchaseIds = @[
                @"tip1",
                @"tip2",
                @"tip3"
        ];
    });

    return store;
}

- (void)loadProducts:(void (^)())callback {
    [[IAPManager sharedIAPManager] getProductsForIds:self.allPurchaseIds completion:^(NSArray *products) {
        self.products = products;
        if (callback) {
            callback();
        }
    }];
}

- (NSString *)priceOf:(NSString *)productId {
    SKProduct *product = [self productById:productId];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:product.priceLocale];
    return [numberFormatter stringFromNumber:product.price];
}

- (SKProduct *)productById:(NSString *)productId {
    return [self.products detect:^BOOL(SKProduct *product) {
        return [product.productIdentifier isEqualToString:productId];
    }];
}

@end