//
// import 'package:book_ogabek/src/model/book_model.dart';
// import 'package:book_ogabek/src/repository/repository_.dart';
// import 'package:rxdart/rxdart.dart';
//
// class AboutUsBloc {
//   final Repository _repository = Repository();
//   final bookFetch = PublishSubject<BookModel>();
//
//   Stream<BookModel> get fetchBook => bookFetch.stream;
//
//   getBook() async {
//     var response = await _repository.get();
//     if (response.isSuccess) {
//       AboutUsModel aboutUsModel = AboutUsModel.fromJson(response.result);
//       aboutUsFetch.sink.add(aboutUsModel);
//     }
//   }
//
//   dispose() {
//     aboutUsFetch.close();
//   }
// }
//
// final aboutUsBloc = AboutUsBloc();
