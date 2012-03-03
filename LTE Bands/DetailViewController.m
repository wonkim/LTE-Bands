//
//  DetailViewController.m
//  LTE Bands
//
//  Created by Wonil Kim on 21/02/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import "DetailViewController.h"
#import "BandInfo.h"
#import "CarrierInfo.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize band = _band;

#pragma mark - Managing the detail item

- (void)setBand:(BandInfo *)band {
    if (_band != band) {
        _band = band;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.band = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Frequency";
    } else {
        return @"Carriers";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else {
        return [self.band.carriers count];
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FreqCell"];
        switch (indexPath.row) {
            case 0:
                [cell.textLabel setText:@"Name"];
                [cell.detailTextLabel setText:self.band.bandName];
                break;
            case 1:
                [cell.textLabel setText:@"Up"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d ~ %d Mhz", self.band.upFreq1, self.band.upFreq2]];
                break;
            case 2:
                [cell.textLabel setText:@"Down"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d ~ %d Mhz", self.band.downFreq1, self.band.downFreq2]];
                break;
        }
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CarrierCell"];
        CarrierInfo *carrier = (CarrierInfo*)[self.band.carriers objectAtIndex:indexPath.row];
        [cell.textLabel setText:carrier.country];
        [cell.detailTextLabel setText:carrier.name];
    }
    
    return cell;
}

@end
