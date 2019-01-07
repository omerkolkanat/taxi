//
//  Poi.m
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 7.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import "Poi.h"

@implementation Poi

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    
    if (self == nil)
    {
        return nil;
    }
    _poiID = [dictionary[@"id"] intValue];
    double latitude = [dictionary[@"coordinate"][@"latitude"] doubleValue];
    double longitude = [dictionary[@"coordinate"][@"longitude"] doubleValue];
    _coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    _fleetType = [dictionary[@"fleetType"] isEqualToString:@"TAXI"] ? FleetTypeTaxi : FleetTypePooling;
    _heading = [dictionary[@"heading"] doubleValue];
    return self;
}

@end
