class AddRelatedHoloceneEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :holocene_events, :related_id, :bigint, default: nil
    add_column :holocene_events, :related_endpoint, :boolean, default: false
    add_column :holocene_events, :start_related_offset, :integer, default: 0
    add_column :holocene_events, :end_related_offset, :integer, default: 0
  end
end
