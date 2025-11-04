

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/counter_bloc.dart';
import '../widgets/counter_view.dart';



class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBlock(),
      child: const CounterView(),
    );
  }
}
