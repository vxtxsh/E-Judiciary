import 'package:ejudiapp/home/first.dart';
import 'package:ejudiapp/home/casedetailspage.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(cstatus());
}

class cstatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cases Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Casestauspage(),
    );
  }
}

class Casestauspage extends StatefulWidget {
  @override
  _CasestatusPageState createState() => _CasestatusPageState();
}

class _CasestatusPageState extends State<Casestauspage> {
  List<List<dynamic>> casesData = [];
  List<List<dynamic>> filteredData = [];

  @override
  void initState() {
    super.initState();
    loadCasesData();
  }

  Future<void> loadCasesData() async {
    final String casesString = await rootBundle.loadString('assets/case_details.csv');
    List<List<dynamic>> listData = CsvToListConverter().convert(casesString);
    setState(() {
      casesData = listData;
      filteredData = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => First(),
                ),
              );
            },
          ),
        title: Text('Case Status'),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(casesData),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          return Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), 
    borderRadius: BorderRadius.circular(8.0),
  ),
  margin: EdgeInsets.all(8.0), 
  child: ListTile(
    title: Text('Dairy No.: ${filteredData[index][2]}'),
    subtitle: Text('Court Type: ${filteredData[index][1]}, Case Status: ${filteredData[index][7]}'),
  ),
);

        },
        
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<List<dynamic>> data;

  CustomSearchDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

 @override
Widget buildSuggestions(BuildContext context) {
  final suggestionList = query.isEmpty
      ? data
      : data.where((row) => row.any((cell) => cell.toString().toLowerCase().contains(query.toLowerCase()))).toList();

  return ListView.builder(
    itemCount: suggestionList.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('Dairy No.: ${suggestionList[index][2]}'),
        subtitle: Text('Court Type: ${suggestionList[index][1]}, Case Status: ${suggestionList[index][7]}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CaseDetailsPage(caseDetails: suggestionList[index]),
            ),
          );
        },
      );
    },
  );
}

}
