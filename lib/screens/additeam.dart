import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/addprovider.dart';
import 'constant.dart';

class AddIteam extends StatefulWidget {
  const AddIteam({super.key});

  @override
  State<AddIteam> createState() => _AddIteamState();
}

class _AddIteamState extends State<AddIteam> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 20, 10),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: controller,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration.collapsed(
                  hintText: "Enter the Note ........",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            Consumer<AddProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.addNote(controller.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade700,
                    ),
                    child: const Center(
                        child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
