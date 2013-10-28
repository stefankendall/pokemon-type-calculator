#import "TypeEffectivenessCell.h"

@implementation TypeEffectivenessCell

- (void)setType:(NSString *)type withMultipler:(NSDecimalNumber *)multipler {
    [self.multiplier setText:[NSString stringWithFormat:@"%@x", multipler]];
    [self.type setText:type];

    [self.type setTextColor:[self colorForType:type]];
}

- (UIColor *)colorForType:(NSString *)type {
    return @{
            @"normal" : [UIColor darkTextColor],
            @"fighting" : [UIColor colorWithRed:192 / 255.0f green:48 / 255.0f blue:40 / 255.0f alpha:1.0f],
            @"flying" : [UIColor colorWithRed:168 / 255.0f green:144 / 255.0f blue:240 / 255.0f alpha:1.0f],
            @"poison" : [UIColor colorWithRed:160 / 255.0f green:64 / 255.0f blue:160 / 255.0f alpha:1.0f],
            @"ground" : [UIColor colorWithRed:146/255.0f green:125/255.0f blue:68/255.0f alpha:1.0f],
            @"rock" : [UIColor colorWithRed:184 / 255.0f green:160 / 255.0f blue:56 / 255.0f alpha:1.0f],
            @"bug" : [UIColor colorWithRed:109/255.0f green:120/255.0f blue:21/255.0f alpha:1.0f],
            @"ghost" : [UIColor colorWithRed:112 / 255.0f green:88 / 255.0f blue:152 / 255.0f alpha:1.0f],
            @"steel" : [UIColor colorWithRed:156/255.0f green:156/255.0f blue:156/255.0f alpha:1.0f],
            @"fire" : [UIColor colorWithRed:240 / 255.0f green:128 / 255.0f blue:48 / 255.0f alpha:1.0f],
            @"water" : [UIColor blueColor],
            @"grass" : [UIColor colorWithRed:0/255.0f green:132/255.0f blue:0/255.0f alpha:1.0f],
            @"electric" : [UIColor colorWithRed:248 / 255.0f green:196 / 255.0f blue:45 / 255.0f alpha:1.0f],
            @"psychic" : [UIColor colorWithRed:248/255.0f green:88/255.0f blue:136/255.0f alpha:1.0f],
            @"ice" : [UIColor colorWithRed:99/255.0f green:141/255.0f blue:141/255.0f alpha:1.0f],
            @"dragon" : [UIColor colorWithRed:112/255.0f green:56/255.0f blue:248/255.0f alpha:1.0f],
            @"dark" : [UIColor colorWithRed:73/255.0f green:57/255.0f blue:47/255.0f alpha:1.0f],
            @"fairy" : [UIColor colorWithRed:238/255.0f green:127/255.0f blue:195/255.0f alpha:1.0f]
    }

    [type];

}

@end