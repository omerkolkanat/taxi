//
//  PoiListViewModel.m
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import "PoiListViewModel.h"
#import "NetworkManager.h"

@implementation PoiListViewModel

- (void)fetchPoiListWithCompletion:(void (^)(BOOL success))completion
{
    //Coordinations of Hamburg
    CLLocationCoordinate2D point1 = CLLocationCoordinate2DMake(53.684865, 9.767589);
    CLLocationCoordinate2D point2 = CLLocationCoordinate2DMake(53.384655, 10.089891);
    [NetworkManager fetchPoiListWithPoint1:point1 point2:point2 completion:^(NSArray *pois, BOOL success) {
        if (success)
        {
            self.pois = pois;
        }
        completion(success);
    }];
}
@end
