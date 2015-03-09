//
//  PersonJSONModel.h
//
//  Created by   on 2013/10/29
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MappingService.h"


@interface PersonJSONModel : NSObject <NSCoding, MappingProtocol>

@property (nonatomic, assign) double age;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSArray *units;
@property (nonatomic, strong) NSString *name;

- (NSNumber *)ageNumber;
- (void)setAgeNumber:(NSNumber *)age;

+ (PersonJSONModel *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
