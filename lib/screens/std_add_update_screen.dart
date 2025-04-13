import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_mgmt_project/models/student.dart';
import 'package:states_mgmt_project/providers/student_data_provider.dart';

class StdAddUpdateScreen extends StatelessWidget {
  StdAddUpdateScreen({super.key, this.index, this.std});

  final Student? std;
  final int? index;
  final nameController = TextEditingController();
  final rollNoController = TextEditingController();
  final depController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    if(std!= null) {
      nameController.text = std!.name;
      rollNoController.text = std!.rollNo;
      depController.text = std!.dep;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(std == null ? 'Add Student data': 'Update data'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text(
            "  Kindly fill these required fields:",
            style: TextStyle(fontSize: 16),
          ),
          myTextField("Name", nameController),
          myTextField("Roll No", rollNoController),
          myTextField("Department", depController),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if(nameController.text.isNotEmpty && rollNoController.text.isNotEmpty && depController.text.isNotEmpty){
                  Student student = Student(
                    name: nameController.text,
                    rollNo: rollNoController.text,
                    dep: depController.text,
                  );
                  if(std == null)
                  {context.read<StudentDataProvider>().addStudent(student);}
                  else
                  {context.read<StudentDataProvider>().updateStudent(index!, student);}
                  Navigator.pop(context);
                }},
                child: Text(std == null ? 'Save': 'Update', style: TextStyle(color: Colors.blueGrey)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget myTextField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
      ),
    ),
  );
}
