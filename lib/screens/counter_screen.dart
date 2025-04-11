import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_mgmt_project/providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(
                onPressed: () {
                  context.read<CounterProvider>().decrement();
                },
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 3),
              Consumer(
                builder:
                    (cntxt, value, child) =>
                        Text('${cntxt.watch<CounterProvider>().getCounter()}', style: TextStyle(fontSize: 28),),
              ),
              SizedBox(width: 3),
              IconButton(
                onPressed: () {
                  context.read<CounterProvider>().increment();
                },
                icon: Icon(Icons.add),
              ),]
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().reset();
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}
