//
//  Todos.m
//  Every.Do
//
//  Created by Jeff Eom on 2016-07-12.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

#import "Todos.h"

@implementation Todos

- (instancetype)initWithTitle:(NSString *)title Body:(NSString *)body PriorityNumber:(int)priorityNumber andIsCompleted: (BOOL)isCompleted
{
    self = [super init];
    if (self) {
        _title = title;
        _body = body;
        _priorityNumber = priorityNumber;
        _isCompleted = isCompleted;
    }
    return self;
}

@end
