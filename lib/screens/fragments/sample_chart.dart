import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SampleChart extends StatefulWidget {

	SampleChartState createState() {

		return SampleChartState();
	}
}

class SampleChartState extends State<SampleChart> {

  final Color leftBarColor = Color(0xff53fdd7);
  final Color rightBarColor = Color(0xffff5182);
  final double width = 7;

	List<BarChartGroupData> myBarGroups;

	@override
	void initState() {
		super.initState();

		myBarGroups = [
	    makeGroupData(0, 5, 12),
	    makeGroupData(1, 16, 12),
	    makeGroupData(2, 18, 5),
	    makeGroupData(3, 20, 16),
	    makeGroupData(4, 17, 6),
	    makeGroupData(5, 19, 1.5),
	    makeGroupData(6, 10, 1.5),
		];
	}

	Widget build(BuildContext context) {

		return FlChart(
			chart: BarChart(
				BarChartData(
					maxY: 20,
					barGroups: myBarGroups,
					borderData: FlBorderData(
						show: false,
					),



		      barTouchData: BarTouchData(
		        enabled: false,
		        touchTooltipData: TouchTooltipData(
	            tooltipBgColor: Colors.blueGrey,
	            getTooltipItems: (touchedSpots) {
	              return touchedSpots.map((touchedSpot) {
	                if (touchedSpot?.spot == null) { return null; }  // ***** this is the key code
	                return TooltipItem('***' + '\n' + touchedSpot.spot.y.toString(), TextStyle(color: Colors.yellow));
	              }).toList();
	            }
	          ),
		        allowTouchBarBackDraw: false,
		      ),

					titlesData: FlTitlesData(
						show: true,
						bottomTitles: SideTitles(
							showTitles: true,
							textStyle: TextStyle(
								color: Color.fromRGBO(134, 156, 210, 1),
							),
							getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return 'M';
                  case 1:
                    return 'Tu';
                  case 2:
                    return 'W';
                  case 3:
                    return 'Th';
                  case 4:
                    return 'F';
                  case 5:
                    return 'Sa';
                  case 6:
                    return 'Su';
									default:
										return '';
                }
              },
						),
						leftTitles: SideTitles(
							showTitles: true,
							textStyle: TextStyle(
								color: Color.fromRGBO(134, 156, 210, 1),
							),
              getTitles: (value) {
                if (value == 0) {
                  return '1K';
                } else if (value == 10) {
                  return '5K';
                } else if (value == 19) {
                  return '10K';
                } else {
                  return '';
                }
              },
						),
					),
				),
			),
		);
	}

	BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
    	barsSpace: 4,
    	x: x,
    	barRods: [
	      BarChartRodData(
	        y: y1,
	        color: leftBarColor,
	        width: width,
	        isRound: true,
	      ),
	      BarChartRodData(
	        y: y2,
	        color: rightBarColor,
	        width: width,
	        isRound: true,
	      ),
    	]
    );
  }
}