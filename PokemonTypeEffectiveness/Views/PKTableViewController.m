#import <iAd/iAd.h>
#import "PKTableViewController.h"
#import "AdStore.h"

@implementation PKTableViewController

- (void)viewDidLoad {
    if ([self respondsToSelector:@selector(canDisplayBannerAds)]) {
        if ([[AdStore instance] adsEnabled]) {
            self.canDisplayBannerAds = YES;
        }
    }
}

@end