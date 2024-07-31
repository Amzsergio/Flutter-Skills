import 'package:toktik/domain/entities/video_post.dart';
// Los datasourcese me sirven como una capa que proteje al repositorio de los cambios que existan en las fuentes de datos **Arch **Ctaxi


abstract class VideoPostDatasource { // Son abstractas porque no quiero crear instancias de esta clase **Arch **AppExp

  Future<List<VideoPost>> getFavoriteVideosByUser( String userID );

  Future<List<VideoPost>> getTrendingVideosByPage( int page );


}