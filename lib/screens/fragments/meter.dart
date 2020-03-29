import 'package:flutter/material.dart';

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

