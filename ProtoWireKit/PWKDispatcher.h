//
//  PWKDispatcher.h
//  ProtoWireKit
//
//  Created by Richard Fox on 1/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PWKDispatcher <T>: NSObject

@property (nonatomic, readonly) T targetReciever;

- (void)addListener:(T)target;
- (void)removeListener:(T)target;

//@property (nonatomic, strong) NSObject <Any *>

@end

NS_ASSUME_NONNULL_END
