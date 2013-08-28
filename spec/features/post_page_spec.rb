# encoding: UTF-8
require 'spec_helper'

describe "Post page", js: true do
  describe "Post a new post" do
    before(:each) do

    end

    it "posts a post" do
      visit "/posts/new"
      within("#new_post") do
        fill_in "post[title]",        with: "I'm feeling so good !"
        fill_in "post[text]",         with: "This is some random text"
        click_button "KUMA!!"
      end

      post = Post.last

      expect(current_path).to eq("/posts/#{post.id}")
    end
  end
end