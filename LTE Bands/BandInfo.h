//
//  BandInfo.h
//  LTE Bands
//
//  Created by Wonil Kim on 21/02/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * LTE band information
 */
@interface BandInfo : NSObject

@property (nonatomic) int bandNumber;
@property (nonatomic, copy) NSString *bandName;
@property (nonatomic) int upFreq1;
@property (nonatomic) int upFreq2;
@property (nonatomic) int downFreq1;
@property (nonatomic) int downFreq2;
@property (nonatomic) int bandWidth;
@property (nonatomic) int bandGap;
@property (nonatomic, copy) NSMutableArray *carriers;

- (id)initWithBandNumber:(int)number bandName:(NSString*)name upperFreq1:(int)upFreq1 upperFre2:(int)upFreq2 downFreq1:(int)downFreq1 downFreq2:(int)downFreq2 bandWidth:(int)width bandGap:(int)gap;

- (void)addCarrierWithName:(NSString*)carrierName country:(NSString*)aCountry;

@end
