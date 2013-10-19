@interface PokemonStore : NSObject
+ (instancetype)instance;

- (void)load;

- (NSDictionary *)pokemonTypeMap;
@end