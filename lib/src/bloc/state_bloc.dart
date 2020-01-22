import 'dart:async';

import 'package:flutter/material.dart';

typedef OnWidgetStateChanged<T> = Widget Function(T value);

typedef ChangeState<T> = T Function(T value);

class BaseStateBloc<T> {
  T _value;
  StreamController<T> controller = StreamController<T>.broadcast();

  BaseStateBloc(var initialData) {
    this._value = initialData;
  }

  changeState({@required ChangeState state}) {
    _value = state(_value);
    controller.sink.add(_value);
  }
  changeStateWithoutValueProvided(T value) {
    _value = value;
    print(_value);
    controller.sink.add(_value);
  }

  T get value => _value;

  void dispose() {
    controller.close();
  }

  Widget blocWidget({@required OnWidgetStateChanged widget}) {
    return StreamBuilder<T>(
        initialData: _value,
        stream: controller.stream,
        builder: (context, snapshot) {
          return widget(snapshot.data);
        });
  }
}
