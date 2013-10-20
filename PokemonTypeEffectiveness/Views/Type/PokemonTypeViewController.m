#import "PokemonTypeViewController.h"
#import "InfoCell.h"
#import "PokemonStore.h"

@implementation PokemonTypeViewController

int const INFO_SECTION = 0;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == INFO_SECTION) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == INFO_SECTION) {
        InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(InfoCell.class)];
        if (!cell) {
            cell = [InfoCell create];
        }

        [cell setPokemon:self.pokemon withTypes:[[PokemonStore instance] typesFor:self.pokemon]];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


@end