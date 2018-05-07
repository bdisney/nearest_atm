require 'feature_spec_helper'

feature 'Create atm with location', %q{
  In order to create atm with location
  As an user
  I want to be able to do it
} do

  scenario 'User create atm with location with valid data' do
    visit new_atm_path
    fill_in 'atm_address', with: 'New address'
    fill_in 'atm_location_latitude', with: 90
    fill_in 'atm_location_longitude', with: 50
    find('input[name="commit"]').click

    expect(current_path).to eq(home_path)
    expect(page).to have_content(I18n.t('activerecord.notices.atm_cteated'))
  end

  scenario 'User tries create atm with location with unvalid data' do
    visit new_atm_path
    fill_in 'atm_address', with: 'New address'
    fill_in 'atm_location_latitude', with: nil
    fill_in 'atm_location_longitude', with: nil
    find('input[name="commit"]').click

    expect(current_path).to eq(atms_path)
    expect(page).to_not have_content(I18n.t('activerecord.notices.atm_cteated'))
    expect(page).to have_content(I18n.t('activerecord.errors.header_title'))
  end
end
