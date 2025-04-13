import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_mgmt_project/providers/student_data_provider.dart';
import 'package:states_mgmt_project/screens/std_add_update_screen.dart';

class StdHomeScreen extends StatelessWidget {
  const StdHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All students list'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StdAddUpdateScreen()),
              );
            },
            icon: Icon(Icons.add_box_rounded, size: 28),
          ),
        ],
      ),
      body: Consumer(
        builder: (contxt, value, child) {
          final stdList = contxt.watch<StudentDataProvider>().getStudents();
          return stdList.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.no_accounts), Text('No student')],
                ),
              )
              : ListView.builder(
                itemCount: stdList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    StdAddUpdateScreen(index: index,std: stdList[index]),
                          ),
                        ),
                    child: ListTile(
                      leading: IconButton(onPressed: () => contxt.read<StudentDataProvider>().delStudent(index), icon: Icon(Icons.delete_outline, size: 18, color: Colors.blueGrey,)),
                      title: Text(stdList[index].name),
                      subtitle: Text(stdList[index].rollNo),
                      trailing: Text(stdList[index].dep, style: TextStyle(fontSize: 14),),
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
