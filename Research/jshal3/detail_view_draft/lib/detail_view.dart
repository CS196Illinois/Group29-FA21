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
  name: "Dad's Weekend",
  location: "Grange Grove - \n1416 S 1st St, Champaign, IL 61820",
  date: DateTime.now().add(const Duration(days: 30)),
  description:
      " SCHEDULE: \n ☀️ 7 AM Grange Grove 🍺 Opens \n 8:30AM 👏 Illini Walk & 🌭 Grange Grove Tailgate 🍔 \n 🎟 9:30AM Gates Open \n 🇺🇸 10AM Marching Illini Performance \n 🏈 11AM Beat Rutgers & 🍾 Post Game",
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

  Container getImageContainer() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 16,
          ),
        ),
        child: event.image,
        padding: const EdgeInsets.all(8));
  }

  Widget _buildAllInfoRows() {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildInfoRow(Icons.location_city, event.location),
            _buildInfoRow(Icons.access_time, event.date.toString()),
          ],
        ),
        padding: EdgeInsets.all(32));
  }

  Widget _buildInfoRow(IconData icon, String label) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(icon),
          Text(label),
        ],
      ),
      padding: EdgeInsets.all(8),
    );
  }

  // TODO: Try to fix error that results from calling event in descriptionSection

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
          getImageContainer(), //MAKE SURE TO ADD LOGIC TO CHECK IF IMAGE IS NULL OR NOT
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
