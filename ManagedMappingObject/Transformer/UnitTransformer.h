//
// Created by azu on 2013/09/12.
//


#import <Foundation/Foundation.h>

/*
    JSONModel <-> CoreData(NSManagedObject)
 */
@interface UnitTransformer : NSObject
@end

//  Meter <-> Centimeter
@interface MeterToCentimeterTransformer : NSValueTransformer
@end
// NSDate <-> UnixTime
@interface UnixTimeToNSDateTransformer : NSValueTransformer
@end
