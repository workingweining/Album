//
//  RootoViewController.m
//  Album
//
//  Created by Lanou on 14-1-24.
//  Copyright (c) 2014年 Lanou. All rights reserved.
//

#import "RootoViewController.h"

@interface RootoViewController ()

@end

@implementation RootoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//image++++
    UIImageView * firstView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    [firstView setImage:[UIImage imageNamed:@"1.jpg"]];
    
    UIImageView * secondView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    [secondView setImage:[UIImage imageNamed:@"2.jpg"]];

    UIImageView * thirdView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    [thirdView setImage:[UIImage imageNamed:@"3.jpg"]];

    UIImageView * fouthView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    [fouthView setImage:[UIImage imageNamed:@"4.jpg"]];

//scroll++++
    UIScrollView * firstScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    [firstScroll addSubview:firstView];
    firstScroll.delegate = self;
    [firstScroll setMaximumZoomScale:2.0];
    [firstScroll setMinimumZoomScale:1.0];
    
    UIScrollView * secondScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(300, 0, 300, 400)];
    [secondScroll addSubview:secondView];
    secondScroll.delegate = self;
    [secondScroll setMaximumZoomScale:2.0];
    [secondScroll setMinimumZoomScale:1.0];
    
    UIScrollView * thirdScorll = [[UIScrollView alloc] initWithFrame:CGRectMake(600, 0, 300, 400)];
    [thirdScorll addSubview:thirdView];
    thirdScorll.delegate = self;
    [thirdScorll setMaximumZoomScale:2.0];
    [thirdScorll setMinimumZoomScale:1.0];
    
    UIScrollView * fouthScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(900, 0, 300, 400)];
    [fouthScroll addSubview:fouthView];
    fouthScroll.delegate = self;
    [fouthScroll setMaximumZoomScale:2.0];
    [fouthScroll setMinimumZoomScale:1.0];
    
//大scroll
    _fatherScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 20, 300, 400)];
    [_fatherScroll setContentSize:CGSizeMake(1200, 400)];
    [_fatherScroll addSubview:firstScroll];
    [_fatherScroll addSubview:secondScroll];
    [_fatherScroll addSubview:thirdScorll];
    [_fatherScroll addSubview:fouthScroll];
    _fatherScroll.delegate = self;
    [_fatherScroll setPagingEnabled:YES];
    [self.view addSubview:_fatherScroll];
//    [_fatherScroll release];
//    [firstScroll release];
//    [secondScroll release];
//    [thirdScorll release];
//    [fouthScroll release];
//    [firstScroll release];
//    [secondView release];
//    [thirdView release];
//    [fouthView release];
    

    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 420, 300, 50)];
    [_page setBackgroundColor:[UIColor grayColor]];
    [_page setNumberOfPages:3];
    [_page addTarget:self action:@selector(pagechangeAction:) forControlEvents:UIControlEventValueChanged];
    [_page setCurrentPage:0];
    [self.view addSubview:_page];
    [_page release];

    
    
    
}

-(void)pagechangeAction:(id)sender{
    _page = (UIPageControl *)sender;
    NSLog(@"current = %d",_page.currentPage);
    _fatherScroll.contentOffset =CGPointMake(_page.currentPage * 300, 0);
}


#pragma mark -
#pragma mark scrollView delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGPoint point = scrollView.contentOffset;
    NSInteger  current = point.x/300;
    _page.currentPage = current;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"开始了");
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;{
    NSLog(@"结束了");
    
    
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSArray * arr = [scrollView subviews];
    UIImageView * currentView = [arr firstObject];
    return currentView;
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
