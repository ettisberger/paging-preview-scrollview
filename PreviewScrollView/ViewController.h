//
//  ViewController.h
//  PreviewScrollView
//
//  Created by Andreas Ettisberger on 21.04.13.
//  Copyright (c) 2013 zuehlke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentView.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet ContentView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
