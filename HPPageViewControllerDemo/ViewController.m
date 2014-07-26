//
//  ViewController.m
//  HPPageViewControllerDemo
//
//  Created by Zixuan Li on 7/26/14.
//  Copyright (c) 2014 Mallocu. All rights reserved.
//

#import "ViewController.h"
#import "ContentTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
