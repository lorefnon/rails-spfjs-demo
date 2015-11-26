class PostsController < ApplicationController

  def index
    @page = params[:page].to_i
    @num_pages = 1000
    @posts = 10.times.map { fake_post_summary }
  end

  def show
    @post = fake_post
  end

  private

  def fake_post
    OpenStruct.new fake_post_summary.to_h.merge!(
      id: params[:id],
      body: LoremIpsum.random(paragraphs: rand(20))
    )
  end

  def fake_post_summary
    OpenStruct.new(
      id: rand(1000),
      title: LoremIpsum.lorem_ipsum(words: rand(20)),
      summary: LoremIpsum.random(paragraphs: 1),
      author: OpenStruct.new(
        user_name: Forgery('internet').user_name,
        email: Forgery('internet').email_address
      )
    )
  end

end
