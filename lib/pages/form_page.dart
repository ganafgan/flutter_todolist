import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo_item.dart';
import 'package:flutter_todolist/utils/network_manager.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final emailController = TextEditingController();

  bool _isVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: size.width,
          child: Form(
            key: formKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  textCapitalization: TextCapitalization.sentences,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "Title",
                    // icon: const Icon(Icons.percent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.0,
                      ),
                    ),
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  maxLength: 10,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descController,
                  textCapitalization: TextCapitalization.sentences,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 10,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Description",
                    alignLabelWithHint: true,
                    // icon: const Icon(Icons.percent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.0,
                      ),
                    ),
                    focusColor: Colors.white,
                    // prefixIcon: const Icon(
                    //   Icons.email_outlined,
                    //   color: Colors.black,
                    //   size: 20,
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "Title",
                    // icon: const Icon(Icons.percent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.0,
                      ),
                    ),
                    focusColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  maxLength: 30,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Tidak boleh kosong';
                  //   }
                  //   if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  //     return 'Please enter a valid email';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: !_isVisible,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: titleController.text.isEmpty || descController.text.isEmpty ? null : () async {
                      final item = TodoItem(
                        title: titleController.text,
                        description: descController.text,
                        isDone: false,
                      );

                      if (formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        await NetworkManager().postData(item);
                        setState(() {
                          _isLoading = false;
                        });
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                      // if (item.title.isNotEmpty &&
                      //     item.description.isNotEmpty) {
                      //   setState(() {
                      //     _isLoading = true;
                      //   });
                      //   await NetworkManager().postData(item);
                      //   setState(() {
                      //     _isLoading = false;
                      //   });
                      //   // ignore: use_build_context_synchronously
                      //   Navigator.pop(context);
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Simpan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
