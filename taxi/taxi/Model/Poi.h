//
//  Poi.h
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 7.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

@interface Poi : NSObject

@property (nonatomic, readonly) int poiID;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) FleetType fleetType;
@property (nonatomic, readonly) CGFloat heading;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
