@import Foundation;

@interface Clock : NSObject

// Factory methods
+ (instancetype)clockWithHours:(NSInteger)hours;
+ (instancetype)clockWithHours:(NSInteger)hours minutes:(NSInteger)minutes;

// Mutation methods (return self for chaining)
- (instancetype)addMinutes:(NSInteger)minutes;
- (instancetype)subtractMinutes:(NSInteger)minutes;

@end
