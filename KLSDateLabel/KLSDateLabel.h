//
//  KLSDateLabel.h
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

#import <UIKit/UIKit.h>


/**
 `KLSDateLabel` is a `UILabel` subclass used for displaying `NSDate` instances.
 Instead of supplying the label with text to display you provide `KLSDateLabel`
 instances with a `NSDate` through the `date` property which then is used to 
 generate the text of the label. 
 
 In addition to setting the date there are a number of properties for 
 controlling how the text for the label is generated and wether or not the 
 label automatically updates itself. 
 */
@interface KLSDateLabel : UILabel

///------------------------
/// @name Setting the Date
///------------------------

/**
 The date used to generate the text of the label.
 */
@property (strong, nonatomic) NSDate *date;



///--------------------------
/// @name Customizing Output
///--------------------------

/**
 The formatter used to generate the label text from the `date`. 
 
 The default date formatter uses the `NSDateFormatterLongStyle` `dateStyle`
 and `NSDateFormatterNoStyle` `timeStyle`.

 */
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

/**
 The `NSBundle` with localization string file for the date formatting.
 
 By default `KLSDateLabel` will use KLSDateLabel.bundle for the localization 
 bundle. If you provide your own bundle it must contain a
 `RelativeDates.strings` file with the localization strings.
 */
@property (strong, nonatomic) NSBundle *localizationBundle;

/**
 A boolean flag to enable/disable auto updating of the label text. The default
 value is `YES`.
 
 When enabled the label text will automatically be updated as time passes.
 */
@property (assign, nonatomic) BOOL autoupdates;

/**
 A boolean flag to enable/disable the display of relative dates. The default
 value is `YES`.
 
 When enabled the label text will show friendly displays of recent dates 
 relative to the current date. Dates within 7 days will use relative
 descriptions. Dates further away will use the `dateFormatter`.
 */
@property (assign, nonatomic) BOOL showRelativeDate;


@end
