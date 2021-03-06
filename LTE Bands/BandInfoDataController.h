//
//  BandInfoDataController.h
//  LTE Bands
//
//  Created by Wonil Kim on 2/22/12.
//

#import <Foundation/Foundation.h>
#import "BandInfo.h"

@interface BandInfoDataController : NSObject
{
    NSMutableArray *filteredBandInfoList;
}

@property (nonatomic, copy) NSMutableArray *bandInfoList;

- (unsigned)countOfBandInfoList;
- (BandInfo*)objectInBandInfoListAtIndex:(NSUInteger)index;

- (void)setFilterString:(NSString*)filter;
- (unsigned)countOfFilteredBandInfoList;
- (BandInfo*)objectInFilteredBandInfoListAtIndex:(NSUInteger)index;

@end
