import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:write_jh/pages/textList.dart';
import 'package:write_jh/data/write.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2022,7,13) : [
      Event('title'),
      Event('title2')
    ],
    DateTime.utc(2022,7,14) : [ Event('title3')],
  };
  List<String> dateArray = ['2022-07-13', '2022-07-14']; //값이 있을 때만 화면 이동 시키기 위해 테스트

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          title: Text("그리다, 글"),
          centerTitle: true,
          elevation: 0, //그림자 없애주기
        ),
        body: SingleChildScrollView( //overflow 오류가 나서 추가함
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TableCalendar(
              focusedDay: focusedDay, //달력에서 자동으로 보여줄 날
              firstDay: DateTime.now().subtract(Duration(days: 365*10 + 2)),
              lastDay: DateTime.now().add(Duration(days: 365*10 + 2)),
              locale: 'ko-KR',
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                //selectedDay는 [yyyy-MM-dd 00:00:00.000Z]로 값이 나와서 비교할 수가 없었다.
                //그래서 날짜형식을 다음과 같이 지정했다.
                final DateTime now = selectedDay; //선택한 날짜의 값을 변경시키기 위함이므로 selectedDay를 넣었따.
                final DateFormat formatter = DateFormat('yyyy-MM-dd');
                final String formatted = formatter.format(now);

                for (var i = 0; i < dateArray.length; i++) {
                  if (dateArray[i] == formatted) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>textList()));
                  }
                  else {
                    setState(() {
                        //선택된 날짜의 상태를 갱신한다.
                        print(selectedDay);
                        this.selectedDay = selectedDay;
                        this.focusedDay = focusedDay;
                      });
                  }
                }
              },
              selectedDayPredicate: (DateTime day) {
                //selectedDay 와 동일한 날짜의 모양을 바꿔준다.
                return isSameDay(selectedDay, day);
              },
              onPageChanged: (focusedDay) {
                this.focusedDay = focusedDay;
              },
              eventLoader: _getEventsForDay, //값이 있는 날짜 마커 디자인 변경해야함
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 70,
              padding: EdgeInsets.all(10),
              child: Text('7월 셋째 주 이행률\n 10%',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            )
          ],
        )
      )
    );
  }
}

class Event {
  String test;

  Event(this.test);
  //저장된 구절이 있으면 표시를 해야하는데 이거 연동 어떻게 진행해야하나
}