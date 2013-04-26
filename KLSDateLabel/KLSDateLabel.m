//
//  KLSDateLabel.m
//
//  Copyright (c) 2013 Kevin L. Stock (http://www.tantalic.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "KLSDateLabel.h"
#import "TTTLocalizedPluralString.h"

@implementation KLSDateLabel

#pragma mark -
#pragma mark Initialization/Dealloc
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return [self sharedinitialization];
}

- (id)sharedinitialization {
    if (self) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [_dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        
        _localizationBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"KLSDateLabel" ofType:@"bundle"]];
        
        _autoupdates = YES;
        
        _showRelativeDate = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didRecieveSignificantTimeChangeNotification:)
                                                     name:UIApplicationSignificantTimeChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    
    [coder encodeObject:self.date forKey:@"KLSDate"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    self = [self sharedinitialization];
    
    id date = [decoder decodeObjectOfClass:[NSDate class] forKey:@"KLSDate"];
    if (date) {
        self.date = date;
    }
    
    return self;
}



#pragma mark -
#pragma mark Properties
- (void)setDate:(NSDate *)date {
    if (_date!= date) {
        _date = date;
        [self updateLabelText];
    }
}

- (void)setText:(NSString *)text {
    // Date labels should not have their text property set directly, throw exception to prevent programmer error
    NSException* myException = [NSException exceptionWithName:@"UnsupportedOperationException"
                                                       reason:@"KLSDateLabel does not support directly setting the label text. To set the text use the date property."
                                                     userInfo:nil];
    @throw myException;
}



#pragma mark -
#pragma mark Private
- (void)updateLabelText {
    NSString *relativeDate = nil;
    NSString *formatString = nil;
    
    if (self.showRelativeDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval updateDelay = 0;
        
        // Use "now" if within a second in either direction
        NSTimeInterval intervalDifference = [self.date timeIntervalSinceDate:now];
        if (-1 < intervalDifference && intervalDifference < 1) {
            relativeDate = NSLocalizedStringFromTableInBundle(@"now", @"RelativeDates", self.localizationBundle, @"String for current time (relative date label)");
            updateDelay = 1;
        }
        
        // Outside of a second difference use date components to measure time difference
        else {
            NSComparisonResult dateComparison = [self.date compare:now];
            NSDateComponents *dateDifference = (NSOrderedDescending==dateComparison) ?
                                                    // Components for future date
                                                    [[NSCalendar currentCalendar] components:(NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit)
                                                                                    fromDate:now
                                                                                      toDate:self.date
                                                                                     options:0] :
                                                    // Components for past date
                                                    [[NSCalendar currentCalendar] components:(NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit)
                                                                                    fromDate:self.date
                                                                                      toDate:now
                                                                                     options:0];
            formatString = (NSOrderedDescending==dateComparison) ?
                                // Format string for future date
                                NSLocalizedStringFromTableInBundle(@"from now", @"RelativeDates", self.localizationBundle, @"Format string for future dates") :
                                
                                // Format string for past date
                                NSLocalizedStringFromTableInBundle(@"ago", @"RelativeDates", self.localizationBundle, @"Format string for past dates");

            // More than a week
            if (dateDifference.day>7) {
                // Fallback to date formatter (do nothing here)
            }
            
            // More than a day
            else if ( dateDifference.day>0 ) {
                relativeDate = TTTLocalizedPluralStringFromTableInBundle(dateDifference.day, @"day", @"RelativeDates", self.localizationBundle, @"Pluralized string for number of days ago (relative date labels)");
                updateDelay = (60*60*12); // 12 hours
            }
            
            // More than an hour ago
            else if ( dateDifference.hour>0 ) {
                relativeDate = TTTLocalizedPluralStringFromTableInBundle(dateDifference.hour, @"hour", @"RelativeDates", self.localizationBundle, @"Pluralized string for number of hours ago (relative date labels)");
                updateDelay = (60*30); // 30 minutes
            }
            
            // More than a minute ago
            else if ( dateDifference.minute>0 ) {
                relativeDate = TTTLocalizedPluralStringFromTableInBundle(dateDifference.minute, @"minute", @"RelativeDates", self.localizationBundle, @"Pluralized string for number of minutes ago (relative date labels)");
                updateDelay = 30;
            }
            
            // More than a second ago
            else if ( dateDifference.second>0 ) {
                relativeDate = TTTLocalizedPluralStringFromTableInBundle(dateDifference.second, @"second", @"RelativeDates", self.localizationBundle, @"Pluralized string for number of second ago (relative date labels)");
                updateDelay = 1;
            }
            
            // Less than a second ago
            else {
                relativeDate = NSLocalizedStringFromTableInBundle(@"now", @"RelativeDates", self.localizationBundle, @"String for current time (relative date label)");
                updateDelay = 1;
            }

        }
                
        // Setup auto update
        if (updateDelay && self.autoupdates) {
            [self updateLabelTextAfterDelay:updateDelay];
        }
    }
    
    // Set label text
    if (relativeDate && formatString) {
        NSString *labelText = [NSString stringWithFormat:formatString, relativeDate];
        [super setText:labelText];
    }
    else if (relativeDate) {
        [super setText:relativeDate];
    }
    else {
        [super setText:[self.dateFormatter stringFromDate:self.date]];
    }

}

- (void)updateLabelTextAfterDelay:(NSTimeInterval)delayInSeconds {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self updateLabelText];
    });
}

- (void)didRecieveSignificantTimeChangeNotification:(NSNotification *)notification {
    if (self.autoupdates) {
        [self updateLabelText];
    }
}

@end
