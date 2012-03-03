//
//  CarrierInfo.h
//  LTE Bands
//
//  Created by Wonil Kim on 2/28/12.
//  Copyright (c) 2012 Nokia Siemens Networks. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Carrier information
 */
@interface CarrierInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *country;

- (id)initWithName:(NSString*)name country:(NSString*)aCountry;

@end
