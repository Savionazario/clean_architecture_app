import 'package:clean_architecture_app/layers/presentation/ui/pages/space_media_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  _showDatePicker() async {
    DateTime? timePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (timePicked != null && timePicked != selectedDate) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(timePicked);
      return formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "APOD",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 140,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: Text(
                    "Escolha uma data",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    var data = await _showDatePicker();
                    print("data: $data");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpaceMediaPage(data: data.toString()),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
