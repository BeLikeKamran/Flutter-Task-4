import 'package:flutter/material.dart';
import 'Calculator.dart';
//import 'Image.dart';

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

var input; // var ka matlb variable or input ki jaga kuch bhi likh skte hain//
List<dynamic> lst = [1, 2, 3, 4];

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        //preferred size app bar ka size change krta hai//
        preferredSize: Size.fromHeight(40),
        child: AppBar(
            backgroundColor: Color(0xff1d0dff),
            title: Center(
                child: Text(
              "ToDoApp",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ))),
      ),
      drawer: (Drawer(
        //drawer side se aata hai//
        child: ListView(
          children: [
            Center(
                child: Container(
              height: 70,
              child: DrawerHeader(
                // drawerheader drawer ke appbar ko kehte hain//
                child: Container(
                  width: 400,
                  color: Color(0xff1d0dff),
                  child: Center(
                    child: Text(
                      "              Welcome \nHere is the List Of All Apps",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(0.0),
              ),
            )),
            GestureDetector(
              //gesturedectector se kisi bhi cheez ko button banya jaskta hai//
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ToDoApp())); //yahan per "ToDoApp" ki jaga kuch bh askta hai jahan aap ne move krna ho//
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "ToDoApp",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Image.network(
                    // image ko link ke zariye lagane ke liye use hota hai//
                    "https://i.imgur.com/OvMZBs9.jpg",
                    width: 100,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Calculator()));
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Calculator",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/c/cf/Casio_calculator_JS-20WK_in_201901_002.jpg",
                    width: 100,
                  ),
                ],
              ),
            ),
            /*GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ImageScreen()));
                },
                child: Column(children: [
                  ListTile(
                    title: Text(
                      "Image Screen",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Image.network(
                    "https://i.imgur.com/OvMZBs9.jpg",
                    width: 100,
                  )
                ])
                )*/
          ],
        ),
      )),
      body: ListView.builder(
          //listview.builder list ko automatic generate krta hai//
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      20), // container ya kisi bhi cheez ko square se circle ki tarf le jata hai//
                  color: Colors.green,
                ),
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    "${lst[index]}",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  trailing: Container(
                    width: 60,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onTap: () {
                            showDialog(
                                // screen per dialog show krta hai//
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    //alert dialog bhi dialog show krta hai, ye show dialog ke sath kam karta hai//
                                    title: Text("Edit"),
                                    content: TextField(
                                      onChanged: (value) {
                                        input = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {input});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Edit"))
                                    ],
                                  );
                                });
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: Align(
        // ek button aata hai circle me bottomright per //
        alignment: Alignment.bottomRight,
        child: Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Create New"),
                          content: TextField(
                            onChanged: (value) {
                              input = value;
                            },
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    lst.add(input);
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text("Add"))
                          ],
                        );
                      });
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                backgroundColor: Color(0xff1d0dff),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
