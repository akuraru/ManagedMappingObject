//
//  PersonJSONModel.h
//
//  Created by   on 2013/09/12
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PersonJSONModel : NSObject <NSCoding>

@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double age;

+ (PersonJSONModel *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
