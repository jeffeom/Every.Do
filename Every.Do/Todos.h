//
//  Todos.h
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todos : NSObject

@property NSString *title;
@property NSString *body;
@property int priorityNumber;
@property BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title Body:(NSString *)body PriorityNumber:(int)priorityNumber andIsCompleted: (BOOL)isCompleted;

@end
