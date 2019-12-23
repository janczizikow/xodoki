namespace :migrate_cloudinary_to_aws do
  desc """
  Stores KML files urls in `old_kml_url` column
  """
  task store_kml_urls: :environment do
    Hike.where.not(kml: [nil, ""]).each do |hike|
      hike.old_kml_url = hike.kml.url
      hike.save
    end
  end

  desc """
  Uploads KML files to AWS (looks up old files via `old_kml_url` column)
  """
  task upload_old_kml_url: :environment do
    Hike.where.not(old_kml_url: [nil, ""]).each do |hike|
      hike.remote_kml_url = hike.old_kml_url
      hike.save
    end
  end
end
