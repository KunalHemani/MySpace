import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myspace_final/services/database.dart';
import 'package:myspace_final/services/shared_pref.dart';
import 'package:myspace_final/widgets/widget_support.dart';


class ViewDesk extends StatefulWidget {
  const ViewDesk({super.key});

  @override
  State<ViewDesk> createState() => _ViewDeskState();
}

class _ViewDeskState extends State<ViewDesk> {
  bool below_twoa = false, below_threea = false, below_foura = false;

  String? id;
  Stream? workspaceStream;


  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {

    });
  }


  ontheload() async {
    await getthesharedpref();
    workspaceStream = await DatabaseMethods().getWorkspaceCart(id!);
    setState(() {

    });
  }

  ontheLoad() async {
    workspaceStream = await DatabaseMethods().getWorkspaceItem("Below 299");
    setState(() {});
  }

  @override
  void initState() {
    ontheLoad();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
        stream: workspaceStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Details(
                    //       detail: ds["Detail"], name: ds["Name"], price: ds["Price"], image: ds["Image"],)));
                  },
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds["Image"],
                                height: 125,
                                width: 125,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              ds["Name"],
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              ds["Detail"],
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "\₹" + ds["Price"],
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
              : CircularProgressIndicator();
        });
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: workspaceStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Details(
                    //       detail: ds["Detail"], name: ds["Name"], price: ds["Price"], image: ds["Image"],
                    //     )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds["Image"],
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 5),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Name"],
                                    style: AppWidget.boldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Detail"],
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "\₹" + ds["Price"],
                                      style: AppWidget.boldTextFieldStyle(),
                                    )
                                ),

                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            String newName = ds["Name"];
                                            String newDetail = ds["Detail"];
                                            String newPrice = ds["Price"];
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return AlertDialog(
                                                  title: Text("Edit Details"),
                                                  contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
                                                  content: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextFormField(
                                                          initialValue: newName,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              newName = value;
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'Name',
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          initialValue: newDetail,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              newDetail = value;
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'Detail',
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          initialValue: newPrice,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              newPrice = value;
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'Price',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        // Update item in Firestore
                                                        await FirebaseFirestore.instance.collection('Below 299').doc(ds.id).update({
                                                          "Name": newName,
                                                          "Detail": newDetail,
                                                          "Price": newPrice,
                                                        });
                                                        // Close the dialog
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text("Save"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        child: Icon(Icons.edit),
                                      ),
                                    ),

                                    SizedBox(width: 15,),

                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Confirm Deletion"),
                                              content: Text("Are you sure you want to delete this item?"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Cancel"),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    // Delete the item from Firestore
                                                    await FirebaseFirestore.instance.collection('Below 299').doc(ds.id).delete();
                                                    await FirebaseFirestore.instance.collection('Below 399').doc(ds.id).delete();
                                                    await FirebaseFirestore.instance.collection('Below 499').doc(ds.id).delete();
                                                    // Close the dialog
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Delete"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        child: Icon(Icons.delete),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                );
              })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 15.0, left: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'WELCOME ADMIN!!  🙏',
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Desk on rent',
                  style: AppWidget.headerTextFieldStyle(),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem(),
                ),
                SizedBox(height: 10),

                // Container(height: 270,
                //     child: allItems()
                // ),

                SizedBox(height: 15),
                Container(
                    height: 600,
                    child: allItemsVertically()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            below_twoa = true;
            below_threea = false;
            below_foura = false;
            workspaceStream = await DatabaseMethods().
            getWorkspaceItem("Below 299");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_twoa ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/btr_two.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  color: below_twoa ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            below_twoa = false;
            below_threea = true;
            below_foura = false;
            workspaceStream = await DatabaseMethods().
            getWorkspaceItem("Below 399");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_threea ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/btr_three.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  color: below_threea ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            below_twoa = false;
            below_threea = false;
            below_foura = true;
            workspaceStream = await DatabaseMethods().
            getWorkspaceItem("Below 499");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: below_foura ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/btr_four.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  color: below_foura ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}