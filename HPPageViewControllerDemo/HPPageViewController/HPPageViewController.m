//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Zixuan Li on 7/25/14.
//  Copyright (c) 2014 Mallocu. All rights reserved.
//

#import "HPPageViewController.h"
#import "CustomView.h"

@interface HPPageViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *titleScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UILabel *thirdLabel;

@end

@implementation HPPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self addMainScrollView];
    [self addViewsAsPages];
    
    if (self.navigationItem.title.length == 0) {
        
        //add title scroll view and titles
        [self addTitles];
        [self addPageControl];
        
    }
    
}

- (void)addMainScrollView {
    
    // with space between views. 10 pixels
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 330, 580)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.delegate = self;
    
    CGFloat contentWidth = 0;
    for (int i = 0; i < [[self.dataSource viewControllers] count]; i++) {
        
        contentWidth += 330;
        
    }
    
    self.scrollView.contentSize = CGSizeMake(contentWidth, self.view.frame.size.height);
    
}

- (void)addViewsAsPages {
    
    // add view controllers
    CGFloat x_cordinate = 0;
    for (int i = 0; i < [[self.dataSource viewControllers] count]; i++) {
        
        UIViewController *vc = (UIViewController *)[[self.dataSource viewControllers] objectAtIndex:i];
        [self addChildViewController:vc];
        [self.scrollView addSubview:vc.view];
        vc.view.frame = CGRectMake(x_cordinate, 0, 320, self.view.frame.size.height);
        [vc didMoveToParentViewController:self];
        x_cordinate += 330;
        
    }
    
    [self.view addSubview:self.scrollView];
    
}

- (void)addPageControl {
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 25, 120, 20)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    
    if ([self.dataSource respondsToSelector:@selector(pageControlCurrentPageIndicatorTintColor)]) {
        
        self.pageControl.currentPageIndicatorTintColor = [self.dataSource pageControlCurrentPageIndicatorTintColor];
        
    } else {
        
        self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.914 green:0.000 blue:0.067 alpha:1];
        
    }
    
    
    if ([self.dataSource respondsToSelector:@selector(pageControlPageIndicatorTintColor)]) {
        
        self.pageControl.pageIndicatorTintColor = [self.dataSource pageControlPageIndicatorTintColor];
        
    } else {
        
        self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.886 green:0.886 blue:0.886 alpha:1];
        
    }
    
    [self.navigationController.navigationBar addSubview:self.pageControl];
    
}

- (void)addTitles {
    
    //configure title scroll view
    
    self.titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 0, 220, 25)];
    self.titleScrollView.pagingEnabled = YES;
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.titleScrollView.scrollEnabled = YES;
    self.titleScrollView.contentSize = CGSizeMake(1000, 15);
    self.titleScrollView.delegate = self;
    
    [self.navigationController.navigationBar addSubview:self.titleScrollView];
    
    for (int i = 0; i < [[self.dataSource viewControllerTitles] count]; i++) {
        
        NSString *title = [[self.dataSource viewControllerTitles] objectAtIndex:i];
        
        if (i == 0) {
            
            self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, 220, 20)];
            self.firstLabel.textAlignment = NSTextAlignmentCenter;
            self.firstLabel.textColor = [[[UINavigationBar appearance] titleTextAttributes] objectForKey:NSForegroundColorAttributeName];
            self.firstLabel.font = [[[UINavigationBar appearance] titleTextAttributes] objectForKey:NSFontAttributeName];
            self.firstLabel.text = title;
            [self.titleScrollView addSubview:self.firstLabel];
            
            
        } else if (i == 1) {
            
            self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 2, 220, 20)];
            self.secondLabel.textAlignment = NSTextAlignmentCenter;
            self.secondLabel.textColor = [[[UINavigationBar appearance] titleTextAttributes] objectForKey:NSForegroundColorAttributeName];
            self.secondLabel.font = [[[UINavigationBar appearance] titleTextAttributes] objectForKey:NSFontAttributeName];
            self.secondLabel.text = title;
            [self.titleScrollView addSubview:self.secondLabel];
            
            
        } else if (i == 2) {
            
            self.thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(290, 2, 220, 20)];
            self.thirdLabel.textAlignment = NSTextAlignmentCenter;
            self.thirdLabel.textColor = [[[UINavigationBar appearance] titleTextAttributes] objectForKey:NSForegroundColorAttributeName];
            self.thirdLabel.font = [[[UINavigationBar appearance] titleTextAttributes] objectForKey:NSFontAttributeName];
            self.thirdLabel.text = title;
            [self.titleScrollView addSubview:self.thirdLabel];
            
        }
        
    }
    
    
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    if (scrollView == self.scrollView) {
        
        if (targetContentOffset->x == 0) {
            
            self.pageControl.currentPage = 0;
            
        } else if (targetContentOffset->x == 330) {
            
            self.pageControl.currentPage = 1;
            
        } else if (targetContentOffset->x == 660) {
            
            self.pageControl.currentPage = 2;
            
        }
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.scrollView) {
        
        CGFloat margin = (scrollView.contentOffset.x / 320) * 140;
        
        [self.titleScrollView setContentOffset:CGPointMake(margin, self.titleScrollView.contentOffset.y)];
        
    } else if (scrollView == self.titleScrollView) {
        
        CGFloat x_offset = scrollView.contentOffset.x;
        
        if (x_offset < 0) {
            
            self.firstLabel.alpha = 1 + x_offset / 100;
            
        } else if (x_offset < 144) {
            
            self.firstLabel.alpha = (scrollView.contentOffset.x + -140) * -1 * 0.007;
            self.secondLabel.alpha = scrollView.contentOffset.x * 0.007;
            
        } else if (x_offset >= 144 && x_offset < 289) {
            
            self.secondLabel.alpha = (scrollView.contentOffset.x + -289) * -1 * 0.007;
            self.thirdLabel.alpha = (scrollView.contentOffset.x - 144) * 0.007;
            
        } else if (x_offset >= 289) {
            
            self.thirdLabel.alpha = (scrollView.contentOffset.x + -433) * -1 * 0.0065;
            
        }
        
    }
    
}

@end
