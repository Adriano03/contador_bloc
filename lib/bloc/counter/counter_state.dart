part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue']?.toInt() ?? 0,
    );
  }
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counterValue: 0);
}

class IncremetState extends CounterState {
  const IncremetState(int increasedValue) : super(counterValue: increasedValue);
}

class DecrementState extends CounterState {
  const DecrementState(int decreasedValue)
      : super(counterValue: decreasedValue);
}
