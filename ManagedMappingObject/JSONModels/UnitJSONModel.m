//
//  UnitJSONModel.m
//
//  Created by   on 2013/09/12
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "UnitJSONModel.h"


NSString *const kUnitJSONModelMeter = @"meter";
NSString *const kUnitJSONModelUnixTime = @"unix_time";


@interface UnitJSONModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UnitJSONModel

@synthesize meter = _meter;
@synthesize unixTime = _unixTime;

- (void)setMeterNumber:(NSNumber *)value {
    self.meter = [value doubleValue];
}

- (NSNumber *)meterNumber {
    return @(self.meter);
}

- (void)setUnixTimeNumber:(NSNumber *)value {
    self.unixTime = [value doubleValue];
}

- (NSNumber *)unixTimeNumber {
    return @(self.unixTime);
}

- (NSDictionary *)JSONKeyMap {
    return @{
            @"meterNumber" : kUnitJSONModelMeter,
            @"unixTimeNumber" : kUnitJSONModelUnixTime,
    };
}

- (NSDictionary *)JSONValueTransformerNames {
    return @{};
}


+ (UnitJSONModel *)modelObjectWithDictionary:(NSDictionary *)dict {
    UnitJSONModel *instance = [[UnitJSONModel alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];

    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.meter = [[self objectOrNilForKey:kUnitJSONModelMeter fromDictionary:dict] doubleValue];
        self.unixTime = [[self objectOrNilForKey:kUnitJSONModelUnixTime fromDictionary:dict] doubleValue];

    }

    return self;

}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.meter] forKey:kUnitJSONModelMeter];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unixTime] forKey:kUnitJSONModelUnixTime];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.meter = [aDecoder decodeDoubleForKey:kUnitJSONModelMeter];
    self.unixTime = [aDecoder decodeDoubleForKey:kUnitJSONModelUnixTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

    [aCoder encodeDouble:_meter forKey:kUnitJSONModelMeter];
    [aCoder encodeDouble:_unixTime forKey:kUnitJSONModelUnixTime];
}


@end
