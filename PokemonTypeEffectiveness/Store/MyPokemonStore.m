#import "MyPokemonStore.h"

@implementation MyPokemonStore

+ (instancetype)instance {
    static MyPokemonStore *store = nil;
    static dispatch_once_t onceToken = 0;

    dispatch_once(&onceToken, ^{
        store = [MyPokemonStore new];
    });

    return store;
}

- (void)load {
    self.pokemon = [[[NSUbiquitousKeyValueStore defaultStore] arrayForKey:@"pokemon"] mutableCopy];
    if (!self.pokemon) {
        self.pokemon = [@[] mutableCopy];
    }
}

- (void)empty {
    self.pokemon = [@[] mutableCopy];
    [[NSUbiquitousKeyValueStore defaultStore] setObject:@[] forKey:@"pokemon"];
}

- (NSArray *)all {
    return [[NSArray arrayWithArray:self.pokemon] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)remove:(NSString *)pokemon {
    [self.pokemon removeObject:pokemon];
    [self sync];
}

- (void)add:(NSString *)pokemon {
    if (![self.pokemon containsObject:pokemon]) {
        [self.pokemon addObject:pokemon];
    }
    [self sync];
}

- (void)sync {
    [[NSUbiquitousKeyValueStore defaultStore] setObject:self.pokemon forKey:@"pokemon"];
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
}

@end