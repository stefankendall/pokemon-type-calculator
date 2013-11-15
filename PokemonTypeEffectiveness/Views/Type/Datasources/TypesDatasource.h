@interface TypesDatasource : NSObject<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSString *pokemon;

- (NSInteger)superEffectiveSection;

- (NSInteger)immuneSection;

- (NSInteger)notEffectiveSection;

- (NSArray *)superEffectiveTypes;

- (NSArray *)notEffectiveTypes;

- (NSArray *)immuneTypes;
@end