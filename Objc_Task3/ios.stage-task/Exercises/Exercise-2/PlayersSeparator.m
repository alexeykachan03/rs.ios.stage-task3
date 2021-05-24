#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
	NSInteger answer = 0;
	NSMutableArray *increaseBuffer;
	NSMutableArray *decreaseBuffer;

	if ([ratingArray count] < 3) {
		return 0;
	}
//1234
	for (int i = 0; i < [ratingArray count] - 2; i++) {
		increaseBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
		decreaseBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
		for (int j = i+1; j < [ratingArray count]; j++) {
			if(decreaseBuffer.count == 2) {
				[decreaseBuffer removeLastObject];
			}
			if(increaseBuffer.count == 2) {
				[increaseBuffer removeLastObject];
			}
			if([[ratingArray objectAtIndex:j] intValue] > [[ratingArray objectAtIndex:i] intValue]) {
				[increaseBuffer addObject:[ratingArray objectAtIndex:j]];
			} else {
				[decreaseBuffer addObject:[ratingArray objectAtIndex:j]];
			}
			for (int k = j+1; k < [ratingArray count]; k++) {
				if([[ratingArray objectAtIndex:k] intValue] > [[ratingArray objectAtIndex:j] intValue]) {
					if(increaseBuffer.count == 2) {
						[increaseBuffer addObject:[ratingArray objectAtIndex:k]];
						answer++;
						[increaseBuffer removeLastObject];
					}
				}
				if([[ratingArray objectAtIndex:k] intValue] < [[ratingArray objectAtIndex:j] intValue]) {
					if(decreaseBuffer.count == 2) {
						[decreaseBuffer addObject:[ratingArray objectAtIndex:k]];
						answer++;
						[decreaseBuffer removeLastObject];
					}
				}
			}
		}
	}
	return answer;
}

@end
//**Input: [3, 6, 4, 5, 2]**
