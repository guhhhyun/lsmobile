import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'common/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<PlutoColumn> columns;
  late List<PlutoColumn> columns2;
  List<PlutoRow> rows = [];
  List<PlutoRow> rows2 = [];
  List<bool> isRow = [];
  late PlutoGridStateManager stateManager;
  late PlutoGridStateManager stateManager2;
  TextEditingController textControll = TextEditingController();
  int focusCnt = 0;
  String text = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String text5 = '';
  final focusNode = FocusNode();
  final focusNode2 = FocusNode(onKey: (node, event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
      return KeyEventResult.handled; // prevent passing the event into the TextField
    }
    return KeyEventResult.ignored; // pass the event to the TextField
  });

  @override
  void initState() {
    super.initState();

    /// 마스터 리스트 컬럼 추가----------------------------------------
    columns = <PlutoColumn>[
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 60,
        title: '순번',
        field: 'id',
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          Color textColor = Colors.black;

          if (isRow[rendererContext.rowIdx] == false) {
            textColor = AppTheme.red_red_900.withOpacity(0.4);
          } else {
            textColor = Colors.transparent;
          }

          return Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            width: 60,
            color: textColor,
            child: Center(
              child: Text(
                  rendererContext.cell.value.toString(),
                  style: AppTheme.a14500.copyWith(color: Colors.black)
              ),
            ),
          );
        }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false, // Row 수정기능 활성화
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        title: '자재코드',
        field: 'name',
        width: 120,
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            Color textColor = Colors.black;

            if (isRow[rendererContext.rowIdx] == false) {
              textColor = AppTheme.red_red_900.withOpacity(0.4);
            } else {
              textColor = Colors.transparent;
            }

            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        width: 320,
        titleTextAlign: PlutoColumnTextAlign.center,
        title: '자재명',
        field: 'age',
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            Color textColor = Colors.black;

            if (isRow[rendererContext.rowIdx] == false) {
              textColor = AppTheme.red_red_900.withOpacity(0.4);
            } else {
              textColor = Colors.transparent;
            }

            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 60,
        title: '세트',
        field: 'role',
        type: PlutoColumnType.number(),
          renderer: (rendererContext) {
            Color textColor = Colors.black;

            if (isRow[rendererContext.rowIdx] == false) {
              textColor = AppTheme.red_red_900.withOpacity(0.4);
            } else {
              textColor = Colors.transparent;
            }

            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        title: '포장구분',
        field: 'joined',
        width: 100,
        type: PlutoColumnType.date(),
          renderer: (rendererContext) {
            Color textColor = Colors.black;

            if (isRow[rendererContext.rowIdx] == false) {
              textColor = AppTheme.red_red_900.withOpacity(0.4);
            } else {
              textColor = Colors.transparent;
            }

            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 110,
        title: 'BOM수량',
        field: 'working_time',
        type: PlutoColumnType.number(),
          renderer: (rendererContext) {
            Color textColor = Colors.black;

            if (isRow[rendererContext.rowIdx] == false) {
              textColor = AppTheme.red_red_900.withOpacity(0.4);
            } else {
              textColor = Colors.transparent;
            }

            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 60,
        title: '수량',
        field: 'salary',
        type: PlutoColumnType.number(),
        renderer: (rendererContext) {
            Color textColor = Colors.black;

            if (isRow[rendererContext.rowIdx] == false) {
              textColor = AppTheme.red_red_900.withOpacity(0.4);
            } else {
              textColor = Colors.transparent;
            }

            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
    ];

    /// 마스터 리스트 컬럼 추가-------------------------------------------------------------
    columns2 = <PlutoColumn>[
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 60,
        title: '순번',
        field: 'id',
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
             // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }

      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        width: 120,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        title: '자재코드',
        field: 'name',
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        width: 320,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        title: '자재명',
        field: 'age',
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 60,
        title: '세트',
        field: 'role',
        type: PlutoColumnType.number(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 100,
        title: '포장구분',
        field: 'joined',
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 110,
        title: 'BOM수량',
        field: 'working_time',
        type: PlutoColumnType.number(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 60,
        title: '수량',
        field: 'salary',
        type: PlutoColumnType.number(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 100,
        title: 'Box번호',
        field: 'box',
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 150,
        title: '사유',
        field: 'reason',
        type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double height = 60*(double.parse((rows.isEmpty ? 1 : rows.length).toString()));
    Future.delayed(const Duration(), (){
      focusNode.requestFocus();
      Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    });

    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Colors.white,

        title: Text('메인 박스 KIT 작업'),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _main(),

                  ],
                )
              ),
              Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: height,
                    width: MediaQuery.of(context).size.width/2 - 20,
                    child: PlutoGrid(
                      columns: columns,
                      rows: rows,
                     // columnGroups: columnGroups,
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        stateManager = event.stateManager;
                       // stateManager.setShowColumnFilter(true);
                      },
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                      configuration: const PlutoGridConfiguration(
                        style: PlutoGridStyleConfig(
                          defaultCellPadding: EdgeInsets.all(0),
                          columnTextStyle: AppTheme.a18700,
                            columnHeight: 60,
                            rowHeight: 50,
                            cellTextStyle: AppTheme.a18400,
                          //  rowColor: AppTheme.red_red_300 //조회해서 같은 값이 들어가있으면 회색 아니면 빨강
                        ),
                      ),
                     /* rowColorCallback: (c) {
                        Get.log('aaasdsd : ${c.row.sortIdx}');
                        for(var i = 0; i < rows.length; i++) {
                          if (isRow[i] == false) {
                            return AppTheme.red_red_300;
                          } else {
                            return AppTheme.white;
                          }
                        }
                         return Colors.transparent;
                      },*/
                     // configuration: const PlutoGridConfiguration(),
                    ),
                  ),
                  SizedBox(width: 24,),
                  Container(
                    color: Colors.white,
                    height: height,
                    width: MediaQuery.of(context).size.width/2 - 20,
                    child: PlutoGrid(
                      columns: columns2,
                      rows: rows2,
                      // columnGroups: columnGroups,
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        stateManager2 = event.stateManager;
                       // stateManager.setShowColumnFilter(true);
                      },
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                     /* createFooter: (stateManager) {
                        stateManager.footerHeight = 45;
                        return Container();
                      },*/
                      configuration: const PlutoGridConfiguration(
                        style: PlutoGridStyleConfig(
                            columnTextStyle: AppTheme.a18700,
                            columnHeight: 60,
                            rowHeight: 50,
                            cellTextStyle: AppTheme.a14700,
                        ),
                      ),
                      // configuration: const PlutoGridConfiguration(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _main() {

    var orientation = MediaQuery.of(context).orientation;

    double containerWidth = orientation == Orientation.portrait ? 300.0 : 750.0;
    Future.delayed(const Duration(), (){
      focusNode.requestFocus();
      Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    });
     return Column(
       children: [
         Container(
               padding: EdgeInsets.all(12),
               decoration: BoxDecoration(
                 border: Border(top: BorderSide(color: AppTheme.black), bottom: BorderSide(color: AppTheme.black))
               ),
               width: MediaQuery.of(context).size.width,
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width - 10,
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         children: [
                           Row(
                                 children: [
                                   Container(
                                     child: Text('QR 코드', style: AppTheme.a24700.copyWith(color: AppTheme.black), ),
                                   ),
                                   SizedBox(width: 12,),
                                   Container(
                                     width: 200,
                                     child: Container(
                                       padding: const EdgeInsets.only(left: 16, right: 6),
                                       decoration: BoxDecoration(
                                           border: Border.all(color: AppTheme.ae2e2e2),
                                           borderRadius: BorderRadius.circular(10),
                                           color: AppTheme.white
                                       ),
                                       child: TextFormField(
                                         focusNode: focusNode,
                                         style:  AppTheme.a16400.copyWith(color: AppTheme.a6c6c6c),
                                         controller: textControll,
                                         textAlignVertical: TextAlignVertical.center,
                                         textInputAction: TextInputAction.done,
                                         onTap: () {
                                           if(focusCnt++ > 1) {
                                             focusCnt = 0;
                                           } else {
                                             Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                           }
                                         },
                                         onTapOutside:(event) => { focusCnt = 0 },

                                         onFieldSubmitted: (value) async {
                                          await _test();

                                          focusNode.requestFocus();
                                          Future.delayed(const Duration(), (){
                                            focusNode.requestFocus();

                                            //  FocusScope.of(context).requestFocus(focusNode);
                                            Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                          });
                                         },
                                         keyboardType: TextInputType.number,
                                         decoration: InputDecoration(
                                           suffixIcon: InkWell(

                                               onTap: () async {
                                                 FocusScope.of(context).autofocus(focusNode);
                                               },
                                               child: Image.asset('assets/app/search.png', color: AppTheme.a6c6c6c, width: 32, height: 32,)
                                           ),

                                           contentPadding: const EdgeInsets.all(0),
                                           fillColor: AppTheme.white,
                                           filled: true,
                                          // hintText: 'BC 번호를 입력해주세요',
                                           hintStyle: AppTheme.a16400.copyWith(color: AppTheme.aBCBCBC),
                                           border: InputBorder.none,
                                         ),
                                         showCursor: true,
                                       ),
                                     ),
                                   ),
                                 ],
                           ),
                           SizedBox(width: 32,),
                           _subData('상태')
                         ],
                       ),
                     ),
                   ),
                   SizedBox(height: 12,),
                   Container(
                     width: MediaQuery.of(context).size.width - 10,
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           _subData2('프로젝트명', text2, true),
                           SizedBox(width: 32,),
                           _subData2('자재 코드', text3, true),
                           SizedBox(width: 32,),
                           _subData2('수량', text4, false),
                           SizedBox(width: 32,),
                           _subData2('박스번호', text5, false)
                         ],
                       ),
                     ),
                   ),

                 ],
               ),
         ),
         Container(
           width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(12),
           child: /*SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child:*/ Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 _subData('메모'),
                 Container(
                   alignment: Alignment.centerRight,
                   width: containerWidth,
                   //  width: MediaQuery.of(context).size.width/2 - 100,
                   child: SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: [
                         _button('행추가'),
                         _button('저장'),
                         _button('동기화'),
                         _button('동기화 취소'),
                         _button('확정'),
                         _button('확정 취소'),
                       ],
                     ),
                   ),
                 )
                /* OrientationBuilder(
                   builder: (context, orientation) {
                     if (orientation == Orientation.portrait) {
                       // 세로일때
                       return Container(
                         alignment: Alignment.centerRight,
                        // width: MediaQuery.of(context).size.width/2 + 80,
                           width: MediaQuery.of(context).size.width/2 - 100,
                         child: SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [
                               _button('행추가'),
                               _button('저장'),
                               _button('동기화'),
                               _button('동기화 취소'),
                               _button('확정'),
                               _button('확정 취소'),
                             ],
                           ),
                         ),
                       );
                     } else {
                       return Container(
                         alignment: Alignment.centerRight,
                         width: MediaQuery.of(context).size.width/2 + 120,
                         //  width: MediaQuery.of(context).size.width/2 - 100,
                         child: SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: Row(
                             children: [
                               _button('행추가'),
                               _button('저장'),
                               _button('동기화'),
                               _button('동기화 취소'),
                               _button('확정'),
                               _button('확정 취소'),
                             ],
                           ),
                         ),
                       );
                     }
                   },
                 ),
*/
               ],
             ),
           ),
        // ),

       ],
     );
  }

  Future _test() async{
    textControll.text == '' ? {stateManager.removeAllRows(), rows.clear()}
        :
    textControll.text.length == 1 ?
    rows = [
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '1'),
          'name': PlutoCell(value: '6201436'),
          'age': PlutoCell(value: 'COT-EPOXY애관PIC(L) CV220-D218(20'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '2'),
          'name': PlutoCell(value: '6205327'),
          'age': PlutoCell(value: 'LEP-SRC(LSR)325L-D210-D100'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 3),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '3'),
          'name': PlutoCell(value: '7627103'),
          'age': PlutoCell(value: '케이블보호금구 230G D165-235L-PCD320(편9'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '4'),
          'name': PlutoCell(value: '7206751'),
          'age': PlutoCell(value: '명판 AGO STS304 70mmX40mm 영문'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '5'),
          'name': PlutoCell(value: '7632034'),
          'age': PlutoCell(value: '중간플랜지 CV220GO(AL) ID160-OD34)'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '6'),
          'name': PlutoCell(value: '7207650'),
          'age': PlutoCell(value: '지지플랜지 CV220GO D620-30T AL'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '7'),
          'name': PlutoCell(value: '7602628'),
          'age': PlutoCell(value: 'PS TAPE (50X0.025-100) 진공포장 0.5g'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '8'),
          'name': PlutoCell(value: '7270751'),
          'age': PlutoCell(value: '유리테이프 15X0.25-5M'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '9'),
          'name': PlutoCell(value: '7207344'),
          'age': PlutoCell(value: '오링 P-275 NBR'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '10'),
          'name': PlutoCell(value: '7244327'),
          'age': PlutoCell(value: '오링 G-115(NBR)'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '11'),
          'name': PlutoCell(value: '7207296'),
          'age': PlutoCell(value: '오링 G-280 NBR'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '12'),
          'name': PlutoCell(value: '7632037'),
          'age': PlutoCell(value: 'SHAFT(B) L120-M8(V+)'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '13'),
          'name': PlutoCell(value: '7207428'),
          'age': PlutoCell(value: '육각볼트 M10-30L STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '14'),
          'name': PlutoCell(value: '7212399'),
          'age': PlutoCell(value: '육각구멍붙이볼트 M10-25L STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '15'),
          'name': PlutoCell(value: '7208487'),
          'age': PlutoCell(value: '육각볼트 M12-50L STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '16'),
          'name': PlutoCell(value: '7207101'),
          'age': PlutoCell(value: '스프링와셔 M10 ID10.5-OD18-2.7T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '17'),
          'name': PlutoCell(value: '7207102'),
          'age': PlutoCell(value: '스프링와셔 M12 ID12.5-OD21-3.2T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '18'),
          'name': PlutoCell(value: '7207798'),
          'age': PlutoCell(value: '평와셔 M10 ID11-OD21-1.1T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '19'),
          'name': PlutoCell(value: '7207799'),
          'age': PlutoCell(value: '평와셔 M12 ID13-OD28-1.5T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
          'box': PlutoCell(value: ''),
          'reason': PlutoCell(value: ''),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '20'),
          'name': PlutoCell(value: '7207171'),
          'age': PlutoCell(value: '알미늄호일 0.015X250-20M'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '21'),
          'name': PlutoCell(value: '7207375'),
          'age': PlutoCell(value: '위생장갑'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
    ] : null;
    rows.isNotEmpty ? text = '완료' : text = '';
    textControll.text == '' ? stateManager2.removeAllRows() :
    stateManager.rows.isNotEmpty && _duplicationRow('6201436') == false && textControll.text == '01' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '6201436'),
        'age': PlutoCell(value: 'COT-EPOXY애관PIC(L) CV220-D218(20'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '8555'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('6205327') == false && textControll.text == '02' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '6205327'),
        'age': PlutoCell(value: 'LEP-SRC(LSR)325L-D210-D100'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 3),
        'box': PlutoCell(value: '1666'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7627103') == false && textControll.text == '03' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7627103'),
        'age': PlutoCell(value: '케이블보호금구 230G D165-235L-PCD320(편9'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '2222'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7206751') == false && textControll.text == '04' ?
    rows2.add( PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7206751'),
        'age': PlutoCell(value: '명판 AGO STS304 70mmX40mm 영문'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '1111'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7632034') == false && textControll.text == '05' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7632034'),
        'age': PlutoCell(value: '중간플랜지 CV220GO(AL) ID160-OD34)'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '1666'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207650') == false && textControll.text == '06' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207650'),
        'age': PlutoCell(value: '지지플랜지 CV220GO D620-30T AL'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '1266'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7602628') == false && textControll.text == '07' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7602628'),
        'age': PlutoCell(value: 'PS TAPE (50X0.025-100) 진공포장 0.5g'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '7777'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7270751') == false && textControll.text == '08' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7270751'),
        'age': PlutoCell(value: '유리테이프 15X0.25-5M'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '7777'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207344') == false && textControll.text == '09' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207344'),
        'age': PlutoCell(value: '오링 P-275 NBR'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '7777'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7244327') == false && textControll.text == '10' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7244327'),
        'age': PlutoCell(value: '오링 G-115(NBR)'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '7777'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207296') == false && textControll.text == '11' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207296'),
        'age': PlutoCell(value: '오링 G-280 NBR'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '7777'),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('6205327') == false && textControll.text == '12' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7632037'),
        'age': PlutoCell(value: 'SHAFT(B) L120-M8(V+)'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    )) : stateManager.rows.isNotEmpty && _duplicationRow('7207428') == false && textControll.text == '13' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207428'),
        'age': PlutoCell(value: '육각볼트 M10-30L STS304'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7212399') == false && textControll.text == '14' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7212399'),
        'age': PlutoCell(value: '육각구멍붙이볼트 M10-25L STS304'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7208487') == false && textControll.text == '15' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7208487'),
        'age': PlutoCell(value: '육각볼트 M12-50L STS304'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207101') == false && textControll.text == '16' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207101'),
        'age': PlutoCell(value: '스프링와셔 M10 ID10.5-OD18-2.7T STS304'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207102') == false && textControll.text == '17' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207102'),
        'age': PlutoCell(value: '스프링와셔 M12 ID12.5-OD21-3.2T STS304'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207798') == false && textControll.text == '18' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207798'),
        'age': PlutoCell(value: '평와셔 M10 ID11-OD21-1.1T STS304'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207799') == false && textControll.text == '19' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207799'),
        'age': PlutoCell(value: '평와셔 M12 ID13-OD28-1.5T STS304'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207171') == false && textControll.text == '20' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207171'),
        'age': PlutoCell(value: '알미늄호일 0.015X250-20M'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),) : stateManager.rows.isNotEmpty && _duplicationRow('7207375') == false && textControll.text == '21' ?
    rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: rows2.length+1),
        'name': PlutoCell(value: '7207375'),
        'age': PlutoCell(value: '위생장갑'),
        'role': PlutoCell(value: 0),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 0),
        'salary': PlutoCell(value: 0),
        'box': PlutoCell(value: ''),
        'reason': PlutoCell(value: ''),
      },
    ),)


        : null;
    isRow.clear();
    //마스터 리스트의 길이만큼 추가
    for(var i = 0; i < rows.length; i++) {
      isRow.add(false);
    }

    stateManager.rows.isEmpty ?
    textControll.text == '' ? {text = '', text2 = '', text3 = '', text4 = '', text5 = ''}
        : {
      stateManager.insertRows(0, rows),
      rows.isNotEmpty ? text2 = 'GREATER CHANGHUA OWF CHW2B+04' : '',
      rows.isNotEmpty ? text3 = '2191465 IJ/PM2/CV345KV1000SQ28(소선SB' : '',
      rows.isNotEmpty ? text4 = '3 set' : '',
      rows.isNotEmpty ? text5 = '104978244' : ''
    } :  _containRow();
    textControll.text = '';
  }

  void _containRow() {
    for(var rowIndex = 0; rowIndex < rows.length; rowIndex++) {
      for(var rowIndex2 = 0; rowIndex2 < rows2.length; rowIndex2++) {
        // stateManager.rows[rowIndex].cells[stateManager.columns[1].field];
        stateManager.rows[rowIndex].cells['name']!.value.toString().contains(stateManager2.rows[rowIndex2].cells['name']!.value.toString()) ?
        isRow[rowIndex] = true : null;

        // stateManager.rows[0].
        // Get.log('하아2 ${}');
      }
    }
    Get.log('하아 ${isRow}');
  }

  bool _duplicationRow(String matrCode) {
    for(var rowIndex2 = 0; rowIndex2 < rows2.length; rowIndex2++) {
      if (stateManager2.rows[rowIndex2].cells['name']!.value.toString().contains(matrCode)) {
        return true;
      }else {
        return false;
      }
    }
    return false;
  }


  Widget _subData(String title) {
    return Row(
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700,),
        ),
        SizedBox(width: 12,),
        Container(
          width: title == '메모' ? 400 : 200,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10)
            ),
          child: Text(title == '메모' ? '' : text, style: AppTheme.a24400,)
        ),
      ],
    );
  }

  Widget _subData2(String title, String content, bool isLong) {
    return Row(
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700,),
        ),
        SizedBox(width: 12,),
        Container(

           // width: isLong ? 200 : null,
            padding: const EdgeInsets.all(4),
            /* decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10)
            ),*/
            child: Text(content, style: AppTheme.a24400.copyWith(color: AppTheme.light_ui_08),)
        ),
      ],
    );
  }

  Widget _button(String text) {
    return Container(
      width: 120,
      padding: EdgeInsets.only(left: 12),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
             // backgroundColor: MaterialStateProperty.all<Color>(AppTheme.a1f1f1f) ,
              backgroundColor: MaterialStateProperty.all<Color>(AppTheme.dongkuk_blue) ,
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(0))),
          onPressed: () {

           /* text == '행추가' ?
              {
                rows2.add(PlutoRow(
                  cells: {
                    'id': PlutoCell(value: (rows2.length+1).toString()),
                    'name': PlutoCell(value: ''),
                    'age': PlutoCell(value: ''),
                    'role': PlutoCell(value: 0),
                    'joined': PlutoCell(value: ''),
                    'working_time': PlutoCell(value: 0),
                    'salary': PlutoCell(value: 0),
                    'box': PlutoCell(value: ''),
                    'reason': PlutoCell(value: ''),
                  },
                ),),
              //  stateManager2.
                //setAutoEditing(true)
                stateManager2.insertRows(0, rows2)
              } : null;*/
          } ,
          child: Container(
            height: 56,
            child: Center(
                child: Text(
                  text,
                  style: AppTheme.a15700.copyWith(
                    color: AppTheme.white,
                  ),
                )),
          )),
    );

  }

}


