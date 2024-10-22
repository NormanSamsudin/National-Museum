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

## Video Demonstration

[![Video](https://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](https://www.youtube.com/watch?v=WsSFx3DfeQg)

## Installation

You can ignore this part
Clone repository via HTTPs

```bash
git clone https://github.com/NormanSamsudin/train-booking-system.git
```

You need to install dependencies for the project. Dependencies is install by using a dependencies manager.

```bash
flutter pub get
```

### Install Package manager

Node & npm

For installing Node.js and npm, utilize a Node version manager like nvm for managing multiple Node.js versions or use a Node installer if a version manager isn't feasible. To download the LTS version from the Node.js download page for macOS or Windows, and for Linux, consider using the NodeSource installer. For more instructions, refer to this Node and npm [installation guide](https://kinsta.com/blog/how-to-install-node-js/).

### Install MongoDB Database

MongoDB Community Edition on Windows

[installation guide](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-windows/).

## Backend Deployment

To deploy this project on your local machine

```bash
  npm run start
```

## Flutter

### Local IP Address

Change value of ip address on page global_variable.dart. Check your ip address on bash command.

```bash
  ipconfig //windows
  ifconfig //linux
```

### Run Flutter

To deploy this flutter projectrun on your local machine

```bash
  flutter run
```

## API Testing

#### Endpoint List

- GET: Activity List

```bash
  localhost:3000/api/activity
```
