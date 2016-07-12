//
//  todoCell.h
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todoCellDelegate.h"


@interface todoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumber;

@property (nonatomic, weak) id<todoCellDelegate> delegate;

@property (nonatomic) UISwipeGestureRecognizer *gr;

@end
