//
//  NetworkManager.m
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import "NetworkManager.h"
#import "Constants.h"

@implementation NetworkManager

+(void)fetchPoiListWithPoint1:(CLLocationCoordinate2D)point1 point2:(CLLocationCoordinate2D)point2 completion:(void (^)(NSArray *pois, BOOL success))completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[NSNumber numberWithDouble:point2.latitude] forKey: @"p2Lat"];
    [dict setObject:[NSNumber numberWithDouble:point1.longitude] forKey: @"p1Lon"];
    [dict setObject:[NSNumber numberWithDouble:point1.latitude] forKey: @"p1Lat"];
    [dict setObject:[NSNumber numberWithDouble:point2.longitude] forKey: @"p2Lon"];
    
    [manager GET:baseURL parameters:dict progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSArray *poisArray = responseObject[@"poiList"];
        if(poisArray){
            NSMutableArray *pois = [NSMutableArray new];
            for (NSDictionary *poiDictionary in poisArray){
                Poi *poi = [[Poi alloc] initWithDictionary: poiDictionary];
                [pois addObject:poi];
            }
            completion(pois, YES);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completion(nil, NO);
    }];
}

@end
