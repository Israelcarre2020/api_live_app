import 'package:flutter/material.dart';

import '../../data/models/chuck_model.dart';

class ChuckCard extends StatelessWidget {
  final List<ChuckModel> chucks;
  final Function() onPress;

  const ChuckCard(this.chucks, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Chucks List:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
            onPressed: onPress,
            icon: const Icon(
              Icons.refresh,
              color: Colors.blue,
            )),
        Expanded(
          child: ListView.builder(
              itemCount: chucks.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(chucks[index].value),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
