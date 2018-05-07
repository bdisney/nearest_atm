require 'feature_spec_helper'

feature 'Search nearest atms', %q{
  In order to solve my problem
  As an user
  I want to be able to search nearest atms
} do

  given!(:atm_1) { create(:atm) }

  scenario 'User search atms with valid data' do
    visit home_path
    expect(page).to_not have_content('Some address')

    fill_in 'filter_latitude', with: 33
    fill_in 'filter_longitude', with: 22
    find('input[name="commit"]').click

    expect(page).to have_content('Some address')
  end

  scenario 'User search atms with invalid data' do
    visit home_path
    expect(page).to_not have_content('Some address')

    fill_in 'filter_latitude', with: nil
    fill_in 'filter_longitude', with: nil
    find('input[name="commit"]').click

    expect(page).to_not have_content('Some address')
    expect(page).to have_content(I18n.t('activerecord.attributes.atm.no_records'))
  end
end
