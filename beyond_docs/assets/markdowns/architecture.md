# Architecture
Cart it out is using complex approach for the Clean architecture implementation, it's not pure Clean architecture because there is an improvement on the facade and infrastructure layer. This architecture is well tested on the Startup environment, because not only **scalable and reusable** this architecture **will let any team to work faster, cleaner, and more efficient and effective**. Also the architecture will make your application **independent from the backend**, which is good because the market dynamic you need to cycle and change any feature quickly without breaking change the client sided part, that will let you to **save time and resource** so you can focus on another thing. Also because this architecture is using atomic approach, **it can be tested easily** because the dependency isn't hardcoded. Here is complete tree map of the architecture used by Cart it out

<img src="~@source/assets/images/ddd-architecture.png" alt="Architecture tree map" width="80%">

Although it look too complex, this architecture is suitable for teamsize 1 to 4 pepople and it's already tested and used as [Meruya Technology](https://github.com/Meruya-Techhnology/) main architecture. Refering to the tree map above, There is a four different main layer in the application.
- [Infrastructure Layer](#infrastructure-layer) (Green)
- [Domain Layer](#domain-layer) (Purple)
- [Facade Layer](#facade-layer) (Blue)
- [Presentation Layer](#presentation-layer) (Red)

## Infrastructure Layer
Infrastructure layer is the outer layer of DDD, all external activity task such a HTTP Request, Web Socket, Streaming etc is writed under this layer or in the project structure we can find them on the `infrastructure` folder. Infrastructure layer has 4 sub folders / components
1. **Datasource abstract** is the interface of external datasource, which acessed by the repository directly without touching the implementation class.
2. **Datasource implementation** contain remote data activity, in this class we can do a Http requests from any external sources we need.
3. **Datasource models** is the I/O from the datasources class, the model can be also nested with another models. This class is also acessed from the mapper & repository implementation class.
4. **Repository implementation** this class is the bridge between infrastructure and domain layer, this class also implementing the Repository abstract class from the Domain Layer. And also Repository implementation can use multiple datasource class in one method

## Domain Layer
Meanwhile domain layer will abstract and transform the external datasources into fixed and structured entities, the main goal of this layer is to separate the application with external datasource, for the example when the datasources changed (endpoint changed, or json field name changed) the entity will remain the same thats make the facade and the presentation layer more independent from the datasources. However if there is any major changed on the datasource response structure, it will required the mappers, and the entities to be changed which is will required the presentation layer also to be changed. Domain layer contain 5 sub folders / components
1. **Repository abstract** same with the datasource abstract, this class is the interface of repository. The Usecase will access this abstract for futher operation
2. **Entity** is a class that contain a data from external and internal datasource, entity is used by repository as a input or output, also entity is passed by the repository to the usecase as a result
3. **Usecase** usecase is a data logic class that detached from state management file, inside the usecase we can access multiple repository to create a final data as entity which passed to the presentation layer. Also inside the usecase there is error handler binding
4. **Error handler (Optional)** this is optional class, this class is to handle any error that occured from Infrastructure layer, Domain layer, and usecase code. To pass a structured entity / primitive object when there is any error on the data proccess
5. **Exception (Optional)** this is optional class, entity is an ouput when the repository and usecase return valid result, Exception is the output when there is something wrong when runtime trying the remote data operation through Infrasctructure and domain layer. This can be passed to the Presentation layer too.

## Facade Layer
Facade layer or we can call it middle ground, is used for dependency injections. This layer is required in order to avoid spilling Import from infrastructure layer, and avoid spoil injection processes to the presentation layer. And that's will make the presentation layer especially on the state management [provider](https://pub.dev/packages/provider) class more clean, and also the [Provider](https://pub.dev/packages/provider) class can be focus on the client sided logic & UI I/O controller. This makes the programmer to work quickly to change the client sided code without changing dependency codes. Also you can play throw and fetch dependency from the main app (global dependency) by using [GetIt](https://pub.dev/packages/get_it) or any available dependency injection package out there
```dart
/// Example
class ProductFacade {
  /// There is two different getter access, private & public. The private getter
  /// only available for class file only, and the public getter is available for
  /// outside access
  ErrorHandler get _errorHandler => ErrorHandlerImpl();
  ProductDatasource get _productDatasource => ProductDatasourceImpl();
  ProductRepository get _productRepository => ProductRepositoryImpl(
        productDatasource: _productDatasource,
      );

  RetrieveProducts get retrieveProducts => RetrieveProducts(
        errorHandler: _errorHandler,
        repository: _productRepository,
      );

  RetrieveHotDealProducts get retrieveHotDealProducts =>
      RetrieveHotDealProducts(
        errorHandler: _errorHandler,
        repository: _productRepository,
      );

  RetrieveProductFilters get retrieveProductFilters => RetrieveProductFilters(
        errorHandler: _errorHandler,
        repository: _productRepository,
      );

  RetrieveReviews get retrieveReviews => RetrieveReviews(
        errorHandler: _errorHandler,
        repository: _productRepository,
      );

  RetrieveCategories get retrieveCategories => RetrieveCategories(
        errorHandler: _errorHandler,
        repository: _productRepository,
      );

  SearchProduct get searchProduct => SearchProduct(
        errorHandler: _errorHandler,
        repository: _productRepository,
      );
}
```
To use facade layer we can do it inside the state management class [Provider](https://pub.dev/packages/provider)
```dart
class ProductListProvider extends ChangeNotifier {
  final BuildContext context;
  final Object? arguments;

  ProductListProvider({
    required this.context,
    required this.arguments,
  }) {
    initState(context);
  }

  /// Method section
  /// Initial method
  Future<void> initState(BuildContext context) async {
    _retrieveProduct();
  }

  /// Data access methods
  /// Retrieve top products
  Future<void> _retrieveProduct({int page = 1}) async {
    final params = RetrieveProductsParams();
    /// Notice that we are using facade by using initialized facade 
    /// then use the static method which is (Use Case class)
    /// then we can do anything with the result bellow
    var result = _productFacade.retrieveProducts.execute(params);
  }
}
```
## Presentation Layer
The inner layer of DDD is the Presentation layer, this layer has 4 sub folders / components. Every components on this layer is UI and client sided logical code. 
1. **Provider** this is state management class, it's usually divided per page or per Widget body
2. **Pages** contain a pages / scaffold files
3. **Widgets** there is a two type of widgets, one is composable which can be used from all pages, and one is typical widget which bound to the specific feature, which only available for specific pages
4. **Params** params is like entity, but the different is params is class that passed from pages to another pagges with containing any object / entity. It's safe to say this is like (Entity wrapper in presentation)

## Too complex ?
The presentation layer is well separated from the datasources, you can just delete the Infrastructure & Domain layer if you want to. Or return the data straight inside the provider. This is the main solution if our `Architecture` is too complex for you.