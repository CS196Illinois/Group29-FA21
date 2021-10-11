import 'package:flutter/material.dart';
import 'event.dart';

Image img = Image.asset(
  'images/lake.jpg',
  width: 600,
  height: 240,
  fit: BoxFit.cover,
);

Event sampleEvent = Event(
  image: img,
  name: "Sample Name",
  location: "Sample Location",
  date: DateTime.now().add(const Duration(days: 30)),
  description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae velit augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
);

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Widget descriptionSection = Padding(
    padding: const EdgeInsets.all(32),
    child: Text(
      sampleEvent.description,
      softWrap: true,
    ),
  );

  Divider divider = const Divider(
    height: 20,
    thickness: 5,
    indent: 20,
    endIndent: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sampleEvent.name)),
      body: ListView(
        children: <Widget>[
          sampleEvent
              .image!, //MAKE SURE TO ADD LOGIC TO CHECK IF IMAGE IS NULL OR NOT
          _buildAllInfoRows(),
          divider,
          descriptionSection,
        ],
      ),
    );
  }

  Widget _buildAllInfoRows() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildInfoRow(Icons.location_city, sampleEvent.location),
        _buildInfoRow(Icons.access_time, sampleEvent.date.toString()),
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
}
