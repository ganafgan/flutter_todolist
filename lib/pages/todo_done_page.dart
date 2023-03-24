import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo_item.dart';
import 'package:flutter_todolist/utils/network_manager.dart';
import 'package:flutter_todolist/widget/item_widget.dart';

class TodoDonePage extends StatefulWidget {
  const TodoDonePage({super.key});

  @override
  State<TodoDonePage> createState() => _TodoDonePageState();
}

class _TodoDonePageState extends State<TodoDonePage> {
  List<TodoItem> todos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    NetworkManager().getTodosIsDone(true).then((value) {
      todos = value;
      setState(() {
        _isLoading = false;
      });
      // setState(() {
      //   todos = value;
      //   _isLoading = false;
      // });
    }).catchError((err) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Tode'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Todo yang sudah diselesaikan',
                  style: textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todoItem = todos[index];
                        return ItemWidget(
                          todoItem: todos[index],
                          handleRefresh: () {},
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
