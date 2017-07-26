//
//  WTYProtoTest.m
//  ProtoBufferDemo
//
//  Created by 王天佑 on 2017/7/26.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import "WTYProtoTest.h"

#import "Person.pbobjc.h"
@implementation WTYProtoTest
- (instancetype)init
{
    self = [super init];
    if (self) {
    
        [self test];
    }
    return self;
}

-(void)test {
    Person *son = [Person message];
    son.name = @"wang";
    son.id_p = 12;
    Person *newPerson = [Person parseFromData:son.data error:nil];
    NSLog(@"%@",newPerson);
}
@end
