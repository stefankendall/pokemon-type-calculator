#import <iAd/iAd.h>
#import "PKTableViewController.h"
#import "AdStore.h"

@implementation PKTableViewController

- (void)viewDidLoad {
    if ([self respondsToSelector:@selector(canDisplayBannerAds)]) {
        self.canDisplayBannerAds = [[AdStore instance] adsEnabled];
    }
}


@end