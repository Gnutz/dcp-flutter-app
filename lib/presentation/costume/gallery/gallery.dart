/*
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late BuildContext _context;
  late List<String> downLoadLinks = <String>[];
  late GalleryBloc _bloc;
  late GalleryState _state;
  late AppLocalizations? _localization;


  @override
  Widget build(BuildContext context) {
    _bloc = context.read<GalleryBloc>();

    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      _context = context;
      _state = state;
      _localization = AppLocalizations.of(_context);

      return WillPopScope(
          onWillPop: () => _popPage(),
          child: Container(
              child: Column(
                children: [..._state.costumes != null
                    ? _state.costumes!
                    .map((costume) => Text(costume.category!))
                    .toList(),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return RawMaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExtendedImage.network(
                                      url,
                                      width: ScreenUtil.instance.setWidth(400),
                                      height: ScreenUtil.instance.setWidth(400),
                                      fit: BoxFit.fill,
                                      cache: true,
                                      border: Border.all(color: Colors.red, width: 1.0),
                                      shape: boxShape,
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      //cancelToken: cancellationToken,
                                    )
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'logo$index',
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(_images[index].imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }],
                          itemCount: _images.length,
                        ),))
                ],)));
    });
  }
}


  Future<bool> _popPage() async {
    return await showDialog(
        //TODO need to track dirty
        context: _context,
        builder: (context) => AlertDialog(
              title: Text(AppLocalizations.of(_context)!.areYouSure),
              content:
                  Text(AppLocalizations.of(_context)!.discardUnSavedChanges),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(AppLocalizations.of(_context)!.cancel),
                ),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(AppLocalizations.of(_context)!.confirm)),
              ],
            )) as bool;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class ImagePreview  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


 */
