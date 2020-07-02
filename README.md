# Jet2 Travel Assignment
This repo contents the code for Jet2 Travel assignment.

- Used **MVVM** design architecture
- Cached the **user avatar image and article image in-app directory**, so that next time when the app runs it will first consult for downloaded image in-app directory, and if not present then the app will download the image.
Decoded JSON response which is required for the app using a Codable protocol.
- Used **custom cells** for user information, the article image, article content, URL, and links.
- Implemented **lazy loading** for image downloading.
- Used **Swift 5.0**.
- Used **Xcode 11.5**.
- Does **NOT** use any **third-party pods/Carthage** for downloading the image, parsing JSON response, etc.
- Constructed the UI as per **UI/X spec** provided in the assignment.
- Due to time constraints, not supported offline supports for contents.
- I did not get the **empty media JSON** from the server for any user, still, write code to handle this.
i.e hide the **article image** if the image is not presented.
