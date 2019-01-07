//
//  PoiModelTestCase.m
//  taxiTests
//
//  Created by OMER YASIN KOLKANAT on 9.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreLocation/CoreLocation.h>
#import "Constants.h"
#import "Poi.h"

@interface PoiModelTestCase : XCTestCase

@end

@implementation PoiModelTestCase

- (void)testPoiModelWithPooling {
    
    int poiID = 807107;
    double latitude = 53.60001638709756;
    double longitude = 9.961639742903259;
    NSString *fleetType = @"POOLING";
    double heading = 66.54012014124272;
    
    NSDictionary *poiDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithInt: poiID], @"id",
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithDouble: latitude], @"latitude",
                                    [NSNumber numberWithDouble: longitude], @"longitude", nil], @"coordinate",
                                   fleetType, @"fleetType",
                                   [NSNumber numberWithDouble: heading], @"heading", nil];
    
    Poi *poi = [[Poi alloc] initWithDictionary: poiDictionary];
    XCTAssertEqual(poi.poiID, poiID);
    XCTAssertEqual(poi.coordinate.latitude, latitude);
    XCTAssertEqual(poi.coordinate.longitude, longitude);
    XCTAssertEqual(poi.fleetType, FleetTypePooling);
    XCTAssertEqual(poi.heading, heading);
    
}

- (void)testPoiModelWithTaxi {
    
    int poiID = 260245;
    double latitude = 53.43351117219395;
    double longitude = 10.01445835107226;
    NSString *fleetType = @"TAXI";
    double heading = 190.2732455688578;
    
    NSDictionary *poiDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithInt: poiID], @"id",
                                   [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithDouble: latitude], @"latitude",
                                    [NSNumber numberWithDouble: longitude], @"longitude", nil], @"coordinate",
                                   fleetType, @"fleetType",
                                   [NSNumber numberWithDouble: heading], @"heading", nil];
    
    Poi *poi = [[Poi alloc] initWithDictionary: poiDictionary];
    XCTAssertEqual(poi.poiID, poiID);
    XCTAssertEqual(poi.coordinate.latitude, latitude);
    XCTAssertEqual(poi.coordinate.longitude, longitude);
    XCTAssertEqual(poi.fleetType, FleetTypeTaxi);
    XCTAssertEqual(poi.heading, heading);
}


@end
