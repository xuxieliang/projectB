//
//  ViewController.m
//  UI_High_通讯录
//
//  Created by lanou on 15/10/26.
//  Copyright (c) 2015年 xxl. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "AppDelegate.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,retain) NSMutableArray *contactArr;

@property (nonatomic,retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contactArr = [NSMutableArray array];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] ;
    }
    Contact *contact = self.contactArr[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    
    // 查找
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Contact"];
    self.contactArr = [[self.managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
