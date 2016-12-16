module CampaignsHelper
  def render_with_hashtags(taggings)
    body.gsub(/#\w+/){|word| link_to word, "/campaigns/hashtag/#{word.delete('#')}"}.html_safe
  end
end
