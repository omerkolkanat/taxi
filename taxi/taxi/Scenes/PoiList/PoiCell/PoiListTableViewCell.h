//
//  PoiListTableViewCell.h
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Poi.h"

@interface PoiListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@property (weak, nonatomic) IBOutlet UILabel *fleetTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

- (void)configureWithModel:(Poi *)poi;

@end
