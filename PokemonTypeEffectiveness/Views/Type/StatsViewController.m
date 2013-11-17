#import "StatsViewController.h"
#import "PokemonStore.h"
#import "StatsCell.h"

@implementation StatsViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *statOrder = @[@"hp", @"attack", @"defense", @"special_attack", @"special_defense", @"speed"];
    NSDictionary *statLabels = @{
            @"hp" : @"HP",
            @"attack" : @"Attack",
            @"defense" : @"Defense",
            @"special_attack" : @"Sp. Attack",
            @"special_defense" : @"Sp. Defense",
            @"speed" : @"Speed"
    };

    StatsCell *statsCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(StatsCell.class)];
    if( !statsCell ){
        statsCell = [StatsCell create];
    }

    NSString *currentStat = statOrder[(NSUInteger) [indexPath row]];
    [statsCell.label setText:statLabels[currentStat]];
    NSString *stat = [self.stats[currentStat] stringValue];
    [statsCell.value setText:stat];
    return statsCell;
}

- (NSDictionary*) stats {
    return [[PokemonStore instance] statsFor: self.pokemon];
}

@end