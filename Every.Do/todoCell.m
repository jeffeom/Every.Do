//
//  todoCell.m
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "todoCell.h"
#import "Todos.h"

@implementation todoCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.gr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedCell:)];
    self.gr.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:self.gr];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)swipedCell:(UISwipeGestureRecognizer *)sender {
    
//    NSMutableAttributedString *cutStringBody = [[NSMutableAttributedString alloc] initWithString:cell.titleLabel.text];
//    
//    [cutStringBody addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [cutStringBody length])];
//    
//    NSMutableAttributedString *cutStringTitle = [[NSMutableAttributedString alloc] initWithString:cell.bodyText.text];
//    
//    [cutStringTitle addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [cutStringTitle length])];
//    
//    [cell.titleLabel setAttributedText:cutStringTitle];
//    [cell.bodyText setAttributedText:cutStringBody];
    
    [self.delegate swipedCell:self];
    
    NSLog(@"Swipe it");
}

@end
