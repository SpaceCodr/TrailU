import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trailapp/our_components.dart';
import 'package:trailapp/our_screens.dart';
import 'package:animated_button/animated_button.dart';

var priority = [
  'Important & Urgent',
  'Important',
  'Urgent',
  'Neither Important nor urgent'
];
var priority_color = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green
];

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




class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {

  final List<Map> _priority = List.generate(
      4,
          (index) =>
      {
        "id": index,
      }).toList();

  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Initial Selected Value
  String priority_text = 'Priority';
  Color page_color = Colors.white70;

  String? title;
  String? description;

  // List of items in our dropdown menu

  // void _showOverlay(BuildContext context) async {
  //
  //   // Declaring and Initializing OverlayState
  //   // and OverlayEntry objects
  //   OverlayState? overlayState = Overlay.of(context);
  //   OverlayEntry overlayEntry;
  //   overlayEntry = OverlayEntry(builder: (context) {
  //
  //     // You can return any widget you like here
  //     // to be displayed on the Overlay
  //     return Positioned(
  //       left: MediaQuery.of(context).size.width * 0.2,
  //       top: MediaQuery.of(context).size.height * 0.3,
  //       child: Container(
  //         width: MediaQuery.of(context).size.width * 0.8,
  //         child: SizedBox(
  //           child: GridView.builder(
  //               padding: const EdgeInsets.all(10),
  //               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //                   maxCrossAxisExtent: 200,
  //                   childAspectRatio: 2 / 3,
  //                   crossAxisSpacing: 20,
  //                   mainAxisSpacing: 20),
  //               itemCount: priority.length,
  //               itemBuilder: (BuildContext ctx, index) {
  //                 return GridTile(
  //                   key: ValueKey(_priority[index]['id']),
  //                   child: AnimatedButton(
  //                       child: Text(
  //                         priority[index],
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                           fontSize: 22,
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       ),
  //                       onPressed: () {},
  //                       height: 150,
  //                       width: 170
  //                   ),
  //                 );
  //               }),
  //         ),
  //       ),
  //     );
  //   });
  //
  //   // Inserting the OverlayEntry into the Overlay
  //   overlayState?.insert(overlayEntry);
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: page_color,
          // image: DecorationImage(
          //   colorFilter: ColorFilter.mode(
          //       Colors.black.withOpacity(0.1), BlendMode.dstATop),
          //   image: AssetImage('assets/mountains.jpg'),
          //   fit: BoxFit.cover,
          // ),
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
              // FormField<String>(
              //   builder: (FormFieldState<String> state) {
              //     return InputDecorator(
              //       decoration: kTextFieldDecoration.copyWith(                    ),
              //       // decoration: InputDecoration(
              //       //     // labelStyle: textStyle,
              //       //     // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              //       //     // hintText: 'Please select expense',
              //       //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
              //       isEmpty: dropdownvalue == '',
              //       child: DropdownButtonHideUnderline(
              //         child: DropdownButton<String>(
              //           value: dropdownvalue,
              //           hint: Text("Priority"),
              //           isDense: true,
              //           onChanged: (String? newValue) {
              //             setState(() {
              //               dropdownvalue = newValue;
              //               state.didChange(newValue);
              //             });
              //           },
              //           items: priority.map((String value) {
              //             return DropdownMenuItem<String>(
              //               value: value,
              //               child: Text(value, style: TextStyle(color: Colors.blueGrey)),
              //               // child: Text(value, textAlign: TextAlign.center),
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              MyButton2(title: priority_text, onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SetPriority()),
                // );
                return showDialog(
                    context: context,
                  builder: (ctx) => AlertDialog(
                    content: Container(
                        width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .34,
                      child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                          itemCount: priority.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GridTile(
                              key: ValueKey(_priority[index]['id']),
                              child: AnimatedButton(
                                  color: priority_color[index],
                                  child: Text(
                                    priority[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      priority_text = priority[index];
                                      page_color = priority_color[index].shade200;
                                    });
                                  },
                                  height: MediaQuery.of(context).size.height * .13,
                                  width: MediaQuery.of(context).size.width * .3
                              ),
                            );
                          }),
                    ),
                  ),
                );
              }),
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

class SetPriority extends StatefulWidget {
  const SetPriority({Key? key}) : super(key: key);

  @override
  _SetPriorityState createState() => _SetPriorityState();
}

class _SetPriorityState extends State<SetPriority> {
  // var priority = [
  //   'Important & Urgent',
  //   'Important',
  //   'Urgent',
  //   'Neither Important nor urgent'
  // ];
  final List<Map> _priority = List.generate(
      4,
          (index) =>
      {
        "id": index,
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.redAccent,
        title: const Text('Priority'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: priority.length,
          itemBuilder: (BuildContext ctx, index) {
            return GridTile(
              key: ValueKey(_priority[index]['id']),
              child: AnimatedButton(
                child: Text(
                  priority[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
                height: 150,
                width: 170
              ),
            );
          }),
    );
  }
}