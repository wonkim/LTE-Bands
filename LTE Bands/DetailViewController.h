//
//  DetailViewController.h
//  LTE Bands
//
//  Created by Wonil Kim on 21/02/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BandInfo;

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) BandInfo *band;

@end
