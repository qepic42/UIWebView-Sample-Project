//
//  Characteristics.m
//  LoadingViewAnimations
//
//  Created by Q on 17.11.10.
//  Copyright (c) 2010 PQ-Developing.com. All rights reserved.
//

#import "Characteristics.h"


@implementation Characteristics
@synthesize articleTitle, articleHTMLCode;

- (void)dealloc {
    [articleTitle release];
    [articleHTMLCode release];
    [super dealloc];
}

@end
