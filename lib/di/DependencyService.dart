import 'package:get_it/get_it.dart';
import 'package:nytapp/network/ApiService.dart';
import 'package:nytapp/repositories/ArticlesRepository.dart';
import 'package:nytapp/viewmodels/ArticlesViewModel.dart';
final dependencies = GetIt.instance;


void setupDependencies() {
  dependencies.registerFactory<ArticlesRepository>(() => ArticlesRepository());
  dependencies.registerFactory<ApiService>(() => ApiService());
  dependencies.registerFactory<ArticlesViewModel>(() => ArticlesViewModel());
}