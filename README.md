# Image-Downloader
An app that allows the user to download images from an API. Using Riverpod + Flutter Hooks

https://user-images.githubusercontent.com/54480504/231240735-f179a92b-4171-45a4-a731-b393e7832d8c.mp4

## App Overview
Once the app is opened, it will fetch from an Image API (this case being Unsplash) and it will show those images in a grid that can  be scrolled. If the user taps on an image, it will proceed to download it and let the user know if it has been downloaded succesfully or unsuccesfully. If the request to the API has an error, it will show it and the user will be able to reload the page to try again.

## Tools Used
1. Riverpod: This was to make the API request as well as making the Consumer Widget that will show different widgets depending on the state: If its loading, it will show a circular progress indicator; If it loaded succesfully then the images will be shown; And lastly, if there was an error, it will show the error message with a button that allows the user to reload.
2. Flutter Hooks: Spefically UseState(bool). This was used so that each image would have a loading state if the user decides to download it. Once the image is tapped, the state will change to true and that will tell the widget to return a circular progress indicator instead. Once the image is donde downloading (wether succesfully or unsuccesfully) the state will go back to false (meaning that is not loading anymore).
3. Gallery Saver: Library used to download the images
