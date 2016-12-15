class Stream < ActiveRecord::Base
  before_create do |stream|
    session = OpenTokClient.create_session
    stream.opentok_session_id = session.session_id
  end

  belongs_to :user
  has_many :viewers

end
