#import "CTCustomTableViewCell/CTCustomTableViewCell.h"

@class ADBannerView;

@interface AdCell : CTCustomTableViewCell {
}
@property(weak, nonatomic) IBOutlet ADBannerView *adView;

@end