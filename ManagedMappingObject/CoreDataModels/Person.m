#import "Person.h"


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
        PersonAttributes.age : @"age"
    };
}

+ (NSDictionary *)JSONValueTransformerNames {
    return nil;
}
@end
