# Setup shell to use when running commands
SHELL := /bin/zsh
# Do not print commands or comments. See: https://stackoverflow.com/a/24005420
.SILENT:

carthage_bootstrap:
	Scripts/tools.sh make_binaries FirebaseSwiftProtobuf carthage
	Scripts/tools.sh make_binaries StaticSwiftProtobuf ./../Scripts/carthage.sh
	Scripts/tools.sh make_binaries DynamicSwiftProtobuf carthage

check_linkage_type:
	Scripts/tools.sh check_linkage_type FirebaseSwiftProtobuf
	Scripts/tools.sh check_linkage_type StaticSwiftProtobuf
	Scripts/tools.sh check_linkage_type DynamicSwiftProtobuf

xcodegen:
	rm -rf Sample.xcodeproj
	xcodegen
	# open Sample.xcodeproj

firebase_swift_protobuf:
	Scripts/tools.sh switch FirebaseSwiftProtobuf
	make xcodegen build_app

static_swift_protobuf:
	Scripts/tools.sh switch StaticSwiftProtobuf
	make xcodegen build_app

dynamic_swift_protobuf:
	Scripts/tools.sh switch DynamicSwiftProtobuf
	make xcodegen build_app

build_app:
	xcodebuild \
		-project Sample.xcodeproj \
		-scheme App \
		-destination 'platform=iOS Simulator,name=iPhone 8,OS=14.3' \
		clean build | xcbeautify
