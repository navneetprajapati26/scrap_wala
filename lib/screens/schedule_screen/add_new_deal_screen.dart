import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'add_new_deal_controller.dart';

class AddNewDealScreen extends StatelessWidget {
  AddNewDealScreen({Key? key}) : super(key: key);

  String selectedItem = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Post a Deal"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).shadowColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: selectedItem,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        selectedItem = newValue!;
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).shadowColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: selectedItem,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        selectedItem = newValue!;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  //controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Amount of Scrap',
                    prefixIcon: const Icon(Icons.line_weight_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  //onChanged: widget.onSearch,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  //controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Rate of Scrap',
                    prefixIcon: const Icon(Icons.currency_rupee_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  //onChanged: widget.onSearch,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<AddNewDealController>(
                init: AddNewDealController(),
                  builder: (controller) {
                return CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: controller.img != null
                        ? Image.file(controller.img!)
                        : Container(
                            height: 350,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Theme.of(context).shadowColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  size: 100,
                                ),
                                const Text("Take a image of scrap")
                              ],
                            ),
                          ),
                    onPressed: () {
                      controller.showImageSource(context);
                    });
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  //controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Title for your deal',
                    prefixIcon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  //onChanged: widget.onSearch,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                //controller: _searchController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Give description about your deal',
                  prefixIcon: const Icon(Icons.edit_note_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                //onChanged: widget.onSearch,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                onPressed: () async {
                  //todo: Login btn
                },
                padding: EdgeInsets.zero,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      //color: Colors.orange,
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Post Deal",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
