//
// Created by azu on 2013/09/12.
//


#import "UnitTransformer.h"


@implementation UnitTransformer {

}
+ (void)initialize {
    [super initialize];
    [NSValueTransformer setValueTransformer:[[MeterToCentimeterTransformer alloc] init] forName:NSStringFromClass(
        [MeterToCentimeterTransformer class])];
    [NSValueTransformer setValueTransformer:[[UnixTimeToNSDateTransformer alloc] init] forName:NSStringFromClass(
        [UnixTimeToNSDateTransformer class])];
}

@end

@implementation MeterToCentimeterTransformer
+ (Class)transformedValueClass {
    return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}


- (id)transformedValue:(id) value {
    if (value == nil) {
        return nil;
    }
    double centimeter = [value doubleValue];
    return @(centimeter * 100);
}

- (id)reverseTransformedValue:(id) value {
    if (value == nil) {
        return nil;
    }
    double meter = [value doubleValue];
    return @(meter / 100);
}

@end

@implementation UnixTimeToNSDateTransformer
+ (Class)transformedValueClass {
    return [NSDate class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (id)transformedValue:(id) value {
    if (value == nil) {
        return nil;
    }
    double unixTime = [value doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:unixTime];
}

- (id)reverseTransformedValue:(id) value {
    if (value == nil) {
        return nil;
    }
    NSDate *date = value;
    return @([date timeIntervalSince1970]);
}
@end