//
// Created by azu on 2013/10/29.
//


#import "PersonTransformer.h"
#import "Unit.h"
#import "NSManagedObject+MagicalRecord.h"

@implementation PersonTransformer {

}
+ (void)initialize {
    [super initialize];
    [NSValueTransformer setValueTransformer:[[PersonUnitTransformer alloc] init] forName:NSStringFromClass(
        [PersonUnitTransformer class])];
}
@end

@implementation PersonUnitTransformer
+ (Class)transformedValueClass {
    return [NSSet class];
}

+ (BOOL)allowsReverseTransformation {
    return YES;
}

- (id)transformedValue:(id) value {
    if (value != nil && value == [NSNull null]) {
        return value;
    }
    NSArray *array = value;
    NSMutableSet *mutableSet = [NSMutableSet set];
    for (NSNumber *idNumber in array) {
        Unit *unit = [Unit MR_createEntity];
        unit.identifier = [idNumber stringValue];
        [mutableSet addObject:unit];
    }
    return mutableSet;
}

- (id)reverseTransformedValue:(id) value {
    if (value != nil && value == [NSNull null]) {
        return value;
    }
    NSSet *sets = value;
    NSMutableArray *array = [NSMutableArray array];
    for (Unit *unit in sets) {
        [array addObject:@([unit.identifier doubleValue])];
    }
    [array sortUsingSelector:@selector(compare:)];
    return array;
}

@end