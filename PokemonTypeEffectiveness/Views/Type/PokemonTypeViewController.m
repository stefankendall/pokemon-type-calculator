#import "PokemonTypeViewController.h"
#import "InfoCell.h"
#import "PokemonStore.h"
#import "TypeEffectivenessCell.h"
#import "TypeCalculator.h"
#import "TypesDatasource.h"

@interface PokemonTypeViewController()
@property(nonatomic) BOOL showingTypes;
@property(nonatomic, strong) TypesDatasource *typesDatasource;
@end

@implementation PokemonTypeViewController

- (void)viewWillAppear:(BOOL)animated {
    self.showingTypes = YES;
    [self changeStatsButton];
    self.typesDatasource = [TypesDatasource new];
    self.typesDatasource.pokemon = self.pokemon;
    [self.tableView setDataSource:self.typesDatasource];
    [self.tableView setDelegate:self.typesDatasource];
    [self.tableView reloadData];
    self.navigationItem.title = self.pokemon;
}

- (void)changeStatsButton {
    [self.statsButton setTitle:self.showingTypes ? @"Stats" : @"Types"];
}

- (IBAction)statsButtonTapped:(id)sender {
    self.showingTypes = !self.showingTypes;
    [self changeStatsButton];
    [self.tableView reloadData];
}


@end