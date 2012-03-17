//
//  MasterViewController.m
//  LTE Bands
//
//  Created by Wonil Kim on 21/02/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BandInfo.h"
#import "BandInfoDataController.h"

#define LTE_BAND_CELL           @"LTEBandCell"
#define SHOW_BAND_DETAILS_SEGUE @"ShowBandDetails"

@implementation MasterViewController

@synthesize dataController = _dataController;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.dataController countOfFilteredBandInfoList];
    } else {
        return [self.dataController countOfBandInfoList];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = LTE_BAND_CELL;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    BandInfo *bandInfoAtIndex;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        bandInfoAtIndex = [self.dataController objectInFilteredBandInfoListAtIndex:indexPath.row];
    } else {
        bandInfoAtIndex = [self.dataController objectInBandInfoListAtIndex:indexPath.row];
    }
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"Band %d", bandInfoAtIndex.bandNumber]];
    [[cell detailTextLabel] setText:bandInfoAtIndex.bandName];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier:SHOW_BAND_DETAILS_SEGUE sender:tableView];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    BOOL filtered;
    UITableView *tv;
    
    if (sender == self.searchDisplayController.searchResultsTableView) {
        filtered = YES;
        tv = (UITableView*)sender;
    } else {
        filtered = NO;
        tv = self.tableView;
    }
    
    if ([[segue identifier] isEqualToString:SHOW_BAND_DETAILS_SEGUE]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        BandInfo *band;
        if (filtered) {
            band = [self.dataController objectInFilteredBandInfoListAtIndex:[tv indexPathForSelectedRow].row];
        } else {
            band = [self.dataController objectInBandInfoListAtIndex:[tv indexPathForSelectedRow].row];
        }
        detailViewController.band = band;
        detailViewController.title = [NSString stringWithFormat:@"Band %d", band.bandNumber];
    }
}

#pragma mark - UISearchDisplayDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self.dataController setFilterString:searchString];
    return YES;
}

@end
