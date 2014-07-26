//
//  HPViewController.m
//  HPPageViewController
//
//  Created by lizixroy on 07/26/2014.
//  Copyright (c) 2014 lizixroy. All rights reserved.
//

#import "HPViewController.h"
#import <HPPageViewController.h>
#import "ContentTableViewController.h"
@interface HPViewController ()

@end

@implementation HPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setNeedsStatusBarAppearanceUpdate];
    HPPageViewController *viewController = [[HPPageViewController alloc] init];
    viewController.dataSource = self;
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma HPPageViewController dataSource

//provide view controllers whose views you want to display in pages

- (NSArray *)viewControllers {
    
    ContentTableViewController *firstVC = [[ContentTableViewController alloc] init];
    ContentTableViewController *secondVC = [[ContentTableViewController alloc] init];
    ContentTableViewController *thirdVC = [[ContentTableViewController alloc] init];
    firstVC.index = 0;
    secondVC.index = 1;
    thirdVC.index = 2;
    
    return @[firstVC, secondVC, thirdVC];
    
}

//provide titles that will be displayed on the navigation bar

- (NSArray *)viewControllerTitles {
    
    NSString *teams = @"Teams";
    NSString *games = @"Players";
    NSString *rankings = @"Rankings";
    return @[teams, games, rankings];
    
}

- (UIColor *)pageControlCurrentPageIndicatorTintColor {
    
    return [UIColor whiteColor];
    
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
