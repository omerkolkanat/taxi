//
//  ViewController.h
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoiListViewModel.h"

@interface PoiListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) PoiListViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;


@end

