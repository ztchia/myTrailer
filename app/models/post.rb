class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ProfilePicUploader
  mount_uploader :video, ProfilePicUploader
  mount_uploader :song, ProfilePicUploader

   def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url
      # "delete_url" => posts_path(:id => id),
      # "delete_type" => "DELETE" 
    }
  end
end
