//
//  WebImageOperations.h
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/11/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebImageOperations : NSObject

+ (void)processImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(NSData *imageData))processImage;

@end
