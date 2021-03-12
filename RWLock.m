//
//  RWLock.m
//
//  Created by jungao on 2021/1/27.
//

#import "RWLock.h"

#import <pthread.h>

@interface RWLock () {
    pthread_rwlock_t _rwLock;
}

@end

@implementation RWLock

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    int initResult = pthread_rwlock_init(&_rwLock, NULL);
    if (initResult < 0) initResult = pthread_rwlock_init(&_rwLock, NULL);
    return self;
}

#pragma mark -
- (void)read:(void(^)(void))readBlock
{
    [self readLock];
    readBlock();
    [self readUnlock];
}

- (void)write:(void(^)(void))writeBlock
{
    [self writeLock];
    writeBlock();
    [self writeUnlock];
}

#pragma mark -
- (void)readLock
{
    pthread_rwlock_rdlock(&_rwLock);
}

- (void)readUnlock
{
    pthread_rwlock_unlock(&_rwLock);
}

- (void)writeLock
{
    pthread_rwlock_wrlock(&_rwLock);
}

- (void)writeUnlock
{
    pthread_rwlock_unlock(&_rwLock);
}

@end
