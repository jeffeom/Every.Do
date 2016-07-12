//
//  MasterViewController.m
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "EditViewController.h"
#import "Todos.h"
#import "todoCell.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *objects;
@property NSMutableArray *todoList;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.todoList = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Todos *todo1 = [[Todos alloc] initWithTitle:@"Eat" Body:@"Eat Breakfast" PriorityNumber:1 andIsCompleted:NO];
    Todos *todo2 = [[Todos alloc] initWithTitle:@"Drink" Body:@"Drink Coffee" PriorityNumber:2 andIsCompleted:NO];
    Todos *todo3 = [[Todos alloc] initWithTitle:@"Rest" Body:@"Take a walk" PriorityNumber:3 andIsCompleted:NO];
    Todos *todo4 = [[Todos alloc] initWithTitle:@"Sleep" Body:@"Sleep at 12PM" PriorityNumber:4 andIsCompleted:YES];
    
    [self.todoList addObject:todo1];
    [self.todoList addObject:todo2];
    [self.todoList addObject:todo3];
    [self.todoList addObject:todo4];
    
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.todoList) {
        self.todoList = [[NSMutableArray alloc] init];
    }
    
    Todos *newTodo = [[Todos alloc] initWithTitle:@"New" Body:@"New" PriorityNumber:1 andIsCompleted:NO];
    [self.todoList insertObject: newTodo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todos *todo = self.todoList[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todo];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    todoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Todos *todo = self.todoList[indexPath.row];
    
    cell.titleLabel.text = todo.title;
    cell.bodyText.text = todo.body;
    cell.priorityNumber.text = [NSString stringWithFormat:@"%d",todo.priorityNumber];
    
    if(todo.isCompleted){
        
        NSMutableAttributedString *cutStringBody = [[NSMutableAttributedString alloc] initWithString:todo.body];
        [cutStringBody addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [cutStringBody length])];
        
        NSMutableAttributedString *cutStringTitle = [[NSMutableAttributedString alloc] initWithString:todo.body];
        [cutStringTitle addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [cutStringTitle length])];
        
        [cell.titleLabel setAttributedText:cutStringTitle];
        [cell.bodyText setAttributedText:cutStringBody];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
