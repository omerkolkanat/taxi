//
//  PoiListViewModel.h
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poi.h"

@interface PoiListViewModel : NSObject

@property NSArray *pois;

/*! @brief Fetches POIs near Hamburg.
 */
- (void)fetchPoiListWithCompletion:(void (^)(BOOL success))completion;

@end

