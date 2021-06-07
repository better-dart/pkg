################################################################


migrate-v2:
	fvm dart pub upgrade --null-safety
	fvm flutter pub get
	fvm dart migrate

pkg.release.check:
	fvm dart pub publish --dry-run

pkg.release:
	fvm dart pub publish # -v

