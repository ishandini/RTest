platform :ios, '9.0'
use_frameworks!

target 'RTest' do

	pod 'SwiftyBeaver'
	pod 'RealmSwift'
	pod 'ObjectMapper', '~> 2.2'
	pod 'SwiftyJSON'
	pod 'Alamofire', '~> 4.0'
	pod 'RappleProgressHUD'
	pod 'AlamofireImage', '~> 3.1'

end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['SWIFT_VERSION'] = '3.0'
		end
	end
end
