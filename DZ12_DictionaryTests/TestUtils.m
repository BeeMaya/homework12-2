#import "TestUtils.h"



@implementation TestUtils {

}
+ (NSMutableArray *)loadRawDataArray {

    NSMutableArray *result = [[NSMutableArray alloc]init];

    for (int i=2; i<=21; i++) {

        NSString *name = [NSString stringWithFormat:@"MOCK_DATA-%d", i];

        [result addObjectsFromArray:[self loadRawArrayByName:name]];
    }

    return result;
}

+ (NSMutableArray *)loadRawArrayByName:(NSString *)name {
    NSMutableArray *result;
    NSBundle *bundle = [NSBundle bundleForClass:self];

    NSString *path = [bundle pathForResource:name ofType:@"json"];

    NSURL *url = [NSURL fileURLWithPath:path];

    NSData *rawData = [NSData dataWithContentsOfURL:url];

    result = [NSJSONSerialization JSONObjectWithData:rawData options:NSJSONReadingMutableContainers error:nil];
    return result;
}


+ (void)performBlock:(void (^)())pFunction nTimes:(int)times {

    for (int i=0; i<times; i++) {
        pFunction();
    }
}
@end