bootstrap:
	@carthage bootstrap --platform iOS --no-use-binaries

update:
	@carthage update --platform iOS --no-use-binaries

sort:
	@perl ./bin/sortXcodeProject Succinct.xcodeproj/project.pbxproj

unit-tests:
	@xcodebuild -project Succinct.xcodeproj -scheme "Succinct" -destination "platform=iOS Simulator,OS=11.2,name=iPhone 8" build test

units tests: sort unit-tests
