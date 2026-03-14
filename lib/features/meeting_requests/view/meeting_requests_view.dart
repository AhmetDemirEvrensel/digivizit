import 'package:flutter/material.dart';
import '../../../core/constants/app_fonts.dart';
import 'meeting_request_detail_view.dart';

class MeetingRequestsView extends StatefulWidget {
  const MeetingRequestsView({super.key});

  @override
  State<MeetingRequestsView> createState() => _MeetingRequestsViewState();
}

class _MeetingRequestsViewState extends State<MeetingRequestsView> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Görüşme Talepleri',
          style: AppFonts.baseBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          _buildCalendarView(),
          Expanded(
            child: Container(
              color: const Color(0xFF1C1C1E),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildMeetingRequestCard(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ay ve Yıl
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.calendar_today, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                _getMonthName(selectedDate.month),
                style: AppFonts.baseBold.copyWith(fontSize: 24, color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Haftalık görünüm
          _buildWeekView(),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = ['', 'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 
                    'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'];
    return months[month];
  }

  Widget _buildWeekView() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    const weekDays = ['P', 'S', 'Ç', 'P', 'C', 'C', 'P'];
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final day = startOfWeek.add(Duration(days: index));
        final isToday = day.day == now.day && day.month == now.month && day.year == now.year;
        final hasMeeting = index == 2 || index == 5;

        return Column(
          children: [
            Text(
              weekDays[index],
              style: AppFonts.baseRegular.copyWith(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isToday ? const Color(0xFF0A84FF) : (hasMeeting ? Colors.red : Colors.transparent),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: AppFonts.baseBold.copyWith(
                    fontSize: 16,
                    color: (isToday || hasMeeting) ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
            if (hasMeeting && !isToday)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildMeetingRequestCard(int index) {
    final times = ['09:00', '10:00', '13:00', '14:00'];
    final durations = ['1sa', '1sa', '1sa', '45d'];
    final titles = ['Turcaf-ExpoNot Demo', 'mehmet çalışma', 'ExpoNot Demo', 'Gözen Holdingeki lead hk'];
    final participants = [
      ['E', 'M'],
      [],
      ['E', 'H'],
      ['M', 'K', 'MB']
    ];
    final colors = [
      [Colors.red, Colors.blue],
      [],
      [Colors.red, const Color(0xFFFF6B6B)],
      [Colors.blue, Colors.grey, Colors.purple]
    ];
    final hasIcon = [false, true, false, false];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeetingRequestDetailView(index: index),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sol taraf - Zaman
            SizedBox(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    times[index],
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    durations[index],
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Orta çizgi
            Container(
              width: 3,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF0A84FF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            // Sağ taraf - İçerik
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (hasIcon[index])
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5AC8FA),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.video_call,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          titles[index],
                          style: AppFonts.baseBold.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (participants[index].isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ...List.generate(
                          participants[index].length,
                          (i) => Container(
                            margin: EdgeInsets.only(right: i < participants[index].length - 1 ? 4 : 0),
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: colors[index][i],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                participants[index][i],
                                style: AppFonts.baseBold.copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else if (hasIcon[index]) ...[
                    const SizedBox(height: 4),
                    Text(
                      'mehmet.bulbul@hepta.com.tr',
                      style: AppFonts.baseRegular.copyWith(
                        fontSize: 13,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
