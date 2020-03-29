import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/fragments/main_drawer.dart';

class Dashboard extends StatefulWidget {

	static const String routeName = 'dashboard';

	DashboardState createState() {
		return DashboardState();
	}
}

class DashboardState extends State<Dashboard> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

	final List<Map<String, dynamic>> history = [
		{"status": "pending", "date": "Mon, Jul 29, 2019", "amount": 1200},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 700},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 8000},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 3200},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 12000},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 1500},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 1200},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 700},
		{"status": "failed", "date": "Mon, Jul 29, 2019", "amount": 8000},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 3200},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 12000},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 1500},
	];

	final List<Map<String, String>> meters = [
		{"meter_number": "277878-299382-02", "name": "My Lekki Meter", "type": "power", "disco": "IKDC"},
		{"meter_number": "AX-59-21-B", "name": "Water Meter", "type": "water", "disco": "AMS"},
	];

	final PageController pageController = PageController(
		initialPage: 1,
	);

	Widget build(BuildContext context) {

		return Scaffold(
      key: scaffoldKey,

      // floating action button
			floatingActionButton: Row(
				mainAxisSize: MainAxisSize.min,
				mainAxisAlignment: MainAxisAlignment.end,
				children: <Widget>[
					RaisedButton(
						child: Row(
							children: <Widget>[
								Icon(Icons.add_shopping_cart), 
								SizedBox(width: 4.0),
								Text("Recharge"), 
							]
						),
						onPressed: () {
							
						}
					),
				]
			),

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
										icon: Icon( Icons.menu ),
                		onPressed: () => scaffoldKey.currentState.openDrawer(),
									),

									Expanded(
										child: SizedBox.shrink(),
									),

									IconButton(
										icon: Icon( Icons.notifications ),
										//onPressed: () => Navigator.of(context).pop(),
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



													// meter history
													Padding(		
														padding: EdgeInsets.only(
															top:12.0, bottom:8.0, left: 16.0, right: 16.0,
														),
														child: Row(
															children: <Widget>[
																Text("Recent Transactions"),
															],
														),
													),

													Expanded(
														child: ListView.builder(
															physics: BouncingScrollPhysics(),
															itemCount: history.length,
															itemBuilder: (context, index) {

																return Padding(		
																	padding: EdgeInsets.only(
																		top: 16.0,
																		left: 16.0, right: 16.0
																	),

																	child: Container(
																		padding: EdgeInsets.all(16.0),
																		decoration: BoxDecoration(
																			boxShadow: [
																				BoxShadow(
																					color: Color.fromRGBO(150,150,150, 0.5),
																					offset: Offset(2.0, 2.0),
																					blurRadius: 2.0,
																				),
																			],
																			borderRadius: BorderRadius.circular(8.0),
																			color: Colors.white,
																		),

																		child: Row(
																			mainAxisSize: MainAxisSize.max,
																			children: [
																				Container(
																					width: 6.0,
																					height: 6.0,
																					color: ((){

																						if (history[index]['status'] == 'success') {
																							return  Colors.green;
																						}
																						else if (history[index]['status'] == 'pending') {
																							return  Colors.orange;
																						}
																				
																						return  Colors.red;

																					})(),
																				),
																				SizedBox(width: 8.0), 
																				Text("${history[index]['date']}"),
																				Expanded(
																					child: SizedBox.shrink(),
																				),
																				Text("\u20A6 ${history[index]['amount']}"),
																			]
																		)
																	),
																);
															}
														),
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

class Meter extends StatelessWidget {

	final String type;
	final String disco;
	final String name;
	final String meterNumber;

	Meter({@required this.name, @required this.disco, @required this.meterNumber, @required this.type});

	Widget build(BuildContext context) {

		return Padding(		
			padding: EdgeInsets.all(16.0),
			child: Container(
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(8.0),
					boxShadow: [
						BoxShadow(
							color: Color.fromRGBO(150,150,150, 0.8),
							offset: Offset(2.0, 2.0),
							blurRadius: 2.0,
						),
					],
					gradient: LinearGradient(
			      begin: Alignment.topLeft,
			      end: Alignment.bottomRight,
			      colors: [
			      	Color.fromRGBO(200, 251, 244, 1),
			      	Color.fromRGBO(200, 235, 252, 1),
		      	],
			    ),
				),

				child: Column(
					mainAxisSize: MainAxisSize.min,
					children: [
						Padding(
							padding: EdgeInsets.only(
								top: 12.0, left: 12.0, right: 12.0 
							),
							child: Row(
								children: [
									Text(
										name,
										style: TextStyle(
											fontSize: 22.0,
										),
									),
								]
							),
						),
						
						SizedBox( height: 16.0),

						Padding(
							padding: EdgeInsets.only(
								top: 12.0, left: 12.0, right: 12.0 
							),
							child: Row(
								children: [

									(() {
										if (type == 'power') {
											return Icon(
												Icons.power,
												size: 32.0,
												color: Colors.red,
											);
										}

										else if (type == "water") {
											return Icon(
												Icons.opacity,
												size: 32.0,
												color: Colors.blue,
											);
										}
										else {
											return Icon(
												Icons.router,
												size: 32.0,
												color: Colors.white,
											);
										}

									})(),

									Expanded( child: SizedBox.shrink(), ),

									Column(
										crossAxisAlignment: CrossAxisAlignment.end,
										children: [
											Text(disco,),
											Text(
												meterNumber,
												style: TextStyle(
													fontSize: 20.0,
												),
											),
										]
									),
								]
							),
						),
					]
				)
			),
		);


	}
}