#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    switch (monthNumber) {
        case 1:
            return @"January";
        case 2:
            return @"February";
        case 3:
            return @"March";
        case 4:
            return @"April";
        case 5:
            return @"May";
        case 6:
            return @"June";
        case 7:
            return @"July";
        case 8:
            return @"August";
        case 9:
            return @"September";
        case 10:
            return @"October";
        case 11:
            return @"November";
        case 12:
            return @"December";
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *DateFormatter= [[NSDateFormatter alloc] init];
    NSMutableString *ans = [[NSMutableString alloc] init];
    DateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd"];
    NSDate* dat = [DateFormatter dateFromString:date];
    ans = [format stringFromDate:dat];
    return [ans intValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSMutableString *ans = [[NSMutableString alloc] init];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.locale = [NSLocale localeWithLocaleIdentifier:@"ru"];
    [format setDateFormat:@"EEEEE"];
    ans = [format stringFromDate:date];
    return ans;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *dateToday =[NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"F"];
    if([format stringFromDate:dateToday] == [format stringFromDate:date]){
        return true;
    }
    return false;
}

@end
