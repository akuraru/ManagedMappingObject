//
//  PersonJSONModel.m
//
//  Created by   on 2013/09/12
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PersonJSONModel.h"


NSString *const kPersonJSONId = @"id";
NSString *const kPersonJSONName = @"name";
NSString *const kPersonJSONAge = @"age";


@interface PersonJSONModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PersonJSONModel

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize name = _name;
@synthesize age = _age;


+ (PersonJSONModel *)modelObjectWithDictionary:(NSDictionary *)dict
{
    PersonJSONModel *instance = [[PersonJSONModel alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kPersonJSONId fromDictionary:dict];
            self.name = [self objectOrNilForKey:kPersonJSONName fromDictionary:dict];
            self.age = [[self objectOrNilForKey:kPersonJSONAge fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kPersonJSONId];
    [mutableDict setValue:self.name forKey:kPersonJSONName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.age] forKey:kPersonJSONAge];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kPersonJSONId];
    self.name = [aDecoder decodeObjectForKey:kPersonJSONName];
    self.age = [aDecoder decodeDoubleForKey:kPersonJSONAge];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kPersonJSONId];
    [aCoder encodeObject:_name forKey:kPersonJSONName];
    [aCoder encodeDouble:_age forKey:kPersonJSONAge];
}


@end
