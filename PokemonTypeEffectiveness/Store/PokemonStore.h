@interface PokemonStore : NSObject
+ (instancetype)instance;

- (void)load;

- (NSArray *)typesFor:(NSString *)pokemonName;

- (NSArray *)pokemonNames;

@property(nonatomic, strong) NSDictionary *pokemonTypeMap;
@end