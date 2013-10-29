#import "Person.h"
#import "Unit.h"
#import "PersonTransformer.h"


@interface Person ()


@end


@implementation Person
+ (NSString *)entityName {
    return [super entityName];
}

+ (NSDictionary *)JSONKeyMap {
    return @{
        PersonAttributes.identifier : @"id",
        PersonAttributes.name : @"name",
        PersonAttributes.age : @"age",
        PersonRelationships.units : @"units"
    };
}

+ (NSDictionary *)JSONValueTransformerNames {
    return @{
        PersonRelationships.units : NSStringFromClass([PersonUnitTransformer class])
    };
}
@end
