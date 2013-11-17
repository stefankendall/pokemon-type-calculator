#import "StatsViewController.h"
#import "PokemonStore.h"
#import "StatsCell.h"
#import "StatsCompareCell.h"
#import "CompareViewController.h"

@implementation StatsViewController

- (void)viewDidLoad {
    self.statOrder = @[@"hp", @"attack", @"defense", @"special_attack", @"special_defense", @"speed"];
    self.statLabels = @{
            @"hp" : @"HP",
            @"attack" : @"Attack",
            @"defense" : @"Defense",
            @"special_attack" : @"Sp. Attack",
            @"special_defense" : @"Sp. Defense",
            @"speed" : @"Speed"
    };
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.comparingPokemon = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CompareViewController *compareViewController = [segue destinationViewController];
    [compareViewController setComparer:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.comparingPokemon) {
        return [self compareStatCell:tableView indexPath:indexPath];
    }
    else {
        return [self singleStatCell:tableView indexPath:indexPath];
    }
}

- (UITableViewCell *)compareStatCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    StatsCompareCell *statsCompareCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(StatsCompareCell.class)];
    if (!statsCompareCell) {
        statsCompareCell = [StatsCompareCell create];
    }

    NSString *currentStat = self.statOrder[(NSUInteger) [indexPath row]];
    [statsCompareCell.label setText:self.statLabels[currentStat]];
    [statsCompareCell.value1 setText:[[[PokemonStore instance] statsFor:self.pokemon][currentStat] stringValue]];
    [statsCompareCell.value2 setText:[[[PokemonStore instance] statsFor:self.comparingPokemon][currentStat] stringValue]];
    return statsCompareCell;
}

- (UITableViewCell *)singleStatCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    StatsCell *statsCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(StatsCell.class)];
    if (!statsCell) {
        statsCell = [StatsCell create];
    }

    NSString *currentStat = self.statOrder[(NSUInteger) [indexPath row]];
    [statsCell.label setText:self.statLabels[currentStat]];
    [statsCell.value setText:[[[PokemonStore instance] statsFor:self.pokemon][currentStat] stringValue]];
    return statsCell;
}

- (void)compareTo:(NSString *)pokemon {
    self.comparingPokemon = pokemon;
    [self.tableView reloadData];
}

@end