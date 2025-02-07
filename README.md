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
