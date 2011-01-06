//
//  DetailViewController.h
//  LoadingViewAnimations
//
//  Created by Q on 17.11.10.
//  Copyright (c) 2010 PQ-Developing.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Characteristics.h"

@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate> {
    UITableView *myTableView;
    UIWebView* myWebView;
    UIView *myView;
    UIActivityIndicatorView *myIndicator;
    UILabel *myLabel;
    UIButton *myButton;
    
    Characteristics *array;
}

@property(nonatomic,retain)Characteristics *array;

-(void)initUIWebView;
-(UIActivityIndicatorView *)setupActivityIndicator:(UIActivityIndicatorView *)activityIndicator: (BOOL)startIndicator;
-(UIButton *)setupButton:(UIButton *)button;

@end
