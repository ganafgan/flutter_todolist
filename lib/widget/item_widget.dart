// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_todolist/model/todo_item.dart';
import 'package:flutter_todolist/utils/network_manager.dart';

class ItemWidget extends StatelessWidget {
  final TodoItem todoItem;
  final Function() handleRefresh;
  const ItemWidget({
    Key? key,
    required this.todoItem,
    required this.handleRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Card(
      color: todoItem.isDone ? colorTheme.primary : Colors.white,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todoItem.title,
                    style: TextStyle(
                      color: todoItem.isDone ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    todoItem.description,
                    style: TextStyle(
                      color: todoItem.isDone ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            if (!todoItem.isDone)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                ),
                onPressed: () async {
                  await NetworkManager().updateData(
                    todoItem.copyWith(isDone: true),
                  );
                  handleRefresh();
                },
                child: const Icon(Icons.check),
              ),
            const SizedBox(
              width: 10,
            ),
            if (!todoItem.isDone)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                ),
                onPressed: () async {
                  await NetworkManager().deleteData(todoItem);
                  handleRefresh();
                },
                child: const Icon(Icons.delete_forever),
              )
          ],
        ),
      ),
    );
  }
}
