import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubits/counter/counter_cubit.dart';
import 'package:my_counter_cubit/other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'MyCounter Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('counter is ${state.counter}'),
                );
              },
            );
          } else if (state.counter == -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtherPage(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Text(
              // '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
              '${state.counter}',
              style: const TextStyle(fontSize: 52),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // onPressed: () =>
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
              // (O) context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
            heroTag: 'Increment',
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
              // (O) context.read<CounterCubit>().decrement();
              // (X) BlocProvider.of<CounterCubit>(context, listen: true).decrement();
              // (X) context.watch<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
            heroTag: 'Decrement',
          ),
        ],
      ),
    );
  }
}
