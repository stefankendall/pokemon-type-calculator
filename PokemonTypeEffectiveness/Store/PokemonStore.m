#import "PokemonStore.h"

@implementation PokemonStore

+ (instancetype)instance {
    static PokemonStore *store = nil;
    static dispatch_once_t onceToken = 0;

    dispatch_once(&onceToken, ^{
        store = [PokemonStore new];
    });

    return store;
}

- (void)load {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pokemon" ofType:@"json"];
    NSString *data = [NSString stringWithContentsOfFile:path
                                               encoding:NSUTF8StringEncoding
                                                  error:nil];
    self.pokemonTypeMap =
            [NSJSONSerialization JSONObjectWithData:[data dataUsingEncoding:NSUTF8StringEncoding]
                                            options:NSJSONReadingMutableContainers
                                              error:nil];
}

- (NSArray *)typesFor:(NSString *)pokemonName {
    return self.pokemonTypeMap[pokemonName];
}

- (NSArray *)names {
    return [[self.pokemonTypeMap allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)namesMatching:(NSString *)filter {
    if (filter.length == 0) {
        return [self names];
    }

    return [[self names] filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *name, NSDictionary *bindings) {
        return [name rangeOfString:filter].location != NSNotFound;
    }]];
}

@end