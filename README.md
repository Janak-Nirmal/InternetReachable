InternetReachable
=================

## Overview
**InternetReachable** is a simple class that will allow you to stop user using your application in case of non availability of internet. You should use this class only if your application strongly rely on the internet availability and user can not use application at all once internet connection is lost.

When internet connectivity is lost your application screen is covered with an image saying you are not connected to internet, and once internet connectivity is back application automatically remove that image and user can carry on using application.

## How to use
Declare `internetReachable` as property and it can be initialised as easy as follow in didFinishLaunchingWithOptions method:

    _internetReachable = [[InternetRechable alloc] init];

Thats it now relax.

##License

LocationHelper is under the MIT Licence:

Copyright (c) 2013 Jennis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

