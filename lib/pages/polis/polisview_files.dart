import 'dart:io';

import 'package:ecargo_app/blocs/progressindicator/progressindicator_bloc.dart';
import 'package:ecargo_app/common/app_data.dart';
import 'package:ecargo_app/models/polis/polis4crud_model.dart';
import 'package:ecargo_app/models/polis/polis4doc_model.dart';
import 'package:ecargo_app/repositories/polis/polisview_repository.dart';
import 'package:ecargo_app/widgets/linearpercentindicator_widget.dart';
import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_it/share_it.dart';

class PolisViewFilesPage extends StatefulWidget {
  final List<Polis4CrudModel> listDocs;

  const PolisViewFilesPage({super.key, required this.listDocs});

  @override
  PolisViewFilesPageState createState() => PolisViewFilesPageState();
}

class PolisViewFilesPageState extends State<PolisViewFilesPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var progressIndicatorBloc = BlocProvider.of<ProgressIndicatorBloc>(context);

    return ListView.builder(        
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: widget.listDocs.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 2.5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              elevation: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("${(index + 1)}.",
                          style: MyText.bodyLarge(context)!
                              .copyWith(color: MyColors.grey_80)),
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.listDocs[index].tipeDoc,
                              style: MyText.bodyLarge(context)!.copyWith(
                                  color: MyColors.grey_100_,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.listDocs[index].dokCaption,
                              style: MyText.bodyLarge(context)!
                                  .copyWith(color: MyColors.grey_80)),
                          Container(height: 10),
                          const Divider(
                              height: 5, color: Colors.black26, thickness: 2),
                          Container(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  ShareIt.file(
                                      path: await filePolisFromUrl(
                                          polis4id:
                                              widget.listDocs[index].polis4Id),
                                      type: ShareItFileType.anyFile);
                                },
                                child: const Icon(
                                  Icons.share,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  OpenFilex.open(await filePolisFromUrl(
                                      polis4id: widget.listDocs[index].polis4Id));
                                },
                                child: const Icon(
                                  Icons.open_in_new,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    final String base = AppData.apiDomain;
                                    String urlGetPolisFileEndPoint =
                                        "api/polis/polisview/getfile/${widget.listDocs[index].polis4Id}";
                                    String urlGetPolisFileUrl =
                                        base + urlGetPolisFileEndPoint;
            
                                    notifyFileDownloadProgress(context);
            
                                    await FileDownloader.downloadFile(
                                        url: urlGetPolisFileUrl,
                                        onProgress: (fileName, progress) {
                                          debugPrint("Progress : $progress");
                                          progressIndicatorBloc.add(
                                              UpdateProgressEvent(
                                                  progress: (progress / 100)));
                                        },
                                        headers: AppData.httpHeaders,
                                        name: widget.listDocs[index].filename,
                                        onDownloadCompleted: (String path) {
                                          debugPrint(
                                              'FILE DOWNLOADED TO PATH: $path');
            
                                          progressIndicatorBloc.add(EndProcessEvent(
                                              progressName:
                                                  "file name: ${widget.listDocs[index].filename}"));
                                        },
                                        onDownloadError: (String error) {
                                          debugPrint('DOWNLOAD ERROR: $error');
                                        });
                                  },
                                  child: const Icon(Icons.download, size: 25, color: Colors.black)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }

  Future<String> filePolisFromUrl({required String polis4id}) async {
    debugPrint("filePolisFromUrl");

    PolisViewRepository repo = PolisViewRepository();
    final Polis4DocModel polisdoc = await repo.getPolisDoc(polis4id);

    final directory = Platform.isIOS
        ? await getApplicationDocumentsDirectory()
        : await getExternalStorageDirectory();
    if (directory == null) {
      return Future.error("null");
    }
    final filePath = join(directory.path, polisdoc.namafile);

    final file = await File(filePath).writeAsBytes(polisdoc.datafile);
    debugPrint("file.path : ${file.path}");

    return file.path;
  }

  void notifyFileDownloadProgress(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) => SizedBox(
              height: 80,
              child: LinearPercentIndicatorWidget(
                title: "Download Progress",
                width: MediaQuery.of(context).size.width - 30,
                lineHeight: 20,
                backgroundColor: Colors.yellow,
                progressColor: Colors.blue,
              ),
            ));
  }
}
