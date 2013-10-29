// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Person.h instead.

#import <CoreData/CoreData.h>
#import "ManagedMappingObject.h"

extern const struct PersonAttributes {
	__unsafe_unretained NSString *age;
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *name;
} PersonAttributes;

extern const struct PersonRelationships {
	__unsafe_unretained NSString *units;
} PersonRelationships;

extern const struct PersonFetchedProperties {
} PersonFetchedProperties;

@class Unit;





@interface PersonID : NSManagedObjectID {}
@end

@interface _Person : ManagedMappingObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PersonID*)objectID;





@property (nonatomic, strong) NSNumber* age;



@property int16_t ageValue;
- (int16_t)ageValue;
- (void)setAgeValue:(int16_t)value_;

//- (BOOL)validateAge:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* identifier;



//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *units;

- (NSMutableSet*)unitsSet;





@end

@interface _Person (CoreDataGeneratedAccessors)

- (void)addUnits:(NSSet*)value_;
- (void)removeUnits:(NSSet*)value_;
- (void)addUnitsObject:(Unit*)value_;
- (void)removeUnitsObject:(Unit*)value_;

@end

@interface _Person (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAge;
- (void)setPrimitiveAge:(NSNumber*)value;

- (int16_t)primitiveAgeValue;
- (void)setPrimitiveAgeValue:(int16_t)value_;




- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveUnits;
- (void)setPrimitiveUnits:(NSMutableSet*)value;


@end
