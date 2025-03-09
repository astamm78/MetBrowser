# The Met Browser

An iOS app for browsing works of art from [New York's Metropolitan Museum of Art](https://www.metmuseum.org).

Using their [free API](https://metmuseum.github.io), this app initially loads 15 oil painting selections from their featured collection. From there the user can select a specific department to view, search by a keyword, or combine the two. From the results screen you're able to view more information about an artwork, share the image with the iOS Share Sheet, and view even more information—if available—on the artwork and artists in the Met's wiki with your iOS browser. 

To run the app, no API keys are needed.

## Swift Packages

This app is uses the [AlamoFire](https://github.com/Alamofire/Alamofire) package as part of the networking layer, and the [SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI) package for web image caching.

## API Endpoints

The Met's free API gives us access to the four following endpoints:

- **Objects**: A listing of all valid Object IDs available for access.
- **Object**: A record for an object, containing all open access data about that object, including its image (if the image is available under Open Access)
- **Departments**: A listing of all valid departments, with their department ID and the department display name
- **Search**: A listing of all Object IDs for objects that contain the search query within the object’s data

## API Challenges

There were a few challenges faced in using this API.

First, the **Objects** and **Search** endpoints only return an array of *objectIDs* and a *total* count. The endpoints do not provide any other base info about each object result, nor do they support pagination of any kind. This leads to two main issues; often we're getting hundreds of results back from these endpoints, and we need to make a request to the **Object** endpoint for reach result we want to display on our results screen.

To handle this, the app takes the array of *objectIDs* and creates it's own paginated collection, grouped into results of 15. This allows the main view of the app to call the **Object** endpoint for one paginated group at a time. Once an object is loaded and displayed on the results view, no further API call is needed to render the detail view for that object.

Second, the **Search** endpoint provides us with a *hasImages* flag to use in the parameters. However, even when that value is set to **true**, results would still occasionally have no image URL data. To fix this issue, I set up fallback images to display when no image information was returned from the API.

Finally, passing an *objectID*—returned from either the **Search** or **Objects** results—to the **Object** endpoint would sometimes return an error. This is gracefully handled in the app by logging an error message to the console. The downside is we're not able to provide accurate result counts to the user and loading each paginated collection can result in an inconsistent number of objects being loaded for each "page".

## Testing and SwiftUI Previews

The networking layer was set up with a networking handler protocol and dependency injection to allow for a mock network handler. This is used in both the testing frameworks, as well as within some SwiftUI previews where data would be loaded from the network via a ViewModel.

UI tests are set up to pass a argument flag to the main app so it knows to configure itself with the mock network handler.
