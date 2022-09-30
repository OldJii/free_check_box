<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Features

customcheckbox is a ui component that It can help you build fully custom checkboxes.

Support Android and iOS platforms

<div align="left">
<img src=https://imgoldjii.oss-cn-beijing.aliyuncs.com/customcheckbox.gif height=400 />
</div>

## Getting started

Run this command:

With Flutter:

```
 $ flutter pub add customcheckbox
```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```
dependencies:
  customcheckbox: ^1.0.1
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn
more.

## Usage

```
CostomCheckBox(
  size: 25,
  isChecked: widget.isCheck,
  checkedColor: const Color(0xFF3940FF),
  animationDuration: const Duration(milliseconds: 200),
  widgetPadding: 0,
  borderColor: widget.isCheck
      ? const Color(0xFF3940FF)
      : const Color(0x4D979797),
  onTap: (_) {
    onClick();
  },
)
```

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing plugin code, view
the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).