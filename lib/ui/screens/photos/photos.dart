import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_client.dart';
import '../photo_detail/photo_detail.dart';
import 'bloc/photos_bloc.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PhotosBloc(context.read<PhotoApiClient>(), context.read<String>())
            ..add(const PhotoFetchedFirstPage()),
      child: const PhotosView(),
    );
  }
}

class PhotosView extends StatefulWidget {
  const PhotosView({super.key});

  @override
  State<PhotosView> createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  final _scrollController = ScrollController();

  bool get isBottom {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }

  void _onTap(String urlFull) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return PhotoDetail(url: urlFull);
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    context.read<PhotosBloc>().add(const PhotoFetchedFirstPage());
  }

  void _onScroll() {
    if (isBottom) {
      context.read<PhotosBloc>().add(const PhotoFetchedNextPage());
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case PhotosStateInitial:
            case PhotosStateLoading:
              return const Center(child: CircularProgressIndicator());
            case PhotosStateFailure:
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: Text('Failed to fetch data.'),
                  ),
                ),
              );
          }

          return state is PhotosStateSuccess
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: state.photos.length + 1,
                  itemBuilder: (_, index) {
                    if (index >= state.photos.length) {
                      return const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 3),
                        ),
                      );
                    }

                    final sponsorName =
                        state.photos[index].sponsorship?.sponsor?.name ??
                            'Unknown';
                    final description = state.photos[index].description;
                    final urlThumb = state.photos[index].urls.thumb;
                    final urlFull = state.photos[index].urls.full;

                    return Card(
                      child: InkWell(
                        onTap: () => _onTap(urlFull),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            height: 120,
                            child: Row(
                              children: [
                                _PhotoImage(urlThumb),
                                const SizedBox(width: 8),
                                _PhotoDescription(
                                  sponsorName: sponsorName,
                                  description: description,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text('Error'));
        },
      ),
    );
  }
}

class _PhotoDescription extends StatelessWidget {
  final String sponsorName;
  final String? description;

  const _PhotoDescription({
    required this.sponsorName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Author: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: sponsorName)
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (description != null)
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Description: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: description)
                ],
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            )
        ],
      ),
    );
  }
}

class _PhotoImage extends StatelessWidget {
  final String url;

  const _PhotoImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          color: Colors.grey,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}
