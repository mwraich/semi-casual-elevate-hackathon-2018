class UpdateColumnsOnPrograms < ActiveRecord::Migration[5.2]
  def change
    change_table :programs do |t|
      t.index :title, unique: true
      t.remove :updated_at
      t.remove :age_group_1
      t.remove :age_group_2
      t.remove :age_group_3
      t.remove :code
      t.remove :date_1
      t.remove :date_2
      t.remove :end_date1
      t.remove :end_time
      t.remove :event_type_1
      t.remove :event_type_2
      t.remove :event_type_3
      t.remove :event_types
      t.remove :extra_tag
      t.remove :friday
      t.remove :friday_hours
      t.remove :fsa_x
      t.remove :fsa_y
      t.remove :gid
      t.remove :id_2
      t.remove :id_x
      t.remove :id_y
      t.remove :image_height
      t.remove :image_path
      t.remove :image_text
      t.remove :image_width
      t.remove :kid_stop_address
      t.remove :kid_stop_ward_number
      t.remove :length
      t.remove :link
      t.remove :link_address
      t.remove :link_text
      t.remove :location
      t.remove :monday
      t.remove :monday_hours
      t.remove :nbhd_name_x
      t.remove :nbhd_name_y
      t.remove :nbhd_number_x
      t.remove :nbhd_number_y
      t.remove :other_info
      t.remove :postal_code
      t.remove :rcid
      t.remove :reading_address
      t.remove :reading_postal_code
      t.remove :reading_ward_number
      t.remove :record_type
      t.remove :saturday
      t.remove :saturday_hours
      t.remove :status
      t.remove :sunday
      t.remove :sunday_hours
      t.remove :thursday
      t.remove :thursday_hours
      t.remove :tier
      t.remove :tier_x
      t.remove :tier_y
      t.remove :time
      t.remove :tuesday
      t.remove :tuesday_hours
      t.remove :ward_region_x
      t.remove :ward_region_y
      t.remove :wednesday
      t.remove :wednesday_hours
      t.remove :weekly_scheduled_hours
      t.remove :longitude
      t.remove :latitude
    end
  end
end
