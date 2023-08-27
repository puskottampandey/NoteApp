import 'package:flutter/material.dart';

import 'package:noteapp/provider/addprovider.dart';
import 'package:noteapp/screens/additeam.dart';
import 'package:noteapp/screens/constant.dart';
import 'package:noteapp/screens/searchscreen.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Consumer<AddProvider>(
                  builder: (context, sort, child) {
                    return Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              sort.sort();
                            },
                            icon: const Icon(Icons.sort)));
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AddProvider>(
              builder: (context, note, child) {
                return TextField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SearchScreen())));
                  },
                  style: const TextStyle(color: Colors.white),
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Search notes",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    fillColor: (Colors.grey.shade800),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Consumer<AddProvider>(builder: (context, value, child) {
              return ListView.builder(
                  itemCount: value.addnote.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: Colors.white),
                              Text('Move to trash',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      confirmDismiss: (DismissDirection direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: backgroundColor,
                              title: const Text(
                                "Delete Confirmation",
                                style: TextStyle(color: Colors.white),
                              ),
                              content: const Text(
                                "Are you sure you want to delete this Note?",
                                style: TextStyle(color: Colors.white),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      value.removenote(
                                          value.addnote[index].toString());
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    )),
                                ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (DismissDirection direction) {
                        if (direction == DismissDirection.down) {
                          value.removenote(value.addnote[index].toString());
                        } else {
                          null;
                        }
                      },
                      key: Key(value.addnote[index]),
                      child: Card(
                        color: Colors.grey.shade800,
                        child: ListTile(
                          subtitle: Text(
                            DateTime.now().toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          /*
                          trailing: IconButton(
                              onPressed: () {
                                value.removenote(
                                    value.addnote[index].toString());
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                              */

                          title: SizedBox(
                            child: Text(
                              value.addnote[index].toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade800,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddIteam())));
        },
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}
