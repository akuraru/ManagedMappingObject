// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Unit.h instead.

#import <CoreData/CoreData.h>
#import "ManagedMappingObject.h"

extern const struct UnitAttributes {
	__unsafe_unretained NSString *centimeter;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *identifier;
} UnitAttributes;

extern const struct UnitRelationships {
	__unsafe_unretained NSString *person;
} UnitRelationships;

extern const struct UnitFetchedProperties {
} UnitFetchedProperties;

@class Person;





@interface UnitID : NSManagedObjectID {}
@end

@interface _Unit : ManagedMappingObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UnitID*)objectID;





@property (nonatomic, strong) NSNumber* centimeter;



@property double centimeterValue;
- (double)centimeterValue;
- (void)setCentimeterValue:(double)value_;

//- (BOOL)validateCentimeter:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* identifier;



//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Person *person;

//- (BOOL)validatePerson:(id*)value_ error:(NSError**)error_;





@end

@interface _Unit (CoreDataGeneratedAccessors)

@end

@interface _Unit (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCentimeter;
- (void)setPrimitiveCentimeter:(NSNumber*)value;

- (double)primitiveCentimeterValue;
- (void)setPrimitiveCentimeterValue:(double)value_;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;





- (Person*)primitivePerson;
- (void)setPrimitivePerson:(Person*)value;


@end
