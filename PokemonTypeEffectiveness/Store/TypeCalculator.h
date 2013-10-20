@interface TypeCalculator : NSObject

@property(nonatomic, strong) NSDictionary *typeChart;

-(NSDictionary *)effectivenessAgainst: (NSArray *) types;
@end