bootstrap:
	@/usr/bin/time carthage bootstrap --platform iOS --no-use-binaries

update:
	@/usr/bin/time carthage update --platform iOS --no-use-binaries

sort:
	@perl ./bin/sortXcodeProject Succinct.xcodeproj/project.pbxproj

unit-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "Succinct" -destination "platform=iOS Simulator,name=iPhone XR,OS=latest" build test

simulator-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "SuccinctContainer" -destination "platform=iOS Simulator,name=iPhone XR,OS=latest" build test

units tests: sort unit-tests

alltests: sort unit-tests simulator-tests

documentation:
	@/usr/bin/time ./bin/generate_jazzy_docs.sh
