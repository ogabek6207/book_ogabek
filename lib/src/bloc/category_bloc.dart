// import 'package:rxdart/rxdart.dart';
// import 'package:textile/src/model/textile/category_model.dart';
// import 'package:textile/src/repository/repository_.dart';
//
// class CategoryBloc {
//   final Repository _repository = Repository();
//   final categoryFetch = PublishSubject<CategoryModel>();
//   final subCategoryFetch = PublishSubject<CategoryModel>();
//   final companyCategoryFetch = PublishSubject<CategoryModel>();
//
//   Stream<CategoryModel> get fetchCategory => categoryFetch.stream;
//
//   Stream<CategoryModel> get fetchSubCategory => subCategoryFetch.stream;
//
//   Stream<CategoryModel> get fetchCompanyCategory => companyCategoryFetch.stream;
//
//   getCategory() async {
//     var response = await _repository.getCategory();
//     if (response.isSuccess) {
//       CategoryModel categoryModel = CategoryModel.fromJson(response.result);
//       categoryFetch.sink.add(categoryModel);
//     }
//   }
//
//   getSubCategory(int id, int companyId) async {
//     var response = await _repository.getSubCategory(id, companyId);
//     if (response.isSuccess) {
//       CategoryModel categoryModel = CategoryModel.fromJson(response.result);
//       subCategoryFetch.sink.add(categoryModel);
//     }
//   }
//
//   getCompanyCategory(int id) async {
//     var response = await _repository.getCompanyCategory(id);
//     if (response.isSuccess) {
//       CategoryModel categoryModel = CategoryModel.fromJson(response.result);
//       companyCategoryFetch.sink.add(categoryModel);
//     }
//   }
//
//   dispose() {
//     categoryFetch.close();
//     subCategoryFetch.close();
//     companyCategoryFetch.close();
//   }
// }
//
// final categoryBloc = CategoryBloc();
