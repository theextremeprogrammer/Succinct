.PHONY:	docs

install-gems:
	@/usr/bin/time sudo bundle update

sort:
	@perl ./bin/sortXcodeProject Succinct.xcodeproj/project.pbxproj

unit-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "Succinct" -destination "platform=iOS Simulator,name=iPhone 11,OS=latest" build test

simulator-tests:
	@/usr/bin/time xcodebuild -project Succinct.xcodeproj -scheme "SuccinctContainer" -destination "platform=iOS Simulator,name=iPhone 11,OS=latest" build test

units tests: sort unit-tests

alltests: sort unit-tests simulator-tests

docs:
	@/usr/bin/time ./bin/generate_jazzy_docs.sh

deploy-podspec:
	@/usr/bin/time pod trunk push Succinct.podspec
