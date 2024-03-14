import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skincare_demo/utils/app_constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StreaksScreen extends StatefulWidget {
  const StreaksScreen({super.key});

  @override
  State<StreaksScreen> createState() => _StreaksScreenState();
}

class _StreaksScreenState extends State<StreaksScreen> {
  List<ChartSampleData>? chartData = <ChartSampleData>[
    ChartSampleData(x: '1D', y: 60, secondSeriesYValue: 70),
    ChartSampleData(x: '1W', y: 85, secondSeriesYValue: 30),
    ChartSampleData(x: '1M', y: 70, secondSeriesYValue: 80),
    ChartSampleData(x: '3M', y: 50, secondSeriesYValue: 35),
    ChartSampleData(x: '1Y', y: 70, secondSeriesYValue: 50),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Goal: 3 streak days',
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Streak Days',
                        style: GoogleFonts.epilogue(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '2',
                        style: GoogleFonts.epilogue(
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),

          ///
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daily Streak',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '2',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                  fontSize: 32,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Last 30 Days',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '+100%',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w500,
                  color: AppColors.greenColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 180,
            child: SfCartesianChart(
              selectionType: SelectionType.point,
              plotAreaBorderWidth: 0,

              // Initialize category axis
              primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(width: 0),
                  labelPlacement: LabelPlacement.onTicks),
              primaryYAxis: const NumericAxis(
                isVisible: false,
                minimum: 10,
                maximum: 100,
                anchorRangeToVisiblePoints: false,
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                // labelFormat: '{value}°F',
                // majorTickLines: MajorTickLines(size: 0),
              ),
              series: _getDefaultSplineSeries(),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Keep it up! You\'re on a roll.',
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Row(children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  textStyle: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                    fontSize: 14,
                  ),
                ),
                onPressed: null,
                child: Text(
                  'Get Started',
                  style: GoogleFonts.epilogue(
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

  List<SplineSeries<ChartSampleData, String>> _getDefaultSplineSeries() {
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataSource: chartData,
        color: AppColors.secondaryColor,
        name: 'Low',
        markerSettings: const MarkerSettings(isVisible: false),
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      )
    ];
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.y,
    required this.secondSeriesYValue,
  });
  final String x;
  final double y;
  final double secondSeriesYValue;
}
