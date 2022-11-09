
# MonochromeWithURL

#### With this simple framework you can download and use images in black and white or color, it also allows you to convert your existing images to black and white.

## Features

#### * Extremely easy-to-handle.
#### * Async image download.
#### * Keeps original image quality.
#### * Monochrome filter.

## Screens

![Simulator Screen Recording - iPhone 11 - 2022-11-09 at 12 29 16](https://user-images.githubusercontent.com/103888716/200793196-5f0627ed-4edc-40db-b226-73c426881461.gif)
![Simulator Screen Recording - iPhone 11 - 2022-11-09 at 12 29 55](https://user-images.githubusercontent.com/103888716/200793201-81a97c68-8d71-4225-98ba-00975b9e8f8b.gif)

## How to use

`import MonochromeWithURL`

#### For images you will download and use, you can use the setImageWithURL extension by entering the image URL and your monochrome preference.

`UIImageView.setImageWithURL("Image URL", shoulConvertMonochrome: true)`

#### To convert your existing images to black and white and use them.

`UIImageView.image = monochrome(UIImage(named: "Image Name")!)`


## How to install

MonochromeWithURL is available on CocoaPods. All you have to do is to add the following line to your podfile.

`pod 'MonochromeWithURL'`

## License

MonochromeWithhURL is released under the MIT license. See LICENSE for details.
