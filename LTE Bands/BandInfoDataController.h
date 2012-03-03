//
//  BandInfoDataController.h
//  LTE Bands
//
//  Created by Wonil Kim on 2/22/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BandInfo.h"

@interface BandInfoDataController : NSObject

@property (nonatomic, copy) NSMutableArray *bandInfoList;

- (unsigned)countOfBandInfoList;
- (BandInfo*)objectInBandInfoListAtIndex:(NSUInteger)index;

@end
