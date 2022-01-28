
import 'dart:convert';

import 'package:book_ogabek/src/model/book_model.dart';
import 'package:book_ogabek/src/model/new_book_model.dart';
import 'package:book_ogabek/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class BookBloc {
  final Repository _repository = Repository();
  final bookFetch = PublishSubject<List<BookModel>>();





  Stream<List<BookModel>> get fetchBook => bookFetch.stream;

  getBook() async {
    var response = await _repository.getBook();
    if (response.isSuccess) {
      var bookModel = bookModelFromJson(json.encode(response.result),);

      bookFetch.sink.add(bookModel);
    }
  }

  dispose() {
    bookFetch.close();
  }
}

final bookBloc = BookBloc();
