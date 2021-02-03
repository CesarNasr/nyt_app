# nytapp

A new Flutter application.

## Getting Started


Enviroment :
This app has been built in Dart language using the Flutter SDK
I have used Android Studio as an IDE

- Structure and Pattern : I have used MVVM structure to build the app along with Provider for state management:

- Models : I have created models similar to the server reponse in order to encapsulate data inside them.

- ViewModels : Each of the Main Widgets (pages) has it's own ViewModel that is responsible for the Business Logic of the view. in order to keep the code reusable, testible and minimal, the ViewModel itself is an instance of Provider where I can listen to data changes and notify widgets.

- Views : are the widgets and are solely responsible for what the user sees on the screen

- Repository : It is a class layered between the Data Sources (Server and LocalDB) and the ViewModels, The data Repository manages data calls back and forth, it also is responsible for making the decision whether to fetch data from Server or fetch th Local data from the app DB (In case a local DB was required).

- 3rd party packages and State Management:
HTTP : helps in https connection for API calls
PROVIDER : A wrapper around InheritedWidget to make them easier to use and more reusable, can hold data and notify widgets
GET_IT : For dependency injection
PEDANTIC : For lint analysis (analysis_options.yaml)

- Unit Testing : 
Dependency injection made it easier to unit test, I only had to mock the API response and write few assertion in the unit test (articles_list_test.dart)

- To run the app, I used "flutter run lib/ui/main.dart"


Future scope : As I did here, I use MVVM with a statemanagement package. However here are things that I usually follow but didn't implement here :

Use a package that help in automatically defining the Platform-specific (Android - IOS) UI elements and show them!
Pay attention more to the UI elements and features (such as internet connection timeout, etc..)
Use abstraction layer between some classes by implementing their interfaces

Thank you for this opportunity, Hope you like my code:)


