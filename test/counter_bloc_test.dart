import 'package:example/features/counter/domain/bloc/counter_bloc.dart';
import 'package:example/features/counter/domain/bloc/counter_event.dart';
import 'package:example/features/counter/domain/bloc/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';



void main() {
  group('CounterBloc', () {
    late CounterBlock counterBloc;

    setUp(() {
      counterBloc = CounterBlock();
    });

    tearDown(() {
      counterBloc.close();
    });

    test('начальное состояние должно быть CounterState(0)', () {
      expect(counterBloc.state.value, 0);
    });

    blocTest<CounterBlock, CounterState>(
      'увеличивает значение при CounterIncremented',
      build: () => CounterBlock(),
      act: (bloc) => bloc.add(Increment()),
      expect: () => [CounterState(1)],
    );

    blocTest<CounterBlock, CounterState>(
      'уменьшает значение при CounterDecremented',
      build: () => CounterBlock(),
      act: (bloc) => bloc.add(Decrement()),
      expect: () => [
        isA<CounterState>().having((s) => s.value, 'value', -1),
      ],
    );

    blocTest<CounterBlock, CounterState>(
      'работает с несколькими событиями подряд',
      build: () => CounterBlock(),
      act: (bloc) {
        bloc
          ..add(Increment())
          ..add(Increment())
          ..add(Decrement());
      },
      expect: () => [
        isA<CounterState>().having((s) => s.value, 'value', 1),
        isA<CounterState>().having((s) => s.value, 'value', 2),
        isA<CounterState>().having((s) => s.value, 'value', 1),
      ],
    );
  });
}
