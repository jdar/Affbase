class AddAllfieldsToAffiliates < ActiveRecord::Migration
  def self.up
    add_column :affiliates, :siteid, :integer
    add_column :affiliates, :name_abbr, :string
    add_column :affiliates, :contact_first_name, :string
    add_column :affiliates, :contact_last_name, :string
    add_column :affiliates, :contact_email, :string
    add_column :affiliates, :address1, :string
    add_column :affiliates, :address2, :string
    add_column :affiliates, :city, :string
    add_column :affiliates, :state, :string
    add_column :affiliates, :zip, :integer
    add_column :affiliates, :phone1, :string
    add_column :affiliates, :phone2, :string
    add_column :affiliates, :tty, :string
    add_column :affiliates, :fax, :string
    add_column :affiliates, :email, :string
    add_column :affiliates, :description, :text
    add_column :affiliates, :metric, :string
    add_column :affiliates, :activate, :boolean
    add_column :affiliates, :public, :boolean
    add_column :affiliates, :region, :string
    add_column :affiliates, :province, :string
    add_column :affiliates, :country, :string
    add_column :affiliates, :aff_type, :string
    add_column :affiliates, :template, :integer
    add_column :affiliates, :state_ind, :integer
  end

  def self.down
    remove_column :affiliates, :state_ind
    remove_column :affiliates, :template
    remove_column :affiliates, :aff_type
    remove_column :affiliates, :country
    remove_column :affiliates, :province
    remove_column :affiliates, :region
    remove_column :affiliates, :public
    remove_column :affiliates, :activate
    remove_column :affiliates, :metric
    remove_column :affiliates, :description
    remove_column :affiliates, :email
    remove_column :affiliates, :fax
    remove_column :affiliates, :tty
    remove_column :affiliates, :phone2
    remove_column :affiliates, :phone1
    remove_column :affiliates, :zip
    remove_column :affiliates, :state
    remove_column :affiliates, :city
    remove_column :affiliates, :address2
    remove_column :affiliates, :address1
    remove_column :affiliates, :contact_email
    remove_column :affiliates, :contact_last_name
    remove_column :affiliates, :contact_first_name
    remove_column :affiliates, :name_abbr
    remove_column :affiliates, :siteid
  end
end
