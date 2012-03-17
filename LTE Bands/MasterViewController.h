//
//  MasterViewController.h
//  LTE Bands
//
//  Created by Wonil Kim on 21/02/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BandInfoDataController;

@interface MasterViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>

@property (nonatomic, strong) BandInfoDataController *dataController;

@end
