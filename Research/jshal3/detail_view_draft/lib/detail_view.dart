import 'package:flutter/material.dart';
import 'event.dart';

Image img = Image.asset(
  'images/lake.jpg',
  width: 600,
  height: 240,
  fit: BoxFit.cover,
);

final Event sampleEvent = Event(
  image: img,
  name: "Sample Name",
  location: "Sample Location",
  date: DateTime.now().add(const Duration(days: 30)),
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae velit augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
);

class DetailView extends StatelessWidget {
  DetailView({Key? key}) : super(key: key);

  Event event = sampleEvent;

  Divider divider = const Divider(
    height: 20,
    thickness: 5,
    indent: 20,
    endIndent: 20,
  );

  Widget _buildAllInfoRows() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildInfoRow(Icons.location_city, event.location),
        _buildInfoRow(Icons.access_time, event.date.toString()),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label) {
    return Row(
      children: <Widget>[
        Icon(icon),
        Text(label),
      ],
    );
  }

  // TODO: Try to fix error that results from calling even in descriptionSection

  // Widget descriptionSection = Padding(
  //   padding: const EdgeInsets.all(32),
  //   child: Text(
  //     event.description,
  //     softWrap: true,
  //   )
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.name)),
      body: ListView(
        children: <Widget>[
          event
              .image!, //MAKE SURE TO ADD LOGIC TO CHECK IF IMAGE IS NULL OR NOT
          _buildAllInfoRows(),
          divider,

          // Temp fix for missing descriptionSection

          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              event.description,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
