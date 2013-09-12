//
// Created by azu on 2013/09/12.
//


#import "ManagedMappingObject.h"


@implementation ManagedMappingObject {

}

+ (NSDictionary *)JSONKeyMap {
    return nil;
}

+ (NSDictionary *)JSONValueTransformerNames {
    return nil;
}

+ (instancetype)insertWithDictionary:(NSDictionary *) dictionary managedObjectContext:(NSManagedObjectContext *) context {
    return [[self alloc] initWithDictionary:dictionary managedObjectContext:context];
}

- (instancetype)initWithDictionary:(NSDictionary *) dictionary managedObjectContext:(NSManagedObjectContext *) context {
    id managedObject = [NSEntityDescription insertNewObjectForEntityForName:[[self class] entityName] inManagedObjectContext:context];
    if (managedObject == nil) {
        return nil;
    }
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
        [managedObject setValue:dictionaryValue forKey:objectKey];
    }
    return managedObject;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
    NSDictionary *keyMap = [[self class] JSONKeyMap];
    NSDictionary *valueTransformerNames = [[self class] JSONValueTransformerNames];
    for (NSString *objectKey in [keyMap allKeys]) {
        id dictionaryKey = keyMap[objectKey];
        id dictionaryValue = [self valueForKey:objectKey];
        NSString *transformerName = valueTransformerNames[objectKey];
        if (transformerName) {
            NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:transformerName];
            if ([[transformer class] allowsReverseTransformation]) {
                dictionaryValue = [transformer reverseTransformedValue:dictionaryValue];
            }
        }
        [results setObject:dictionaryValue forKey:dictionaryKey];
    }
    return results;
}

@end