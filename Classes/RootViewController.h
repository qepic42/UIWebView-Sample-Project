//
//  RootViewController.h
//  LoadingViewAnimations
//
//  Created by Q on 18.11.10.
//  Copyright (c) 2010 PQ-Developing.com. All rights reserved.
//
#import "Characteristics.h"

@interface RootViewController : UITableViewController {
    NSMutableArray *dataArray;
    
    Characteristics *array;
}

@property(retain,nonatomic)NSMutableArray *dataArray;

@end

