//
// Created by azu on 2013/09/12.
//


#import <Foundation/Foundation.h>

@protocol ManagedMappingProtocol
+ (NSDictionary *)JSONKeyMap;
+ (NSDictionary *)JSONValueTransformerNames;
+ (NSString *)entityName;
@end

@interface ManagedMappingObject : NSManagedObject

+ (instancetype)insertWithDictionary:(NSDictionary *) dictionary managedObjectContext:(NSManagedObjectContext *) context;

- (NSDictionary *)dictionaryRepresentation;
@end