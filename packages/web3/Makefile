



###############################################################
#
# grpc proto:
#   - https://grpc.io/docs/languages/dart/quickstart/
#   - export PATH="$PATH:$HOME/.pub-cache/bin"
###############################################################


install.proto:
	brew install protobuf

setup.proto:
	pub global activate protoc_plugin

# packages/web3/lib/src/proto
gen.proto.all: setup.proto
	# protoc --dart_out=grpc:lib/src/generated ./lib/proto/model/*.proto
	protoc --proto_path=./lib/src/proto --dart_out=grpc:lib/src/proto/ ./lib/src/proto/*.proto

migrate-v2:
	fvm dart pub upgrade --null-safety
	fvm flutter pub get
	fvm dart migrate --skip-import-check # --ignore-errors # --skip-import-check

pkg.release.check:
	fvm dart pub publish --dry-run

pkg.release:
	fvm dart pub publish # -v

