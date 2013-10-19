@interface PokemonStore : NSObject
+ (instancetype)instance;

- (void)load;

- (NSArray *)typesFor:(NSString *)pokemonName;

- (NSArray *)names;

@property(nonatomic, strong) NSDictionary *pokemonTypeMap;

- (NSArray *)namesMatching:(NSString *)name;
@end