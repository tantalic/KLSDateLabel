# KLSDateLabel
A UILabel subclass for displaying dates.  



## Usage

### Basic Usage
Instead of providing a NSString for the label text (as you would do with UILabel), KLSDateLabel uses a NSDate instance which is used to generate the label text:

``` objective-c
KLSDateLabel *dateLabel = [[KLSDateLabel alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
dateLabel.date = [NSDate date];
```

### Documentation
To install the documentation into the Xcode organizer install [appledoc](https://github.com/tomaz/appledoc) and run the command `appledoc -p KLSDateLabel -c "Keivn Stock" --company-id com.tantalic KLSDateLabel/*.h`

## Installation
The recommended way to use KLSDateLabel is with the [CocoaPods](http://www.cocoapods.org) dependency manager.  

1. [Install CocoaPods](http://docs.cocoapods.org/guides/installing_cocoapods.html) (if not already installed)

2. Create a Podfile for your project in the same directory as your Xcode project file:

	``` bash
	$ touch Podfile
	```

3. Add the following line to your Podfile

	``` ruby
	pod 'KLSDateLabel', '~> 0.0'
	```

4. Update (or create) :

	``` bash
	$ pod install
	```

5. Always open the Xcode workspace (.xcworkspace) instead of the project file to work on your project

## Requirements
The recommended way to use KLSDateLabel is with the [CocoaPods](http://www.cocoapods.org) dependency manager. If you choose to use the source files directly you are responsible for meeting the following requirements. 

### iOS 5.0 or Greater
KLSDateLabel has only been tested on iOS 5.0 and greater. It may work with previous releases but is not recomended. 

### Automatic Reference Counting (ARC)
KLSDateLabel requires [ARC](https://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html). To use KLSDateLabel in a non-arc project, you will need to set a <code>-fobjc-arc</code> compiler flag on KLSDateLabel.m. To set this compiler flag in Xcode, go to your active target and select the "Build Phases" tab. Expand the "Compile Sources" phase and double click on the KLSDateLabel.m file.  Insert <code>-fobjc-arc</code> and click "Done".

### TTTLocalizedPluralString
KLSDateLabel uses [TTTLocalizedPluralString](https://github.com/mattt/TTTLocalizedPluralString/) for handling localization strings. The TTTLocalizedPluralString macros work simular to the NSLocalizedString macros but add a count argument.

### appledoc
[appledoc](https://github.com/tomaz/appledoc) is required if you would like to install the KLSDateLabel documentation into the Xcode organizer.



## License
KLSDateLabel is made available under the MIT license. See the LICENSE file for more info.
