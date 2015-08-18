# Spinner
Custom Activity Indicator written in Swift

Inspired by : [icanzilb/SwiftSpinner](https://github.com/icanzilb/SwiftSpinner)

![Preview](https://raw.githubusercontent.com/vinayjn/Spinner/master/preview/Spinner.gif)

###Usage

Download the file [Spinner.swift](https://raw.githubusercontent.com/vinayjn/Spinner/master/Spinner.swift) and Add in your project.

The view is `@IBDesignable` so you can directly configure the view properties from Storyboard. Similar to the `UIActivityIndicatorView` the `Spinner` also support two styles `Light` and `Dark`. Configure the spinner style with :

    self.spinner.Style = .Dark

If you want to use only one ring then set the `enableInnerLayer` property of spinner outlet to `false`

    self.spinner.enableInnerLayer = false

Similar to `UIActivityIndicatorView` set these properties according to your usage:

    self.spinner.startAnimating() // spinner starts animating
    self.spinner.stopAnimating()  // spinner stops animating
    self.spinner.hidesWhenStopped // spinner hides when stopped

    



