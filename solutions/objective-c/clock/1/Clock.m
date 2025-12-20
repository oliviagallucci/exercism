@import Foundation;
#import "Clock.h"

static const NSInteger kMinutesPerHour = 60;
static const NSInteger kMinutesPerDay = 24 * 60; // 1440

@interface Clock ()
@property (nonatomic) NSInteger minutesFromMidnight; // normalized to [0, 1439]
@end

@implementation Clock

#pragma mark - Initialization

+ (instancetype)clockWithHours:(NSInteger)hours {
	return [self clockWithHours:hours minutes:0];
}

+ (instancetype)clockWithHours:(NSInteger)hours minutes:(NSInteger)minutes {
	Clock *clock = [[self alloc] init];
	clock.minutesFromMidnight = [self normalizeMinutes:hours * kMinutesPerHour + minutes];
	return clock;
}

#pragma mark - Mutation

- (instancetype)addMinutes:(NSInteger)minutes {
	self.minutesFromMidnight = [[self class] normalizeMinutes:self.minutesFromMidnight + minutes];
	return self;
}

- (instancetype)subtractMinutes:(NSInteger)minutes {
	return [self addMinutes:-minutes];
}

#pragma mark - Description

- (NSString *)description {
	NSInteger hours = self.minutesFromMidnight / kMinutesPerHour;
	NSInteger mins  = self.minutesFromMidnight % kMinutesPerHour;
	return [NSString stringWithFormat:@"%02ld:%02ld", (long)hours, (long)mins];
}

#pragma mark - Equality & Hashing

- (BOOL)isEqual:(id)object {
	if (self == object) { return YES; }
	if (![object isKindOfClass:[Clock class]]) { return NO; }
	Clock *other = (Clock *)object;
	return self.minutesFromMidnight == other.minutesFromMidnight;
}

- (NSUInteger)hash {
	return (NSUInteger)self.minutesFromMidnight;
}

#pragma mark - Helpers

+ (NSInteger)normalizeMinutes:(NSInteger)totalMinutes {
	// Proper modulo normalization to range [0, kMinutesPerDay-1]
	NSInteger m = totalMinutes % kMinutesPerDay;
	if (m < 0) { m += kMinutesPerDay; }
	return m;
}

@end
