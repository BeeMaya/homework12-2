#import <Foundation/Foundation.h>


@interface BookInfo : NSObject

@property NSString *ISBN;
@property NSDate *date;
@property NSString *language;
@property NSString *author_full_name;
@property NSString *title;
@property NSString *price;

- (instancetype)initWithISBN:(NSString *)ISBN date:(NSDate *)date language:(NSString *)language author_full_name:(NSString *)author_full_name title:(NSString *)title price:(NSString *)price;

//- (NSString *)description;

+ (instancetype)infoWithISBN:(NSString *)ISBN date:(NSDate *)date language:(NSString *)language author_full_name:(NSString *)author_full_name title:(NSString *)title price:(NSString *)price;

+ (instancetype)infoWithDictionary:(NSDictionary *)dict;

@end