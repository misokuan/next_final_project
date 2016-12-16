module CampaignsHelper
  def render_with_hashtags(taggings)
    #taggings.gsub(/#\w+/){|word| link_to word, "/campaigns/hashtag/#{word.delete('#')}"}.html_safe
    taggings.gsub(/#\w+/){|word| link_to word, featured_index_path(tag_name: word.delete('#').downcase)}.html_safe
  end
end
