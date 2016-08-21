FactoryGirl.define do
  factory :picture do
    movie
    picture {
      Rack::Test::UploadedFile.new(
        "#{Rails.root}/spec/fixtures/picture.jpg"
      )
    }
  end
end
