@interface PokemonStore : NSObject
+ (instancetype)instance;

- (void)load;

- (NSArray *)typesFor:(NSString *)name;

- (NSArray *)names;

@property(nonatomic, strong) NSDictionary *pokemonData;

- (NSArray *)namesMatching:(NSString *)name;

- (NSDictionary *)statsFor:(NSString *)name;
@end