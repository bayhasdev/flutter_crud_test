import 'package:flutter/widgets.dart';
import '../../data/enums/view_state_enum.dart';
import '../../../core/utils/global_var.dart';

class BaseState<T> {
  List<T> dataList = [];

  BaseState(this.dataList, this._viewState);

  ViewState _viewState = ViewState.init;

  ViewState get viewState => _viewState;

  get isBusy => _viewState == ViewState.busy;
}

class BaseProvider<T> extends ChangeNotifier {
  ViewState _viewState = ViewState.init;
  ViewState get viewState => _viewState;
  void setState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  get isInit => _viewState == ViewState.init;
  get isBusy => _viewState == ViewState.busy;
  get isIdle => _viewState == ViewState.idle;
  get isError => _viewState == ViewState.error;

  List<T> dataList = [];
  final int nextPageThreshold = 5;
  int page = 0;
  bool isMoreAvailable = true;

  Future loadInfinityData({required Future<List<T>> Function(int page) loadData}) async {
    GlobalVar.log('///////////////////////////////  loadinfinityData  $page');
    try {
      _viewState = ViewState.busy;
      if (page == 0) dataList.clear();

      var list = await loadData(++page);
      GlobalVar.log(list.toString());
      dataList.insertAll(dataList.length, list);

      if (list.isEmpty) isMoreAvailable = false;

      setState(ViewState.idle);
    } catch (error) {
      setState(ViewState.error);
      rethrow;
    }
  }

  void resetSetting() {
    page = 0;
    isMoreAvailable = true;
    dataList.clear();
  }

  Future loadBaseData({required Future Function() loadBody}) async {
    try {
      setState(ViewState.busy);
      await loadBody();
      setState(ViewState.idle);
    } catch (err) {
      setState(ViewState.idle);
      debugPrint(err.toString());
      rethrow;
    }
  }
}
