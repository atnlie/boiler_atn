import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'counter_event.dart';
// part 'counter_state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
// CounterBloc() : super(CounterInitial()) {
// on<CounterEvent>((event, emit) {
//   // TODO: implement event handler
// });
// }
// }

enum CounterAction { Increment, Decrement, Reset }

class CounterBloc {
  int counter = 0;
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;

  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else if (event == CounterAction.Reset) {
        counter = 0;
      }

      counterSink.add(counter);
    });
  }
}
