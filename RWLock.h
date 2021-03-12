//
//  RWLock.h
//
//  Created by jungao on 2021/1/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RWLock : NSObject

- (void)read:(void(^)(void))readBlock;

- (void)write:(void(^)(void))writeBlock;

@end

NS_ASSUME_NONNULL_END
