//
//  ViewController.m
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 8.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

#import "PoiListViewController.h"
#import "NetworkManager.h"
#import "taxi-Swift.h"
#import "PoiListTableViewCell.h"

@implementation PoiListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    self.viewModel = [[PoiListViewModel alloc] init];
    [self fetchPois];
}

- (void) setupUI
{
    self.navigationItem.title = @"Poi List";
    [self.activityIndicatorView startAnimating];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshTableView:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];

}

- (void) fetchPois {
    [self.viewModel fetchPoiListWithCompletion:^(BOOL success) {
        if (success)
        {
            [self.tableView reloadData];
            [self.tableView setHidden:NO];
        }
        else
        {
            [AlertHelper showNetworkErrorAlertFromController:self];
        }
        [self.activityIndicatorView stopAnimating];
    }];
}

- (void)refreshTableView:(UIRefreshControl *)refreshControl
{
    [refreshControl endRefreshing];
    [self fetchPois];
}

#pragma mark - UITableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PoiListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListTableViewCell"];
    [cell configureWithModel:[self.viewModel.pois objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.pois.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PoiMapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    mapVC.poi = [self.viewModel.pois objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

@end
