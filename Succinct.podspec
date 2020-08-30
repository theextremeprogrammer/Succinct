Pod::Spec.new do |spec|
  spec.name                  = "Succinct"
  spec.version               = "0.4.30"
  spec.summary               = "UI tests at the speed of unit tests. Proper encapsulation. Architecture agnostic. Freedom to refactor."
  spec.description           = <<-DESC
  Succinct was created to allow you to TDD from the view controller level in unit tests. By searching through the view hierarchy, the internals of your view controller can be kept private, honoring encapsulation. You can use any architectural pattern to implement your view controllers - and refactor to a different one - without having to change your tests. Pass in your dependencies the proper way: through the view controller's constructor - and get lightning fast feedback through unit tests instead of waiting around for your flakey UI tests to give you an accurate result... sometimes.
                   DESC
  spec.homepage              = "https://github.com/derekleerock/Succinct"
  spec.documentation_url     = "https://derekleerock.github.io/Succinct"
  spec.license               = { :type => "MIT", :file => "LICENSE" }
  spec.author                = "Derek Lee"
  spec.social_media_url      = "https://twitter.com/derekleerock"
  spec.platform              = :ios, "10.0"
  spec.swift_versions        = ['5.0']
  spec.frameworks            = 'MapKit'
  spec.source                = { :git => "https://github.com/derekleerock/Succinct.git",
                                 :tag => "v#{spec.version}" }
  spec.source_files          = "Succinct/**/*.swift"
end
