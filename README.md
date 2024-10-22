# National Museum Event Mobile Application

## Project Overview

This mobile application is designed to digitize the event and activity listing board of a National Museum, helping the museum reach a broader audience. The goal is to allow users to view all available events and activities without needing to visit the museum physically. The app offers an intuitive, user-friendly interface with real-time information, thus enhancing engagement and participation.

## Problem Statement

Mr. Power, the owner of the National Museum, currently relies on a physical event board to communicate museum events and activities. However, this system limits access for those unable to visit in person. The goal is to create a mobile application that presents the museum’s events digitally, increasing accessibility and outreach to the public.

### Key Features:

- **Digital Event and Activity Listing**: Users can browse all available museum events and activities.
- **Search Functionality**: Users can search through events for easier navigation.
- **Event Categories**:
  - In-reach Programme
  - Art Bazaar
  - Guided Tour
- **Participant Limitations**: For Guided Tour activities, each event has a maximum number of participants, configured individually.

## Tech Stack

The following technologies will be used for the development of the mobile application:

- **Frontend**: Flutter will be used to build the cross-platform mobile application for both Android and iOS. Flutter allows for creating a high-performance UI with a single codebase.
- **Backend**: Node.js will serve as the backend API. It will handle all the requests from the mobile app, including retrieving event data, implementing search functionality, and managing pagination.
- **Database**: MongoDB will be used as the database to store all event and activity data. Its document-based structure makes it flexible for handling varying event types and participant data.

## Widgets Used in Flutter Application

To build an interactive and user-friendly mobile application, the following Flutter widgets are suitable:

- **`ListView.builder`**: This widget is ideal for displaying a scrollable list of events. It efficiently loads items lazily as the user scrolls, making it perfect for implementing infinite scroll with pagination.
- **`TextField`**: A `TextField` widget will be used for the search bar, allowing users to enter keywords to filter events. You can also integrate this with debouncing techniques to optimize performance during searches.

- **`FutureBuilder`**: This widget is great for making asynchronous requests to the backend API and displaying events when the data is retrieved. It simplifies handling loading states (such as showing a `CircularProgressIndicator` while waiting for the event data).

- **`GridView`**: If events are categorized and you want to display them in a visually organized way, `GridView` allows for a structured grid layout. This might be useful if you want to display different categories of events side by side.

- **`Pagination Controls (Custom Buttons)`**: You can create custom pagination controls using `ElevatedButton` or `IconButton`. These buttons will allow the user to navigate between pages of events, providing a better user experience for long lists.

- **`BottomNavigationBar`**: If you plan to include multiple sections within the app (such as "Events", "Categories", "Favorites"), a `BottomNavigationBar` can help users navigate between different parts of the app seamlessly.

- **`SliverList`** and **`SliverAppBar`**: If you want to enhance the scrolling experience further, you can combine `SliverList` and `SliverAppBar` to create a sophisticated scrolling effect, which allows the app bar to collapse or expand as users scroll through the list of events.

## Technical Requirements

- **Infinite Scroll and Pagination**: Support infinite scrolling with pagination to handle the large number of events throughout the year efficiently.
- **Cross-Platform**: The application should be runnable on both Android and iOS devices.
- **Architecture**: Implement an industrial-recommended architecture (e.g., MVC, MVP, MVVM) to ensure scalability and maintainability.
- **Development Tools**: The mobile app will be built using Flutter, while the backend will be built using Node.js with MongoDB as the database.

## Prototype

Mr. Power has provided a UI/UX design prototype (refer to Appendix 1). The mobile application should match this prototype as closely as possible to meet user experience expectations.

## Submission Requirements

Once the mobile application is complete, the following materials should be submitted:

1. **Source Code**: Upload the source code to a version control repository like GitHub or GitLab.
2. **Installation File (APK/IPA)**: Submit the mobile application's installation file.
3. **Video and Screenshots**: Provide a video recording and screenshots of the final product.
4. **Component List**: Include a list and brief description of any components, technologies, and elements used during development.

## Conclusion

This project aims to enhance public interaction with the National Museum's events through a mobile application, providing accessibility and convenience to users while helping the museum reach a wider audience. The use of Flutter for the frontend, Node.js for the backend, and MongoDB for the database ensures that the app will be scalable, efficient, and cross-platform.
