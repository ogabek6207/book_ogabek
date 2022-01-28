

import 'package:book_ogabek/src/model/http_result.dart';
import 'package:book_ogabek/src/provider/app_provider.dart';

class Repository {
  final AppProvider _provider = AppProvider();

  Future<HttpResult> getBook() => _provider.getBook();

  Future<HttpResult> getNewBooks() => _provider.getNewBooks();


}
