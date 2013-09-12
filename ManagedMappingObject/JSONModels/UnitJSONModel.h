//
//  UnitJSONModel.h
//
//  Created by   on 2013/09/12
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UnitJSONModel : NSObject <NSCoding>

@property (nonatomic, assign) double meter;
@property (nonatomic, assign) double unixTime;

+ (UnitJSONModel *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
