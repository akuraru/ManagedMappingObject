#import <XCTest/XCTest.h>
#import "PersonJSONModel.h"
#import "MappingService.h"
#import "UnitJSONModel.h"

@interface MappingServiceTests : XCTestCase

@end

@implementation MappingServiceTests

- (void)testPersonJSONModel {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"person" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    PersonJSONModel *model = [[PersonJSONModel alloc] init];
    [MappingService updateManagedObject:model dictionary:dictionary];
    NSDictionary *expect = [MappingService dictionaryRepresentationMappingObject:model];

    XCTAssertEqualObjects(expect, dictionary, @"dictionary to person to dictionary");
}

- (void)testUnitJSONModel {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"unit" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    UnitJSONModel *model = [[UnitJSONModel alloc] init];
    [MappingService updateManagedObject:model dictionary:dictionary];
    NSDictionary *expect = [MappingService dictionaryRepresentationMappingObject:model];

    XCTAssertEqualObjects(expect, dictionary, @"dictionary to unit to dictionary");
}
@end
