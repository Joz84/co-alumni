module ResourceHelper
  def resource_photo(resource)
    return resource.photo.url if resource.photo.present?
    youtube_thumbnail(resource)
  end

  private

  def youtube_thumbnail(resource)
    regexp_youtu = /https:\/\/youtu.be\/(?<id>[a-zA-Z0-9]*)(\?.*)?/
    regexp_youtube = /https:\/\/www.youtube.com\/watch\?v=(?<id>[a-zA-Z0-9]*)/
    regexp_embed = /https:\/\/www.youtube.com\/embed\/(?<id>[a-zA-Z0-9]*)(.*)?/
    match = resource.video_url.match(regexp_youtube) ||
            resource.video_url.match(regexp_youtu) ||
            resource.video_url.match(regexp_embed)
    "https://img.youtube.com/vi/#{match[:id]}/hqdefault.jpg"
  end
end
