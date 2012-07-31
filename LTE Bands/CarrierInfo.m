//
//  CarrierInfo.m
//  LTE Bands
//
//  Created by Wonil Kim on 2/28/12.
//

#import "CarrierInfo.h"

@implementation CarrierInfo

@synthesize name = _name;
@synthesize country = _country;

- (id)initWithName:(NSString *)name country:(NSString *)aCountry {
    
    self = [super init];
    if (self) {
        _name = name;
        _country = aCountry;
    }
    return self;
}

@end