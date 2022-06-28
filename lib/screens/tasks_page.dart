import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailapp/our_components.dart';
import 'package:trailapp/our_screens.dart';

final _auth = FirebaseAuth.instance;
class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: Container(
          height: 55,
          width: 55,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTasks()),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'MY TASKS',
            style: TextStyle(
              fontFamily: 'Titlefont6',
              fontSize: 40,
              wordSpacing: 5,
            ),
          ),
          leading: null,
          automaticallyImplyLeading: false,
          foregroundColor: Colors.orange,
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout_outlined,size: 30,),

            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/full-bloom.png'),
            fit: BoxFit.cover,
            ),
          ),
        child :Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                      child: Text(
                        'Add Task!',
                        style: TextStyle(
                          fontFamily: 'VT323',
                          color: Colors.black,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ))));
  }
}



enum Priority { ImpUrg, Imp, Urg, Nill }

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  Priority _Eisenhower = Priority.ImpUrg;
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Initial Selected Value
  String? dropdownvalue = 'Important & Urgent';

  String? title;
  String? description;

  // List of items in our dropdown menu
  var priority = [
    'Important & Urgent',
    'Important',
    'Urgent',
    'Neither Important nor urgent'
  ];

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   // color: Colors.blueGrey[900],
    //   child: Padding(
    //       padding: EdgeInsets.all(20),
    //       child: ListView(
    //         children: <Widget>[
    //           Container(
    //               alignment: Alignment.center,
    //               padding: EdgeInsets.all(20),
    //               child: Theme(
    //
    //                 child: DecoratedBox(
    //                   decoration: BoxDecoration(
    //                     color:Colors.orange,
    //                     borderRadius: BorderRadius.circular(5),
    //                   ),
    //                   child: TextField(
    //                     style: TextStyle(
    //                       fontSize: 25,
    //                       fontFamily: 'VT323',
    //                       color: Colors.white,
    //                     ),
    //                     controller: taskController,
    //                     decoration: InputDecoration.collapsed(
    //                         hintText: 'Username',
    //
    //                       // labelStyle: TextStyle(
    //                       //   fontSize: 25,
    //                       //   fontFamily: 'VT323',
    //                         // color: Colors.white,
    //                       ),
    //                     ),
    //                   ),
    //               ),
    //               ),
    //           Container(
    //             padding: EdgeInsets.all(20),
    //             child: DecoratedBox(
    //               decoration: BoxDecoration(
    //                 color:Colors.orange,
    //                 borderRadius: BorderRadius.circular(5),
    //               ),
    //               child: Container(
    //                 padding: EdgeInsets.all(20),
    //                 child: DropdownButton(
    //
    //                   style: TextStyle(
    //                     fontSize: 25,
    //                     fontFamily: 'VT323',
    //                     // color: Colors.white,
    //                   ),
    //
    //                   underline: Container(),
    //                   // Initial Value
    //                   isExpanded: true,
    //                   value: dropdownvalue,
    //
    //                   // Down Arrow Icon
    //                   icon: const Icon(Icons.keyboard_arrow_down),
    //
    //                   // Array list of items
    //                   items: items.map((String items) {
    //                     return DropdownMenuItem(
    //                       value: items,
    //                       child: Text(items),
    //                     );
    //                   }).toList(),
    //                   // After selecting the desired option,it will
    //                   // change button value to selected value
    //                   onChanged: (String? newValue) {
    //                     setState(() {
    //                       dropdownvalue = newValue!;
    //                     });
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Column(
    //             children: <Widget>[
    //               Container(
    //                 alignment: Alignment.centerLeft,
    //                 padding: EdgeInsets.all(20),
    //                 child: Text(
    //                   'Set the priority!',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 25,
    //                     fontFamily: 'VT323',
    //                   ),
    //                 ),
    //               ),
    //               ListTile(
    //                 title: const Text(
    //                   'Important & Urgent',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 25,
    //                     fontFamily: 'VT323',
    //                   ),
    //                 ),
    //                 leading: Radio<Priority>(
    //                   value: Priority.ImpUrg,
    //                   groupValue: _Eisenhower,
    //                   onChanged: (value) {
    //                     setState(() {
    //                       _Eisenhower = Priority.ImpUrg;
    //                     });
    //                   },
    //                 ),
    //               ),
    //               ListTile(
    //                 title: const Text(
    //                   'Important',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 25,
    //                     fontFamily: 'VT323',
    //                   ),
    //                 ),
    //                 leading: Radio<Priority>(
    //                   value: Priority.Imp,
    //                   groupValue: _Eisenhower,
    //                   onChanged: (value) {
    //                     setState(() {
    //                       _Eisenhower = Priority.Imp;
    //                     });
    //                   },
    //                 ),
    //               ),
    //               ListTile(
    //                 title: const Text(
    //                   'Urgent',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 25,
    //                     fontFamily: 'VT323',
    //                   ),
    //                 ),
    //                 leading: Radio<Priority>(
    //                   value: Priority.Urg,
    //                   groupValue: _Eisenhower,
    //                   onChanged: (value) {
    //                     setState(() {
    //                       _Eisenhower = Priority.Urg;
    //                     });
    //                   },
    //                 ),
    //               ),
    //               ListTile(
    //                 title: const Text(
    //                   'Neither Important nor urgent',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 25,
    //                     fontFamily: 'VT323',
    //                   ),
    //                 ),
    //                 leading: Radio<Priority>(
    //                   value: Priority.Nill,
    //                   groupValue: _Eisenhower,
    //                   onChanged: (value) {
    //                     setState(() {
    //                       _Eisenhower = Priority.Nill;
    //                     });
    //                   },
    //                 ),
    //               ),
    //               // ListTile(
    //               //   title: const Text('Cat'),
    //               //   leading: Radio<Pet>(
    //               //     value: Pet.cat,
    //               //     groupValue: _pet,
    //               //     onChanged: (value) {
    //               //       setState(() {
    //               //         _pet = Pet.cat;
    //               //       });
    //               //     },
    //               //   ),
    //               // ),
    //             ],
    //           ),
    //           // Column(
    //           //   children: <Widget>[
    //           //     ListTile(
    //           //       title: const Text('Urgent & important'),
    //           //       leading: Radio(
    //           //         value: Priority.urg_imp,
    //           //         groupValue: _eisenhower,
    //           //         onChanged: (value) async => setState(() {
    //           //             _eisenhower= value;
    //           //           }),
    //           //       ),
    //           //     ),
    //           //     ListTile(
    //           //       title: const Text('Urgent'),
    //           //       leading: Radio(
    //           //         value: Priority.urg,
    //           //         groupValue: _eisenhower,
    //           //         onChanged: (value) async {
    //           //           setState(() {
    //           //             _eisenhower = value;
    //           //           });
    //           //         },
    //           //       ),
    //           //     ),
    //           //     ListTile(
    //           //       title: const Text('Important'),
    //           //       leading: Radio(
    //           //         value: Priority.imp,
    //           //         groupValue: _eisenhower,
    //           //         onChanged: (value) async {
    //           //           setState(() {
    //           //             _eisenhower = value;
    //           //           });
    //           //         },
    //           //       ),
    //           //     ),
    //           //   ],
    //           // ),
    //           // Container(
    //           //   alignment: Alignment.center,
    //           //   padding: EdgeInsets.all(20),
    //           //   child: TextField(
    //           //     controller: priorityController,
    //           //     style: TextStyle(
    //           //       fontSize: 25,
    //           //       fontFamily: 'VT323',
    //           //       color: Colors.white,
    //           //     ),
    //           //     decoration: const InputDecoration(
    //           //       border: OutlineInputBorder(),
    //           //       labelText: 'set priority!',
    //           //       labelStyle: TextStyle(
    //           //         fontSize: 25,
    //           //         fontFamily: 'VT323',
    //           //         color: Colors.white,
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ),
    //         ],
    //       )),
    // );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/mountains.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                  keyboardType: TextInputType.text,
                  // textAlign: TextAlign.center,
                  onChanged: (value){
                    title=value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Title',
                  )),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  keyboardType: TextInputType.text,
                  // textAlign: TextAlign.center,
                  onChanged: (value){
                    description=value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Description',
                  )),
              SizedBox(
                height: 8.0,
              ),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: kTextFieldDecoration.copyWith(                    ),
                    // decoration: InputDecoration(
                    //     // labelStyle: textStyle,
                    //     // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    //     // hintText: 'Please select expense',
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
                    isEmpty: dropdownvalue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownvalue,
                        hint: Text("Priority"),
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                            state.didChange(newValue);
                          });
                        },
                        items: priority.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: Colors.blueGrey)),
                            // child: Text(value, textAlign: TextAlign.center),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              MyButton(colour: Colors.orange, title: 'Add Task', onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}