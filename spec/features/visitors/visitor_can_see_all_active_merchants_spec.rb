require 'rails_helper'

describe 'As a visitor' do
  it 'Can see all active merchants' do

    merch_1 = create(:user, role: 1)
    merch_2 = create(:user, role: 1)
    merch_3 = create(:user, role: 1)
    merch_4 = create(:user, role: 1, state: 'MA', active: false, created_at: 3.days.ago)
    merch_5 = create(:user, role: 1, active: false, created_at: 3.days.ago)

    visit merchants_path

    expect(page).to have_content(merch_1.name)
    expect(page).to have_content(merch_1.city)
    expect(page).to have_content(merch_1.state)
    expect(page).to have_content(merch_1.created_at.to_date)
    expect(page).to have_content(merch_2.name)
    expect(page).to have_content(merch_2.city)
    expect(page).to have_content(merch_2.state)
    expect(page).to have_content(merch_2.created_at.to_date)
    expect(page).to have_content(merch_3.name)
    expect(page).to have_content(merch_3.city)
    expect(page).to have_content(merch_3.state)
    expect(page).to have_content(merch_3.created_at.to_date)
    expect(page).to have_content(merch_3.name)
    expect(page).to have_content(merch_3.city)
    expect(page).to have_content(merch_3.state)
    expect(page).to have_content(merch_3.created_at.to_date)
    expect(page).to have_content(merch_3.name)
    expect(page).to have_content(merch_3.city)
    expect(page).to have_content(merch_3.state)
    expect(page).to have_content(merch_3.created_at.to_date)
    expect(page).to_not have_content(merch_4.name)
    expect(page).to_not have_content(merch_4.city)
    expect(page).to_not have_content(merch_4.created_at.to_date)
    expect(page).to_not have_content(merch_5.name)
    expect(page).to_not have_content(merch_5.city)
    expect(page).to_not have_content(merch_5.created_at.to_date)
  end
end
