//
//  BandInfo.m
//  LTE Bands
//
//  Created by Wonil Kim on 21/02/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import "BandInfo.h"
#import "CarrierInfo.h"

@implementation BandInfo

@synthesize bandNumber = _bandNumber;
@synthesize bandName = _bandName;
@synthesize upFreq1 = _upFreq1;
@synthesize upFreq2 = _upFreq2;
@synthesize downFreq1 = _downFreq1;
@synthesize downFreq2 = _downFreq2;
@synthesize carriers = _carriers;

- (id)initWithBandNumber:(int)number bandName:(NSString *)name upperFreq1:(int)upFreq1 upperFre2:(int)upFreq2 downFreq1:(int)downFreq1 downFreq2:(int)downFreq2 {
    
    self = [super init];
    if (self) {
        _bandNumber = number;
        _bandName = name;
        _upFreq1 = upFreq1;
        _upFreq2 = upFreq2;
        _downFreq1 = downFreq1;
        _downFreq2 = downFreq2;
        _carriers = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}

- (void)addCarrierWithName:(NSString *)carrierName country:(NSString *)aCountry {
    
    CarrierInfo *carrier = [[CarrierInfo alloc] initWithName:carrierName country:aCountry];
    [self.carriers addObject:carrier];
}

@end
