#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal ()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
	int i = 0;
	int k = 0;
    NSMutableString *temp = [[NSMutableString alloc] init];
	NSMutableString *Answer = [[NSMutableString alloc] init];
    while(i != string1.length || k != string2.length) {
        if (i == string1.length){
            temp = [NSString stringWithFormat:@"%c", [string2 characterAtIndex:k]];
            [Answer appendString:temp];
            k++;
            continue;
        }
        if (k == string2.length){
            temp = [NSString stringWithFormat:@"%c", [string1 characterAtIndex:i]];
            [Answer appendString:temp];
            i++;
            continue;
        }
		if((int)[string1 characterAtIndex:i] > (int)[string2 characterAtIndex:k]) {
            temp = [NSString stringWithFormat:@"%c", [string2 characterAtIndex:k]];
            [Answer appendString:temp];
			k++;
		} else {
            temp = [NSString stringWithFormat:@"%c", [string1 characterAtIndex:i]];
            [Answer appendString:temp];
			i++;
		}
	}
	return Answer;
}
//ABCACF
//JACK
//DANIEL
//DAJACKNIEL
//
//
//
@end
