//
//  ViewController.m
//  ProtoBufferDemo
//
//  Created by WTY on 17/3/29.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import "ViewController.h"

#import "WTYDrawView.h"
#import "Person.pbobjc.h"
@interface ViewController ()
@property(nonatomic,strong) WTYDrawView *drawView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.drawView = [[WTYDrawView alloc] init];
    self.drawView.frame = CGRectMake(100, 100, 100, 100);
    self.drawView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.drawView];
    NSMutableArray *pointArr = [@[] mutableCopy];
    for (int i = 10; i < 1000; i ++) {
        CGPoint point = CGPointMake(10, 10 + i);
        [pointArr addObject:[NSValue valueWithCGPoint:point]];
    }
    
    NSMutableArray *pointArr2 = [@[] mutableCopy];
    for (int i = 10; i < 1000; i ++) {
        CGPoint point = CGPointMake(40, 10 + i);
        [pointArr2 addObject:[NSValue valueWithCGPoint:point]];
    }
    
    self.drawView.array = [pointArr copy];
    self.drawView.arrayTwo = [pointArr2 copy];

    [self.drawView setNeedsDisplay];

//    Person *person = [[[[[Person builder] setName:@"王天佑"]
//                        setId:1]
//                       setEmail:@"王天佑"] build];
    
    Person *person = [Person message];
    person.name = @"王天佑";
    person.id_p = 1;
    
    NSData *data = [person data];
    NSString *basePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *path = [basePath stringByAppendingFormat:@"/person.data"];
    
    if ([data writeToFile:path atomically:YES]) {
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        Person *person = [Person parseFromData:data error:nil];
        
        if (person) {
            NSLog(@"\n id %d \n name: %@ \n email: %@ \n",person.id_p, person.name, person.email);
        }
    }
     

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
