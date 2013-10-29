//
//  PersonJSONModel.m
//
//  Created by   on 2013/10/29
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PersonJSONModel.h"


NSString *const kPersonJSONModelAge = @"age";
NSString *const kPersonJSONModelId = @"id";
NSString *const kPersonJSONModelUnits = @"units";
NSString *const kPersonJSONModelName = @"name";


@interface PersonJSONModel ()

- (id)objectOrNilForKey:(id) aKey fromDictionary:(NSDictionary *) dict;

@end

@implementation PersonJSONModel

@synthesize age = _age;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize units = _units;
@synthesize name = _name;


+ (PersonJSONModel *)modelObjectWithDictionary:(NSDictionary *) dict {
    PersonJSONModel *instance = [[PersonJSONModel alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *) dict {
    self = [super init];

    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.age = [[self objectOrNilForKey:kPersonJSONModelAge fromDictionary:dict] doubleValue];
        self.internalBaseClassIdentifier = [self objectOrNilForKey:kPersonJSONModelId fromDictionary:dict];
        self.units = [self objectOrNilForKey:kPersonJSONModelUnits fromDictionary:dict];
        self.name = [self objectOrNilForKey:kPersonJSONModelName fromDictionary:dict];

    }

    return self;

}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kPersonJSONModelName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.age] forKey:kPersonJSONModelAge];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kPersonJSONModelId];
    NSMutableArray *tempArrayForUnits = [NSMutableArray array];
    for (NSObject *subArrayObject in self.units) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUnits addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUnits addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUnits] forKey:kPersonJSONModelUnits];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id) aKey fromDictionary:(NSDictionary *) dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *) aDecoder {
    self = [super init];

    self.age = [aDecoder decodeDoubleForKey:kPersonJSONModelAge];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kPersonJSONModelId];
    self.units = [aDecoder decodeObjectForKey:kPersonJSONModelUnits];
    self.name = [aDecoder decodeObjectForKey:kPersonJSONModelName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *) aCoder {

    [aCoder encodeDouble:_age forKey:kPersonJSONModelAge];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kPersonJSONModelId];
    [aCoder encodeObject:_units forKey:kPersonJSONModelUnits];
    [aCoder encodeObject:_name forKey:kPersonJSONModelName];
}


@end
