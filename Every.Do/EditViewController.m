//
//  EditViewController.m
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "EditViewController.h"
#import "Todos.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    
    self.madeTitle = self.editTitle.text;
    self.madeBody = self.editBody.text;
    self.newInteger = [self.editNumber.text intValue];
//    self.isCompleted = NO;
    
    NSLog(@"Saved. Title: %@", self.madeTitle);
    
    Todos *newTodo = [[Todos alloc] initWithTitle:self.madeTitle Body:self.madeBody PriorityNumber:self.newInteger andIsCompleted:NO];
    [self.delegate editViewControllerDidTouchSave:newTodo];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
