import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';

class LearningItemsScreen<T extends AppState> extends StatefulWidget {
  const LearningItemsScreen({Key? key}) : super(key: key);

  @override
  State<LearningItemsScreen> createState() => _LearningItemsScreenState<T>();
}

class _LearningItemsScreenState<T extends AppState>
    extends State<LearningItemsScreen> {
  final _imagePicker = ImagePicker();

  late Store<T> _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store = StoreProvider.of<T>(context);

    // TODO: just for test
    final action = GetLIItemsAction();
    _store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: buildSearchBarContainer(),
              ),
              const SizedBox(width: 16),
              buildCaptureImageButton(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: buildLearningItemsContainer(),
        ),
      ],
    );
  }

  ListView buildLearningItemsContainer() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => navigateToLearningItemDetailScreen(
            index.toString(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                Hero(
                  tag: "learning_item_$index",
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 4),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learning Item $index',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Subtitle',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCaptureImageButton() {
    return ElevatedButton(
      onPressed: () {
        onCaptureImage();
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        elevation: 0,
      ),
      child: const Icon(
        Icons.add_a_photo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget buildSearchBarContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Filter icon button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }

  void navigateToLearningItemDetailScreen(String LearningItemId) {
    context.pushNamed(
      AppRoutes.learningItemDetailScreen,
      queryParameters: {
        ParamKeys.learningItemId: LearningItemId,
      },
    );
  }

  void onCaptureImage() async {
    final imageFile = await _getImage();
    if (imageFile == null) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UploadLIScreen(
          imageFile: imageFile,
        ),
      ),
    );
  }

  Future<XFile?> _getImage() async {
    final imageFile = await _imagePicker.pickImage(
      imageQuality: 100,
      preferredCameraDevice: CameraDevice.rear,
      source: ImageSource.gallery,
    );

    return imageFile;
  }
}
