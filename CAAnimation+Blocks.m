//
//  CAAnimation+Blocks.m
//  MPSilva
//
//  Created by Baldoph Pourprix on 27/09/2012.
//  Copyright (c) 2012 Coronal Sky. All rights reserved.
//

#import "CAAnimation+Blocks.h"
#import <objc/runtime.h>

static char COMPLETION_BLOCK_KEY;
static char START_BLOCK_KEY;

@implementation CAAnimation (Blocks)

- (void (^)(BOOL finished))completionBlock
{
	void (^completionBlock)(BOOL) = objc_getAssociatedObject(self, &COMPLETION_BLOCK_KEY);
	return completionBlock;
}

- (void)setCompletionBlock:(void (^)(BOOL finished))completionBlock
{
	self.delegate = self;
	objc_setAssociatedObject(self, &COMPLETION_BLOCK_KEY, completionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))startBlock
{
	dispatch_block_t startBlock = objc_getAssociatedObject(self, &START_BLOCK_KEY);
	return startBlock;
}

- (void)setStartBlock:(void (^)(void))startBlock
{
	self.delegate = self;
	objc_setAssociatedObject(self, &START_BLOCK_KEY, startBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	void (^completionBlock)(BOOL) = self.completionBlock;
	if (completionBlock) completionBlock(flag);
}

- (void)animationDidStart:(CAAnimation *)anim
{
	dispatch_block_t startBlock = self.startBlock;
	if (startBlock) startBlock();
}

@end
