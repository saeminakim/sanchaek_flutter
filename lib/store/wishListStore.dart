import 'package:mobx/mobx.dart';
import 'package:sanchaek/models/bookModel.dart';

part 'wishListStore.g.dart';

class WishListStore extends _WishListStore with _$WishListStore {
  static WishListStore _instnace;

  static WishListStore get instance {
    if (_instnace == null) {
      _instnace = WishListStore();
    }

    return _instnace;
  }
}

abstract class _WishListStore with Store {
  ObservableList<BookModel> wishBooks = ObservableList();
}
