import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ejudiapp/efiling/efiling1home.dart';
import 'package:ejudiapp/erepository/pages/miscellaneous.dart';
import 'package:ejudiapp/erepository/models/article_model.dart';
import 'package:ejudiapp/erepository/models/category_model.dart';
import 'package:ejudiapp/erepository/models/slider_model.dart';
import 'package:ejudiapp/erepository/pages/all_news.dart';
import 'package:ejudiapp/erepository/pages/article_view.dart';
import 'package:ejudiapp/erepository/pages/category_news.dart';
import 'package:ejudiapp/erepository/pages/hcourt.dart';
import 'package:ejudiapp/erepository/services/data.dart';
import 'package:ejudiapp/erepository/services/news.dart';
import 'package:ejudiapp/erepository/services/slider_data.dart';
import 'package:ejudiapp/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Rhome extends StatefulWidget {
  const Rhome({super.key});

  @override
  State<Rhome> createState() => _HomeState();
}
  List myRep = [
    // [ featureName, iconPath  ]
    ["Supreme Court", "assets/efil.png"],
    ["High Court", "assets/cstatus.png"],
  ];

class _HomeState extends State<Rhome> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true, loading2=true;

  int activeIndex = 0;
  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

    getSlider() async {
    Sliders slider= Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
  setState(() {
    loading2=false;
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
                  builder: (context) => const MyApp(),
                ),
              );
            },
          ),
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
        centerTitle: true,
        title: Row(
          
          children: [
            Text("E-",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Text(
              "Repository",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        
        elevation: 0.0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Column(
            children: [
              SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "News ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Breaking")));
                                },
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      loading2? Center(child: CircularProgressIndicator()):  CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              String? res = sliders[index].urlToImage;
                              String? res1 = sliders[index].title;
                              return buildImage(res!, index, res1!);
                            },
                            options: CarouselOptions(
                                height: 250,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                })),
                        SizedBox(
                          height: 30.0,
                        ),
                        Center(child: buildIndicator()),
                        SizedBox(
                          height: 25.0,
                        ),
                        
                        const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 107, 105, 105),
              ),
            ),
                        SizedBox(
                          height: 25.0,
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                          height: 2.0,
                        ),
                              Text(
                                "Repositories",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0),
                              ),
                              SizedBox(
                          height: 2.0,
                        ),
                              
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                       
                      ],
                    ),
                  ),
                ),
                 Expanded(
              child: GridView.builder(
                itemCount: 2,
                //physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.1,
                ),
                itemBuilder: (context, index) {
                  return RepBox(
                    featureName: myRep[index][0],
                    
                    
                  );
                },
              ),
            )
            ],
          ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
      
            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width, imageUrl: image,
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(top: 170.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
            child: Text(
              name,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: SlideEffect(
            dotWidth: 10, dotHeight: 10, activeDotColor: Colors.purple),
      );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                 image,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
               
              ),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              child: Center(
                  child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc, url;
  BlogTile({required this.desc, required this.imageUrl, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl:url )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                      imageUrl: imageUrl,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover, 
                          ))),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          desc,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class RepBox extends StatelessWidget {
  final String featureName;
  
  

  RepBox({
    Key? key,
    required this.featureName,
    
    
     // Include onChanged as an optional parameter
  }) : super(key: key);

  void _navigateToDevicePage(BuildContext context) {
    // Define a map to associate device names with their respective page classes
    final repPageRoutes = {
      "Supreme Court": miscellaneous(),
      "High Court": hcourt(),
      
    };

    // Get the corresponding page based on the device name
    final RepPage = repPageRoutes[featureName];

    if (RepPage != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => RepPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: () => _navigateToDevicePage(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: GestureDetector(
            onTap: () => _navigateToDevicePage(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color:  Colors.grey[900],
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  offset: Offset(-5.0, -5.0),
                  blurRadius: 5,
                  spreadRadius: 0.0,
                ),
                
                BoxShadow(
                  color: Color.fromARGB(255, 62, 62, 62),
                  offset: Offset(12.0, 12.0),
                  blurRadius: 20,
                  spreadRadius: 0.0,
                ),

                  /*BoxShadow(
                    color: Color.fromARGB(255, 248, 245, 245),
                    offset: Offset(-8.0, -8.0),
                    blurRadius: 8,
                    spreadRadius: 0.0,
                  ),
                  
                  BoxShadow(
                    color: Color.fromARGB(255, 11, 11, 11),
                    offset: Offset(24.0, 24.0),
                    blurRadius: 45,
                    spreadRadius: 0.0,
                  ),*/
                ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                        Center(
                          child: Expanded(
                             child: Padding(
                              
                              padding: const EdgeInsets.all( 20.0),
                              child: Center(
                                child: Center(
                                  child: Text(
                                    //style: GoogleFonts.mukta(fontSize: 26,color: Colors.white),
                                    
                                    featureName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), 
                  ],
              ),
                  ),
            ),
                ),
          ),
        ),),);
  }
}

