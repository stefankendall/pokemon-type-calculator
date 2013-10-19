@interface PokemonStore : NSObject
+ (instancetype)instance;

- (void)load;

- (NSArray *) typesFor: (NSString *) pokemonName;

@property(nonatomic, strong) NSDictionary *pokemonTypeMap;
@end