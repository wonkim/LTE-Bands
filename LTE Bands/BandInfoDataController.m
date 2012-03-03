//
//  BandInfoDataController.m
//  LTE Bands
//
//  Created by Wonil Kim on 2/22/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import "BandInfoDataController.h"

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
    
    BandInfo *band1 = [[BandInfo alloc] initWithBandNumber:1 bandName:@"800 Mhz" upperFreq1:800 upperFre2:810 downFreq1:820 downFreq2:830];
    [band1 addCarrierWithName:@"KT" country:@"Korea"];
    
    BandInfo *band2 = [[BandInfo alloc] initWithBandNumber:2 bandName:@"850 Mhz" upperFreq1:850 upperFre2:810 downFreq1:820 downFreq2:830];
    [band2 addCarrierWithName:@"SKT" country:@"Korea"];
    
    [self.bandInfoList addObject:band1];
    [self.bandInfoList addObject:band2];
}

- (void)setBandInfoList:(NSMutableArray *)bandInfoList {
    if (_bandInfoList != bandInfoList) {
        _bandInfoList = [bandInfoList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
    }
    return self;
}

- (unsigned)countOfBandInfoList {
    return [self.bandInfoList count];
}

- (BandInfo*)objectInBandInfoListAtIndex:(NSUInteger)index {
    return [self.bandInfoList objectAtIndex:index];
}

@end
