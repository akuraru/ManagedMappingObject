//
// Created by akuraru on 2015/03/08.
//

#import "MappingService.h"

@implementation MappingService

+ (void)updateManagedObject:(id<MappingProtocol>)managedObject dictionary:(NSDictionary *)dictionary {
    NSDictionary *keyMap = [[self class] JSONKeyMap];
    NSDictionary *valueTransformerNames = [[self class] JSONValueTransformerNames];
    for (NSString *objectKey in [keyMap allKeys]) {
        id dictionaryKey = keyMap[objectKey];
        id dictionaryValue = dictionary[dictionaryKey];
        NSString *transformerName = valueTransformerNames[objectKey];
        if (transformerName) {
            NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:transformerName];
            dictionaryValue = [transformer transformedValue:dictionaryValue];
        }
        if (dictionaryValue != nil) {
            if (dictionaryValue == [NSNull null]) {
                [managedObject setValue:nil forKeyPath:objectKey];
            } else {
                [managedObject setValue:dictionaryValue forKeyPath:objectKey];
            }
        }
    }
}

+ (NSDictionary *)dictionaryRepresentationMappingObject:(id<MappingProtocol>)object {
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
    NSDictionary *keyMap = [[object class] JSONKeyMap];
    NSDictionary *valueTransformerNames = [[object class] JSONValueTransformerNames];
    for (NSString *objectKey in [keyMap allKeys]) {
        id dictionaryKey = keyMap[objectKey];
        id dictionaryValue = [self valueForKeyPath:objectKey]; // support relationship by putting keyPath.
        NSString *transformerName = valueTransformerNames[objectKey];
        if (transformerName) {
            NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:transformerName];
            if ([[transformer class] allowsReverseTransformation]) {
                dictionaryValue = [transformer reverseTransformedValue:dictionaryValue];
            }
        }
        if (dictionaryValue == nil) {
            continue;
        }
        [results setObject:dictionaryValue forKey:dictionaryKey];
    }
    return results;
}
@end
