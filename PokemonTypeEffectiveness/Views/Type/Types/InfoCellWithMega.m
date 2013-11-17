#import "InfoCellWithMega.h"
#import <QuartzCore/QuartzCore.h>

@implementation InfoCellWithMega

- (void)setMegas:(NSArray *)megas {
    _megas = megas;

    if ([megas count] == 1) {
        [self.mega2 setHidden:YES];
        [self.mega1 setTitle:@"Mega" forState:UIControlStateNormal];
    }
    else {
        [self.mega2 setHidden:NO];
        [self.mega1 setTitle:@"Mega X" forState:UIControlStateNormal];
    }
}

@end