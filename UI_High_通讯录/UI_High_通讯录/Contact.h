//
//  Contact.h
//  UI_High_通讯录
//
//  Created by lanou on 15/10/26.
//  Copyright (c) 2015年 xxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * hobby;
@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * sex;

@end
