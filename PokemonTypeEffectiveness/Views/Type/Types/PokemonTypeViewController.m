#import "PokemonTypeViewController.h"
#import "PokemonListViewController.h"
#import "PokemonStore.h"
#import "InfoCell.h"
#import "InfoCellWithMega.h"
#import "TypeEffectivenessCell.h"
#import "TypeCalculator.h"
#import "StatsViewController.h"

const int INFO_SECTION = 0;

@implementation PokemonTypeViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = self.pokemon;
}

- (void)viewDidLoad {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        self.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc]
                initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];


    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    StatsViewController *statsController = [segue destinationViewController];
    statsController.pokemon = self.pokemon;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    int INFO_SECTION_COUNT = 1;
    int SUPER_EFFECTIVE_SECTION_COUNT = [[self superEffectiveTypes] count] > 0 ? 1 : 0;
    int IMMUNE_SECTION_COUNT = [[self immuneTypes] count] > 0 ? 1 : 0;
    int NOT_EFFECTIVE_COUNT = [[self notEffectiveTypes] count] > 0 ? 1 : 0;
    return INFO_SECTION_COUNT + SUPER_EFFECTIVE_SECTION_COUNT + IMMUNE_SECTION_COUNT + NOT_EFFECTIVE_COUNT;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == INFO_SECTION) {
        return @"";
    }
    else if (section == [self superEffectiveSection]) {
        return @"Super Effective";
    }
    else if (section == [self notEffectiveSection]) {
        return @"Not Effective";
    } else {
        return @"Immune";
    }
}

- (NSInteger)superEffectiveSection {
    if ([[self superEffectiveTypes] count] == 0) {
        return -1;
    }
    return 1;
}

- (NSInteger)immuneSection {
    if ([[self immuneTypes] count] == 0) {
        return -1;
    }

    int section = 1;
    if ([self superEffectiveSection] > 0) {
        section++;
    }
    return section;
}

- (NSInteger)notEffectiveSection {
    if ([[self notEffectiveTypes] count] == 0) {
        return -1;
    }

    int section = 1;
    if ([self superEffectiveSection] > 0) {
        section++;
    }
    if ([self immuneSection] > 0) {
        section++;
    }

    return section;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == INFO_SECTION) {
        return 1;
    }
    else if (section == [self superEffectiveSection]) {
        return [[self superEffectiveTypes] count];
    }
    else if (section == [self notEffectiveSection]) {
        return [[self notEffectiveTypes] count];
    }
    else {
        return [[self immuneTypes] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == INFO_SECTION) {
        NSArray *megas = [[PokemonStore instance] megasFor:self.pokemon];
        if ([megas count] == 0) {
            InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(InfoCell.class)];
            if (!cell) {
                cell = [InfoCell create];
            }

            [cell setPokemonTypes:[[PokemonStore instance] typesFor:self.pokemon]];
            return cell;
        }
        else {
            InfoCellWithMega *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(InfoCellWithMega.class)];
            if (!cell) {
                cell = [InfoCellWithMega create];
            }

            [cell setMegas:megas];
            [cell.mega1 addTarget:self action:@selector(mega1Tapped) forControlEvents:UIControlEventTouchUpInside];
            [cell.mega2 addTarget:self action:@selector(mega2Tapped) forControlEvents:UIControlEventTouchUpInside];
            [cell setPokemonTypes:[[PokemonStore instance] typesFor:self.pokemon]];
            return cell;
        }
    }
    else {
        TypeEffectivenessCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TypeEffectivenessCell.class)];
        if (!cell) {
            cell = [TypeEffectivenessCell create];
        }

        NSString *type = nil;
        if ([indexPath section] == [self superEffectiveSection]) {
            type = [self superEffectiveTypes][(NSUInteger) [indexPath row]];
        }
        else if ([indexPath section] == [self notEffectiveSection]) {
            type = [self notEffectiveTypes][(NSUInteger) [indexPath row]];
        }
        else if ([indexPath section] == [self immuneSection]) {
            type = [self immuneTypes][(NSUInteger) [indexPath row]];
        }
        NSDictionary *effectiveness = [self effectivenessForPokemon];
        [cell setType:type withMultipler:effectiveness[type]];
        return cell;
    }
}

- (void)mega1Tapped {
    [self transitionTo:[[PokemonStore instance] megasFor:self.pokemon][0]];
}

- (void)mega2Tapped {
    [self transitionTo:[[PokemonStore instance] megasFor:self.pokemon][1]];
}

- (void)transitionTo:(NSString *)mega {
    [self.listViewController setMega:mega];
    [self.navigationController popViewControllerAnimated:NO];
}

- (NSArray *)superEffectiveTypes {
    NSDictionary *effectiveness = [self effectivenessForPokemon];
    NSMutableArray *types = [@[] mutableCopy];

    for (NSString *type in [effectiveness allKeys]) {
        if ([effectiveness[type] compare:N(1)] == NSOrderedDescending) {
            [types addObject:type];
        }
    }
    return [types sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)notEffectiveTypes {
    NSDictionary *effectiveness = [self effectivenessForPokemon];
    NSMutableArray *types = [@[] mutableCopy];

    for (NSString *type in [effectiveness allKeys]) {
        NSDecimalNumber *multiplier = effectiveness[type];
        if ([multiplier compare:N(1)] == NSOrderedAscending && ![multiplier isEqualToNumber:N(0)]) {
            [types addObject:type];
        }
    }
    return [types sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)immuneTypes {
    NSDictionary *effectiveness = [self effectivenessForPokemon];
    NSMutableArray *types = [@[] mutableCopy];
    for (NSString *type in [effectiveness allKeys]) {
        if ([effectiveness[type] isEqualToNumber:N(0)]) {
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