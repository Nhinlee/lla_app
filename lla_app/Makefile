build-di:
	flutter packages pub run build_runner build --delete-conflicting-outputs && find . -name "*.inject.summary" |xargs rm -- && find . -name "*.inject.dart" -size 0 |xargs rm --

build-di-watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs
