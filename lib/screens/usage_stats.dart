import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/fragments/main_drawer.dart';
import 'package:twenty4seven_utility/screens/fragments/meter.dart';
import 'package:twenty4seven_utility/screens/fragments/sample_chart.dart';

class UsageStats extends StatefulWidget {

	static const String routeName = 'usage-stats';

	UsageStatsState createState() {
		return UsageStatsState();
	}
}

class UsageStatsState extends State<UsageStats> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

	final List<Map<String, String>> meters = [
		{"meter_number": "277878-299382-02", "name": "My Lekki Meter", "type": "power", "disco": "IKDC"},
		{"meter_number": "AX-59-21-B", "name": "Water Meter", "type": "water", "disco": "AMS"},
	];

	final PageController pageController = PageController(
		initialPage: 0,
	);

	Widget build(BuildContext context) {

		return Scaffold(
      key: scaffoldKey,

			// drawer 
			drawer: MainDrawer(),

			// body
			body: SafeArea(
				child: Column(
					children: [

						// appbar
						Padding(
							padding: EdgeInsets.only(
								top: 16.0,
								left: 8.0, right: 8.0,
							),
							child: Row(
								crossAxisAlignment: CrossAxisAlignment.center,
								children: [
									IconButton(
										icon: Icon(
											Icons.arrow_back,
											size: 24.0,
										),
                		//onPressed: () => scaffoldKey.currentState.openDrawer(),
                		onPressed: () => Navigator.of(context).pop(),
									),

									Expanded(
										child: Text(
											"Usage Stats",
											style: TextStyle(
												fontSize: 24.0
											),
										),
									),
								]
							),
						),

						Expanded(
							child: PageView(
								controller: pageController,
								scrollDirection: Axis.horizontal,
								physics: BouncingScrollPhysics(),
								children: List<Widget>.generate(
									meters.length,
									(index) {


										Map<String, String> meter = meters[index];
										return Padding(
											padding: EdgeInsets.only(
												bottom: 12.0,
											),
											child: Column(
												mainAxisSize: MainAxisSize.max,
												children: <Widget>[

													// meter
													Meter(
														type: meter["type"],
														disco: meter["disco"],
														name: meter["name"],
														meterNumber: meter["meter_number"],
													),

													Expanded(

														child: Padding(		
															padding: EdgeInsets.only(
																top:12.0, bottom:8.0, left: 16.0, right: 16.0,
															),

															child: SingleChildScrollView(
																physics: BouncingScrollPhysics(),
																child: Column(
																	crossAxisAlignment: CrossAxisAlignment.start,
																	children: <Widget>[

																		// filter
																		Row(
																			mainAxisAlignment: MainAxisAlignment.end,
																			children: <Widget>[
																				FlatButton(
																					child: Row(
																						children: <Widget>[
																							Text("Last 7 days"),
																							SizedBox(width: 8.0),
																							Icon(Icons.arrow_drop_down),
																						]
																					),
																					onPressed: () {},
																				),
																			],
																		),

																		// chart
																		SizedBox(
																			width: double.infinity,
																			height: 320.0,
																			child: Card(
																        //elevation: 0,
																        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
																        color: Color(0xff2c4260),
																        child: Padding(
																          padding: const EdgeInsets.all(16),
																          child: SampleChart(),
															          ),
															        ),
														        ),

														        // recommendation
														        SizedBox(height: 32.0),
														        Text(
														        	"Recommendation",
														        	style: TextStyle(
														        		color: Color(0xff255893),
														        		fontSize: 24.0
													        		),
													        	),

														        Text(
														        	"The recommendations section of this screen is a future iteration suggestion to the platform.  Considering the resources available at hand, it is not recommended to ship with MVP. The recommendations section of this screen is a future iteration suggestion to the platform.  Considering the resources available at hand, it is not recommended to ship with MVP.",
														        	style: TextStyle(
														        		color: Color(0xffa0a0a0),
														        		fontSize: 20.0,
														        		fontWeight: FontWeight.w300,
													        		),
													        	),
																	]
																),
															),
														)
													),
												]
											),
										);


									}
								),
							),
						),
					]
				),
			),
		);
	}
}