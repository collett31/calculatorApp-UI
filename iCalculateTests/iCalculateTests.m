//
//  iCalculateTests.m
//  iCalculateTests
//
//  Created by Collett Charlton on 9/8/19.
//  Copyright © 2019 Collett. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface iCalculateTests : XCTestCase
@property  ViewController *aClass;
@end

@implementation iCalculateTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
   self.aClass = [[ViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testisValidString {
   
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
