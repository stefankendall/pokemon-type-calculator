#import "MyPokemonListViewController.h"
#import "MyPokemonStore.h"

@implementation MyPokemonListViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[MyPokemonStore instance] all] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"MyPokemonListCell"];
    if (!listCell) {
        listCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyPokemonListCell"];
    }

    [listCell.textLabel setText:[[MyPokemonStore instance] all][(NSUInteger) indexPath.row]];
    return listCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *pokemon = [[MyPokemonStore instance] all][(NSUInteger) indexPath.row];
    int count = [self.navigationController.viewControllers count];
    [self.navigationController popToViewController:self.navigationController.viewControllers[(NSUInteger) (count - 3)] animated:YES];
    [self.comparer compareTo:pokemon];
}

@end