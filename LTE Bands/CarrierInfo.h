//
//  CarrierInfo.h
//  LTE Bands
//
//  Created by Wonil Kim on 2/28/12.
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
