@import Foundation;

@interface BinarySearch : NSObject

@property (nonatomic, strong, readonly) NSArray<NSNumber *> *list;

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array;
- (NSUInteger)middle;
- (NSUInteger)searchFor:(NSInteger)element;

@end
