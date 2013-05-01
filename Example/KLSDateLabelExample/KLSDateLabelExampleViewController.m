//
//  KLSDateLabelExampleViewController.m
//  KLSDateLabelExample
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

#import "KLSDateLabelExampleViewController.h"

@interface KLSDateLabelExampleViewController ()

@end

@implementation KLSDateLabelExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Now
    self.exampleOne.date = [NSDate date];
    
    // 30 seconds ago, 30 seconds from now
    self.exampleTwo.date = [NSDate dateWithTimeIntervalSinceNow:30];
    self.exampleThree.date = [NSDate dateWithTimeIntervalSinceNow:-30];
    
    // 5 minutes ago
    self.exampleFour.date = [NSDate dateWithTimeIntervalSinceNow:(5*60)];
    
    // Two days ago
    self.exampleFive.date = [NSDate dateWithTimeIntervalSinceNow:(-2*60*60*24)];
    
    // November 16. 2012, 10:38 PM PST
    self.exampleSix.date = [NSDate dateWithTimeIntervalSince1970:1353134280];
    
}


@end
