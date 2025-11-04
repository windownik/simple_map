
import 'package:example/features/counter/domain/bloc/counter_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/counter_bloc.dart';
import '../../domain/bloc/counter_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(title: const Text('Counter BLoC')),
      body: Center(
        child: BlocBuilder<CounterBlock, CounterState>(

          builder: (context, state) {
            return Text(
              '${state.value}',
              style: const TextStyle(fontSize: 48),
            );
          },
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => context.read<CounterBlock>().add(Increment()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () => context.read<CounterBlock>().add(Decrement()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
