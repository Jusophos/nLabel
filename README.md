# README

## Copyright
2011 by [Richard Jung](http://www.rjonline.de/)

## License
This software is released under the terms of LGPL.

## Description
The nLabel provides a subclass of an UILabel. It auto expends its height depending of the content length and has html trimming feature.

## Requirements

iOS 4.0+

## Install
1. Add the following files to your xCode project:
	
	- nLabel.h
	- nLabel.m
	
2. Import the header file where do you want to use it

	- Example: ``#import "nLabel.h"``
	
3. Add the string where do you want, whether in the interface builder or programmatically:

Just add the text with the "setText" selector and the rest will be done by nLabel.

## Options

The following options are available:

* *trimHTMLTags*
	* Removes all html tags from the text.

Usage:

``nLabel *label 	 = [[nLabel alloc] init];``

``label.trimHTMLTags = YES;``

## Coming soon

* HTML trimming supports attributes
* HTML trimming supports CDATA
* HTML trimming supports subtags
* Interface Builder extension