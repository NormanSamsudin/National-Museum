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

### Setup local database mongoDB and run Flutter

```bash
 git clone https://github.com/NormanSamsudin/National-Museum.git
 cd backend
 npm install
 npm start
 cd mobile_application
 flutter pub get
 flutter run
```

### Local IP Address

Change value of ip address on page global_variable.dart. Check your ip address on bash command.

```bash
  ipconfig //windows
  ifconfig //linux
```

## API Testing

#### Endpoint List

- GET: Activity List

```bash
  localhost:3000/api/activity?page=page&limit=limit&search=search
```

- POST: Sign In Account

```bash
  localhost:3000/api/signin
```

- POST: Sign Up Account

```bash
  localhost:3000/api/signup
```

## Widget Overview for Flutter

### Key Widgets

#### 1. **`PagedListView`**

Enables infinite scrolling and pagination, loading data page by page. It handles fetching new pages when the user scrolls close to the bottom.

#### 2. **`PagingController`**

Manages pagination logic by fetching and controlling the flow of data for the `PagedListView`.

#### 3. **`RefreshIndicator`**

Adds pull-to-refresh functionality, allowing users to refresh the list of activities by pulling down from the top.

#### 4. **`TextField`**

Provides a search bar for filtering activities based on user input. It updates the query dynamically when text changes.

#### 5. **`Stack`**

Used to layer widgets, allowing the placement of a background image (`Image.asset`) on top of the `Container`.

#### 6. **`Container`**

A rectangular visual element that serves as the background and layout structure for other widgets. It can hold images, colors, and child widgets.

#### 7. **`Positioned`**

Allows precise control over where a widget (like the background image) is placed within a `Stack`.

#### 8. **`Image.asset`**

Displays a small background image at the top of the `Container`, without covering the entire area.

#### 9. **`Scaffold`**

Provides the basic structure for the screen, including the background color and a scrollable body using `SingleChildScrollView`.

#### 10. **`Form`**

Wraps the input fields and validates user input, using a `GlobalKey` for managing the form state.

#### 11. **`TextFormField`**

Used for the email and password input fields, with validation logic to ensure correct formats (e.g., valid email, password length).

#### 12. **`TextEditingController`**

Captures the user input from the text fields for further processing, such as login credentials.

#### 13. **`InkWell`**

Makes the sign-in button tappable, and handles form submission when pressed. It also displays a loading indicator when the login process is in progress.

#### 14. **`Image.asset`**

Loads and displays images like an illustration and icons for email and password fields.

#### 15. **`GoogleFonts`**

Utilizes custom fonts (e.g., `Lato`, `Nunito Sans`, and `Roboto`) to style the text elements across the screen.

#### 16. **`LinearGradient`**

Adds a gradient background to the "Sign in" button, giving it a visually appealing effect.

#### 17. **`Navigator.push`**

Navigates to the registration screen when the user taps on "Sign up."

### Additional Features

- **Form Validation:** The login form ensures that the email and password follow proper formats before allowing submission.
- **Loading State:** Displays a `CircularProgressIndicator` while the login process is ongoing.
- **Custom Design:** Uses padding, colors, and rounded borders to create a clean and modern UI.
