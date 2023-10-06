import 'package:flutter/material.dart';

// third party packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// local files
import 'package:flutter_artdx/bottom_sheet.dart';
import 'package:flutter_artdx/styles/app_text_style.dart';
import './constants/test_data.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var id = 0;

  //Supabase Table에서 data fetch 해오기
  final _future =
      Supabase.instance.client.from('artworks').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //작품 목록 사이드바 Drawer widget
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
            child: ListView.builder(
                // TODO : supabase에서 가져온 데이터로 변경
                itemCount: TestData.localDataList.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    // TODO : supabase에서 가져온 데이터로 변경
                    title: Text(
                      '$index. ' + TestData.localDataList[index]["name"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      setState(() {
                        id = index;
                        Navigator.pop(context);
                      });
                    },
                  );
                }),
          ),
        ),
        appBar: AppBar(
          title: Text(
            '영국 내셔널갤러리 명화전',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
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
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //작품 사진
                    SizedBox(height: 10),
                    CarouselSlider(
                        items: TestData.localDataList
                            .map((item) => Center(
                                child: Image.asset(
                                    TestData.localDataList[id]["image"],
                                    width: 600,
                                    height: 320)))
                            .toList(),
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
                        )),

                    //작품 기본 정보
                    SizedBox(height: 10),
                    Text(TestData.localDataList[id]["artist"],
                        style: AppTextStyle.artSubtitle),
                    Text(TestData.localDataList[id]["name"],
                        style: AppTextStyle.artTitle),
                    Text(TestData.localDataList[id]["date"],
                        style: AppTextStyle.cardTitle),
                    Text(TestData.localDataList[id]["medium"],
                        style: AppTextStyle.artSubtitle),
                    Text(TestData.localDataList[id]["size"],
                        style: AppTextStyle.artSubtitle),

                    //Expanded로 listview 높이 문제 해결
                    Expanded(
                      //스크롤바 숨기는 코드
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        //스크롤 가능하도록 만들기
                        child: ListView(
                          children: [
                            //작품 키포인트 카드
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      //작품 키포인트, 도슨트 이름
                                      Row(
                                        children: [
                                          Text('작품 키포인트',
                                              style: AppTextStyle.cardTitle),
                                          SizedBox(width: 10),
                                          Text(
                                              TestData.localDataList[id]
                                                  ["docent"],
                                              style: AppTextStyle.cardSubtext),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      //작품 키포인트 내용
                                      Text(TestData.localDataList[id]
                                          ["keypoint"]),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            //한 줄 평론 카드
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          BuildSheet());
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        //'한 줄 평론' 부제목, 한 줄 평론 개수
                                        Row(
                                          children: [
                                            Text('한 줄 평론',
                                                style: AppTextStyle.cardTitle),
                                            SizedBox(width: 10),
                                            Text('1.3천',
                                                style:
                                                    AppTextStyle.cardSubtext),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        //베스트 평론가 프로필 이미지, 베스트 평론 내용
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'profile.png',
                                                width: 30,
                                                height: 30,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                                child: Text(
                                                    '베스트 댓글이 1개 보여집니다. 베스트 댓글이 1개 보여집니다. 베스트 댓글이 1개 보여집니...')),
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
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('작품 설명',
                                          style: AppTextStyle.cardTitle),
                                      SizedBox(height: 10),
                                      //작품 키포인트 내용
                                      Text(TestData.localDataList[id]
                                          ["description"]),
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
            }));
  }
}
