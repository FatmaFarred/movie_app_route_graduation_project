import 'package:hive/hive.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';

class MovieAdapter extends TypeAdapter<MovieModel> {
  @override
  MovieModel read(BinaryReader reader) {
    return MovieModel(
        movieId: reader.readInt(),
        name: reader.readString(),
        rating: reader.readDouble(),
        imageURL: reader.readString(),
        year: reader.readString());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer.writeInt(obj.movieId ?? 0);
    writer.writeString(obj.name ?? "");
    writer.writeDouble(obj.rating ?? 0);
    writer.writeString(obj.imageURL ?? "");
    writer.writeString(obj.year ?? "");
  }
}
