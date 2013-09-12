#import "Unit.h"
#import "UnitTransformer.h"


@interface Unit ()

// Private interface goes here.

@end


@implementation Unit
+ (NSDictionary *)JSONKeyMap {
    return @{
        UnitAttributes.date : @"unix_time",
        UnitAttributes.centimeter : @"meter"
    };
}

+ (NSDictionary *)JSONValueTransformerNames {
    return @{
        UnitAttributes.centimeter : NSStringFromClass([MeterToCentimeterTransformer class]),
        UnitAttributes.date : NSStringFromClass([UnixTimeToNSDateTransformer class])
    };
}

+ (NSString *)entityName {
    return [super entityName];
}
@end
