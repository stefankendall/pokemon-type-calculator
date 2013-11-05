@interface TypesDatasource : NSObject<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSString *pokemon;

- (NSArray *)superEffectiveTypes;

- (NSArray *)notEffectiveTypes;

@end