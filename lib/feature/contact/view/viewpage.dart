import 'package:cntimageriverpod/feature/contact/controller/provider.dart';
import 'package:cntimageriverpod/feature/contact/controller/theme_controller.dart';
import 'package:cntimageriverpod/feature/contact/model/contactModel.dart';
import 'package:cntimageriverpod/feature/contact/view/addPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class contactPage extends ConsumerWidget {
  const contactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Contact> contacts = ref.watch(contactprovider);
    return Scaffold(
      appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.grey,
          leading: IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).Switcher();
              },
              icon: ref.watch(themeProvider)
                  ? Icon(
                      Icons.lightbulb,
                      color: Colors.amber,
                    )
                  : Icon(
                      Icons.lightbulb_sharp,
                    )),
          title: TextField(
            decoration: InputDecoration(
              // prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: "Search contact and places",
            ),
          ),
          actions: [
            Icon(Icons.mic),
            Icon(Icons.more_vert_outlined),
            Padding(padding: EdgeInsets.only(right: 20))
          ]),
      body: contacts.isEmpty
          ? Center(
              child: Text("add contact"),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addPage(
                                      nameText: contacts[index].name,
                                      phoneText: contacts[index].phone,
                                      isEdit: true,
                                      index: index,
                                    )));
                      },
                      leading: CircleAvatar(
                        backgroundImage: contacts[index].imagefile == null
                            ? null
                            : FileImage(contacts[index].imagefile!),
                        child: contacts[index].imagefile == null
                            ? Icon(Icons.person)
                            : null,
                        backgroundColor: Colors.black,
                      ),
                      title: Text(contacts[index].name),
                      subtitle: Text(contacts[index].phone.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton.outlined(
                              onPressed: () {
                                // showAlertedit(context);
                              },
                              icon: Icon(Icons.edit_calendar)),
                          Padding(padding: EdgeInsets.only(left: 13)),
                          IconButton.filledTonal(
                              hoverColor: Colors.grey,
                              onPressed: () {
                                ref
                                    .read(contactprovider.notifier)
                                    .delete(index);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      )),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => addPage(),
              ));
        },
        hoverColor: Colors.white,
        backgroundColor: Colors.grey,
        mouseCursor: SystemMouseCursors.click,
        child: Icon(Icons.add),
      ),
    );
  }
}
