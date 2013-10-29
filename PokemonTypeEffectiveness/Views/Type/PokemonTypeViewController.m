#import "PokemonTypeViewController.h"
#import "InfoCell.h"
#import "PokemonStore.h"
#import "TypeEffectivenessCell.h"
#import "TypeCalculator.h"

int const INFO_SECTION = 0;
int const SUPER_EFFECTIVE_SECTION = 1;
int const NOT_EFFECTIVE_SECTION = 2;

@implementation PokemonTypeViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    self.navigationItem.title = self.pokemon;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == INFO_SECTION) {
        return @"";
    }
    else if (section == SUPER_EFFECTIVE_SECTION) {
        return @"Super Effective";
    }
    else {
        return @"Not Effective";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == INFO_SECTION) {
        return 1;
    }
    else if (section == SUPER_EFFECTIVE_SECTION) {
        return [[self superEffectiveTypes] count];
    }
    else {
        return [[self notEffectiveTypes] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == INFO_SECTION) {
        InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(InfoCell.class)];
        if (!cell) {
            cell = [InfoCell create];
        }

        [cell setPokemonTypes:[[PokemonStore instance] typesFor:self.pokemon]];
        return cell;
    }
    else {
        TypeEffectivenessCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TypeEffectivenessCell.class)];
        if (!cell) {
            cell = [TypeEffectivenessCell create];
        }

        NSString *type = nil;
        if([indexPath section] == SUPER_EFFECTIVE_SECTION){
            type = [self superEffectiveTypes][(NSUInteger) [indexPath row]];
        }
        else {
            type = [self notEffectiveTypes][(NSUInteger) [indexPath row]];
        }
        NSDictionary *effectiveness = [self effectivenessForPokemon];
        [cell setType:type withMultipler:effectiveness[type]];
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(NSArray *) superEffectiveTypes {
    NSDictionary * effectiveness = [self effectivenessForPokemon];
    NSMutableArray *types = [@[] mutableCopy];

    for( NSString *type in [effectiveness allKeys]){
        if([effectiveness[type] compare:N(1)] == NSOrderedDescending){
            [types addObject:type];
        }
    }
    return [types sortedArrayUsingSelector:@selector(compare:)];
}

-(NSArray *) notEffectiveTypes {
    NSDictionary * effectiveness = [self effectivenessForPokemon];
    NSMutableArray *types = [@[] mutableCopy];

    for( NSString *type in [effectiveness allKeys]){
        if([effectiveness[type] compare:N(1)] == NSOrderedAscending){
            [types addObject:type];
        }
    }
    return [types sortedArrayUsingSelector:@selector(compare:)];
}

- (NSDictionary *)effectivenessForPokemon {
    return [[TypeCalculator new] effectivenessAgainst:[[PokemonStore instance] typesFor:self.pokemon]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


@end