//
//  DetailViewControllerDelegate.h
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todos.h"

@protocol DetailViewControllerDelegate <NSObject>

- (void)editViewControllerDidTouchSave:(Todos *)todo;

@end
