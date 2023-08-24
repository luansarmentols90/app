import 'package:mobx/mobx.dart';

part 'access_controller.g.dart';

class AccessController = _AccessController with _$AccessController;

abstract class _AccessController with Store { 

  @observable
  int value = 0;

  @observable
  bool isLoading = false;

  @action
  void increment() {
    value++;
  }

  @action
  void changeLoading() => this.isLoading = !this.isLoading;

}
