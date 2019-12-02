# frozen_string_literal: true

require 'indico'

module ChartHelper
  def posts_statistics(campain)
    reactions = []
    campain.posts.each do |post|
      reactions << PageMannager.new(post).get_post_reactions(post.facebook_id)
    end
    process_reactions(reactions)
  end

  def post_statistics(post)
    reactions = PageMannager.new(post).get_post_reactions(post.facebook_id)
    process_reactions(reactions)
  end

  def process_reactions(reactions)
    reactions_summary = {}
    return if reactions.eql?('error')

    reactions.flatten.each do |reaction|
      next if reaction.eql?('error')

      if reactions_summary[reaction['type']].nil?
        reactions_summary[reaction['type']] = 1
      else
        reactions_summary[reaction['type']] += 1
      end
    end

    reactions_summary
  end

  def posts_comments_statistics(campain)
    analize_comments(posts_comments(campain))
  end

  def post_comments_statistics(post)
    analize_comments(post_comments(post))
  end

  def analize_comments(comments)
    Indico.api_key = Rails.application.credentials.indico_key
    positive_comments = 0
    negative_comments = 0
    comments&.each do |message|
      sentiment = Indico.sentiment(message, language: 'spanish')
      sentiment > 0.5 ? positive_comments += 1 : negative_comments += 1
    rescue StandardError
      ''
    end

    { 'Comentarios positivos': positive_comments,
      'Comentarios negativos': negative_comments }
  end

  def posts_comments(campain)
    comments = []
    campain.posts.each do |post|
      comments << PageMannager.new(post).get_post_comments(post.facebook_id)
    end
    return [] if comments.eql?('error')

    comments.flatten.map! do |comment|
      next nil if comment.eql?('error')

      comment['message']
    end.compact!
  end

  def post_comments(post)
    comments = PageMannager.new(post).get_post_comments(post.facebook_id)
    return if comments.eql?('error')

    comments.flatten.map! do |comment|
      next nil if comment.eql?('error')

      comment['message']
    end.compact!
  end
end
