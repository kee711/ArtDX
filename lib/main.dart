import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bottom_sheet.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xomlhkusycjnfjshqyqx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhvbWxoa3VzeWNqbmZqc2hxeXF4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0OTM3ODMsImV4cCI6MjAxMjA2OTc4M30.1urLXw5dAmZyIAWlGOafvU7ObTGoBiqEejhuwinnPdM',
  );
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        color: Color.fromARGB(255, 242, 242, 242),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w100),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5
      )
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var artTitle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  var artSubtitle = TextStyle(
    color: Colors.grey,
    fontSize: 17,
    fontWeight: FontWeight.normal
  );

  var cardTitle = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold
  );

  var cardSubtext = TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w300 
  );

  var id = 0;

  List data_local = [
    {
      "id": 0,
      "image": "../assets/job_cigarette_papers.jpeg",
      "artist": "Alphonse Mucha",
      "name": "Job Cigarette Papers",
      "medium": "Lithograph",
      "date": "1896",
      "size": "59 x 173 cm",
      "docent": "강유진 도슨트",
      "keypoint": " This poster features a modern girl with Pre-Raphaelite hair holding a lighted cigarette, symbolizing the contemporary femininity of the time.",
      "description": "Alphonse Mucha’s poster for Job cigarette papers has become an iconic work in design history. This poster features a modern girl with Pre-Raphaelite hair holding a lighted cigarette, symbolizing the contemporary femininity of the time. Mucha treated this poster as a canvas and broke down the conventional boundaries between art and craft. He incorporated intricate patterns, floral elements, and lettering to create a visually stunning piece that captures both the Art Nouveau style and the Bohemian spirit. \nThe ‘Mucha woman’ depicted in this poster established an iconic image that captured audiences worldwide. Her elaborate hair became one of Mucha’s trademarks, capturing the fantasy-like beauty he wished to convey to viewers. This design was also heavily influenced by Japonism, which is present in its flat two-dimensional forms and elongated figures. \nJob by Alphonse Mucha is not only an influential masterpiece from his famed career but also showcased his contribution to popular art movements like Art Nouveau at its height. The innovative use of ornamentation adds depth to this simple image of a lone smoker, transcending her into something more emblematic about what it means to be both human and female.",
    },
    {
      "id": 1,
      "image": "../assets/brillo_box.jpeg",
      "artist": "Andy Warhol",
      "name": "Brillo Box",
      "medium": "Acrylic,silkscreen,plywood",
      "date": "1964",
      "size": "17 1/8 x 17 1/8 x 14 in",
      "docent": "기민성 도슨트",
      "keypoint": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac maximus massa. Ut tellus diam, scelerisque eget orci nec,",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac maximus massa. Ut tellus diam, scelerisque eget orci nec, elementum molestie urna. Nullam sed metus convallis, ullamcorper risus nec, vehicula est. Phasellus quis lacus ac nisi rhoncus consectetur sit amet eget justo. Pellentesque urna nunc, tempor vitae pretium eget, tincidunt at ante. Maecenas in dignissim felis. Morbi feugiat facilisis sodales. Fusce blandit quam mollis dui suscipit maximus. Maecenas in fermentum enim, et lobortis sem. Curabitur porttitor commodo tincidunt. Vestibulum vitae turpis maximus lacus placerat pulvinar. Donec vel neque eu felis fermentum tristique quis sed nulla.Cras rutrum rutrum tincidunt. Aliquam dapibus dui purus, vel mattis erat molestie eu. Vivamus bibendum hendrerit mauris in tristique. Cras nec eros at nisi congue volutpat non non ex. Integer efficitur nibh justo, et tempus dolor hendrerit id. Pellentesque facilisis orci a sem consequat, nec vehicula ante tempus. Praesent velit dolor, eleifend id magna nec, lobortis tempus eros. Curabitur non scelerisque ligula, quis eleifend mi. Morbi lobortis sollicitudin tellus, vitae viverra metus finibus sed. Proin et tristique libero. Pellentesque et urna et odio commodo pharetra non sed enim. Vestibulum suscipit nisl nisl, a cursus orci dapibus eu.Ut maximus orci orci, eu aliquam metus condimentum bibendum. Vivamus pulvinar dolor quis mauris convallis, ut tristique quam eleifend. Suspendisse consequat rhoncus dolor vel viverra. Morbi sed sapien non lacus ornare suscipit. Nunc tincidunt placerat pharetra. Vestibulum nec luctus neque, ac auctor sem. Fusce venenatis scelerisque nunc, vitae faucibus purus sodales sit amet. Proin pellentesque efficitur enim, vel hendrerit nisl faucibus quis. Nam consectetur nisi non placerat placerat. Vivamus congue tellus vitae pharetra consequat. Nam feugiat purus felis, ac blandit elit blandit eget. Curabitur at urna ac ante faucibus fringilla. Phasellus vitae nisi enim. Morbi elementum ligula in mollis sollicitudin. Nunc tristique, ex bibendum ultrices pretium, dui sem blandit elit, id rutrum nibh risus vel nulla.",
    },
    {
      "id": 2,
      "image": "../assets/the_star.jpg",
      "artist": "Edgar Degas",
      "name": "The Star",
      "medium": "Pastel on paper",
      "date": "1878",
      "size": "60 x 44 cm",
      "docent": "김동한 도슨트",
      "keypoint": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac maximus massa. Ut tellus diam, scelerisque eget orci nec,",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac maximus massa. Ut tellus diam, scelerisque eget orci nec, elementum molestie urna. Nullam sed metus convallis, ullamcorper risus nec, vehicula est. Phasellus quis lacus ac nisi rhoncus consectetur sit amet eget justo. Pellentesque urna nunc, tempor vitae pretium eget, tincidunt at ante. Maecenas in dignissim felis. Morbi feugiat facilisis sodales. Fusce blandit quam mollis dui suscipit maximus. Maecenas in fermentum enim, et lobortis sem. Curabitur porttitor commodo tincidunt. Vestibulum vitae turpis maximus lacus placerat pulvinar. Donec vel neque eu felis fermentum tristique quis sed nulla.Cras rutrum rutrum tincidunt. Aliquam dapibus dui purus, vel mattis erat molestie eu. Vivamus bibendum hendrerit mauris in tristique. Cras nec eros at nisi congue volutpat non non ex. Integer efficitur nibh justo, et tempus dolor hendrerit id. Pellentesque facilisis orci a sem consequat, nec vehicula ante tempus. Praesent velit dolor, eleifend id magna nec, lobortis tempus eros. Curabitur non scelerisque ligula, quis eleifend mi. Morbi lobortis sollicitudin tellus, vitae viverra metus finibus sed. Proin et tristique libero. Pellentesque et urna et odio commodo pharetra non sed enim. Vestibulum suscipit nisl nisl, a cursus orci dapibus eu.Ut maximus orci orci, eu aliquam metus condimentum bibendum. Vivamus pulvinar dolor quis mauris convallis, ut tristique quam eleifend. Suspendisse consequat rhoncus dolor vel viverra. Morbi sed sapien non lacus ornare suscipit. Nunc tincidunt placerat pharetra. Vestibulum nec luctus neque, ac auctor sem. Fusce venenatis scelerisque nunc, vitae faucibus purus sodales sit amet. Proin pellentesque efficitur enim, vel hendrerit nisl faucibus quis. Nam consectetur nisi non placerat placerat. Vivamus congue tellus vitae pharetra consequat. Nam feugiat purus felis, ac blandit elit blandit eget. Curabitur at urna ac ante faucibus fringilla. Phasellus vitae nisi enim. Morbi elementum ligula in mollis sollicitudin. Nunc tristique, ex bibendum ultrices pretium, dui sem blandit elit, id rutrum nibh risus vel nulla.",
    },
  ];
  

  //Supabase Table에서 data fetch 해오기
  final _future = Supabase.instance.client
      .from('artworks')
      .stream(primaryKey: ['id']);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //작품 목록 사이드바 Drawer widget
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
          child: ListView.builder(
            // *** 이부분은 supabase에서 아직 못가져오고 수동으로 기입한 data_local로 처리함 ***
            itemCount: data_local.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                // *** 이부분은 supabase에서 아직 못가져오고 수동으로 기입한 data_local로 처리함 ***
                title: Text('$index. ' + data_local[index]["name"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                onTap: (){
                  setState(() {
                    id = index;
                    Navigator.pop(context);
                  });
                },
              );
            }
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('영국 내셔널갤러리 명화전', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
      ),

      // Superbase data 가져오기
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _future,  
        builder: (context, snapshot) {
          // 데이터 가져오는 중에 원형 프로그레스 인디케이터 띄우기
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          // data에 supabase에 가져온 snapshot.data 가져오기
          final data = snapshot.data!;
          
          return Padding(
            padding: EdgeInsets.fromLTRB(20,5,20,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //작품 사진
                SizedBox(height: 10),
                CarouselSlider(
                  items: data_local.map((item) => Center(child: Image.asset(data_local[id]["image"], width: 600, height: 320))).toList(),
                  options: CarouselOptions(
                    height: 320,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    enlargeFactor: 10,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        id = index;
                      });
                    },
                  )
        
                ),
              
                //작품 기본 정보
                SizedBox(height: 10),
                Text(data_local[id]["artist"], style: artSubtitle),
                Text(data_local[id]["name"], style: artTitle),
                Text(data_local[id]["date"], style: cardTitle),
                Text(data_local[id]["medium"], style: artSubtitle),
                Text(data_local[id]["size"], style: artSubtitle),
        
                //Expanded로 listview 높이 문제 해결
                Expanded(
                  //스크롤바 숨기는 코드
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    //스크롤 가능하도록 만들기
                    child: ListView(
                      children: [
        
                        //작품 키포인트 카드
                        Container(
                          padding: EdgeInsets.fromLTRB(0,10,0,5),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  //작품 키포인트, 도슨트 이름
                                  Row(
                                    children: [
                                      Text('작품 키포인트', style: cardTitle),
                                      SizedBox(width: 10),
                                      Text(data_local[id]["docent"], style: cardSubtext),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  //작품 키포인트 내용
                                  Text(data_local[id]["keypoint"]),
                                ],
                              ),
                            ),
                          ),
                        ),
        
                        //한 줄 평론 카드
                        Container(
                          padding: EdgeInsets.fromLTRB(0,10,0,5),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)
                                  )
                                ),
                                context: context, 
                                builder: (BuildContext context) => BuildSheet());
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    //'한 줄 평론' 부제목, 한 줄 평론 개수
                                    Row(
                                      children: [
                                        Text('한 줄 평론', style: cardTitle),
                                        SizedBox(width: 10),
                                        Text('1.3천', style: cardSubtext),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    //베스트 평론가 프로필 이미지, 베스트 평론 내용
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset('profile.png', width: 30, height: 30, fit: BoxFit.cover,),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text('베스트 댓글이 1개 보여집니다. 베스트 댓글이 1개 보여집니다. 베스트 댓글이 1개 보여집니...')
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
        
                        //작품 설명 카드
                        Container(
                          padding: EdgeInsets.fromLTRB(0,10,0,10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('작품 설명', style: cardTitle),
                                  SizedBox(height: 10),
                                  //작품 키포인트 내용
                                  Text(data_local[id]["description"]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}

