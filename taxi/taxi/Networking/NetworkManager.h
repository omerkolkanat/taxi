//
//  NetworkManager.h
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "Poi.h"
#import <MapKit/MapKit.h>

@interface NetworkManager : NSObject

/*!
 @brief Fetches POI's between given coordinates.
 @param  point1 first point of the given two points
 @param  point2 second point of the given two points
 */
+(void)fetchPoiListWithPoint1:(CLLocationCoordinate2D)point1 point2:(CLLocationCoordinate2D)point2 completion:(void (^)(NSArray *pois, BOOL success))completion;

@end
