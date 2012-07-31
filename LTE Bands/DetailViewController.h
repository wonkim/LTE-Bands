//
//  DetailViewController.h
//  LTE Bands
//
//  Created by Wonil Kim on 21/02/12.
//

#import <UIKit/UIKit.h>
#import <iAD/ADBannerView.h>

@class BandInfo;

@interface DetailViewController : UITableViewController <ADBannerViewDelegate>

@property (strong, nonatomic) BandInfo *band;
@property (strong, nonatomic) ADBannerView *ad;

@end
