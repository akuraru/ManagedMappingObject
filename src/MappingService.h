//
// Created by akuraru on 2015/03/08.
//

#import <Foundation/Foundation.h>

@protocol MappingProtocol <NSObject>
- (id)valueForKey:(NSString *)key;
- (void)setValue:(id)value forKeyPath:(NSString *)key;

- (NSDictionary *)JSONKeyMap;
- (NSDictionary *)JSONValueTransformerNames;
@end

@interface MappingService: NSObject
+ (void)updateManagedObject:(id<MappingProtocol>)managedObject dictionary:(NSDictionary *)dictionary;

+ (NSDictionary *)dictionaryRepresentationMappingObject:(id<MappingProtocol>)object;
@end
