Pod::Spec.new do |s|

    s.name         = "FGSlider"
    s.version      = "1.0.0"
    s.summary      = "A UISlider subclass with the possibility to tap on the Min and Max Images to set the value to the minimum or maximum value."

    s.description  = "FGSlider allows your users to tap on the Min and Max Images of a UISlider, to set the value to the minimum or maximum value."
    s.requires_arc = true
    s.homepage     = "https://github.com/fguchelaar/FGSlider"
    s.license      = "MIT"
    s.author             =  "Frank Guchelaar"
    s.platform     = :ios
    s.source       = { :git => "https://github.com/fguchelaar/FGSlider.git", :tag => "1.0.0" }
    s.source_files  = "FGSlider"
end
