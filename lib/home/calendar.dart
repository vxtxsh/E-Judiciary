import 'package:ejudiapp/home/first.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const HomeCalendarPage());
}

class HomeCalendarPage extends StatelessWidget {
  const HomeCalendarPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;

  const MyHomePage({Key? key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CalendarController _controller;
  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];

  List<String> _courts = ['All Courts', 'SC Supreme Court', 'HC High Court'];
  String _selectedCourt = 'All Courts';


  String _selectedState = 'All States';

Map<String, Map<String, List<String>>> _courtSuggestions = {
  'All Courts': {
    '15-11-2023': [
      'SC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
      '329, 1414: Criminal Matters - Criminal Matters relating to Drugs, Disposed\n'
      'SC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'SC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Pending\n'
      'RJ HC 598, 0804: Consumer Protection Matters - Defective product cases, Disposed\n'
      'CG HC 598, 0804: Consumer Protection Matters - Defective product cases, Disposed\n'
      'AP HC 527, 1011: Human Rights Matters - Police brutality cases, Disposed\n'
      'KA HC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'
      // Add more information for this date

    ],
    '9-12-2023': [
      // Add unique information for this date
      'SC 427, 0307: Media Law Matters - Defamation cases, Disposed\n'
      'SC 199, 409: Criminal Matters - Criminal Matters relating bail, Pending\n'
      'KA HC 713, 1306: Aviation Law Matters - Airline liability cases, Disposed\n'
      'CG HC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
      'AP HC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'KA HC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'
    ],
    '28-11-2023': [
      // Add unique information for this date
      'SC 410, 3502: Securities Law Matters - Insider trading cases, Pending\n'
      'SC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'SC 501, 3505: Insolvency and Bankruptcy Code Matters - Resolution of corporate insolvency, Disposed\n'
      'AP HC 426, 0910: Real Estate Law Matters - Property title disputes, Disposed\n'
      'KA HC 628, 1805: Ordinary Civil Matters - Matters relating to contract, Disposed\n'
      'CG HC 329, 0811: Motor Vehicles Act Matters - Claims for compensation in road accidents, Pending\n'
    ],
    '23-11-2023': [
      // Add unique information for this date
      'SC 427, 0307: Media Law Matters - Defamation cases, Disposed\n'
      'SC 511, 2808: Administrative Law Matters - Appeals against administrative tribunal decisions, Disposed\n'
      'SC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'
      'CG HC 735, 1911: Insurance Matters - Claims disputes, Pending\n'
      'AP HC 721, 1102: Arbitration Matters, Pending\n'
      'KA HC 511, 2808: Administrative Law Matters - Appeals against administrative tribunal decisions, Disposed\n'
      'KA HC 895, 1610: Intellectual Property Matters - Patent infringement cases, Disposed\n'
      'RJ HC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
    ],
    '4-12-2023': [
      // Add unique information for this date
      '329, 1414: Criminal Matters - Criminal Matters relating to Drugs, Disposed\n'
      'SC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
      'SC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'SC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'
      'CG HC 329, 0811: Motor Vehicles Act Matters - Claims for compensation in road accidents, Pending\n'
      'CG HC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
    ],
  },
  'SC Supreme Court': {
    '15-11-2023': [
      // Add unique information for this date
      'SC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
      '329, 1414: Criminal Matters - Criminal Matters relating to Drugs, Disposed\n'
      'SC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'SC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Pending\n'
    ],
    '9-12-2023': [
      // Add unique information for this date
      'SC 427, 0307: Media Law Matters - Defamation cases, Disposed\n'
      'SC 199, 409: Criminal Matters - Criminal Matters relating bail, Pending\n'
    ],
    '28-11-2023': [
      // Add unique information for this date
      'SC 410, 3502: Securities Law Matters - Insider trading cases, Pending\n'
      'SC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'SC 501, 3505: Insolvency and Bankruptcy Code Matters - Resolution of corporate insolvency, Disposed\n'

    ],
    '23-11-2023': [
      // Add unique information for this date
      'SC 427, 0307: Media Law Matters - Defamation cases, Disposed\n'
      'SC 511, 2808: Administrative Law Matters - Appeals against administrative tribunal decisions, Disposed\n'
      'SC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'
    ],
    '4-12-2023': [
      // Add unique information for this date
      '329, 1414: Criminal Matters - Criminal Matters relating to Drugs, Disposed\n'
      'SC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
      'SC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'SC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'
    ],
  },
  'HC High Court': {
    '15-11-2023': [
      // Add unique information for this date
      'RJ HC 598, 0804: Consumer Protection Matters - Defective product cases, Disposed\n'
      'CG HC 598, 0804: Consumer Protection Matters - Defective product cases, Disposed\n'
      'AP HC 527, 1011: Human Rights Matters - Police brutality cases, Disposed\n'
      'KA HC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'

    ],
    '9-12-2023': [
      // Add unique information for this date
      'KA HC 713, 1306: Aviation Law Matters - Airline liability cases, Disposed\n'
      'CG HC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
      'AP HC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
      'KA HC 240, 1410: Criminal Matters - Criminal Matters in which sentence awarded is up to 5 years, Disposed\n'


    ],
    '28-11-2023': [
      // Add unique information for this date
      'AP HC 426, 0910: Real Estate Law Matters - Property title disputes, Disposed\n'
      'KA HC 628, 1805: Ordinary Civil Matters - Matters relating to contract, Disposed\n'
      'CG HC 329, 0811: Motor Vehicles Act Matters - Claims for compensation in road accidents, Pending\n'
    ],
    '23-11-2023': [
      // Add unique information for this date
      'CG HC 735, 1911: Insurance Matters - Claims disputes, Pending\n'
      'AP HC 721, 1102: Arbitration Matters, Pending\n'
      'KA HC 511, 2808: Administrative Law Matters - Appeals against administrative tribunal decisions, Disposed\n'
      'KA HC 895, 1610: Intellectual Property Matters - Patent infringement cases, Disposed\n'
      'RJ HC 598, 0804: Consumer Protection Matters - Defective product cases, Pending\n'
    ],
    '4-12-2023': [
      // Add unique information for this date
      'CG HC 329, 0811: Motor Vehicles Act Matters - Claims for compensation in road accidents, Pending\n'
      'CG HC 527, 1011: Human Rights Matters - Police brutality cases, Pending\n'
    ],
  },
};


// Rest of your code remains the same

@override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _suggestions = (_courtSuggestions['All Courts']?.values ?? [])
    .expand((element) => element)
    .toList();



}

void _showDateInfo(DateTime date) {
  // Format the date as 'dd-MM-yyyy'
  String formattedDate = '${date.day}-${date.month}-${date.year}';

  // Initialize courtInfo
  String courtInfo;

  // Check if the date is present in the suggestions
  if (_courtSuggestions.containsKey(_selectedCourt) &&
      _courtSuggestions[_selectedCourt]!.containsKey(formattedDate)) {
    List<String> filteredCourtInfo =
        _courtSuggestions[_selectedCourt]![formattedDate]!;

    if (filteredCourtInfo.isEmpty) {
      courtInfo = 'No relevant information found for $formattedDate.';
    } else {
      courtInfo = filteredCourtInfo.join('\n');
    }
  } else {
    courtInfo =
        'no information for $formattedDate.';
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Court Information for $formattedDate'),
        content: Text(courtInfo),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}


  void _showRecommendations() {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final screenHeight = MediaQuery.of(context).size.height;
    final centerVerticalPosition =
        (screenHeight - 200.0) / 2; // Adjust the value as needed

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final builderContext = context;

    showMenu(
      context: builderContext,
      position: RelativeRect.fromLTRB(
        offset.dx,
        centerVerticalPosition + offset.dy,
        100.0,
        0.0,
      ),
      items: _suggestions.map((String suggestion) {
        return PopupMenuItem<String>(
          value: suggestion,
          child: ListTile(
            title: Text(suggestion),
            onTap: () {
              setState(() {
                _searchController.text = suggestion;
                Navigator.of(builderContext).pop(); // Close the menu
              });
            },
          ),
        );
      }).toList(),
    ).then((_) {
      // Ensure that _suggestions is updated even when no court is selected
      setState(() {
        _suggestions = (_courtSuggestions['All Courts']?.values ?? [])
    .expand((element) => element)
    .toList();
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const First(),
                ),
              );
            },
          ),
        title: Text('Calendar',style: TextStyle(
                                        color: Colors.white,
                                        
                                      ),),
          backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
          centerTitle: true, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _suggestions = _getFilteredSuggestions(value);
                        });
                      },
                      onTap: () {
                        _showRecommendations();
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _suggestions = (_courtSuggestions['All Courts']?.values ?? [])
                          .expand((element) => element)
                          .toList();
                    });
                  },
                ),
              ], 
            ),
          ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: _selectedCourt,
                items: _courts.map((String court) {
                  return DropdownMenuItem<String>(
                    value: court,
                    child: Text(court),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCourt = newValue!;
                    _suggestions =
                        (_courtSuggestions['All Courts']?.values ?? [])
                            .expand((element) => element)
                            .toList();
      
                    // Reset the selected state when High Court is selected
                    if (_selectedCourt == 'HC High Court') {
                      _selectedState = 'All States';
                    }
                  });
                },
              ),
            ),
      
            Expanded(
              child: Center(
                child: SfCalendar(
                  controller: _controller,
                  view: CalendarView.month,
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.calendarCell) {
                      _showDateInfo(details.date!);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getFilteredSuggestions(String query) {
    return _suggestions.where((suggestion) {
      return suggestion.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
} 