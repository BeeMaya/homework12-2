#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "BookInfo.h"

static NSString *const TARGET_LANGUAGE = @"Zulu";


@interface DZ12_DictionaryTests : XCTestCase

@end

@implementation DZ12_DictionaryTests

- (NSMutableArray *) createNewArray{

    NSArray *rawData = [TestUtils loadRawDataArray];

    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:rawData.count];

    for (NSDictionary *dict in rawData){

        BookInfo *info = [BookInfo infoWithDictionary:dict];

        [newArray addObject:info];
    }
    return newArray;
}


- (void)testPerformanceExample6 {

    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        NSMutableArray *newArray = [self createNewArray];

        [self startMeasuring];

        __block BookInfo *targetObjects;

        [TestUtils performBlock:^(){

            int targetIndex = [newArray indexOfObjectPassingTest:^BOOL(BookInfo * obj, NSUInteger idx, BOOL *stop) {
                return [obj.language isEqualToString:TARGET_LANGUAGE];
            }];

            if (targetIndex !=NSNotFound){
                targetObjects = newArray [targetIndex];
            }

        } nTimes:1000];

        [self stopMeasuring];

        NSLog(@"%@", targetObjects);

    }];
}


- (NSDictionary *) createNewDictionary {

    NSArray *rawData = [TestUtils loadRawDataArray];

    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:rawData.count];

    for (NSDictionary *dict in rawData){

        BookInfo *info = [BookInfo infoWithDictionary:dict];

        result[info.language] = info;
    }
    return result;
}


-(void)testPerformanceExample8 {

    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

     NSDictionary * newDictionary = [self createNewDictionary];

     [self startMeasuring];

        __block BookInfo *targetObjects;

     [TestUtils performBlock:^() {

         targetObjects = newDictionary[TARGET_LANGUAGE];

     } nTimes:1000];

        [self stopMeasuring];

        NSLog(@"%@", targetObjects);

    }];




}
@end
