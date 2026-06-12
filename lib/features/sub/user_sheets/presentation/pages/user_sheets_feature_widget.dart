import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:receipt_helper/core/extensions/context_extensions.dart';
import 'package:receipt_helper/features/sub/user_sheets/presentation/cubit/user_sheets_cubit.dart';
import 'package:receipt_helper/features/sub/user_sheets/presentation/cubit/user_sheets_state.dart';
import 'package:sizer/sizer.dart';

class UserSheetsFeatureWidget extends StatelessWidget {
  final Function(String? selectedSheet, String? sheetName)? onSelect;
  const UserSheetsFeatureWidget({super.key, this.onSelect});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSheetsCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<UserSheetsCubit>();
          String? selectedSpread;
          String? spreadId;
          String? sheetName;
          return BlocConsumer<UserSheetsCubit, UserSheetsState>(
            listener: (context, state) {
              if (state is UserSheetsErrorState) {
                context.showSnackBar(state.message, isError: true);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: .stretch,
                spacing: 15,
                children: [
                  if (state is UserSheetsSuccessState)
                    DropdownMenu<String>(
                      hintText: 'Choose a spreadsheet',
                      enableSearch: true,
                      enableFilter: true,
                      initialSelection: selectedSpread,
                      label: Text('Spreadsheet Name'),
                      requestFocusOnTap: true,
                      width: .infinity,
                      menuHeight: 40.sh,
                      alignmentOffset: Offset(0, 0),
                      filterCallback: (entries, filter) => entries
                          .where((element) => element.label.contains(filter))
                          .toList(),
                      onSelected: (value) {
                        selectedSpread = value;
                        spreadId = state.spreadSheets
                            .firstWhere(
                              (element) => element.title?.toString() == value,
                            )
                            .id;
                        cubit.fetchTabs(spreadId ?? '');
                        sheetName = null;
                      },
                      dropdownMenuEntries: state.spreadSheets
                          .map(
                            (e) => DropdownMenuEntry<String>(
                              value: e.title ?? '',
                              label: e.title ?? '',
                            ),
                          )
                          .toList(),
                    ),
                  if (state is UserSheetsSuccessState)
                    DropdownMenu<String>(
                      hintText: 'Choose a sheet',
                      enableSearch: true,
                      enableFilter: true,
                      enabled: state.sheets != null,
                      initialSelection: sheetName,
                      width: .infinity,
                      label: Text('Sheet Name'),
                      menuHeight: 40.sh,
                      alignmentOffset: Offset(0, 0),
                      requestFocusOnTap: true,
                      filterCallback: (entries, filter) => entries
                          .where((element) => element.label.contains(filter))
                          .toList(),
                      onSelected: (value) {
                        sheetName = value;
                        if (onSelect != null) onSelect!(spreadId, sheetName);
                      },
                      dropdownMenuEntries: state.sheets == null
                          ? []
                          : state.sheets!
                                .map(
                                  (e) => DropdownMenuEntry<String>(
                                    value: e.properties?.title ?? '',
                                    label: e.properties?.title ?? '',
                                  ),
                                )
                                .toList(),
                    ),
                  if (state is UserSheetsSuccessState &&
                      state.sheetError != null)
                    Text(
                      state.sheetError!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
