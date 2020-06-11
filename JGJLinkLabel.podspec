Pod::Spec.new do |s|
s.name              = 'JGJLinkLabel'
s.version           = '0.1.0'
s.summary           = 'JGJLinkLabel'
s.homepage          = 'https://github.com/tounaobun/JGJLinkLabel'
s.ios.deployment_target = '7.0'
s.platform = :ios, '7.0'
s.license           = {
:type => 'MIT',
:file => 'LICENSE'
}
s.author            = {
'YOURNAME' => 'Tounaobun'
}
s.source            = {
:git => 'https://github.com/tounaobun/JGJLinkLabel',
:tag => "#{s.version}" }
s.framework = "UIKit"
s.source_files      = 'JGJLinkLabel*' , 'Classes/*', 'Resource/*'
s.requires_arc      = true
end
