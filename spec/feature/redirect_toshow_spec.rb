require 'rails_helper'

feature 'User signing up', js: true do

  scenario 'redirect to sign up page' do
    #point to the right path
    visit root_path
    # Press "sign up" (to redirect to sign up page)
    click_link("Sign Up")


    #Expect to be redirected to the sign up page
    expect(current_path).to eq new_user_registration_path

end
  scenario "User signs up" do
    #point to the right path
    visit root_path
sleep(2)
    #point to the sign-up page
    visit new_user_registration_path

    # Enter e-mail and password
    fill_in 'Email adres', with: 'jeffrey@jeff.com'
    fill_in 'Password', with: '12345678'

    #Sign
    page.execute_script("$('form').submit()")

    #Expect to be redirected to the root_path
    expect(current_path).to eq root_path
  end
end
