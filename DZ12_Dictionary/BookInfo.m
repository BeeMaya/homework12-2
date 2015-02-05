//
// Created by Maya on 2/4/15.
// Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "BookInfo.h"


@implementation BookInfo {

}
- (instancetype)initWithISBN:(NSString *)ISBN date:(NSDate *)date language:(NSString *)language author_full_name:(NSString *)author_full_name title:(NSString *)title price:(NSString *)price {
    self = [super init];
    if (self) {
        self.ISBN = ISBN;
        self.date = date;
        self.language = language;
        self.author_full_name = author_full_name;
        self.title = title;
        self.price = price;
    }

    return self;
}

+ (instancetype)infoWithISBN:(NSString *)ISBN date:(NSDate *)date language:(NSString *)language author_full_name:(NSString *)author_full_name title:(NSString *)title price:(NSString *)price {
    return [[self alloc] initWithISBN:ISBN date:date language:language author_full_name:author_full_name title:title price:price];
}

+ (instancetype)infoWithDictionary:(NSDictionary *)dict {
     BookInfo *result = [self infoWithISBN:dict [@"ISBN"] date:dict[@"date"] language:dict[@"language"] author_full_name:dict [@"author_full_name"] title:dict [@"title"] price:dict [@"price"]];

    return result;
}


@end