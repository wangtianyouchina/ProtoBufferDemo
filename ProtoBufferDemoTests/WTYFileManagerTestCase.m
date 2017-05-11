//
//  WTYFileManagerTestCase.m
//  ProtoBufferDemo
//
//  Created by WTY on 2017/5/10.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WTYFileManager.h"

@interface WTYFileManagerTestCase : XCTestCase

@end

@implementation WTYFileManagerTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

-(void)testCreatFile {
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
    [file creatFileWithPath:[NSString stringWithFormat:@"%@/%@",path,@"file1"] content:@"第一个创建的文件222"];
}

-(void)testCreatFielHasEmpotpath {
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
   BOOL isok = [file creatFileWithPath:[NSString stringWithFormat:@"%@/%@/%@",path,@"empot",@"file1"] content:@"第一个创建的文件222"];
    XCTAssert(isok,@"中间有不存在的文件夹目录 ,创建文件失败");
}

-(void)testCreatdir {
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
    [file creatDirWithPath:[NSString stringWithFormat:@"%@/%@/%@",path,@"dir",@"dir2"]];
}

-(void)testRemovefile {
    
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];

    [file removeFilePath:[NSString stringWithFormat:@"%@/%@",path,@"file1"]];
}
// 成功
-(void)testRemovedir {
    
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
    
    [file removeFilePath:[NSString stringWithFormat:@"%@/%@",path,@"dir"]];
}

-(void)testCopy {
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
    NSString *fromPath = [NSString stringWithFormat:@"%@/%@",path,@"person.data"];
    NSString *toPath = [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),@"Library",@"personCopy.data"];
    [file copyFilePath:fromPath toPath:toPath];
}

-(void)testCopyhasEmpotDir {
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
    NSString *fromPath = [NSString stringWithFormat:@"%@/%@",path,@"person.data"];
    NSString *toPath = [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),@"Library/copy",@"personCopy.data"];
    [file copyFilePath:fromPath toPath:toPath];
}

-(void)testzipFile {
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
        NSString *fromPath = [NSString stringWithFormat:@"%@/%@",path,@"aaa"];
//    NSString *fromPath = [NSString stringWithFormat:@"%@",path];
    NSString *toPath = [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),@"Documents",@"document.zip"];

    [file zipFileWithFromPath:fromPath toPath:toPath];
}

-(void)testunzipFile {
    NSString *path = [NSString stringWithFormat:@"%@/%@",NSHomeDirectory(),@"Documents"];
    WTYFileManager *file = [WTYFileManager shareInstance];
    NSString *fromPath = [NSString stringWithFormat:@"%@/%@",path,@"document.zip"];
    NSString *toPath = [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),@"Documents",@"sss"];
    
    [file unzipFileWithFromPath:fromPath toPath:toPath];
}



- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
