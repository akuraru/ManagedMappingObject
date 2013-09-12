//
//  ManagedMappingObjectTests.m
//  ManagedMappingObjectTests
//
//  Created by azu on 2013/09/11.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import "ManagedMappingObjectTests.h"
#import "MagicalRecord+Setup.h"
#import "PersonJSONModel.h"
#import "Person.h"
#import "NSManagedObjectContext+MagicalRecord.h"
#import "UnitJSONModel.h"
#import "Unit.h"

@implementation ManagedMappingObjectTests

- (void)setUp {
    [super setUp];
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown {
    // Tear-down code here.
    [MagicalRecord cleanUp];
    [super tearDown];
}

- (PersonJSONModel *)personJSONModel {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"person" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    PersonJSONModel *personJSONModel = [PersonJSONModel modelObjectWithDictionary:dictionary];
    return personJSONModel;
}
- (UnitJSONModel *)unitJSONModel {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"unit" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    UnitJSONModel *jsonModel = [UnitJSONModel modelObjectWithDictionary:dictionary];
    return jsonModel;
}

- (void)testInsertWithDictionary {
    PersonJSONModel *jsonModel = [self personJSONModel];
    Person *person = [Person insertWithDictionary:jsonModel.dictionaryRepresentation managedObjectContext:[NSManagedObjectContext MR_defaultContext]];
    STAssertEqualObjects([person dictionaryRepresentation], [jsonModel dictionaryRepresentation], @"dict -> NSManagedObject -> dict");
}

- (void)testTransform {
    UnitJSONModel *jsonModel = [self unitJSONModel];
    Unit *unit = [Unit insertWithDictionary:jsonModel.dictionaryRepresentation managedObjectContext:[NSManagedObjectContext MR_defaultContext]];
    STAssertEqualObjects([unit dictionaryRepresentation], [jsonModel dictionaryRepresentation], @"dict -> NSManagedObject -> dict");
}

@end
