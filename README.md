# sample_flutter_material
Learn Material Design Components for Flutter with a series of Flutter Codelabs.

## Notes
* Flutter Plugin doesn't work on Android Studio Canary versions
* If Android Studio can't find Dart SDK then provide path to it in Settings: path_to_flutter_folder/bin/cache/dart-sdk
* To format text (if needed): Right-click the dart code and select Reformat Code with dartfmt
* To add external packages: edit pubspec.yaml file and click Packages get and import package in main.dart
* To wrap widget with another widget: place cursor on the widget and press Alt-Enter -> Choose "Wrap with new widget"
* When using Firebase, set minSdkVersion 21 in android/app/build.gradle to support Multidex, because Firebase requires Multidex support
* To use files from the asset folder, update pubspec.yaml file

## Source
All code and assets are taken from Flutter Codelab repo: https://github.com/material-components/material-components-flutter-codelabs

## References
https://codelabs.developers.google.com/codelabs/mdc-101-flutter/#0

https://codelabs.developers.google.com/codelabs/mdc-102-flutter/#0

https://codelabs.developers.google.com/codelabs/mdc-103-flutter/#0

https://codelabs.developers.google.com/codelabs/mdc-104-flutter/#0