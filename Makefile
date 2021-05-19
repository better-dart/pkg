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


get.dust:
	cd packages/dust; flutter pub get

get.web3:
	cd packages/web3; flutter pub get

git-push:
	git push origin main


# https://github.com/hhstore/blog/issues/245
create-pkg:
	cd packages; flutter create --template=package better_ui


git.commit.clean:
	git checkout --orphan newMain
	git add -A
	git commit -am "clean"

git.change.main:
	git branch -D main
	git branch -m main
	git push -f origin main
