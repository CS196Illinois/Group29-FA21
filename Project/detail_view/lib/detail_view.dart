import 'package:flutter/material.dart';
import 'event.dart';
import 'package:intl/intl.dart';

Image img = Image.asset(
  'images/Grange_Grove_Tailgate_IMG_4674_34.jpg',
  width: 600,
  height: 240,
  fit: BoxFit.cover,
);

final Event sampleEvent = Event(
  image: img,
  name: "Dad's Weekend",
  location: "Grange Grove - \n1416 S 1st St, Champaign, IL 61820",
  date: DateTime(2021, 10, 30, 8, 30),
  description:
      "Come to Grange Grove for Dad's Weekend tailgate right before the football game for a great time! \n \n SCHEDULE: \n ☀️ 7:00 AM Grange Grove 🍺 Opens \n 8:30AM 👏 Illini Walk & 🌭 Grange Grove Tailgate 🍔 \n 🎟 9:30AM Gates Open \n 🇺🇸 10AM Marching Illini Performance \n 🏈 11AM Beat Rutgers & 🍾 Post Game",
);

class DetailView extends StatelessWidget {
  DetailView({Key? key}) : super(key: key);

  final Event event = sampleEvent;

  Widget getDivider() => const Divider(
        height: 20,
        thickness: 5,
        indent: 20,
        endIndent: 20,
      );

  Container getImageContainer() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0,
          ),
        ),
        child: event.image,
        padding: const EdgeInsets.all(0));
  }

  // -> July 10, 1996
  String getDateString(DateTime dt) => DateFormat.yMMMMd("en_US").format(dt);

  // -> 5:08 PM
  String getTimeString(DateTime dt) => DateFormat.jm().format(dt);

  // -> Tuesday
  String getWeekdayString(DateTime dt) => DateFormat.E("en_US").format(dt);

  // -> Wednesday, July 10, 1996
  String getFullDateString(DateTime dt) {
    DateFormat df = DateFormat("EEEE, MMMM d, yyyy");
    return df.format(dt);
  }

  Widget _buildAllInfoRows() {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildInfoRow(Icons.location_city, event.location),
            _buildInfoRow(Icons.calendar_today, getFullDateString(event.date)),
            _buildInfoRow(Icons.access_time, getTimeString(event.date)),
          ],
        ),
        padding: const EdgeInsets.all(16));
  }

  Widget _buildInfoRow(IconData icon, String label) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8), child: Icon(icon)),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
    );
  }

  Widget getDescriptionSection() => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          event.description,
          softWrap: true,
          textScaleFactor: 1.1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(event.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.deepOrangeAccent),
      body: ListView(
        children: <Widget>[
          getImageContainer(), //MAKE SURE TO ADD LOGIC TO CHECK IF IMAGE IS NULL OR NOT
          _buildAllInfoRows(),
          getDivider(),
          getDescriptionSection(),
        ],
      ),
    );
  }
}
