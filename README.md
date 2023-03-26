<p align="center">

[![Super Extensions](https://github.com/AbhishekDoshi26/super_extensions/actions/workflows/main.yaml/badge.svg)](https://github.com/AbhishekDoshi26/super_extensions/actions/workflows/main.yaml)
[![codecov](https://codecov.io/github/AbhishekDoshi26/super_extensions/branch/main/graph/badge.svg?token=ST07XFABBP)](https://codecov.io/github/AbhishekDoshi26/super_extensions) 

[![GitHub contributors](https://img.shields.io/github/contributors/AbhishekDoshi26/super_extensions.svg?style=plastic&label=Contributors)](https://gitHub.com/AbhishekDoshi26/super_extensions/graphs/contributors/)
[![GitHub stars](https://img.shields.io/github/stars/AbhishekDoshi26/super_extensions.svg?style=plastic&label=Stars)](https://github.com/AbhishekDoshi26/super_extensions) 

</p>

## Introduction

We all love shortcode that does the work. So dart has provided a great feature called Extension Methods which you can
use on different data types! What are Extension Methods exactly? Extension methods add functionality to existing
libraries. You might use extension methods without even knowing it. For example, when you use code completion in an IDE,
it suggests extension methods alongside regular
methods. [(Reference)](https://dart.dev/guides/language/extension-methods "(Reference)")

## What is this package about?

We probably use lots of extension methods in our project. So, this package combines all the extension methods that are
used on daily basis and make them available to you under a single package so that you can reuse them in multiple
packages.

## Getting started

To learn more about Extension Methods, feel free to check
this [article](https://medium.com/google-developer-experts/extension-methods-eb7a89a055f8 "article").

## List of Extensions

In this package, right now we have the following extension methods:

- **Extensions on BuildContext:**
    - void showSnackBar(SnackBar snackBar)
    - void showNewDialog(Widget child)
    - double get screenHeight
    - double get screenWidth
    - bool get isMobile
    - bool get isTablet
    - bool get isDesktop
    - void push(Widget className)
    - void pushReplacement(Widget className)
    - void pushNamed(String path)
    - void pushReplacementNamed(String path)
    - void pushAndRemoveUntil(Widget className)
    - void pushNamedAndRemoveUntil(String path)
    - Future<bool> maybePop()
    - void pop()
    - void popAndPushNamed(String path)
    - EdgeInsets padding
    - EdgeInsets viewPadding
    - EdgeInsets viewInsets
      <br>
- **Extensions on String:**
    - String capitaliseFirstChar()
    - String capitaliseEachWordFirstChar()
    - Future<void> copyToClipboard()
    - bool isPalindrom
    - String reversed
      <br>
- **Extensions on num:**
    - SizedBox hSizedBox
    - SizedBox wSizedBox

## Contribution Information

If you feel that there can be any other extension methods, feel free to create a PR for the same and I would love to add
it to the package 💙
