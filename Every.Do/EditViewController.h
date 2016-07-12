//
//  EditViewController.h
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewControllerDelegate.h"

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *editTitle;
@property (weak, nonatomic) IBOutlet UITextField *editNumber;
@property (weak, nonatomic) IBOutlet UITextView *editBody;
- (IBAction)saveButton:(id)sender;

@property NSString *madeTitle;
@property NSString *madeBody;
@property int newInteger;
@property BOOL isCompleted;

@property (nonatomic, weak) id<DetailViewControllerDelegate> delegate;

@end
