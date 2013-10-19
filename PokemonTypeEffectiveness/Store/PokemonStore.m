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
    NSError *error = nil;
    NSString *data = [NSString stringWithContentsOfFile:path
                                               encoding:NSUTF8StringEncoding
                                                  error:&error];
    NSLog(@"%@", data);
}

- (NSDictionary *)pokemonTypeMap {
    return nil;
}
@end