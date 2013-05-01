# KLSDateLabel
A UILabel subclass for displaying dates. By default KLSDateLabel will use a relative description ("9 minutes ago", "16 hours from now", etc) for dates within 7 days of the current date (this behavior can be disabled). For dates outside of this range a date formatter is used to transform the date into text.  The default date formatter uses a long date style and does not include the time. 


## Usage

### Basic Usage
Instead of providing a NSString for the label text (as you would do with UILabel), KLSDateLabel uses a NSDate instance which is used to generate the label text:

``` objective-c
KLSDateLabel *dateLabel = [[KLSDateLabel alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
dateLabel.date = [NSDate date];
```

### Advanced Usage
The behavior of KLSDateLabel's can be customized through the properties available.  Please [see the documentation](http://cocoadocs.org/docsets/KLSDateLabel) for more information.

### Documentation
When you install KLSDateLabel through CocoaPods, documentation will be installed into Xcode’s documentation viewer. The documentation is also available online online at [CocoaDocs](http://cocoadocs.org/docsets/KLSDateLabel). If you are not using CocoaPods you can manually install the documentation by installing [appledoc](https://github.com/tomaz/appledoc) and running the following command:

``` bash
$ appledoc -p KLSDateLabel -c "Keivn Stock" --company-id com.tantalic KLSDateLabel/*.h
```



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
If you choose to use the source files directly you are responsible for meeting the following requirements. 

### iOS 5.0 or Greater
KLSDateLabel has only been tested on iOS 5.0 and greater. It may work with previous releases but is not recomended. 

### Automatic Reference Counting (ARC)
KLSDateLabel requires [ARC](https://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html). To use KLSDateLabel in a non-arc project, you will need to set a <code>-fobjc-arc</code> compiler flag on KLSDateLabel.m. To set this compiler flag in Xcode, go to your active target and select the "Build Phases" tab. Expand the "Compile Sources" phase and double click on the KLSDateLabel.m file.  Insert <code>-fobjc-arc</code> and click "Done".

### TTTLocalizedPluralString
KLSDateLabel uses [TTTLocalizedPluralString](https://github.com/mattt/TTTLocalizedPluralString/) for handling localization strings. The TTTLocalizedPluralString macros work simular to the NSLocalizedString macros but add a count argument.



## License
KLSDateLabel is made available under the MIT license. See the LICENSE file for more info.
