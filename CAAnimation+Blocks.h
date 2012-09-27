//
//  CAAnimation+Blocks.h
//  MPSilva
//
//  Created by Baldoph Pourprix on 27/09/2012.
//  Copyright (c) 2012 Coronal Sky. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (Blocks)

- (void (^)(BOOL finished))completionBlock;
- (void)setCompletionBlock:(void (^)(BOOL finished))completionBlock;

- (void (^)(void))startBlock;
- (void)setStartBlock:(void (^)(void))startBlock;

@end
