//
//  PWKDispatcher.h
//  ProtoWireKit
//
//  Created by Richard Fox on 1/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRSDispatcher <T>: NSObject

@property (nonatomic, readonly) T targetReciever;

- (void)addListener:(T)target;
- (void)removeListener:(T)target;

@end

NS_ASSUME_NONNULL_END
