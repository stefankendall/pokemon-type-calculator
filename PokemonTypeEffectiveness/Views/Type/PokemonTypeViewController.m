#import "PokemonTypeViewController.h"
#import "TypesDatasource.h"
#import "StatsDatasource.h"

@interface PokemonTypeViewController ()
@property(nonatomic) BOOL showingTypes;
@property(nonatomic, strong) TypesDatasource *typesDatasource;
@property(nonatomic, strong) StatsDatasource *statsDatasource;
@end

@implementation PokemonTypeViewController

- (void)viewWillAppear:(BOOL)animated {
    self.showingTypes = YES;

    self.typesDatasource = [TypesDatasource new];
    self.statsDatasource = [StatsDatasource new];
    self.typesDatasource.pokemon = self.pokemon;
    self.statsDatasource.pokemon = self.pokemon;

    [self changeToTypesOrStats];
    self.navigationItem.title = self.pokemon;
}

- (void)changeToTypesOrStats {
    if (self.showingTypes) {
        [self.tableView setDataSource:self.typesDatasource];
        [self.tableView setDelegate:self.typesDatasource];
    }
    else {
        [self.tableView setDataSource:self.statsDatasource];
    }

    [self.tableView reloadData];
    [self.statsButton setTitle:self.showingTypes ? @"Stats" : @"Types"];
}

- (IBAction)statsButtonTapped:(id)sender {
    self.showingTypes = !self.showingTypes;
    [self changeToTypesOrStats];
}

@end