//
//  ContentTableViewController.m
//  PageControllerTest
//
//  Created by Zixuan Li on 7/25/14.
//  Copyright (c) 2014 Mallocu. All rights reserved.
//

#import "ContentTableViewController.h"

@interface ContentTableViewController ()

@property (nonatomic, strong) NSArray *names;

@end

@implementation ContentTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *name_a = @"Kobe Bryant";
    NSString *name_b = @"LeBron James";
    NSString *name_c = @"Allen Iverson";
    NSString *name_d = @"Dwyane Wade";
    NSString *name_e = @"Stephen Curry";
    
    if (self.index == 0) {
        
        //Team
        name_a = @"Lakers";
        name_b = @"Rockets";
        name_c = @"Magic";
        name_d = @"Heat";
        name_e = @"Spurs";
        
    } else if (self.index == 1) {
        
        //Game
        name_a = @"Kobe Bryant";
        name_b = @"LeBron James";
        name_c = @"Allen Iverson";
        name_d = @"Dwyane Wade";
        name_e = @"Stephen Curry";
        
    } else if (self.index == 2) {
        
        name_a = @"Socres";
        name_b = @"Rebounds";
        name_c = @"Assists";
        name_d = @"Steals";
        name_e = @"Blocks";
        
    }
    
    self.names = @[name_a, name_b, name_c, name_d, name_e];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.layer.shadowColor = [[UIColor blackColor] CGColor];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    NSDictionary *dic = @{@"index": [NSNumber numberWithInteger:self.index]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ContentDidAppear" object:nil userInfo:dic];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.names.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *name = [self.names objectAtIndex:indexPath.row];
    cell.textLabel.text = name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
