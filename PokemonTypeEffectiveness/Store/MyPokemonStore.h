@interface MyPokemonStore : NSObject

+ (instancetype)instance;

- (void)load;

- (void)empty;

- (NSArray *)all;

- (void)remove:(NSString *)pokemon;

- (void)add:(NSString *)pokemon;

@property(nonatomic, strong) NSMutableArray *pokemon;
@end