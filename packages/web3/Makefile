



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
