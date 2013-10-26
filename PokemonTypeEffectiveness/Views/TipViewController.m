#import <IAPManager/IAPManager.h>
#import "TipViewController.h"
#import "SKProductStore.h"

@implementation TipViewController

- (void)viewWillAppear:(BOOL)animated {
    if ([[SKProductStore instance] isLoaded]) {
        [self.tip1 setText:[[SKProductStore instance] priceOf:@"tip1"]];
        [self.tip2 setText:[[SKProductStore instance] priceOf:@"tip2"]];
        [self.tip3 setText:[[SKProductStore instance] priceOf:@"tip3"]];
    }
    else {
        [self.tip1 setText:@"Can't reach store"];
        [self.tip2 setText:@"Can't reach store"];
        [self.tip3 setText:@"Can't reach store"];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int tipLevel = [indexPath row] + 1;
    NSString *tip = [NSString stringWithFormat:@"tip%d", tipLevel];
    if ([[SKProductStore instance] isLoaded]) {
        [[IAPManager sharedIAPManager] purchaseProductForId:tip completion:^(SKPaymentTransaction *transaction) {
            [self thanksMessage];
        }                                             error:^(NSError *error) {
            [self errorMessage];
        }];
    }
}

- (void)thanksMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@":)" message:@"Thanks for the tip!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)errorMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@":(" message:@"Something went wrong trying to reach the store" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


@end