//
//  ViewController.m
//  PreviewScrollView
//
//  Created by Andreas Ettisberger on 21.04.13.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import "ViewController.h"
#import "ContentView.h"

@implementation ViewController
{
    NSMutableArray *pages;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ScrollView
- (void)initScrollView
{
    // constants
    const int PAGES = 3;
    
    float currentOffset = 0.0f;
    
    // settings
    self.scrollView.clipsToBounds = NO; // our subviews should not be clipped to the bounds of our scrollview
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    pages = [[NSMutableArray alloc] init];
 
    for (int i = 0; i < PAGES; i++) {
        // create frame at the right position
        CGRect frame = CGRectMake(currentOffset, 0.0f, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.tag = i;
        imageView.contentMode = UIViewContentModeCenter;
        imageView.image = [UIImage imageNamed:@"zuehlke_logo.jpg"];
        
        if(i != 0) imageView.alpha = 0.5f;
        
        [self.scrollView addSubview:imageView];
        [pages addObject:imageView];
        
        // adapt offset
        currentOffset += imageView.frame.size.width;
        
        // set contentsize of the scrollview
        self.scrollView.contentSize = CGSizeMake(currentOffset, self.scrollView.frame.size.height);
    }
}

- (void)animatePageForCurrentPage:(int)page
{
    for(UIImageView *imageView in pages){
        if(imageView.tag == page){
            [self fadeInView:imageView];
        } else {
            [self fadeOutView:imageView];
        }
    }
}

- (void)fadeInView:(UIView*)view
{
    [UIView animateWithDuration:0.2f animations:^{
        view.alpha = 1.0f;
    }];
}

- (void)fadeOutView:(UIView*)view
{
    [UIView animateWithDuration:0.2f animations:^{
        view.alpha = 0.5f;
    }];
}

#pragma mark ScrollView Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // calculate current page
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    [self animatePageForCurrentPage:page];
}

@end
