//
//  AddViewController.m
//  UI_High_通讯录
//
//  Created by lanou on 15/10/26.
//  Copyright (c) 2015年 xxl. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"
#import "Contact.h"
@interface AddViewController ()

@property (nonatomic,retain) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UITextField *sexTF;
@property (strong, nonatomic) IBOutlet UITextField *ageTF;
@property (strong, nonatomic) IBOutlet UITextField *hobbyTF;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;

}
- (IBAction)addContact:(id)sender {
    
    Contact *contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:self.managedObjectContext];
    
    contact.name = self.nameTF.text;
    contact.sex = self.sexTF.text;
    contact.age = self.ageTF.text;
    contact.hobby = self.hobbyTF.text;
    
    [self.managedObjectContext save:nil];
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
