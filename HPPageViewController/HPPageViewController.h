//
//  ViewController.h
//  ScrollViewTest
//
//  Created by Zixuan Li on 7/25/14.
//  Copyright (c) 2014 Mallocu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HPPageViewDataSource <NSObject>

//ps: current max number for view controllers can be in the page is 3 but you can customize this if you need to

/**
 * titles for each page.
 * numbers of titles must match those of view controllers
 * @return NSArray
 */
- (NSArray *)viewControllerTitles;

/**
 * view controllers associated with each page
 * numbers of view controllers must match those of titles
 *@return NSArray
 */
- (NSArray *)viewControllers;

@optional
/**
 * page control current page indicator color
 * @return UIColor
 */
- (UIColor *)pageControlCurrentPageIndicatorTintColor;

/**
 * page control page indicator color
 * @return UIColor
 */
- (UIColor *)pageControlPageIndicatorTintColor;

@end

@interface HPPageViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic) id<HPPageViewDataSource> dataSource;

@end
