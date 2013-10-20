# CustomTableViewCell

Simple superclass for custom tableview cells that works on convention and removes the need for a lot of code.

## Creating a custom tableview cell

1. Create a subclass of CTCustomTableViewCell.
1. Create a xib with a single UITableViewCell instance, and set its ReuseIdentifer to the class name. Set the class to the subclass you created in step 1.
1. In your UITableViewDataSource, use this:
```
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell"];

    if (cell == nil ) {
        cell = [MyCustomCell create];
    }
    
    //config 

    return cell;

```
