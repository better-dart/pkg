################################################################

setup:
	# fix error: template not found
	export PUB_HOSTED_URL=https://pub.dartlang.org; \
	export FLUTTER_STORAGE_BASE_URL=https://storage.dartlang.org; \
	pub global activate melos


init:
  # fix error: do not use pub get proxy url
	melos bootstrap


clean:
	melos clean

################################################################

get:
	flutter pub get

git-push:
	git push origin main


