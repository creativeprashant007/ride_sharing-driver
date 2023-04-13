import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/utils/colors.dart';
import '/utils/profile_data_type.dart';

class TableComponent extends StatelessWidget {
  const TableComponent({
    Key? key,
    required this.rowData,
  }) : super(key: key);

  final List<TableDataType> rowData;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          width: 1,
          color: AppColors.tableBorder,
          style: BorderStyle.solid,
        ),
      ),
      children: rowData
          .map(
            (item) => TableRow(
              children: [
                Padding(
                  padding: rowData.indexOf(item) == 1
                      ? EdgeInsets.only(bottom: 9.h)
                      : EdgeInsets.only(top: 14.h, bottom: 9.h),
                  child: Text(
                    item.key!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: rowData.indexOf(item) == 1
                      ? EdgeInsets.only(bottom: 9.h)
                      : EdgeInsets.only(top: 14.h, bottom: 9.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      child: Text(
                        item.value!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
          .toList(),
    );
  }
}
