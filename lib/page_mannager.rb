# frozen_string_literal: true

class PageMannager
  USER_TOKEN = Rails.application.credentials.facebook_token
  attr_accessor :user_graph, :page_graph

  def initialize(post)
    page_token = if post.node.campain.encrypted_page_token.blank?
                   @user_graph = Koala::Facebook::API.new(USER_TOKEN)
                   user_graph.get_connections('me', 'accounts')
                             .first['access_token']
                 else
                   post.node.campain.encrypted_page_token
                 end
    @page = Koala::Facebook::API.new(page_token)
  end

  def publish_image(file, content)
    file_path = ActiveStorage::Blob.service.path_for(file.key)
    @page.put_picture(file_path, file.content_type, { caption: content }, 'me')
  end

  def publish_post(body)
    @page.put_connections('me', 'feed', message: body)
  end
end
