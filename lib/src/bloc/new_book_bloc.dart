import 'dart:convert';
import 'package:book_ogabek/src/model/new_book_model.dart';
import 'package:book_ogabek/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class NewBookBloc {
  final Repository _repository = Repository();
  final newBookFetch = PublishSubject<List<NewBookModel>>();

  Stream<List<NewBookModel>> get fetchNewBook => newBookFetch.stream;

  getNewBook() async {
    var response = await _repository.getNewBooks();
    if (response.isSuccess) {
      var newBookModel = newBookModelFromJson(
        json.encode(response.result),
      );

      newBookFetch.sink.add(newBookModel);
    }
  }

  dispose() {
    newBookFetch.close();
  }
}

final newBookBloc = NewBookBloc();
