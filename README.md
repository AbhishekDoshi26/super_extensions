## Introduction

We all love shortcode that does the work. So dart has provided a great feature called Extension Methods which you can use on different data types! What are Extension Methods exactly? Extension methods add functionality to existing libraries. You might use extension methods without even knowing it. For example, when you use code completion in an IDE, it suggests extension methods alongside regular methods. [(Reference)](https://dart.dev/guides/language/extension-methods "(Reference)")

## What is this package about?
We probably use lots of extension methods in our project. So, this package combines all the extension methods that are used on daily basis and make them available to you under a single package so that you can reuse them in multiple packages.

## Getting started

To learn more about Extension Methods, feel free to check this [article](https://medium.com/google-developer-experts/extension-methods-eb7a89a055f8 "article").

## List of Extensions
In this package, right now we have following extension methods:
- **Extensions on BuildContext:**
	- void showSnackBar(SnackBar snackBar)
	- void showNewDialog(Widget child)
	- double screenHeight()
	- double screenWidth()
	- bool isMobile()
	- bool isTablet()
	- bool isDesktop()
	- void push(Widget className)
	- void pushReplacement(Widget className)
	- void pushNamed(String path)
	- void pushReplacementNamed(String path)
	- void pushAndRemoveUntil(Widget className)
	- void pushNamedAndRemoveUntil(String path)
	- void pop()
	- void popAndPushNamed(String path)
	<br>
- **Extensions on String:**
	- String capitaliseFirstChar()
	- String capitaliseEachWordFirstChar()
	<br>
- **Extensions on num:**
	- SizedBox hSizedBox
	- SizedBox wSizedBox


## Contribution Information

If you feel that there can be any other extension methods, feel free to create a PR for the same and I would love to add it to the package 💙
