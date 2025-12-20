#import <Foundation/Foundation.h>
#import "HelloWorld.h"

@implementation HelloWorld
- (NSString *)hello:(NSString * _Nullable)input {
    NSString *name = input ?: @"World";
    return [NSString stringWithFormat:@"Hello, %@!", name];
}
@end
