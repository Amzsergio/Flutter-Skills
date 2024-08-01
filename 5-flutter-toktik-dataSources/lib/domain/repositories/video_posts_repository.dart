import 'package:toktik/domain/entities/video_post.dart';
// Se llaman de dataSource la info, y es de aqui el repositorio de donde se alimenta el resto de la app, y cuando cambie el data source nada de esto se ve afectado. **Arch **Ctaxi


abstract class VideoPostRepository { // Son abstractas porque no quiero crear instancias de esta clase **Arch **AppExp

  Future<List<VideoPost>> getFavoriteVideosByUser( String userID );

  Future<List<VideoPost>> getTrendingVideosByPage( int page );


}