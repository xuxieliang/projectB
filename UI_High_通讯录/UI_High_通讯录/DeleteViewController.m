//
//  DeleteViewController.m
//  UI_High_通讯录
//
//  Created by lanou on 15/10/26.
//  Copyright (c) 2015年 xxl. All rights reserved.
//

#import "DeleteViewController.h"
#import "AppDelegate.h"
#import "Contact.h"

@interface DeleteViewController ()

@property (strong, nonatomic) IBOutlet UITextField *nameTF;

@property (strong, nonatomic) IBOutlet UITextField *sexTF;

@property (strong, nonatomic) IBOutlet UITextField *ageTF;

@property (strong, nonatomic) IBOutlet UITextField *hobbyTF;

@property (nonatomic,retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
}
- (IBAction)deleteContact:(id)sender {
    
    // 查找
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Contact"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS 'self.nameTF.text'"];
    request.predicate = predicate;
    NSArray *arr = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    // 删除
    if (arr.count != 0) {
        
        for (int i = 0; i < arr.count; i++) {
            Contact *contact = arr[i];
            [self.managedObjectContext deleteObject:contact];
            [self.managedObjectContext save:nil];
        }
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
