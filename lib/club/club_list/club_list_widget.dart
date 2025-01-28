import '/backend/supabase/supabase.dart';
import '/club/club_card/club_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'club_list_model.dart';
export 'club_list_model.dart';

class ClubListWidget extends StatefulWidget {
  const ClubListWidget({
    super.key,
    required this.clubList,
    required this.onClubTap,
  });

  final List<ClubRow>? clubList;
  final Future Function(ClubRow club)? onClubTap;

  @override
  State<ClubListWidget> createState() => _ClubListWidgetState();
}

class _ClubListWidgetState extends State<ClubListWidget> {
  late ClubListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
      child: Builder(
        builder: (context) {
          final clubFromList = widget.clubList!.toList();

          return Wrap(
            spacing: 15.0,
            runSpacing: 15.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: List.generate(clubFromList.length, (clubFromListIndex) {
              final clubFromListItem = clubFromList[clubFromListIndex];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.onClubTap?.call(
                    clubFromListItem,
                  );
                },
                child: wrapWithModel(
                  model: _model.clubCardModels.getModel(
                    clubFromListItem.id.toString(),
                    clubFromListIndex,
                  ),
                  updateCallback: () => safeSetState(() {}),
                  child: ClubCardWidget(
                    key: Key(
                      'Keyos0_${clubFromListItem.id.toString()}',
                    ),
                    clubParameter: clubFromListItem,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
