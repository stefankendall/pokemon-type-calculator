#import "MyPokemonViewController.h"
#import "AddCell.h"
#import "MyPokemonStore.h"
#import <ViewDeck/IIViewDeckController.h>

@implementation MyPokemonViewController

const int ROWS_SECTION = 0;
const int ADD_SECTION = 1;

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == ROWS_SECTION) {
        return [[[MyPokemonStore instance] all] count];
    }
    else {
        return 1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == ADD_SECTION) {
        [self performSegueWithIdentifier:@"selectMyPokemon" sender:self];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == ADD_SECTION) {
        AddCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(AddCell.class)];
        if (!cell) {
            cell = [AddCell create];
        }
        return cell;
    }
    else {
        NSString *pokemon = [[MyPokemonStore instance] all][(NSUInteger) [indexPath row]];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyPokemonCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyPokemonCell"];
        }
        [cell.textLabel setText:pokemon];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *pokemon = [[MyPokemonStore instance] all][(NSUInteger) [indexPath row]];
        [[MyPokemonStore instance] remove:pokemon];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == ADD_SECTION) {
        return UITableViewCellEditingStyleNone;
    }
    return UITableViewCellEditingStyleDelete;
}


- (IBAction)revealSidebar:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end