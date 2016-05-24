require "rails_helper"


RSpec.feature "Editing an Article" do

  before do
    @article = Article.create(title: "First Article", body: "Body of first Article")

  end

  scenario "A user updates an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated article"
    fill_in "Body", with: "Updated body of article"
    click_button "Update Article"

    expect(page).to have_content("Article has been Updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated body of article"
    click_button "Update Article"

    expect(page).to have_content("Article has not been Updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end
