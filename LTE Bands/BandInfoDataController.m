//
//  BandInfoDataController.m
//  LTE Bands
//
//  Created by Wonil Kim on 2/22/12.
//

#import "BandInfoDataController.h"
#import "CarrierInfo.h"

#define LAUNCH_SCREEN_MODE 0

@interface BandInfoDataController()
- (void)initializeDefaultDataList;
@end

@implementation BandInfoDataController

@synthesize bandInfoList = _bandInfoList;

- (void)initializeDefaultDataList {
    // read data from plist file?
    // first, let's use sample data for testing
    NSMutableArray *bandList = [[NSMutableArray alloc] init];
    self.bandInfoList = bandList;
#if !LAUNCH_SCREEN_MODE
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"LTEBands" ofType:@"plist"];
    NSArray *bands = [[[NSDictionary alloc] initWithContentsOfFile:plistPath] valueForKey:@"Bands"];
        
    for (NSDictionary *bandDict in bands) {
        NSNumber *bandNumber = [bandDict valueForKey:@"BandNumber"];
        NSString *bandName = [bandDict valueForKey:@"BandName"];
        NSNumber *upFreq1 = [bandDict valueForKey:@"UpFreq1"];
        NSNumber *upFreq2 = [bandDict valueForKey:@"UpFreq2"];
        NSNumber *downFreq1 = [bandDict valueForKey:@"DownFreq1"];
        NSNumber *downFreq2 = [bandDict valueForKey:@"DownFreq2"];
        NSNumber *bandWidth = [bandDict valueForKey:@"BandWidth"];
        NSNumber *bandGap = [bandDict valueForKey:@"BandGap"];
        NSArray *carriers = [bandDict valueForKey:@"Carriers"];
        
        BandInfo *band;
        band = [[BandInfo alloc] initWithBandNumber:bandNumber.integerValue bandName:bandName upperFreq1:upFreq1.integerValue upperFre2:upFreq2.integerValue downFreq1:downFreq1.integerValue downFreq2:downFreq2.integerValue bandWidth:bandWidth.integerValue bandGap:bandGap.integerValue];
        for (NSDictionary *carrierDict in carriers) {
            NSString *carrier = [carrierDict valueForKey:@"Name"];
            NSString *country = [carrierDict valueForKey:@"Country"];
            [band addCarrierWithName:carrier country:country];
        }
        [self.bandInfoList addObject:band];
    }
#endif
}

- (void)setBandInfoList:(NSMutableArray *)bandInfoList {
    if (_bandInfoList != bandInfoList) {
        _bandInfoList = [bandInfoList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        filteredBandInfoList = [[NSMutableArray alloc] initWithCapacity:[self.bandInfoList count]];
    }
    return self;
}

- (unsigned)countOfBandInfoList {
    return [self.bandInfoList count];
}

- (BandInfo*)objectInBandInfoListAtIndex:(NSUInteger)index {
    return [self.bandInfoList objectAtIndex:index];
}

#pragma mark - Filtered Band Info List Handling

- (void)setFilterString:(NSString *)filter
{
    [filteredBandInfoList removeAllObjects];
     
    for (BandInfo *bandInfo in self.bandInfoList) {
        for (CarrierInfo *carrier in bandInfo.carriers) {
            NSRange r = [carrier.name rangeOfString:filter options:NSCaseInsensitiveSearch];
            if (r.location == 0) {
                [filteredBandInfoList addObject:bandInfo];
                break;
            }
            r = [carrier.country rangeOfString:filter options:NSCaseInsensitiveSearch];
            if (r.location == 0) {
                [filteredBandInfoList addObject:bandInfo];
                break;
            }
        }
    }
}

- (unsigned)countOfFilteredBandInfoList 
{
    return [filteredBandInfoList count];
}

- (BandInfo*)objectInFilteredBandInfoListAtIndex:(NSUInteger)index
{
    return [filteredBandInfoList objectAtIndex:index];
}

@end
