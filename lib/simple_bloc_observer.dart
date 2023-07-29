import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// SimpleBlocObserver class:
// A custom BlocObserver that listens to the state changes and lifecycle events of Blocs.
class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // onChange method:
    // Called when the state of a Bloc changes.
    // It prints the 'change' object to the debug console.
    debugPrint('Change = $change');
  }

  @override
  void onClose(BlocBase bloc) {
    // onClose method:
    // Called when a Bloc is closed or disposed of.
    // It prints the 'bloc' object to the debug console.
    debugPrint('Close = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    // onCreate method:
    // Called when a new Bloc is created.
    // It prints the 'bloc' object to the debug console.
    debugPrint('Create = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // onError method:
    // Called when there is an error in a Bloc.
    // Currently, this method is empty, and it does not print any error information to the debug console.
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // onEvent method:
    // Called when an event is added to a Bloc.
    // Currently, this method is empty, and it does not print any event information to the debug console.
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // onTransition method:
    // Called when a Bloc transitions from one state to another.
    // Currently, this method is empty, and it does not print any transition information to the debug console.
  }
}
