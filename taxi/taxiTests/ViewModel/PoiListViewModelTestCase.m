//
//  ListViewModelTestCase.m
//  taxiTests
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PoiListViewModel.h"
#import "PoiListViewController.h"
#import "Poi.h"
#import <MapKit/MapKit.h>


@interface PoiListViewModelTestCase : XCTestCase

@property PoiListViewModel *viewModel;

@end

@implementation PoiListViewModelTestCase

- (void)setUp {
    self.viewModel = [[PoiListViewModel alloc] init];
}

- (void)tearDown {
    self.viewModel = nil;
}

- (void)testFetchPoiList {
    XCTestExpectation *fetchPoiListExpectation = [self expectationWithDescription:@"fetchPoiList"];

    [self.viewModel fetchPoiListWithCompletion:^(BOOL success) {
        XCTAssertTrue(success, "unsuccess");
        XCTAssertNotNil(self.viewModel.pois, "No data found for poiModel");
        
        [fetchPoiListExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError *error) {
        XCTAssertNil(error, "Timeout after 5 seconds");
    }];
    
}


@end
