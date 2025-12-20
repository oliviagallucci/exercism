@import Foundation;
#import "BinarySearch.h"

@implementation BinarySearch {
	NSArray<NSNumber *> *_list;
}

@synthesize list = _list;

+ (BOOL)isSortedAscending:(NSArray<NSNumber *> *)array {
	if (array.count <= 1) {
		return YES;
	}
	for (NSUInteger i = 1; i < array.count; i++) {
		if (array[i - 1].integerValue > array[i].integerValue) {
			return NO;
		}
	}
	return YES;
}

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array {
	if (![[self class] isSortedAscending:array]) {
		return nil;
	}
	self = [super init];
	if (self) {
		_list = [array copy];
	}
	return self;
}

- (NSUInteger)middle {
	if (_list.count == 0) {
		return NSNotFound;
	}
	return _list.count / 2;
}

- (NSUInteger)searchFor:(NSInteger)element {
	if (_list.count == 0) {
		return NSNotFound;
	}
	NSInteger low = 0;
	NSInteger high = (NSInteger)_list.count - 1;
	while (low <= high) {
		NSInteger mid = low + (high - low) / 2;
		NSInteger value = _list[(NSUInteger)mid].integerValue;
		if (value == element) {
			return (NSUInteger)mid;
		} else if (value < element) {
			low = mid + 1;
		} else {
			high = mid - 1;
		}
	}
	return NSNotFound;
}

@end
