class ChangeVendorCategoryToBusinessCategory < ActiveRecord::Migration[5.0]
  def change
    rename_table :vendor_categories, :business_categories
  end
end
