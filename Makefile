bootstrap:
	@/usr/bin/time carthage bootstrap --platform iOS --no-use-binaries

update:
	@/usr/bin/time carthage update --platform iOS --no-use-binaries

sort:
	@perl ./bin/sortXcodeProject Succinct.xcodeproj/project.pbxproj

unit-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "Succinct" -destination "platform=iOS Simulator,OS=12.0,name=iPhone X" build test

simulator-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "SuccinctContainer" -destination "platform=iOS Simulator,OS=12.0,name=iPhone X" build test

units tests: sort unit-tests

alltests: sort unit-tests simulator-tests
