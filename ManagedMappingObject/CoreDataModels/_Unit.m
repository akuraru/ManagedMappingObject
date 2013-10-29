// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Unit.m instead.

#import "_Unit.h"

const struct UnitAttributes UnitAttributes = {
	.centimeter = @"centimeter",
	.date = @"date",
	.identifier = @"identifier",
};

const struct UnitRelationships UnitRelationships = {
	.person = @"person",
};

const struct UnitFetchedProperties UnitFetchedProperties = {
};

@implementation UnitID
@end

@implementation _Unit

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Unit" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Unit";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Unit" inManagedObjectContext:moc_];
}

- (UnitID*)objectID {
	return (UnitID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"centimeterValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"centimeter"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic centimeter;



- (double)centimeterValue {
	NSNumber *result = [self centimeter];
	return [result doubleValue];
}

- (void)setCentimeterValue:(double)value_ {
	[self setCentimeter:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveCentimeterValue {
	NSNumber *result = [self primitiveCentimeter];
	return [result doubleValue];
}

- (void)setPrimitiveCentimeterValue:(double)value_ {
	[self setPrimitiveCentimeter:[NSNumber numberWithDouble:value_]];
}





@dynamic date;






@dynamic identifier;






@dynamic person;

	






@end
