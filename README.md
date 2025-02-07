# Style Guide

## Pull/Merge requests
You must create at most 2 merge requests, one dedicated for layout and another dedicated for API integration. Exceptional situations are accepted when you have more than one person working on the same feature.

## Programing paradigm
The project's code, specially those ones created for views, must be done in a stateful style, instead of funcional style. It means you shoud created properties in the views that will make use of instances variables instead of creating self-contained view where the data is dependent unique of the parameters.

This way most of the views can access the view model and perform its operations.

## Static vs Instance properties
It's up to you make use of static or instance properties when the corresponding value is shared across entities.

## Creation of subviews
The subviews must be created as instance variables instead of file's type of nested type.

## Margins and paddings constants
All the margins and paddings size should be defined in view properties.

## 

## Data Flow

### Event handling
The project doesn't make use of closures throught views hierarchy for event handlings, instead, you must pass down the view model and its method must be called inside actions on the leaf. 

This is specially useful when you have lists where events occur on list's items for deletion, edition and so on.

### Spacing
The views should have blank lines to separate sibling views.

- Cada view deve ter uma property content usada no body
- In switch cases always use pattern matching instead of equatable comparasions or other methods
- You must not create any kind of model outside ViewDatas, if you would like to do so, create typealias of tuples.
 
## Design System
### ButtonView
You must not use the property `isLoading` at ButtonView.


## MyCats

MyCats is a Swift-based app that showcases a list of cat images fetched from an API. It uses MVVM architecture, protocols, generics, and other best practices for clean, maintainable code.

## Getting Started

1.  Open the project in Xcode.
    
2.  Select a development team in the **Signing & Capabilities** section.
    
3.  Build and run the project on your desired simulator or device.
    
There are no complex configuration steps, just ensure that you have selected the appropriate development team for signing the app.

## Features
-   **MVVM Architecture**: Organized into Model-View-ViewModel (MVVM) design pattern for clean separation of concerns.
    
-   **Isolated Network Layer**: Custom network layer with robust error handling, making it easy to replace or update networking logic.
    
-   **Reusability**: Common components are organized within the `_Components_` group to promote code reuse across different parts of the app.
    
-   **High-Order Functions**: The `CatsListNetworkViewModel.swift` file makes use of high-order functions to streamline the process of handling data.
    
-   **Protocol-Oriented Programming (POP)**: The app leverages the **Dependency Inversion Principle** to decouple views from concrete implementations by depending on protocols.
    
-   **Generics**: Used extensively in `CatsListView.swift` and `CatDetailView.swift` to ensure flexibility and reusability of components.
    
-   **State Management**: Handles various app states (error, loading) gracefully, improving the user experience.
    
-   **No Magic Numbers**: Avoids hardcoded values throughout the code, using constants instead for easier maintenance.
    
-   **Share Button**: Allows users to share a cat's image with others.
    
-   **Factory Design Pattern**: Used to abstract the creation of views, promoting loose coupling and enhancing testability.

**Note**: The API occasionally returns different images for the same cat, even when fetching by ID. This is a limitation of the API itself, not a bug in the app.