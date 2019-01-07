//
//  PoiListTableViewCell.m
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import "PoiListTableViewCell.h"
#import <CoreLocation/CLGeocoder.h>

@implementation PoiListTableViewCell
@synthesize carImageView = _carImageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)configureWithModel:(Poi *)poi
{
    self.fleetTypeLabel.text = poi.fleetType == FleetTypeTaxi ? @"Taxi" : @"Pooling";
    self.addressLabel.text = [NSString stringWithFormat:@"id: %d", poi.poiID];
    _carImageView.image = poi.fleetType == FleetTypeTaxi ? [UIImage imageNamed:@"taxi"] : [UIImage imageNamed:@"pooling"];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _carImageView.image = nil;
}

@end
