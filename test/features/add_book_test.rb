require "test_helper"

class AddBookTest < Capybara::Rails::TestCase

  setup do
    Author.create! first_name: "William", last_name: "Shakespeare", bio: "William Shakespeare was an English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world's pre-eminent dramatist. He is often called England's national poet, and the 'Bard of Avon'. ", id: 1
    User.create! name: "Bob", email: "bob@example.com", password: "12345678"
  end

  scenario "Add Book", js: true do
    visit root_path
    visit new_book_path

    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    visit new_book_path

    within("#new_book") do
      fill_in "Title", with: "I'm a New Book"
      fill_in "Price", with: "4.99"
      attach_file('Photo', "#{Rails.root}/test/fixtures/kitty.jpg")
      select("William Shakespeare", from: "Author")
      click_button "Create Book"
    end
    visit root_path
    assert_content page, "I'm a New Book"
  end

end
