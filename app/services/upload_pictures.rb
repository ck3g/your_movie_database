class UploadPictures
  def self.upload(movie, picture_files)
    picture_files.each { |picture| movie.pictures.create picture: picture }
  end
end
