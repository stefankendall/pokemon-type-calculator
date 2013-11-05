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
    self.pokemonData =
            [NSJSONSerialization JSONObjectWithData:[data dataUsingEncoding:NSUTF8StringEncoding]
                                            options:NSJSONReadingMutableContainers
                                              error:nil];
}

- (NSArray *)typesFor:(NSString *)name {
    return self.pokemonData[name][@"types"];
}

- (NSArray *)names {
    return [[self.pokemonData allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (NSDictionary *)statsFor:(NSString *)name {
    return self.pokemonData[name][@"stats"];
}

- (NSArray *)namesMatching:(NSString *)filter {
    if (filter.length == 0) {
        return [self names];
    }

    return [[self names] filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *name, NSDictionary *bindings) {
        return [[name lowercaseString] rangeOfString:[filter lowercaseString]].location == 0;
    }]];
}

@end