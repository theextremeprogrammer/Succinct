bootstrap:
	@/usr/bin/time ./bin/carthageWrapper.sh bootstrap --platform iOS --no-use-binaries --cache-builds

update:
	@/usr/bin/time ./bin/carthageWrapper.sh update --platform iOS --no-use-binaries --cache-builds

sort:
	@perl ./bin/sortXcodeProject Succinct.xcodeproj/project.pbxproj

unit-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "Succinct" -destination "platform=iOS Simulator,name=iPhone 11,OS=latest" build test

simulator-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "SuccinctContainer" -destination "platform=iOS Simulator,name=iPhone 11,OS=latest" build test

units tests: sort unit-tests

alltests: sort unit-tests simulator-tests

documentation:
	@/usr/bin/time ./bin/generate_jazzy_docs.sh
