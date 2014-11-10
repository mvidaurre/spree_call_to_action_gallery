require 'rails_helper'

feature 'Admin Galleries for Call to Actions', type: :feature, js: true do
  stub_authorization!
  let(:store) {create(:store, default: true, url: 'spreecommerce.com')}

  context 'when no gallery exists' do
    background do
      store
      visit spree.admin_path
      click_link 'Configuration'
      click_link 'Galleries'
    end

    scenario 'can create new gallery' do
      expect(page).to have_text 'NO GALLERIES FOUND, ADD ONE!'

      click_link 'New gallery of call to action'
      expect(page).to have_text 'Galleries'

      fill_in 'gallery_of_call_to_action_name', with: 'Main'
      fill_in 'gallery_of_call_to_action_description', with: 'Main gallery for homepage'
      fill_in 'gallery_of_call_to_action_max_call_to_actions_count', with: 5

      check 'gallery_of_call_to_action_store_id'

      click_button 'Create'

      expect(page).to have_text 'successfully created!'
    end
  end

  context 'when a gallery exists' do
    let!(:gallery) { create(:gallery_of_call_to_action) }

    background do
      visit spree.admin_path
      click_link 'Configuration'
      click_link 'Galleries'
    end

    scenario 'can be updated' do
      within_row(1) do
        click_icon :edit
      end

      fill_in 'gallery_of_call_to_action_name', with: 'Main Updated'
      fill_in 'gallery_of_call_to_action_description', with: 'Main gallery for homepage updated'

      click_button 'Update'
      expect(page).to have_text 'successfully updated!'
    end

    scenario 'can be deleted' do
      within_row(1) do
        click_icon :trash
      end

      page.driver.browser.switch_to.alert.accept unless Capybara.javascript_driver == :poltergeist

      expect(page).not_to have_text gallery.name
    end

    scenario 'can create a new call to action' do
      within_row(1) do
        click_on "New call to action"
      end

      fill_in 'call_to_action_title', with: 'Huge Benefits'
      fill_in 'call_to_action_description', with: 'You will have huge benfits'
      fill_in 'call_to_action_action', with: 'Signup'
      fill_in 'call_to_action_action_url', with: '/call_to_action'
      fill_in 'call_to_action_picture_url', with: '/images/think_cat.jpg'

      click_button 'Create'
      expect(page).to have_text 'successfully created!'
    end

    context 'with several call to actions' do
      let!(:call_to_action) {create(:call_to_action, gallery_of_call_to_action: gallery)}
      let!(:call_to_action_subscribe) {create(:call_to_action, gallery_of_call_to_action: gallery, action: "Subscribe", action_url: "/signup")}
      let!(:call_to_action_purchase) {create(:call_to_action, gallery_of_call_to_action: gallery, action: "Purchase", action_url: "/cart")}

      scenario 'list call to actions' do
        within_row(1) do
          click_on "List of call to actions"
        end
        expect(page).to have_text "Purchase"
      end

    end
  end

end
