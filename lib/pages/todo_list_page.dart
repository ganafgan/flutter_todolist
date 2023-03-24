import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo_item.dart';
import 'package:flutter_todolist/pages/form_page.dart';
import 'package:flutter_todolist/pages/todo_done_page.dart';
import 'package:flutter_todolist/utils/network_manager.dart';
import 'package:flutter_todolist/widget/item_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<TodoItem> todos = [];
  bool isLoading = false;
  int totalDone = 0;

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
    });

    await NetworkManager().getTodosIsDone(true).catchError((err) {
      print(err.toString());
    }).then((val) {
      // totalDone = val.length;
      setState(() {
        totalDone = val.length;
      });
      setState(() {});
    });

    await NetworkManager().getTodosIsDone(false).then((value) {
      // todos = value;
      setState(() {
        todos = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Todo List',
                    style: textTheme.bodyText1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TodoDonePage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sudah diselesaikan $totalDone',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: todos.isEmpty
                        ? const Center(
                            child: Text('Tidak ada data'),
                          )
                        : RefreshIndicator(
                            onRefresh: refreshData,
                            child: Scrollbar(
                              thumbVisibility: true,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ItemWidget(
                                    todoItem: todos[index],
                                    handleRefresh: refreshData,
                                  );
                                },
                                itemCount: todos.length,
                              ),
                            ),
                          ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const FormPage();
              },
            ),
          );

          refreshData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
