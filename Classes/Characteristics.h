//
//  Characteristics.h
//  LoadingViewAnimations
//
//  Created by Q on 17.11.10.
//  Copyright (c) 2010 PQ-Developing.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Characteristics : NSObject {
    NSString *articleTitle;
    NSString *articleHTMLCode;
}

@property (nonatomic,retain) NSString *articleTitle;
@property (nonatomic,retain) NSString *articleHTMLCode;

@end
