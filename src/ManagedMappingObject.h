//
// Created by azu on 2013/09/12.
//


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol ManagedMappingProtocol
+ (NSDictionary *)JSONKeyMap;
+ (NSDictionary *)JSONValueTransformerNames;
+ (NSString *)entityName;
@end

@interface ManagedMappingObject : NSManagedObject

+ (instancetype)insertNewWithDictionary:(NSDictionary *) dictionary managedObjectContext:(NSManagedObjectContext *) context;

- (void)updateWithDictionary:(NSDictionary *) dictionary;

- (NSDictionary *)dictionaryRepresentation;
@end