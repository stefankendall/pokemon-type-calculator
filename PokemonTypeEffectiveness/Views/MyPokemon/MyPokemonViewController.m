#import "MyPokemonViewController.h"
#import "AddCell.h"
#import <ViewDeck/IIViewDeckController.h>

@implementation MyPokemonViewController

const int ROWS_SECTION = 0;
const int ADD_SECTION = 1;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == ROWS_SECTION) {
        return 0;
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
        return nil;
    }
}


- (IBAction)revealSidebar:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end